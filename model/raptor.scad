// Raptor 3 engines: the sea-level Raptor 3 and the Raptor 3 Vacuum (RVac), for the vehicle
// models to pull in with use <raptor.scad>. Rendered on its own, this file shows one of each.
// Units are mm, Z up, with the nozzle exit on z = 0 and the engine's axis on the Z axis.
// The outlines are the "Shape for modelling" tables in dimensions.md's Raptor engines section,
// in metres, which were measured from SpaceX photos. The plumbing follows the flight engines on
// Boosters 19 and 20 (dimensions.md, "Plumbing on the flight engines"): the engine's front, where its
// number is painted, faces +X, and its two coolant pipes run down its sides, the bigger one on +Y,
// with a shielded valve above each. Looking at the front, +Y is on the right.

/* [Print] */
// Print at 1:model_scale. 1 is full size; 20 makes the RVac 227 mm tall.
model_scale = 1; // [1:1000]
// Nozzle walls. 0 makes the nozzles solid.
nozzle_wall = 40;
// Full draws the plumbing, valves and rings; Simple draws each engine as one turned shape, bulked
// out to stand in for them
engine_detail = 2; // [1:Simple, 2:Full]
// The thinnest part allowed on the print, in mm at print size: the engine's neck is thickened to at
// least this across. 0 keeps it true to size.
min_feature = 0; // [0:0.1:3]

/* [Hidden] */
// Sea-level Raptor 3 with a 1.3 m exit: [h, r] in metres, h up from the nozzle exit
sl_nozzle = [
    [0, 0.65], [0.1, 0.64], [0.2, 0.62], [0.3, 0.6], [0.4, 0.58], [0.5, 0.55], [0.6, 0.52],
    [0.7, 0.485], [0.8, 0.45], [0.9, 0.41], [1.0, 0.37], [1.05, 0.355], [1.15, 0.345], // bell
    [1.17, 0.39], [1.19, 0.41], [1.24, 0.41], [1.26, 0.38],            // manifold ring, as on B20's engines
    [1.28, 0.29], [1.35, 0.245], [1.45, 0.185],                        // upper nozzle
    [1.5, 0.16]];                                                      // throat, outside the cooling jacket
sl_bell_top = 1.15; // the nozzle's inside runs straight from here to the throat
sl_throat = 1.5;
throat_bore = 0.115;
// Chamber and powerhead, from the throat up
sl_core = [
    [1.5, 0.16], [1.6, 0.21], [1.75, 0.21], [1.8, 0.27],     // chamber
    [1.85, 0.29], [1.98, 0.29], [2.0, 0.24], [2.06, 0.24],   // manifold disk and the bolted flange
    [2.1, 0.2], [2.4, 0.2], [2.42, 0.24], [2.5, 0.24],       // powerhead
    [2.56, 0.25], [2.6, 0.25], [2.6, 0.2], [2.67, 0.2],      // top plate and its ring of studs
    [2.67, 0.14], [2.75, 0.14], [2.75, 0.11], [2.91, 0.11]]; // domed hub and the top port
sl_mount = 2.6; // top of the top plate, where the engine probably hangs from the vehicle
// Rings round the throat and the chamber: height, radius of the ring's centreline and of its tube
core_rings = [[1.47, 0.22, 0.055], [1.63, 0.21, 0.025], [1.72, 0.21, 0.025]];
// The coolant pipes as [waypoints, tube radius], the waypoints [y, h] in the engine's side plane
// (x = 0), with their corners rounded off. The bigger one, on +Y, leaves the manifold disk sideways,
// runs down and turns back in to the ring round the throat. The one on -Y leaves the chamber below
// the disk and curves down into the manifold ring at the top of the bell.
coolant_pipes = [
    [[[0.2, 2.05], [0.6, 2.07], [0.6, 1.49], [0.2, 1.47]], 0.045],
    [[[-0.2, 1.86], [-0.44, 1.8], [-0.44, 1.3], [-0.36, 1.22]], 0.04]];
// The shielded main valves either side of the powerhead: [x, y] of each one's axis, its bottom and
// top h and its radius. A thin line hooks up from each to the top plate.
valve_pods = [[[0.02, 0.34], 2.08, 2.36, 0.14], [[0.02, -0.33], 2.02, 2.26, 0.12]];
valve_lines = [
    [[[0.4, 2.33], [0.4, 2.52], [0.24, 2.56]], 0.016],
    [[[-0.36, 2.24], [-0.36, 2.52], [-0.24, 2.56]], 0.016]];
// Round ports round the upper powerhead: height, count, how far their faces stand from the axis,
// and their radius
powerhead_ports = [2.47, 8, 0.28, 0.035];
// The simple engine's outline from the top of the bell up, [h, r] in metres like sl_core. It is one
// turned shape that stands in for the chamber, the powerhead and the pipes and valves round them,
// bulked out to about the width the plumbing gives the full engine, with a slight waist at the throat.
simple_core = [
    [1.15, 0.345], [1.19, 0.41], [1.26, 0.41],                 // the manifold ring at the top of the bell
    [1.5, 0.34], [1.8, 0.38], [2.36, 0.4],                     // throat, chamber, powerhead and valves
    [2.45, 0.3], [2.5, 0.25], [2.6, 0.25], [2.6, 0.2], [2.67, 0.2], // top plate and its ring of studs
    [2.67, 0.14], [2.75, 0.14], [2.75, 0.11], [2.91, 0.11]];   // domed hub and the top port

// Raptor 3 Vacuum with a 2.3 m exit: the nozzle up to the throat. Above that it shares the
// sea-level engine's chamber and powerhead.
vac_nozzle = [
    [0, 1.15], [0.3, 1.14], [0.85, 1.025], [1.3, 0.905], [1.8, 0.735], // lighter, ribbed extension (1.3 m smoothed)
    [1.9, 0.675], [2.1, 0.595], [2.3, 0.52], [2.5, 0.44], [2.7, 0.33], // dark upper bell
    [3.0, 0.16]];                                                      // throat
vac_ext_top = 1.8; // the junction ring between the extension and the upper bell
vac_bell_top = 2.7;
vac_ring = [0.25, 0.35, 1.185]; // stiffening ring near the exit: bottom h, top h, radius

dark = [0.32, 0.31, 0.3];
metal = [0.46, 0.46, 0.48];
light = [0.72, 0.72, 0.74];

// Height of the top of the top plate above the nozzle exit, in mm
function raptor_sl_mount(exit = 1300) = sl_mount * 1000 * exit / 1300;
function raptor_vac_mount(exit = 2400, sl_exit = 1300) =
    vac_nozzle[len(vac_nozzle) - 1][0] * 1000 * exit / 2300 + (sl_mount - sl_throat) * 1000 * sl_exit / 1300;

// [r, z] outline in mm of a nozzle turned from `out`, a list of [h, r] in metres from the exit up,
// scaled by k. With a wall it is hollow: the inside follows the outside, `wall` in, up to
// bell_top, then narrows straight to the throat bore. The outside is never narrower than min_r.
function nozzle_outline(out, bell_top, wall, k, min_r = 0) = let(
    s = 1000 * k,
    top = out[len(out) - 1][0],
    outside = [for (p = out) [max(p[1] * s, min_r), p[0] * s]])
    wall <= 0 ? concat([[0, out[0][0] * s]], outside, [[0, top * s]])
              : concat(outside,
                       top > bell_top ? [[throat_bore * s, top * s]] : [],
                       [for (i = [len(out) - 1 : -1 : 0]) if (out[i][0] <= bell_top)
                           [out[i][1] * s - wall, out[i][0] * s]]);

// Rounds off a path's corners by cutting each one three times (Chaikin's method). The ends stay put.
function rounded(p, n = 3) = n == 0 ? p : rounded(concat([p[0]],
    [for (i = [0 : len(p) - 2]) each [0.75 * p[i] + 0.25 * p[i + 1], 0.25 * p[i] + 0.75 * p[i + 1]]],
    [p[len(p) - 1]]), n - 1);

// A pipe of radius r along `path`, a list of [y, z] points in the plane x = 0, with rounded ends.
// It is a single polyhedron, which exports much faster than a chain of hulls.
module pipe(path, r, n = 10) {
    m = len(path);
    dir = [for (i = [0 : m - 1]) let(d = path[min(i + 1, m - 1)] - path[max(i - 1, 0)]) d / norm(d)];
    points = [for (i = [0 : m - 1], j = [0 : n - 1]) let(a = 360 * j / n)
        [r * cos(a), path[i][0] - r * sin(a) * dir[i][1], path[i][1] + r * sin(a) * dir[i][0]]];
    function k(i, j) = i * n + j % n;
    polyhedron(points, concat(
        [for (i = [0 : m - 2], j = [0 : n - 1]) each [[k(i, j), k(i, j + 1), k(i + 1, j + 1)], [k(i, j), k(i + 1, j + 1), k(i + 1, j)]]],
        [for (j = [1 : n - 2]) each [[0, j + 1, j], [k(m - 1, 0), k(m - 1, j), k(m - 1, j + 1)]]]));
    for (p = [path[0], path[m - 1]]) translate([0, p[0], p[1]]) sphere(r, $fn = n);
}

// Chamber, powerhead and plumbing with the throat on z = 0, scaled by k. The turned part starts
// 5 mm below the throat so it fuses with the nozzle, and is never narrower than min_r. With
// detail = 1 it is simple_core's bulked outline instead, without the rings, pipes, valves and ports.
module raptor_core(k, detail = 2, min_r = 0) {
    s = 1000 * k;
    function at(p) = [p[0] * s, (p[1] - sl_throat) * s]; // [y, h] in metres to [y, z] in mm
    color(metal) if (detail < 2) rotate_extrude() polygon(concat(
        [[0, (simple_core[0][0] - sl_throat) * s]],
        [for (p = simple_core) [max(p[1] * s, min_r), (p[0] - sl_throat) * s]],
        [[0, (simple_core[len(simple_core) - 1][0] - sl_throat) * s]]));
    else {
        rotate_extrude() polygon(concat(
            [[0, -5], [max(sl_core[0][1] * s, min_r), -5]],
            [for (p = sl_core) [max(p[1] * s, min_r), (p[0] - sl_throat) * s]],
            [[0, (sl_core[len(sl_core) - 1][0] - sl_throat) * s]]));
        for (c = core_rings) translate([0, 0, (c[0] - sl_throat) * s])
            rotate_extrude($fn = 32) translate([c[1] * s, 0]) circle(c[2] * s, $fn = 8);
        for (p = concat(coolant_pipes, valve_lines)) pipe([for (q = rounded(p[0])) at(q)], p[1] * s);
        for (v = valve_pods) translate([v[0][0] * s, v[0][1] * s, (v[1] - sl_throat) * s]) hull() {
            cylinder(h = 10, r = v[3] * s, $fn = 16);
            translate([0, 0, (v[2] - v[1] - v[3]) * s]) sphere(v[3] * s, $fn = 16);
        }
        for (i = [0 : powerhead_ports[1] - 1]) rotate([0, 0, 22.5 + 360 * i / powerhead_ports[1]])
            translate([0, 0, (powerhead_ports[0] - sl_throat) * s]) rotate([0, 90, 0])
                cylinder(h = powerhead_ports[2] * s, r = powerhead_ports[3] * s, $fn = 8);
    }
}

// Sea-level Raptor 3 with its nozzle exit on z = 0. For small prints, detail = 1 bulks it out in place
// of the plumbing, and nothing on the engine is narrower than min_r.
module raptor_sl(exit = 1300, wall = 40, detail = 2, min_r = 0) {
    k = exit / 1300;
    color(dark) rotate_extrude() polygon(nozzle_outline(sl_nozzle, sl_bell_top, wall, k, min_r));
    translate([0, 0, sl_throat * 1000 * k]) raptor_core(k, detail, min_r);
}

// Raptor 3 Vacuum with its nozzle exit on z = 0. sl_exit sizes the chamber and powerhead it
// shares with the sea-level engine; detail and min_r work as for raptor_sl.
module raptor_vac(exit = 2400, wall = 40, sl_exit = 1300, detail = 2, min_r = 0) {
    kv = exit / 2300;
    s = 1000 * kv;
    color(light) {
        rotate_extrude() polygon(nozzle_outline([for (p = vac_nozzle) if (p[0] <= vac_ext_top) p], vac_ext_top, wall, kv, min_r));
        rotate_extrude() translate([1.12 * s, vac_ring[0] * s])
            square([(vac_ring[2] - 1.12) * s, (vac_ring[1] - vac_ring[0]) * s]);
    }
    color(dark) rotate_extrude()
        polygon(nozzle_outline([for (p = vac_nozzle) if (p[0] >= vac_ext_top) p], vac_bell_top, wall, kv, min_r));
    translate([0, 0, vac_nozzle[len(vac_nozzle) - 1][0] * s]) raptor_core(sl_exit / 1300, detail, min_r);
}

// One of each, side by side with their fronts facing -Y
scale(1 / model_scale) {
    min_r = min_feature * model_scale / 2;
    translate([-1700, 0, 0]) rotate([0, 0, -90]) raptor_sl(wall = nozzle_wall, detail = engine_detail, min_r = min_r, $fn = 96);
    translate([1100, 0, 0]) rotate([0, 0, -90]) raptor_vac(wall = nozzle_wall, detail = engine_detail, min_r = min_r, $fn = 96);
}
