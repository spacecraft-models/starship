// Small parts both vehicles carry, for the model files to pull in with use <details.scad>: round ports
// and windows, bands of vent slats, rods, bell-shaped vents and tile-covered boxes. Each is drawn as if
// on a hull whose surface is the plane x = 0, facing out along +X with Z up, and reaches sink() into the
// hull so that it meets a curved surface without a gap. The model files only place them, with on_hull().
// Rendered on its own, this file shows one of each.

use <materials.scad>

/* [Materials] */
// Draws only the parts made of one material. "all" draws them all.
material = "all"; // [all, steel, tiles, black]

/* [Hidden] */
// How far each part reaches back into the hull. A function, so the model files can use it too.
function sink() = 100;

// Places its children on a hull of radius r at OpenSCAD angle a (degrees from +X) and height z,
// facing out from the axis. A tilt turns them to face up a surface that leans in toward the top by
// that many degrees, as the ship's nose does.
module on_hull(a, r, z, tilt = 0) rotate([0, 0, a]) translate([r, 0, z]) rotate([0, -tilt, 0]) children();

// A disc of diameter d whose face is at x = h, reaching sink() back behind x = 0
module disc(d, h, fn = 48) translate([-sink(), 0, 0]) rotate([0, 90, 0]) cylinder(h = h + sink(), d = d, $fn = fn);

// A round port or window: an opening of diameter d (a dark disc, or a grille in `opening`) set back
// in a flange of diameter flange_d that stands `proud` off the hull. A thin plate of diameter plate[0]
// and thickness plate[1] can sit behind it. bolts = [count, circle diameter, head diameter] draws a ring
// of bolt heads on the flange or the plate, whichever they land on.
module bolted_port(d, flange_d, proud = 40, bolts = [0, 0, 0], plate = [0, 0], opening = "black") {
    made_of("steel") difference() {
        union() {
            disc(flange_d, proud);
            if (plate[0] > 0) disc(plate[0], plate[1]);
            if (bolts[0] > 0) for (i = [0 : bolts[0] - 1]) let(a = 360 * i / bolts[0])
                translate([0, bolts[1] / 2 * cos(a), bolts[1] / 2 * sin(a)])
                    disc(bolts[2], (bolts[1] < flange_d ? proud : plate[1]) + bolts[2] / 3, 8);
        }
        translate([proud - 20, 0, 0]) rotate([0, 90, 0]) cylinder(h = 100, d = d, $fn = 48);
    }
    made_of(opening) disc(d + 1, proud - 19);
}

// A ring of raised slots round a port, drawn as a band d across and w wide standing h off the hull
module raised_ring(d, w, h) difference() {
    disc(d + w, h, 64);
    translate([-sink() - 1, 0, 0]) rotate([0, 90, 0]) cylinder(h = h + sink() + 2, d = d - w, $fn = 64);
}

// A band of upright slats round a hull of radius r, from height z0 to z1 and OpenSCAD angle a0 to a1,
// each slat = [width, pitch, how far it stands off the hull]. Between angles sparse[0] and sparse[1]
// the slats are sparse[2] apart instead. The slats are one extruded shape, which keeps a full render
// fast.
module slat_band(r, z0, z1, a0, a1, slat, sparse = [0, 0, 0]) {
    step = slat[1] / r * 180 / PI;
    dense = [for (a = [a0 + step / 2 : step : a1]) if (sparse[2] == 0 || a < sparse[0] || a > sparse[1]) a];
    thin = sparse[2] > 0 ? let(s = sparse[2] / r * 180 / PI) [for (a = [sparse[0] + s / 2 : s : sparse[1]]) a] : [];
    translate([0, 0, z0]) linear_extrude(z1 - z0) for (a = concat(dense, thin))
        rotate(a) translate([r - sink(), -slat[0] / 2]) square([sink() + slat[2], slat[0]]);
}

// A rod of diameter d from p to q, with rounded ends
module rod(p, q, d) hull() for (e = [p, q]) translate(e) sphere(d = d, $fn = 12);

// A pipe of diameter d turning through a right angle on a bend of radius b, from heading down (-Z) at
// the origin to heading along +Y at [0, b, -b]
module elbow(b, d) translate([0, b, 0]) rotate([0, 90, 0]) rotate([0, 0, -90])
    rotate_extrude(angle = 90, $fn = 24) translate([b, 0]) circle(d = d, $fn = 16);

// A bell-shaped vent hanging down from z = 0: a flared tube d0 across at the top and d1 at its mouth,
// h long, with walls `wall` thick
module bell(d0, d1, h, wall = 25) {
    curve = [for (i = [0 : 8]) let(t = i / 8) [d0 / 2 + (d1 - d0) / 2 * pow(t, 1.6), -h * t]];
    rotate_extrude($fn = 32) polygon(concat(curve, [for (i = [8 : -1 : 0]) curve[i] - [wall, 0]]));
}

// A box w wide (along Y), h tall (along Z) and t deep off the hull, with its corners rounded to radius
// c, such as a Starlink dish under its tiled cover
module rounded_box(w, h, t, c = 80) translate([-sink(), 0, 0]) hull()
    for (y = [-1, 1], z = [-1, 1]) translate([0, y * (w / 2 - c), z * (h / 2 - c)])
        rotate([0, 90, 0]) cylinder(h = sink() + t, r = c, $fn = 16);

// A hexagonal plate across_flats wide, its points up and down, standing t off the hull
module hex_plate(across_flats, t) translate([-sink(), 0, 0]) rotate([0, 90, 0])
    cylinder(h = sink() + t, d = across_flats / cos(30), $fn = 6);

// One of each, in a row along X
for (i = [0 : 5]) translate([1500 * i, 0, 0]) rotate([0, 0, -90]) {
    if (i == 0) bolted_port(750, 1100, 40, [32, 925, 40], [1300, 15], $material = material);
    if (i == 1) union() { bolted_port(700, 850, 40, $material = material); made_of("steel", $material = material) for (d = [1150, 1450]) raised_ring(d, 60, 25); }
    if (i == 2) made_of("steel", $material = material) slat_band(4500, 0, 650, -8, 8, [70, 120, 30], [-3, 3, 260]);
    if (i == 3) made_of("steel", $material = material) translate([300, 0, 0]) bell(250, 430, 800);
    if (i == 4) made_of("tiles", $material = material) rounded_box(720, 820, 100);
    if (i == 5) made_of("steel", $material = material) hex_plate(1100, 150);
}
