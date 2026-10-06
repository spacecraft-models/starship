// Raptor 3 engines: the sea-level Raptor 3 and the Raptor 3 Vacuum (RVac), for the vehicle
// models to pull in with use <raptor.scad>. Rendered on its own, this file shows one of each.
// Units are mm, Z up, with the nozzle exit on z = 0 and the engine's axis on the Z axis.
// The outlines are the "Shape for modelling" tables in dimensions.md's Raptor engines section,
// in metres, which were measured from SpaceX photos. The powerhead isn't round: its big duct
// is on +X and a smaller pipe loop is on -X.

/* [Print] */
// Print at 1:model_scale. 1 is full size; 20 makes the RVac 227 mm tall.
model_scale = 1; // [1:1000]
// Nozzle walls. 0 makes the nozzles solid.
nozzle_wall = 40;

/* [Hidden] */
// Sea-level Raptor 3 with a 1.3 m exit: [h, r] in metres, h up from the nozzle exit
sl_nozzle = [
    [0, 0.65], [0.1, 0.64], [0.2, 0.62], [0.3, 0.6], [0.4, 0.58], [0.5, 0.55], [0.6, 0.52],
    [0.7, 0.485], [0.8, 0.45], [0.9, 0.41], [1.0, 0.37], [1.05, 0.35], // bell
    [1.09, 0.4], [1.11, 0.42], [1.14, 0.42],                           // manifold ring
    [1.15, 0.33], [1.25, 0.29], [1.35, 0.24], [1.45, 0.185],           // upper nozzle, hidden in the photo, so smoothed
    [1.5, 0.16]];                                                      // throat, outside the cooling jacket
sl_bell_top = 1.05; // the nozzle's inside runs straight from here to the throat
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
// The big duct from the powerhead down to the manifold ring, as a chain of [r, h, radius] balls
duct = [[0.22, 2.1, 0.18], [0.5, 2.1, 0.22], [0.47, 1.85, 0.12], [0.47, 1.5, 0.12],
        [0.43, 1.25, 0.1], [0.38, 1.12, 0.08]];
// The smaller pipe loop on the other side, and the capped port facing up on the duct
pipe_loop = [[-0.17, 1.47, 0.035], [-0.255, 1.4, 0.035], [-0.255, 1.18, 0.035]];
duct_port = [0.5, 2.25, 2.4, 0.08]; // r, bottom h, top h, radius

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
metal = [0.6, 0.6, 0.62];
light = [0.72, 0.72, 0.74];

// Height of the top of the top plate above the nozzle exit, in mm
function raptor_sl_mount(exit = 1300) = sl_mount * 1000 * exit / 1300;
function raptor_vac_mount(exit = 2400, sl_exit = 1300) =
    vac_nozzle[len(vac_nozzle) - 1][0] * 1000 * exit / 2300 + (sl_mount - sl_throat) * 1000 * sl_exit / 1300;

// [r, z] outline in mm of a nozzle turned from `out`, a list of [h, r] in metres from the exit up,
// scaled by k. With a wall it is hollow: the inside follows the outside, `wall` in, up to
// bell_top, then narrows straight to the throat bore.
function nozzle_outline(out, bell_top, wall, k) = let(
    s = 1000 * k,
    top = out[len(out) - 1][0],
    outside = [for (p = out) [p[1] * s, p[0] * s]])
    wall <= 0 ? concat([[0, out[0][0] * s]], outside, [[0, top * s]])
              : concat(outside,
                       top > bell_top ? [[throat_bore * s, top * s]] : [],
                       [for (i = [len(out) - 1 : -1 : 0]) if (out[i][0] <= bell_top)
                           [out[i][1] * s - wall, out[i][0] * s]]);

module ball(b, s) translate([b[0] * s, 0, (b[1] - sl_throat) * s]) sphere(b[2] * s, $fn = 24);

// Chamber, powerhead and plumbing with the throat on z = 0, scaled by k. The turned part starts
// 5 mm below the throat so it fuses with the nozzle.
module raptor_core(k) {
    s = 1000 * k;
    color(metal) {
        rotate_extrude() polygon(concat(
            [[0, -5], [sl_core[0][1] * s, -5]],
            [for (p = sl_core) [p[1] * s, (p[0] - sl_throat) * s]],
            [[0, (sl_core[len(sl_core) - 1][0] - sl_throat) * s]]));
        for (chain = [duct, pipe_loop]) for (i = [0 : len(chain) - 2]) hull() {
            ball(chain[i], s);
            ball(chain[i + 1], s);
        }
        translate([duct_port[0] * s, 0, (duct_port[1] - sl_throat) * s])
            cylinder(h = (duct_port[2] - duct_port[1]) * s, r = duct_port[3] * s, $fn = 24);
    }
}

// Sea-level Raptor 3 with its nozzle exit on z = 0
module raptor_sl(exit = 1300, wall = 40) {
    k = exit / 1300;
    color(dark) rotate_extrude() polygon(nozzle_outline(sl_nozzle, sl_bell_top, wall, k));
    translate([0, 0, sl_throat * 1000 * k]) raptor_core(k);
}

// Raptor 3 Vacuum with its nozzle exit on z = 0. sl_exit sizes the chamber and powerhead it
// shares with the sea-level engine.
module raptor_vac(exit = 2400, wall = 40, sl_exit = 1300) {
    kv = exit / 2300;
    s = 1000 * kv;
    color(light) {
        rotate_extrude() polygon(nozzle_outline([for (p = vac_nozzle) if (p[0] <= vac_ext_top) p], vac_ext_top, wall, kv));
        rotate_extrude() translate([1.12 * s, vac_ring[0] * s])
            square([(vac_ring[2] - 1.12) * s, (vac_ring[1] - vac_ring[0]) * s]);
    }
    color(dark) rotate_extrude()
        polygon(nozzle_outline([for (p = vac_nozzle) if (p[0] >= vac_ext_top) p], vac_bell_top, wall, kv));
    translate([0, 0, vac_nozzle[len(vac_nozzle) - 1][0] * s]) raptor_core(sl_exit / 1300);
}

// One of each, side by side with their ducts facing -Y
scale(1 / model_scale) {
    translate([-1700, 0, 0]) rotate([0, 0, -90]) raptor_sl(wall = nozzle_wall, $fn = 96);
    translate([1100, 0, 0]) rotate([0, 0, -90]) raptor_vac(wall = nozzle_wall, $fn = 96);
}
