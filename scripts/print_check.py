#!/usr/bin/env python3
"""Layer-by-layer printability check for an STL, using only the standard library and PIL.

It slices the mesh into layers the way a slicer does, rasterises each layer, and reports:
- the size, volume and mesh checks (open or non-manifold edges, separate bodies)
- what touches the bed in the first layer
- where supports are needed: islands that start in mid-air, and overhangs steeper than the limit
- parts thinner than one extrusion width (lost) and than two (a single line, fragile), and gaps
  narrower than one extrusion width (the slicer fills them in)
- the smallest cross-sections, which are where a tall print is weakest
It writes two side-view maps with the problems coloured in, OUT_PREFIX_side_x.png (looking along Y)
and OUT_PREFIX_side_y.png (looking along X): grey prints, blue needs support, red is thinner than one
extrusion width, orange than two, and purple marks gaps that fill in. It also writes OUT_PREFIX.json.

Usage: print_check.py MODEL.stl OUT_PREFIX [--flip] [--layer 0.2] [--px 0.05] [--width 0.4]
                      [--overhang 50]
--flip turns the model upside down first, and --overhang is the steepest overhang, in degrees from
vertical, that prints without support.
"""
import argparse, json, math, struct
from collections import Counter
from PIL import Image, ImageChops, ImageDraw, ImageFilter


def read_stl(path):
    data = open(path, 'rb').read()
    tris = []
    if data[:5] == b'solid' and b'facet' in data[:400]:
        verts = []
        for line in data.decode('ascii', 'replace').splitlines():
            s = line.split()
            if s and s[0] == 'vertex':
                verts.append(tuple(float(v) for v in s[1:4]))
                if len(verts) == 3:
                    tris.append(tuple(verts))
                    verts = []
    else:
        n = struct.unpack('<I', data[80:84])[0]
        for r in struct.iter_unpack('<12fH', data[84:84 + 50 * n]):
            tris.append((r[3:6], r[6:9], r[9:12]))
    return tris


def mesh_checks(tris):
    vid, faces = {}, []
    for t in tris:
        f = []
        for v in t:
            i = vid.get(v)
            if i is None:
                i = vid[v] = len(vid)
            f.append(i)
        faces.append(f)
    directed = Counter()
    for a, b, c in faces:
        directed[(a, b)] += 1
        directed[(b, c)] += 1
        directed[(c, a)] += 1
    undirected = Counter()
    for (u, v), n in directed.items():
        undirected[(min(u, v), max(u, v))] += n
    parent = list(range(len(vid)))

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x
    for a, b, c in faces:
        ra = find(a)
        for o in (b, c):
            ro = find(o)
            if ro != ra:
                parent[ro] = ra
    comps = {}
    for t, (a, b, c) in zip(tris, faces):
        A, B, C = t
        vol = (A[0] * (B[1] * C[2] - B[2] * C[1]) - A[1] * (B[0] * C[2] - B[2] * C[0])
               + A[2] * (B[0] * C[1] - B[1] * C[0])) / 6
        e = comps.setdefault(find(a), [0, 0.0, [1e9] * 3, [-1e9] * 3])
        e[0] += 1
        e[1] += vol
        for v in t:
            for k in range(3):
                e[2][k] = min(e[2][k], v[k])
                e[3][k] = max(e[3][k], v[k])
    bodies = sorted(([n, round(vol, 3), [round(x, 2) for x in lo], [round(x, 2) for x in hi]]
                     for n, vol, lo, hi in comps.values()), key=lambda b: -abs(b[1]))
    return {
        'triangles': len(tris), 'vertices': len(vid),
        'open_edges': sum(1 for n in undirected.values() if n == 1),
        'nonmanifold_edges': sum(1 for n in undirected.values() if n > 2),
        'misoriented_edges': sum(1 for n in directed.values() if n > 1),
        'volume_mm3': round(sum(b[1] for b in bodies), 2),
        'bodies': len(bodies), 'body_list': bodies[:20],
    }


# Morphology on 0/255 'L' images. Alternating 3x3 square and cross steps grow an octagon, which is
# close to a disc, so r steps make a radius of about r pixels in every direction.
SQ_MIN, SQ_MAX = ImageFilter.MinFilter(3), ImageFilter.MaxFilter(3)
SHIFTS = ((1, 0), (-1, 0), (0, 1), (0, -1))


def _cross(img, op):
    out = img
    for dx, dy in SHIFTS:
        out = op(out, ImageChops.offset(img, dx, dy))
    return out


def erode(img, r):
    for i in range(r):
        img = img.filter(SQ_MIN) if i % 2 == 0 else _cross(img, ImageChops.darker)
    return img


def dilate(img, r):
    for i in range(r):
        img = img.filter(SQ_MAX) if i % 2 == 0 else _cross(img, ImageChops.lighter)
    return img


def opening(img, r):
    return dilate(erode(img, r), r)


def closing(img, r):
    return erode(dilate(img, r), r)


def count(img):
    return img.histogram()[255]


def components(img, min_px=1):
    """Connected areas of a 0/255 image as (bbox, pixel count, a pixel in it), largest first."""
    work = img.copy()
    out = []
    while True:
        bb = work.getbbox()
        if not bb:
            break
        row = work.crop((bb[0], bb[1], bb[2], bb[1] + 1)).tobytes()
        seed = (bb[0] + next(i for i, b in enumerate(row) if b == 255), bb[1])
        ImageDraw.floodfill(work, seed, 128)
        comp = work.point(lambda v: 255 if v == 128 else 0)
        n = count(comp)
        if n >= min_px:
            out.append((comp.getbbox(), n, seed))
        work = ImageChops.subtract(work, comp.point(lambda v: 128 if v else 0))
    return sorted(out, key=lambda c: -c[1])


def component_at(img, seed):
    work = img.copy()
    ImageDraw.floodfill(work, seed, 128)
    return work.point(lambda v: 255 if v == 128 else 0)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('stl')
    ap.add_argument('out')
    ap.add_argument('--flip', action='store_true', help='print it upside down')
    ap.add_argument('--layer', type=float, default=0.2)
    ap.add_argument('--px', type=float, default=0.05)
    ap.add_argument('--width', type=float, default=0.4, help='extrusion width')
    ap.add_argument('--overhang', type=float, default=50, help='steepest overhang without support, degrees')
    a = ap.parse_args()

    tris = read_stl(a.stl)
    if a.flip:
        tris = [tuple((v[0], -v[1], -v[2]) for v in t) for t in tris]  # turned over about X
    report = {'stl': a.stl, 'flipped': a.flip, 'layer': a.layer, 'px': a.px, 'width': a.width,
              'overhang_deg': a.overhang}
    report['mesh'] = mesh_checks(tris)

    lo = [min(v[k] for t in tris for v in t) for k in range(3)]
    hi = [max(v[k] for t in tris for v in t) for k in range(3)]
    report['min_mm'] = [round(v, 2) for v in lo]
    report['max_mm'] = [round(v, 2) for v in hi]
    report['size_mm'] = [round(hi[k] - lo[k], 2) for k in range(3)]
    px, m = a.px, 1.0
    x0, y0 = lo[0] - m, lo[1] - m
    W = int(math.ceil((hi[0] - lo[0] + 2 * m) / px))
    H = int(math.ceil((hi[1] - lo[1] + 2 * m) / px))
    nl = int(math.ceil((hi[2] - lo[2]) / a.layer))

    r1 = max(1, round(a.width / 2 / px))      # radius that fits in one extrusion width
    r2 = max(1, round(a.width / px))          # and in two
    ov = max(1, round(a.layer * math.tan(math.radians(a.overhang)) / px))

    items = sorted(((min(t[0][2], t[1][2], t[2][2]), max(t[0][2], t[1][2], t[2][2]), t) for t in tris),
                   key=lambda i: i[0])
    active, nxt = [], 0
    full = b'\xff' * W
    prev = None
    layers = []
    side = {0: [], 1: []}         # per layer: category codes along X (axis 0) and along Y (axis 1)
    regions = {'support': [], 'lost': [], 'fragile': [], 'filled': []}

    def add_region(kind, k, bb, n, z, floating=False):
        mg = round(0.5 / px)
        for r in regions[kind]:
            if r['last'] >= k - 2 and not (bb[0] > r['bb'][2] + mg or bb[2] < r['bb'][0] - mg or
                                           bb[1] > r['bb'][3] + mg or bb[3] < r['bb'][1] - mg):
                r['bb'] = [min(r['bb'][0], bb[0]), min(r['bb'][1], bb[1]),
                           max(r['bb'][2], bb[2]), max(r['bb'][3], bb[3])]
                r['last'], r['z1'] = k, z
                r['px'] += n
                r['layers'] += 1
                r['floating'] = r['floating'] or floating
                return
        regions[kind].append({'bb': list(bb), 'first': k, 'last': k, 'z0': z, 'z1': z, 'px': n,
                              'layers': 1, 'floating': floating})

    for k in range(nl):
        h = lo[2] + (k + 0.5) * a.layer + 1e-6
        while nxt < len(items) and items[nxt][0] <= h:
            active.append(items[nxt])
            nxt += 1
        active = [i for i in active if i[1] >= h]
        rows = [[] for _ in range(H)]
        for _, _, t in active:
            pts = []
            for p, q in ((t[0], t[1]), (t[1], t[2]), (t[2], t[0])):
                if (p[2] < h) != (q[2] < h):
                    s = (h - p[2]) / (q[2] - p[2])
                    pts.append((p[0] + s * (q[0] - p[0]), p[1] + s * (q[1] - p[1])))
            if len(pts) != 2:
                continue
            (xa, ya), (xb, yb) = pts
            if ya == yb:
                continue
            if ya > yb:
                xa, ya, xb, yb = xb, yb, xa, ya
            ra = max(0, math.ceil((ya - y0) / px - 0.5))
            rb = min(H, math.ceil((yb - y0) / px - 0.5))
            sl = (xb - xa) / (yb - ya)
            for r in range(ra, rb):
                rows[r].append(xa + (y0 + (r + 0.5) * px - ya) * sl)
        buf = bytearray(W * H)
        for r, xs in enumerate(rows):
            if len(xs) < 2:
                continue
            xs.sort()
            base = r * W
            for i in range(0, len(xs) - 1, 2):
                c0 = max(0, math.ceil((xs[i] - x0) / px - 0.5))
                c1 = min(W, math.ceil((xs[i + 1] - x0) / px - 0.5))
                if c1 > c0:
                    buf[base + c0:base + c1] = full[:c1 - c0]
        cur = Image.frombytes('L', (W, H), bytes(buf))
        z = round((k + 0.5) * a.layer, 3)   # height above the bed
        rec = {'z': z, 'area': round(count(cur) * px * px, 3)}
        masks = {}

        bb = cur.getbbox()
        if bb:
            g = r2 + 4
            box = (max(0, bb[0] - g), max(0, bb[1] - g), min(W, bb[2] + g), min(H, bb[3] + g))
            c = cur.crop(box)
            o1 = opening(c, r1)
            o2 = opening(c, r2)
            parts = {'lost': opening(ImageChops.subtract(c, o1), 1),
                     'fragile': opening(ImageChops.subtract(o1, o2), 2),
                     'filled': opening(ImageChops.subtract(closing(c, r1), c), 1)}
            for kind, img in parts.items():
                full_img = Image.new('L', (W, H))
                full_img.paste(img, box[:2])
                masks[kind] = full_img
                n = count(img)
                rec[kind] = round(n * px * px, 3)
                if n:
                    for cbb, cn, _ in components(full_img, 6):
                        add_region(kind, k, cbb, cn, z)
            if prev is None:
                rec['bed'] = [(cbb, round(n * px * px, 3)) for cbb, n, _ in components(cur, 4)]
            else:
                unsup = opening(ImageChops.subtract(cur, dilate(prev, ov)), 1)
                masks['support'] = unsup
                n = count(unsup)
                rec['unsupported'] = round(n * px * px, 3)
                if n:
                    for cbb, cn, seed in components(unsup, 4):
                        whole = component_at(cur, seed)
                        floating = ImageChops.darker(whole, prev).getbbox() is None
                        add_region('support', k, cbb, cn, z, floating)
        layers.append(rec)

        # side views: 0 empty, 1 model, 5 filled gap, 2 fragile, 3 lost, 4 needs support
        for axis in (0, 1):
            codes = [1 if v else 0 for v in cur.getprojection()[axis]]
            for code, kind in ((5, 'filled'), (2, 'fragile'), (3, 'lost'), (4, 'support')):
                img = masks.get(kind)
                if img is not None and img.getbbox():
                    for i, v in enumerate(img.getprojection()[axis]):
                        if v:
                            codes[i] = code
            side[axis].append(codes)
        prev = cur

    def mm_box(bb):
        return [round(x0 + bb[0] * px, 2), round(y0 + bb[1] * px, 2),
                round(x0 + bb[2] * px, 2), round(y0 + bb[3] * px, 2)]

    def summarise(kind, min_px):
        out = []
        for r in regions[kind]:
            if r['px'] < min_px:
                continue
            e = {'z': [r['z0'], r['z1']], 'xy_box': mm_box(r['bb']),
                 'area_mm2': round(r['px'] * px * px, 3), 'layers': r['layers']}
            if kind == 'support':
                e['starts_in_mid_air'] = r['floating']
            out.append(e)
        return sorted(out, key=lambda r: r['z'][0])

    report['layers'] = len(layers)
    report['bed_area_mm2'] = layers[0]['area']
    report['bed_contact'] = [{'xy_box': mm_box(b), 'area_mm2': n} for b, n in layers[0].get('bed', [])]
    for kind, key in (('support', 'unsupported'), ('lost', 'lost'), ('fragile', 'fragile'), ('filled', 'filled')):
        report[kind + '_area_mm2'] = round(sum(l.get(key, 0) for l in layers), 2)
        report[kind + '_regions'] = summarise(kind, 8)
    skip = max(3, int(1.0 / a.layer))
    body = layers[skip:-skip] if len(layers) > 2 * skip else layers
    report['smallest_sections'] = [{'z': l['z'], 'area_mm2': l['area']}
                                   for l in sorted(body, key=lambda l: l['area'])[:6]]
    report['area_profile'] = [[l['z'], l['area'], l.get('unsupported', 0), l.get('lost', 0),
                               l.get('fragile', 0), l.get('filled', 0)] for l in layers]
    with open(a.out + '.json', 'w') as f:
        json.dump(report, f, indent=1)

    colours = {1: (190, 192, 198), 2: (245, 160, 40), 3: (215, 40, 40), 4: (40, 90, 220), 5: (170, 120, 210)}
    vs = max(1, round(a.layer / px))
    for axis, name in ((0, 'side_x'), (1, 'side_y')):
        view = side[axis]
        img = Image.new('RGB', (len(view[0]), len(view) * vs), (255, 255, 255))
        draw = ImageDraw.Draw(img)
        for k, codes in enumerate(view):
            top = (len(view) - 1 - k) * vs
            i = 0
            while i < len(codes):
                cde = codes[i]
                j = i
                while j < len(codes) and codes[j] == cde:
                    j += 1
                if cde:
                    draw.rectangle([i, top, j - 1, top + vs - 1], fill=colours[cde])
                i = j
        img.save(a.out + '_' + name + '.png')

    short = {k: v for k, v in report.items() if k != 'area_profile'}
    short['mesh'] = {k: v for k, v in report['mesh'].items() if k != 'body_list'}
    print(json.dumps(short, indent=1))


if __name__ == '__main__':
    main()
