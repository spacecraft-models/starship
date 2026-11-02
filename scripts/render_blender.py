"""Builds a realistic scene in Blender from the meshes scripts/render_blender.sh exports, one per material
of each model, renders it from several views and saves it as a .blend and a .glb.

render_blender.sh runs it as
    blender -b --factory-startup --python scripts/render_blender.py -- OUTDIR NAME:MESHDIR:Z ...
where each NAME:MESHDIR:Z is a model, whose meshes are MESHDIR/NAME_<material>.stl in mm, raised Z mm.
The environment variables VIEWS, SAMPLES and SCALE pick the views, the render samples per pixel and
the image size in percent. It works with Blender 4.0 and later.

The looks follow photos of the V3 vehicles listed in source_analysis.md: the hull's bright, mirror-like
stainless steel, which reflects its surroundings (here one of the photographed skies Blender comes
with, see REFLECTIONS); the ship's black hexagonal tiles, about 0.25 m across with points at top and
bottom, each with a light pin near its top corner; and the booster's black aft skirt, charcoal Raptors
and dark grid fins. Lengths here are in metres.
"""
import math
import os
import sys
import time

import bpy
import numpy as np

SQRT3 = math.sqrt(3)

# Per-model settings, by the model file's name. Rings: the height of each of the hull's steel rings
# and the height (z) of one seam between them, for the weld seams drawn on the steel, or None for no
# seams. Ground: how far the ground sits below the model's lowest point, or None for no ground. Views: what render_view() is given for each.
# A view looks at the part of the model between heights z (in the model's own frame, metres) from
# azimuth az (dimensions.md's: 0 is windward on the ship and the rudder fin on the booster), either
# from eye metres above the ground or from el degrees above the part's middle, through a lens of
# lens mm, into an image w x h pixels.
MODELS = {
    'starship': {
        'rings': (1.83, 0.0),  # dimensions.md: 21 rings of 1.83 m from the skirt's bottom edge
        'ground': 0.0,         # standing on its skirt
        'views': {
            'leeward': dict(az=205, eye=1.7, lens=85, w=1200, h=1800),
            'windward': dict(az=330, eye=1.7, lens=85, w=1200, h=1800),
            'nose': dict(az=235, el=-12, z=(36, 52.2), lens=85, w=1800, h=1200),
            'aft': dict(az=200, el=-35, z=(-0.5, 16), lens=50, w=1800, h=1200),
        },
    },
    'super_heavy': {
        'rings': (1.86, 69.3),  # dimensions.md: seams about 1.86 m apart, one at the top of the tank wall
        'ground': 20.0,  # as if on its launch mount, which isn't drawn
        'views': {
            'tower_side': dict(az=200, eye=1.7, lens=70, w=1200, h=1800),
            'rudder_side': dict(az=20, eye=1.7, lens=70, w=1200, h=1800),
            'engines': dict(az=200, el=-25, z=(-0.6, 8), lens=50, w=1800, h=1200),
            'truss_and_fins': dict(az=315, el=-20, z=(58, 72.4), lens=85, w=1800, h=1200),
        },
    },
}
# Several models in one scene: views of the whole stack
STACK_VIEWS = {
    'stack': dict(az=205, eye=1.7, lens=70, w=1200, h=1800),
    'stack_windward': dict(az=330, eye=1.7, lens=70, w=1200, h=1800),
    'hot_staging': dict(az=200, el=-8, z=(62, 82), lens=85, w=1800, h=1200),
}
# Any other model: a high and a low view of the whole thing, with no ground
OTHER = {
    'ground': None,
    'views': {
        'isometric': dict(az=225, el=30, lens=50, w=1600, h=1200),
        'front_low': dict(az=200, el=-5, lens=50, w=1600, h=1200),
    },
}

# Each material's look: base colour (linear), metallic, roughness, and how much a large-scale noise
# varies the colour and roughness. steel, tiles and aft_shield have their own shaders below.
LOOKS = {
    'steel': dict(base=(0.58, 0.585, 0.6), metallic=1.0, roughness=0.12),
    'tiles': dict(base=(0.018, 0.019, 0.022), metallic=0.0, roughness=0.48),
    'black': dict(base=(0.018, 0.018, 0.02), metallic=0.0, roughness=0.55, vary=0.15),
    'aft_shield': dict(base=(0.03, 0.03, 0.032), metallic=0.3, roughness=0.6),
    'dome': dict(base=(0.5, 0.49, 0.46), metallic=1.0, roughness=0.42, vary=0.08),
    'grid_fin': dict(base=(0.065, 0.065, 0.068), metallic=0.85, roughness=0.45, vary=0.3),
    'bronze': dict(base=(0.42, 0.29, 0.15), metallic=1.0, roughness=0.35, vary=0.1),
    'nozzle': dict(base=(0.055, 0.055, 0.057), metallic=0.5, roughness=0.45, vary=0.15),
    'engine': dict(base=(0.045, 0.045, 0.047), metallic=0.7, roughness=0.35, vary=0.15),
    'nozzle_extension': dict(base=(0.42, 0.42, 0.43), metallic=1.0, roughness=0.35, vary=0.1),
}
UNKNOWN_LOOK = dict(base=(0.3, 0.3, 0.3), metallic=0.0, roughness=0.5)

TILE_PITCH = 0.25  # across the flats
TILE_GAP = 0.007
SUN = dict(elevation=38, strength=4.0)
# What the steel reflects: one of the photographed skies that come with Blender (CC0, from Poly Haven),
# by its file name in Blender's datafiles/studiolights/world, turned this many degrees about Z.
# "city" is a landing pad under an open sky, which gives the hull the neutral, silvery look of the
# photos; "sunrise" makes it bluer above and warmer below. None reflects the plain sky instead.
REFLECTIONS = ('city', 0.0)


# ---- Meshes ----

def read_stl(path):
    """Triangles of a binary STL as an (n, 3, 3) array, in metres."""
    with open(path, 'rb') as f:
        data = f.read()
    n = int(np.frombuffer(data, '<u4', 1, 80)[0])
    rec = np.dtype([('normal', '<f4', 3), ('v', '<f4', (3, 3)), ('attr', '<u2')])
    return np.frombuffer(data, rec, n, 84)['v'].astype(np.float64) / 1000.0


def mesh_object(name, tris, collection):
    """An object from triangles, with shared vertices merged, shaded smooth with sharp edges kept."""
    verts, index = np.unique(tris.reshape(-1, 3), axis=0, return_inverse=True)
    faces = index.reshape(-1, 3)
    faces = faces[(faces[:, 0] != faces[:, 1]) & (faces[:, 1] != faces[:, 2]) & (faces[:, 0] != faces[:, 2])]
    mesh = bpy.data.meshes.new(name)
    mesh.from_pydata(verts.tolist(), [], faces.tolist())
    mesh.validate()
    mesh.polygons.foreach_set('use_smooth', [True] * len(mesh.polygons))
    if hasattr(mesh, 'use_auto_smooth'):  # Blender before 4.1
        mesh.use_auto_smooth = False
    mesh.update()
    obj = bpy.data.objects.new(name, mesh)
    collection.objects.link(obj)
    # Smooth curved surfaces, but keep edges sharper than 30 degrees, as the facets are a few degrees apart
    split = obj.modifiers.new('Sharp edges', 'EDGE_SPLIT')
    split.split_angle = math.radians(30)
    return obj


# ---- Shader nodes ----

class Graph:
    """A small helper for building node trees from expressions."""

    def __init__(self, tree):
        self.tree = tree
        self.nodes = tree.nodes
        self.nodes.clear()

    def node(self, kind, **props):
        n = self.nodes.new(kind)
        for k, v in props.items():
            setattr(n, k, v)
        return n

    def put(self, socket, value):
        if isinstance(value, bpy.types.NodeSocket):
            self.tree.links.new(value, socket)
        else:
            socket.default_value = value

    def math(self, op, a, b=0.0):
        n = self.node('ShaderNodeMath', operation=op)
        self.put(n.inputs[0], a)
        self.put(n.inputs[1], b)
        return n.outputs[0]

    def vmath(self, op, a, b=(0.0, 0.0, 0.0)):
        n = self.node('ShaderNodeVectorMath', operation=op)
        self.put(n.inputs[0], a)
        if op == 'SCALE':
            self.put(n.inputs['Scale'], b)
        else:
            self.put(n.inputs[1], b)
        return n.outputs['Value' if op in ('DOT_PRODUCT', 'LENGTH', 'DISTANCE') else 'Vector']

    def xyz(self, v):
        n = self.node('ShaderNodeSeparateXYZ')
        self.put(n.inputs[0], v)
        return n.outputs['X'], n.outputs['Y'], n.outputs['Z']

    def vec(self, x, y, z=0.0):
        n = self.node('ShaderNodeCombineXYZ')
        for s, v in zip(n.inputs, (x, y, z)):
            self.put(s, v)
        return n.outputs[0]

    def mix(self, fac, a, b, kind='FLOAT'):
        """a where fac is 0, b where it is 1. kind is FLOAT, VECTOR or RGBA."""
        n = self.node('ShaderNodeMix', data_type=kind)
        suffix = {'FLOAT': 'Float', 'VECTOR': 'Vector', 'RGBA': 'Color'}[kind]
        ins = {s.identifier: s for s in n.inputs}
        self.put(ins['Factor_Float'], fac)
        self.put(ins['A_' + suffix], a)
        self.put(ins['B_' + suffix], b)
        return {s.identifier: s for s in n.outputs}['Result_' + suffix]

    def step(self, x, lo, hi):
        """0 below lo, 1 above hi, smooth between."""
        n = self.node('ShaderNodeMapRange', interpolation_type='SMOOTHSTEP')
        self.put(n.inputs['Value'], x)
        self.put(n.inputs['From Min'], lo)
        self.put(n.inputs['From Max'], hi)
        return n.outputs['Result']

    def noise(self, vector, scale, detail=2.0):
        n = self.node('ShaderNodeTexNoise')
        self.put(n.inputs['Vector'], vector)
        self.put(n.inputs['Scale'], scale)
        self.put(n.inputs['Detail'], detail)
        return n.outputs['Fac']

    def white_noise(self, value, dims='3D'):
        n = self.node('ShaderNodeTexWhiteNoise', noise_dimensions=dims)
        self.put(n.inputs['W' if dims == '1D' else 'Vector'], value)
        return n.outputs['Value']

    def object_position(self):
        return self.node('ShaderNodeTexCoord').outputs['Object']

    def object_normal(self):
        n = self.node('ShaderNodeVectorTransform', vector_type='NORMAL', convert_from='WORLD', convert_to='OBJECT')
        self.put(n.inputs[0], self.node('ShaderNodeNewGeometry').outputs['Normal'])
        return self.vmath('NORMALIZE', n.outputs[0])

    def bump(self, height, distance, strength=1.0):
        n = self.node('ShaderNodeBump')
        self.put(n.inputs['Height'], height)
        self.put(n.inputs['Distance'], distance)
        self.put(n.inputs['Strength'], strength)
        return n.outputs['Normal']

    def principled(self, base, metallic, roughness, normal=None):
        n = self.node('ShaderNodeBsdfPrincipled')
        self.put(n.inputs['Base Color'], base)
        self.put(n.inputs['Metallic'], metallic)
        self.put(n.inputs['Roughness'], roughness)
        if normal is not None:
            self.put(n.inputs['Normal'], normal)
        out = self.node('ShaderNodeOutputMaterial')
        self.put(out.inputs['Surface'], n.outputs[0])
        return n


def rgba(c):
    return (c[0], c[1], c[2], 1.0)


def new_material(name):
    mat = bpy.data.materials.new(name)
    if bpy.app.version < (5, 0, 0):
        mat.use_nodes = True  # always on from Blender 5.0
    return mat


def plain_material(name, look):
    """A material with a large-scale noise varying its colour and roughness, as on real surfaces."""
    mat = new_material(name)
    g = Graph(mat.node_tree)
    n = g.noise(g.object_position(), 0.6, 4.0)
    vary = look.get('vary', 0.0)
    shade = g.math('ADD', 1.0 - vary, g.math('MULTIPLY', n, 2 * vary))
    base = g.mix(shade, (0, 0, 0, 1), rgba(look['base']), 'RGBA')
    rough = g.math('ADD', look['roughness'] - 0.05, g.math('MULTIPLY', n, 0.1))
    g.principled(base, look['metallic'], rough)
    return mat


def steel_material(name, rings):
    """Stainless steel: each ring a slightly different shade and polish, with darker, duller weld seams
    between rings, and a gentle waviness that makes reflections ripple as they do on the real tanks."""
    look = LOOKS['steel']
    mat = new_material(name)
    g = Graph(mat.node_tree)
    p = g.object_position()
    _, _, z = g.xyz(p)
    wave = g.noise(g.vmath('MULTIPLY', p, (1.0, 1.0, 0.35)), 0.25, 2.0)
    fine = g.noise(p, 3.0, 3.0)
    if rings:
        ring_h, z0 = rings
        t = g.math('DIVIDE', g.math('SUBTRACT', z, z0), ring_h)
        ring = g.math('FLOOR', t)
        r1 = g.white_noise(ring, '1D')
        r2 = g.white_noise(g.math('ADD', ring, 57.0), '1D')
        to_seam = g.math('MULTIPLY', g.math('ABSOLUTE', g.math('SUBTRACT', g.math('FRACT', g.math('ADD', t, 0.5)), 0.5)), ring_h)
        seam = g.math('SUBTRACT', 1.0, g.step(to_seam, 0.006, 0.016))
    else:
        r1 = r2 = g.noise(g.vmath('MULTIPLY', p, (0.2, 0.2, 1.0)), 0.5, 0.0)
        seam = 0.0
    shade = g.math('ADD', 0.93, g.math('MULTIPLY', r1, 0.12))
    base = g.mix(shade, (0, 0, 0, 1), rgba(look['base']), 'RGBA')
    base = g.mix(g.math('MULTIPLY', seam, 0.8), base, (0.26, 0.22, 0.18, 1), 'RGBA')
    rough = g.math('ADD', look['roughness'] - 0.04, g.math('ADD', g.math('MULTIPLY', r2, 0.1), g.math('MULTIPLY', fine, 0.04)))
    rough = g.mix(seam, rough, 0.45)
    height = g.math('ADD', wave, g.math('MULTIPLY', seam, -0.05))
    g.principled(base, 1.0, rough, g.bump(height, 0.02, 0.15))
    return mat


def hex_cells(g, u, v):
    """The ship's heat-shield tiles at (u, v) metres on the surface: regular hexagons TILE_PITCH across
    the flats, with points at top and bottom. Returns how far the point is inside its tile (m), a random
    number for the tile, and 1 on the tile's pin, 0 elsewhere."""
    s = (1.0, SQRT3, 1.0)
    off = (0.5, SQRT3 / 2, 0.0)
    p = g.vec(g.math('DIVIDE', u, TILE_PITCH), g.math('DIVIDE', v, TILE_PITCH))
    # The nearest centre on each of the two offset rectangular grids that make up the hexagonal one
    a = g.vmath('MULTIPLY', g.vmath('FLOOR', g.vmath('ADD', g.vmath('DIVIDE', p, s), (0.5, 0.5, 0.0))), s)
    pb = g.vmath('SUBTRACT', p, off)
    b = g.vmath('ADD', g.vmath('MULTIPLY', g.vmath('FLOOR', g.vmath('ADD', g.vmath('DIVIDE', pb, s), (0.5, 0.5, 0.0))), s), off)
    nearer_b = g.math('LESS_THAN', g.vmath('DISTANCE', p, b), g.vmath('DISTANCE', p, a))
    centre = g.mix(nearer_b, a, b, 'VECTOR')
    q = g.vmath('SUBTRACT', p, centre)
    qx, qy, _ = g.xyz(g.vmath('ABSOLUTE', q))
    edge = g.math('MAXIMUM', qx, g.math('ADD', g.math('MULTIPLY', qx, 0.5), g.math('MULTIPLY', qy, SQRT3 / 2)))
    inside = g.math('MULTIPLY', g.math('SUBTRACT', 0.5, edge), TILE_PITCH)
    rnd = g.white_noise(centre)
    pin = g.math('LESS_THAN', g.math('MULTIPLY', g.vmath('DISTANCE', q, (0.0, 0.43, 0.0)), TILE_PITCH), 0.011)
    return inside, rnd, pin


def tile_material(name):
    """Black heat-shield tiles. They follow the hull round (u is the distance round it), lie flat on
    the flaps' faces and on level faces, and vary a little in shade and gloss from tile to tile."""
    look = LOOKS['tiles']
    mat = new_material(name)
    g = Graph(mat.node_tree)
    p = g.object_position()
    x, y, z = g.xyz(p)
    r = g.math('MAXIMUM', g.vmath('LENGTH', g.vec(x, y)), 0.001)
    hull_uv = (g.math('MULTIPLY', r, g.math('ARCTAN2', x, y)), z)  # angle from windward (+Y)
    n = g.object_normal()
    round_dir = g.vec(g.math('DIVIDE', g.math('MULTIPLY', y, -1.0), r), g.math('DIVIDE', x, r))
    _, _, nz = g.xyz(n)
    level = g.math('GREATER_THAN', g.math('ABSOLUTE', nz), 0.8)
    flap = g.math('GREATER_THAN', g.math('ABSOLUTE', g.vmath('DOT_PRODUCT', n, round_dir)), 0.7)
    u = g.mix(level, g.mix(flap, hull_uv[0], r), x)
    v = g.mix(level, z, y)
    inside, rnd, pin = hex_cells(g, u, v)
    tile = g.step(inside, TILE_GAP / 2, TILE_GAP / 2 + 0.002)
    shade = g.math('ADD', 0.7, g.math('MULTIPLY', rnd, 0.6))
    base = g.mix(shade, (0, 0, 0, 1), rgba(look['base']), 'RGBA')
    base = g.mix(tile, (0.004, 0.004, 0.004, 1), base, 'RGBA')
    base = g.mix(g.math('MULTIPLY', pin, tile), base, (0.3, 0.3, 0.3, 1), 'RGBA')
    rough = g.mix(tile, 0.85, g.math('ADD', look['roughness'] - 0.08, g.math('MULTIPLY', rnd, 0.16)))
    g.principled(base, 0.0, rough, g.bump(tile, 0.003))
    return mat


def aft_shield_material(name):
    """The aft heat shield: dark, with flecks of bronze-coloured metal, as under the booster in photos."""
    look = LOOKS['aft_shield']
    mat = new_material(name)
    g = Graph(mat.node_tree)
    flecks = g.step(g.noise(g.object_position(), 40.0, 2.0), 0.58, 0.62)
    base = g.mix(flecks, rgba(look['base']), (0.35, 0.25, 0.12, 1), 'RGBA')
    g.principled(base, g.mix(flecks, look['metallic'], 1.0), g.mix(flecks, look['roughness'], 0.35))
    return mat


def flat_material(name, look):
    """The same look as constant values only, which other programs can read from the .glb."""
    mat = new_material(name + ' (flat)')
    g = Graph(mat.node_tree)
    g.principled(rgba(look['base']), look['metallic'], look['roughness'])
    return mat


# ---- Scene ----

def make_world():
    """A clear sky: deep blue overhead, paler toward the horizon, with a few thin clouds, and dusty
    ground below the horizon, which the steel reflects."""
    world = bpy.data.worlds.new('Sky')
    if bpy.app.version < (5, 0, 0):
        world.use_nodes = True  # always on from Blender 5.0
    bpy.context.scene.world = world
    g = Graph(world.node_tree)
    d = g.node('ShaderNodeTexCoord').outputs['Generated']
    _, _, dz = g.xyz(d)
    up = g.math('POWER', g.math('MAXIMUM', dz, 0.0), 0.6)
    sky = g.mix(up, (0.68, 0.79, 1.0, 1), (0.13, 0.3, 0.75, 1), 'RGBA')
    clouds = g.math('MULTIPLY', g.step(g.noise(g.vmath('MULTIPLY', d, (1.0, 1.0, 4.0)), 2.5, 6.0), 0.56, 0.72),
                    g.step(dz, 0.02, 0.25))
    sky = g.mix(g.math('MULTIPLY', clouds, 0.7), sky, (0.95, 0.95, 0.97, 1), 'RGBA')
    ground = (0.2, 0.18, 0.15, 1)
    colour = g.mix(g.step(dz, -0.03, 0.0), ground, sky, 'RGBA')
    bg = g.node('ShaderNodeBackground')
    g.put(bg.inputs['Color'], colour)
    g.put(bg.inputs['Strength'], 1.0)
    out = g.node('ShaderNodeOutputWorld')
    path = REFLECTIONS and os.path.join(
        bpy.utils.system_resource('DATAFILES', path='studiolights/world'), REFLECTIONS[0] + '.exr')
    if path and os.path.exists(path):
        # Reflections see a real place, one of the photographed skies Blender comes with, so the steel
        # mirrors buildings, ground and clouds as the real hull does; the camera and the light falling
        # on matt surfaces see the plain sky above
        env = g.node('ShaderNodeTexEnvironment')
        env.image = bpy.data.images.load(path)
        mapping = g.node('ShaderNodeMapping')
        g.put(mapping.inputs['Vector'], d)
        g.put(mapping.inputs['Rotation'], (0.0, 0.0, math.radians(REFLECTIONS[1])))
        g.put(env.inputs['Vector'], mapping.outputs[0])
        reflected = g.node('ShaderNodeBackground')
        g.put(reflected.inputs['Color'], env.outputs['Color'])
        g.put(reflected.inputs['Strength'], 1.0)
        mix = g.node('ShaderNodeMixShader')
        g.put(mix.inputs[0], g.node('ShaderNodeLightPath').outputs['Is Glossy Ray'])
        g.put(mix.inputs[1], bg.outputs[0])
        g.put(mix.inputs[2], reflected.outputs[0])
        g.put(out.inputs['Surface'], mix.outputs[0])
    else:
        g.put(out.inputs['Surface'], bg.outputs[0])


def make_sun():
    """The sun. A sun lamp shines along its -Z, so render_view() tilts it down from straight overhead
    by its rotation about X and turns it to an azimuth by its rotation about Z."""
    data = bpy.data.lights.new('Sun', 'SUN')
    data.energy = SUN['strength']
    data.angle = math.radians(0.53)
    data.color = (1.0, 0.96, 0.9)
    sun = bpy.data.objects.new('Sun', data)
    bpy.context.scene.collection.objects.link(sun)
    return sun


def make_ground(z):
    mesh = bpy.data.meshes.new('Ground')
    s = 3000.0
    mesh.from_pydata([(-s, -s, z), (s, -s, z), (s, s, z), (-s, s, z)], [], [(0, 1, 2, 3)])
    obj = bpy.data.objects.new('Ground', mesh)
    bpy.context.scene.collection.objects.link(obj)
    mat = new_material('Ground')
    g = Graph(mat.node_tree)
    # Pale concrete and sand in broad patches, with finer grain
    p = g.object_position()
    patches = g.step(g.noise(p, 0.02, 3.0), 0.45, 0.6)
    grain = g.noise(p, 1.5, 4.0)
    base = g.mix(patches, (0.13, 0.12, 0.1, 1), (0.3, 0.28, 0.24, 1), 'RGBA')
    base = g.mix(g.math('MULTIPLY', grain, 0.3), base, (0.08, 0.075, 0.065, 1), 'RGBA')
    g.principled(base, 0.0, 0.95)
    obj.data.materials.append(mat)
    return obj


def vertices(objects):
    """Every vertex of the objects, in the scene's frame, as an (n, 3) array."""
    out = []
    for o in objects:
        co = np.empty(len(o.data.vertices) * 3)
        o.data.vertices.foreach_get('co', co)
        out.append(co.reshape(-1, 3) + np.array(o.location))
    return np.concatenate(out)


def look_from(cam, eye, target):
    from mathutils import Vector
    cam.location = eye
    cam.rotation_euler = (Vector(target) - Vector(eye)).to_track_quat('-Z', 'Y').to_euler()


def fit(corners, target, direction, half_w, half_h):
    """Distance from target along direction (unit, toward the camera) at which every corner fits in a
    view half_w by half_h wide (as tangents of the half-angles)."""
    from mathutils import Vector
    d = Vector(direction).normalized()
    right = d.cross(Vector((0, 0, 1)))
    if right.length < 1e-6:
        right = Vector((1, 0, 0))
    right.normalize()
    up = right.cross(d)
    need = 0.0
    for c in corners:
        rel = Vector(c) - Vector(target)
        depth = rel.dot(d)
        need = max(need, depth + abs(rel.dot(right)) / half_w, depth + abs(rel.dot(up)) / half_h)
    return need


def render_view(scene, cam, sun, name, view, verts, ground_z, ground, out):
    """Points the camera as view says at the vertices verts (or those between its heights), lights them
    from the side, and renders out/<name>.png."""
    if 'z' in view:
        verts = verts[(verts[:, 2] >= view['z'][0]) & (verts[:, 2] <= view['z'][1])]
    lo, hi = verts.min(axis=0), verts.max(axis=0)
    target = (lo + hi) / 2
    corners = [(x, y, z) for x in (lo[0], hi[0]) for y in (lo[1], hi[1]) for z in (lo[2], hi[2])]
    w, h = view['w'], view['h']
    cam.data.lens = view['lens']
    cam.data.sensor_width = 36.0
    cam.data.sensor_fit = 'AUTO'
    t = 18.0 / view['lens']  # tangent of the half-angle across the image's longer side
    half_w, half_h = (t, t * h / w) if w >= h else (t * w / h, t)
    half_w, half_h = 0.92 * half_w, 0.92 * half_h  # a margin round the model
    theta = math.radians(view['az'] + 90)  # dimensions.md's azimuth to an angle from +X
    flat = np.array([math.cos(theta), math.sin(theta), 0.0])
    if 'eye' in view and ground_z is not None:
        # From eye height above the ground, looking up at the middle: find the distance and the angle
        # together, a few rounds being plenty
        el = 0.0
        for _ in range(6):
            d = flat * math.cos(el) + np.array([0, 0, math.sin(el)])
            dist = fit(corners, target, d, half_w, half_h)
            el = math.atan2(ground_z + view['eye'] - target[2], dist * math.cos(el))
        eye = target + dist * (flat * math.cos(el) + np.array([0, 0, math.sin(el)]))
    else:
        el = math.radians(view.get('el', 20))
        d = flat * math.cos(el) + np.array([0, 0, math.sin(el)])
        eye = target + fit(corners, target, d, half_w, half_h) * d
    look_from(cam, tuple(eye), tuple(target))
    # The sun shines from 45 degrees to the camera's left, so the light models the shapes
    sun.rotation_euler = (math.radians(90 - SUN['elevation']), 0.0, theta + math.radians(45 + 90))
    scene.render.resolution_x, scene.render.resolution_y = w, h
    if ground is not None:
        ground.hide_render = bool(eye[2] < ground_z + 0.5)  # leave it out when looking up from below it
    scene.render.filepath = os.path.join(out, name + '.png')
    start = time.time()
    bpy.ops.render.render(write_still=True)
    print(f'RENDER {name} ({time.time() - start:.0f} s)', flush=True)


def setup_render(scene):
    scene.render.engine = 'CYCLES'
    scene.cycles.device = 'CPU'
    scene.cycles.samples = int(os.environ.get('SAMPLES', '128'))
    scene.cycles.use_denoising = getattr(bpy.app.build_options, 'openimagedenoise', True)
    if scene.cycles.use_denoising:
        scene.cycles.denoiser = 'OPENIMAGEDENOISE'
    scene.render.resolution_percentage = int(os.environ.get('SCALE', '100'))
    scene.render.image_settings.file_format = 'PNG'
    scene.render.film_transparent = False
    scene.render.threads_mode = 'FIXED'
    scene.render.threads = max(1, (os.cpu_count() or 2) - 1)  # leaves a core for the desktop
    # AgX with a little more contrast looks most like the photos; older versions only have Filmic
    try:
        scene.view_settings.view_transform = 'AgX'
        scene.view_settings.look = 'AgX - Medium High Contrast'
    except TypeError:
        scene.view_settings.view_transform = 'Filmic'


def main():
    args = sys.argv[sys.argv.index('--') + 1:]
    out, specs = args[0], args[1:]
    first = MODELS.get(specs[0].split(':')[0], OTHER)
    views = STACK_VIEWS if len(specs) > 1 else first['views']
    wanted = [v for v in os.environ.get('VIEWS', '').split(',') if v]
    for v in wanted:
        if v not in views:
            sys.exit(f'no view called {v}; the views are {", ".join(views)}')
    scene = bpy.context.scene
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    setup_render(scene)

    models = []
    for spec in specs:
        name, meshdir, z = spec.split(':')
        settings = MODELS.get(name, OTHER)
        coll = bpy.data.collections.new(name)
        scene.collection.children.link(coll)
        objs = []
        for f in sorted(os.listdir(meshdir)):
            if not (f.startswith(name + '_') and f.endswith('.stl')):
                continue
            material = f[len(name) + 1:-4]
            tris = read_stl(os.path.join(meshdir, f))
            if len(tris) == 0:
                continue
            obj = mesh_object(f'{name} {material}', tris, coll)
            obj.location.z = float(z) / 1000.0
            obj['material'] = material
            if material == 'steel':
                mat = steel_material(f'steel ({name})', settings.get('rings'))
            elif material == 'tiles':
                mat = tile_material('tiles')
            elif material == 'aft_shield':
                mat = aft_shield_material('aft_shield')
            else:
                if material not in LOOKS:
                    print(f'WARNING: no look for material {material}; it is drawn plain grey')
                mat = plain_material(material, LOOKS.get(material, UNKNOWN_LOOK))
            obj.data.materials.append(mat)
            objs.append(obj)
            print(f'LOADED {name} {material}: {len(tris)} triangles', flush=True)
        models.append((name, settings, objs, float(z) / 1000.0))

    everything = [o for m in models for o in m[2]]
    verts = vertices(everything)
    drop = first.get('ground')
    if len(models) > 1:
        drop = max(m[1].get('ground') or 0.0 for m in models)
    ground_z = None if drop is None else verts[:, 2].min() - drop
    make_world()
    sun = make_sun()
    ground = make_ground(ground_z) if ground_z is not None else None

    cam_data = bpy.data.cameras.new('Camera')
    cam_data.clip_end = 10000.0
    cam = bpy.data.objects.new('Camera', cam_data)
    scene.collection.objects.link(cam)
    scene.camera = cam

    os.makedirs(out, exist_ok=True)
    bpy.context.preferences.filepaths.save_version = 0  # no .blend1 backups
    base = os.path.basename(os.path.normpath(out))
    if base == 'blender':
        base = os.path.basename(os.path.dirname(os.path.normpath(out)))
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(out, base + '.blend'), compress=True)
    print('SAVED ' + base + '.blend', flush=True)
    export_glb(everything, os.path.join(out, base + '.glb'))

    for name, view in views.items():
        if wanted and name not in wanted:
            continue
        render_view(scene, cam, sun, name, view, verts, ground_z, ground, out)
    # Save again, with the camera left at the last view
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(out, base + '.blend'), compress=True)


def export_glb(objects, path):
    """A .glb of the model with each material's look as constant values, which other 3D viewers read
    (they can't read Blender's procedural textures, so the tiles' pattern isn't in it)."""
    saved = {}
    for o in objects:
        look = LOOKS.get(o['material'], UNKNOWN_LOOK)
        saved[o.name] = o.data.materials[0]
        o.data.materials[0] = flat_material(o['material'], look)
    for o in bpy.context.scene.objects:
        o.select_set(o in objects)
    try:
        bpy.ops.export_scene.gltf(filepath=path, export_format='GLB', use_selection=True, export_apply=True)
        print('SAVED ' + os.path.basename(path), flush=True)
    except Exception as e:  # the exporter's options change between versions
        print(f'WARNING: no .glb: {e}')
    for o in objects:
        o.data.materials[0] = saved[o.name]


main()
