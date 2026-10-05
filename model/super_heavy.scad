// Basic Super Heavy: the V3 booster without small details.
// Units are mm at full size, Z up, with the engines' nozzle exits on z = 0. The ship sits on
// top of the hot-staging truss, at z = 72300 with the default settings.
// Values under [From dimensions.md] come from that file's basic booster and Raptor figures.
// Those don't cover the values under [Estimates], so they are rough guesses worth adjusting.
// The fin at the stem of the T faces +Y, the side starship.scad gives the ship's heat shield
// (dimensions.md's detailed section puts it there), so the ship stacks on top without rotating.

/* [Print] */
// Print at 1:model_scale. 1 is full size; 300 makes the booster 241 mm tall.
model_scale = 1; // [1:1000]
// Facets around the hull
segments = 128;

/* [From dimensions.md] */
// Height, including the hot-staging truss on top
height = 72300;
// Whether that height includes the engines, which hang below the hull. dimensions.md says it
// does, judging from photos.
height_includes_engines = true;
diameter = 9000;
// Engines in the centre, the inner ring and the outer ring
centre_engines = 3;
inner_engines = 10;
outer_engines = 20;
// Sea-level Raptor length and nozzle exit diameter
raptor_len = 3100;
raptor_exit = 1300;
// Azimuths of the three grid fins, spaced 90° / 90° / 180° (a T seen from above).
// 0 is +X, so the fin at 90 is the stem of the T.
fin_azimuths = [0, 90, 180];

/* [Estimates] */
// Height of the open hot-staging truss, and of the ring at its top that the ship sits on
truss_h = 4000;
truss_ring_h = 600;
// Number of V-shaped bays around the truss, and the thickness of its struts
truss_bays = 12;
strut_d = 400;
// How far the methane tank's forward dome rises into the truss
dome_h = 2500;
// Grid fins lie level: how far each reaches out from the hull, its width around the hull and its depth
fin_reach = 4000;
fin_width = 6000;
fin_depth = 1000;
// Gap between the top of the grid fins and the bottom of the truss
fin_gap = 1500;
// The fins' frame and grid bars, and the size of the square cells. 0 makes the fins solid.
fin_frame = 350;
fin_bar = 250;
fin_cell = 1000;
// Radius of the circles the engines sit on. The 20 outer nozzles nearly touch, so they reach
// about 0.35 m past the hull: twenty 1.3 m nozzles can't fit inside a 9 m circle.
centre_ring_r = 800;
inner_ring_r = 2300;
outer_ring_r = 4200;
// Each Raptor is a bell nozzle under a cylindrical powerhead. The powerhead is narrower than
// starship.scad's so the outer ring's powerheads stay under the hull.
powerhead_h = 1400;
powerhead_r = 300;
throat_r = 250;

/* [Hidden] */
R = diameter / 2;
top = height_includes_engines ? height : height + raptor_len; // top of the truss, where the ship sits
hull_bottom = raptor_len;  // the engines hang below the hull, which starts at their tops
tank_top = top - truss_h;  // top of the hull's cylinder, where the dome and the truss start
ring_w = 350;              // radial width of the ring the ship sits on, a little wider than its skirt
fin_embed = 150;           // how far the middle of each fin's root sinks into the hull
steel = [0.78, 0.79, 0.81];
dome_grey = [0.55, 0.55, 0.57];
fin_grey = [0.5, 0.51, 0.53];
engine_grey = [0.4, 0.38, 0.36];

// The tank section: a plain cylinder from the engine tops to the base of the truss
module tanks() cylinder(h = tank_top - hull_bottom, r = R, $fn = segments);

// The methane tank's forward dome, half an ellipse turned about the axis, rising into the truss
module forward_dome()
    translate([0, 0, tank_top]) rotate_extrude($fn = segments)
        polygon(concat([[0, 0]], [for (i = [0 : 16]) let(a = 90 * i / 16) [R * cos(a), dome_h * sin(a)]]));

function truss_node(a, z) = let(r = R - strut_d / 2) [r * cos(a), r * sin(a), z];

module strut(p, q) hull() {
    translate(p) sphere(d = strut_d, $fn = 8);
    translate(q) sphere(d = strut_d, $fn = 8);
}

// The open hot-staging truss: struts zigzag between the top of the tanks and the ring the ship sits on
module truss() {
    step = 360 / truss_bays;
    z_ring = top - truss_ring_h;
    for (i = [0 : truss_bays - 1]) {
        a = 90 + i * step;
        strut(truss_node(a, tank_top), truss_node(a + step / 2, z_ring));
        strut(truss_node(a + step / 2, z_ring), truss_node(a + step, tank_top));
    }
    rotate_extrude($fn = segments) translate([R - ring_w, z_ring]) square([ring_w, truss_ring_h]);
}

// Square cells on a diagonal grid, centred on the origin, enough to cover a whole fin
module fin_cells() {
    pitch = fin_cell + fin_bar;
    n = ceil(max(fin_reach, fin_width) / pitch);
    rotate(45) for (i = [-n : n], j = [-n : n]) translate([i * pitch, j * pitch]) square(fin_cell, center = true);
}

// A grid fin pointing along +X: a level frame filled with a diagonal grid. Only the middle of its
// straight root meets the curved hull, like a fin mounted on a pivot.
module grid_fin() {
    x0 = R - fin_embed;
    x1 = R + fin_reach;
    linear_extrude(fin_depth) difference() {
        translate([x0, -fin_width / 2]) square([x1 - x0, fin_width]);
        if (fin_cell > 0) intersection() {
            translate([x0 + fin_frame, -fin_width / 2 + fin_frame])
                square([x1 - x0 - 2 * fin_frame, fin_width - 2 * fin_frame]);
            translate([(x0 + x1) / 2, 0]) fin_cells();
        }
    }
}

module grid_fins()
    for (a = fin_azimuths) rotate([0, 0, a]) translate([0, 0, tank_top - fin_gap - fin_depth]) grid_fin();

// [r, z] outline of a Raptor with its nozzle exit on z = 0: a bell up to the throat, then the
// powerhead, which sinks 100 mm into the bottom of the hull
function raptor_profile(n = 12) = let(re = raptor_exit / 2, nozzle = raptor_len - powerhead_h)
    concat([[0, 0]],
           [for (i = [0 : n]) [throat_r + (re - throat_r) * sqrt(1 - i / n), nozzle * i / n]],
           [[powerhead_r, nozzle], [powerhead_r, hull_bottom + 100], [0, hull_bottom + 100]]);

module raptor() rotate_extrude($fn = 48) polygon(raptor_profile());

module engine_ring(count, r, start)
    for (i = [0 : count - 1]) rotate([0, 0, start + i * 360 / count]) translate([r, 0, 0]) raptor();

// Every ring is symmetric about the Y axis, like the fins. The outer ring is offset half a step
// so none of its engines sits straight behind an inner one.
module engines() {
    engine_ring(centre_engines, centre_ring_r, 90);
    engine_ring(inner_engines, inner_ring_r, 90);
    engine_ring(outer_engines, outer_ring_r, 90 + 180 / outer_engines);
}

module super_heavy() {
    color(steel) {
        translate([0, 0, hull_bottom]) tanks();
        truss();
    }
    color(dome_grey) forward_dome();
    color(fin_grey) grid_fins();
    color(engine_grey) engines();
}

scale(1 / model_scale) super_heavy();
