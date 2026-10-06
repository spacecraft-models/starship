// Super Heavy: the V3 booster, built from dimensions.md's "Super Heavy V3 in detail" and
// "Raptor engines" sections. The 33 engines are raptor.scad's sea-level Raptor 3.
// Units are mm at full size, Z up, with the outer ring's nozzle exits on z = 0, as in dimensions.md.
// The inner ring's and centre trio's exits hang 0.2 m and 0.5 m lower, so the lowest point is
// z = -500. The ship sits on top of the hot-staging truss, so starship.scad stacks at z = 72300.
// Values under [From dimensions.md] come from that file, which tags each one Published, Reported
// or Estimated (measured from photos); the comments mark the estimated ones. Values under
// [Estimates] aren't in dimensions.md, so they are guesses worth adjusting.
// Azimuths are dimensions.md's: 0 is the rudder grid fin, under the ship's windward side,
// increasing counterclockwise seen from above. It faces +Y like the ship's windward side, so the
// default render views look at the tower side, where the raceway runs.

use <raptor.scad>

/* [Print] */
// Print at 1:model_scale. 1 is full size; 300 makes the booster 243 mm tall.
model_scale = 1; // [1:1000]
// Facets around the hull
segments = 128;
// Engine nozzle walls. 0 makes the nozzles solid, which suits prints smaller than about 1:100.
nozzle_wall = 40;
// The grid fins' lattice. Off makes the fins solid, which suits prints smaller than about 1:100.
fin_lattice = true;

/* [From dimensions.md] */
// Top of the hot-staging truss, where the ship sits
height = 72300;
diameter = 9000;
// Bottom of the conduit band round the skirt, its top, and its diameter (estimated)
band_z = [3300, 5900];
band_d = 10000;
// Sea-level Raptor 3 nozzle exit
raptor_exit = 1300;
// The engines (estimated): 20 fixed ones in the outer ring at 9 + 18k degrees, 10 gimballed ones
// in the inner ring at 18 + 36k, and the gimballed centre trio. For each group, the radius of its
// circle and the height of its nozzle exits.
outer_r = 4600;
outer_exit_z = 0;
inner_r = 2600;
inner_exit_z = -200;
centre_az = [0, 108, 252];
centre_r = 1100;
centre_exit_z = -500;
// Each outer engine hangs under a round housing against the skirt, reaching up to the conduit
// band (estimated)
housing_d = 400;
// The open truss rises truss_open from the top of the tank wall to the top of its ring (estimated).
// Its 20 brackets on the tank wall sit at 18k degrees and the ring's 20 attachment points at
// 9 + 18k. Each attachment takes two struts strut_pair apart, spreading down to the brackets either side.
truss_open = 3000;
strut_pair = 400;
// The struts are tubes tapering to a point at each end. The brackets are clevises below the top of
// the tank wall: width and height (estimated).
strut_d = 225;
bracket = [250, 600];
// How far the methane tank's forward dome rises above the top of the tank wall (estimated, rough)
dome_rise = 2500;
// Grid fins: the rudder at 0 and the catch fins at 90 and 270. Each reaches fin_reach out from the
// hull and is fin_width wide round it. fin_z is their apparent span seen from below; the frame is
// fin_depth deep, centred on it (estimated).
fin_az = [0, 90, 270];
fin_reach = 4200;
fin_width = 3200;
fin_z = [64600, 66100];
fin_depth = 800;
// Each fin pivots on a round bearing on the tank wall, with a round port pod_port_up above it (estimated)
pod_d = 1200;
port_d = 400;
pod_port_up = 2000;
// Chines (estimated): the taller pair on the raceway side and the shorter pair on the rudder side,
// with the heights of their tops. All four come down to the top of the conduit band, and their
// outer faces are chine_out from the axis.
tall_chine_az = [160, 200];
tall_chine_top = 36800;
short_chine_az = [59, 301];
short_chine_top = 28800;
chine_out = 5850;
// Raceway (estimated): azimuth, its bottom about halfway down and its top just below the truss, and width
raceway_az = 178;
raceway_z = [36150, 68000];
raceway_w = 750;

/* [Estimates] */
// The ring at the top of the truss that the ship sits on: height and radial width. Its height sets
// how far the struts lean, which dimensions.md puts at about 8° to 10° (10° with 300).
truss_ring_h = 300;
truss_ring_w = 350;
// How far the fins' roots stand off the hull, how far the bearing stands proud of the wall, and the
// thickness of the arm from the bearing to the fin
pod_out = 500;
pod_proud = 150;
arm_d = 400;
// The fins' frame and lattice plates, and the lattice's spacing, which gives roughly the 10 cells
// along a fin that dimensions.md counts. The plates' top and bottom edges are cut in arches
// arch_depth deep between their crossings; previews show the arches, but the STL leaves them out
// because they would make it far slower to export.
fin_frame = 150;
fin_bar = 60;
fin_pitch = 480;
arch_depth = 210;
// Chines: width round the hull, and the rise of the sloping cut at the bottom and the chamfer at the top
chine_w = 1000;
chine_cut = 1350;
chine_chamfer = 1350;
// How far the raceway stands off the hull
raceway_out = 300;
// The thrust plate's underside is flat for plate_flat either side of each engine circle and slopes
// between them. Below the conduit band the skirt ends in a dark ring of skirt_wall, with a small
// opening of skirt_opening (width, height) between each pair of outer engines.
plate_flat = 350;
skirt_wall = 150;
skirt_opening = [120, 180];

/* [Hidden] */
R = diameter / 2;
wall_top = height - truss_open; // top of the tank wall, where the dome starts
ring_bottom = height - truss_ring_h;
outer_az = [for (k = [0 : 19]) 9 + 18 * k];
inner_az = [for (k = [0 : 9]) 18 + 36 * k];
bracket_az = [for (k = [0 : 19]) 18 * k];
mount = raptor_sl_mount(raptor_exit); // height of an engine's top plate above its nozzle exit
plate_rim = outer_exit_z + mount;      // the outer engines' top plates, where the skirt ends
strut_r = R - 50;                      // radius of the circle the struts run on
fin_zc = (fin_z[0] + fin_z[1]) / 2;
steel = [0.78, 0.79, 0.81];
raceway_steel = [0.66, 0.67, 0.69];
dark = [0.22, 0.22, 0.24];
band_grey = [0.3, 0.3, 0.32];
plate_grey = [0.42, 0.42, 0.44];
fin_grey = [0.32, 0.32, 0.34];
bearing_bronze = [0.45, 0.38, 0.28];
dome_steel = [0.7, 0.68, 0.63];

function az(a) = a + 90; // dimensions.md azimuth to OpenSCAD's angle from +X

// The tank barrel from the bottom of the conduit band to the top of the tank wall, with the band
// round its foot
module barrel() {
    color(steel) translate([0, 0, band_z[0]]) cylinder(h = wall_top - band_z[0], r = R, $fn = segments);
    color(band_grey) rotate_extrude($fn = segments) translate([R - 100, band_z[0]])
        square([band_d / 2 - R + 100, band_z[1] - band_z[0]]);
}

// The methane tank's forward dome, plated in steel. Its curve carries on up from the tank wall.
module forward_dome() color(dome_steel) translate([0, 0, wall_top]) rotate_extrude($fn = segments)
    polygon(concat([[0, 0]], [for (i = [0 : 16]) let(a = 90 * i / 16) [R * cos(a), dome_rise * sin(a)]]));

// The thrust plate that carries all 33 engines and closes the bottom of the skirt. Its tiled
// underside steps down from the outer ring to the centre, so each engine hangs from it by its top
// plate. The skirt ends below the conduit band in a dark ring with small openings, level with the
// outer engines' top plates, and each outer engine hangs under a housing against that ring.
module thrust_plate() {
    f = plate_flat;
    zc = centre_exit_z + mount;
    zi = inner_exit_z + mount;
    color(plate_grey) rotate_extrude($fn = segments) polygon([
        [0, zc], [centre_r + f, zc], [inner_r - f, zi], [inner_r + f, zi], [outer_r - f, plate_rim],
        [R - skirt_wall, plate_rim], [R - skirt_wall, band_z[0] + 100], [0, band_z[0] + 100]]);
    color(dark) {
        difference() {
            rotate_extrude($fn = segments) translate([R - skirt_wall, plate_rim])
                square([skirt_wall, band_z[0] - plate_rim + 100]);
            for (a = bracket_az) rotate([0, 0, az(a)])
                translate([R - 50, -skirt_opening[0] / 2, (plate_rim + band_z[0] - skirt_opening[1]) / 2])
                    cube([100, skirt_opening[0], skirt_opening[1]]);
        }
        for (a = outer_az) rotate([0, 0, az(a)]) translate([outer_r, 0, plate_rim])
            cylinder(h = band_z[0] - plate_rim + 100, d = housing_d, $fn = 32);
    }
}

// The 33 Raptors, each with its big duct facing outward. Which way the ducts face isn't known.
module engine_group(azs, r, exit_z)
    for (a = azs) rotate([0, 0, az(a)]) translate([r, 0, exit_z]) raptor_sl(raptor_exit, nozzle_wall, $fn = 32);

module engines() {
    engine_group(outer_az, outer_r, outer_exit_z);
    engine_group(inner_az, inner_r, inner_exit_z);
    engine_group(centre_az, centre_r, centre_exit_z);
}

// A point on the circle the struts run on, at dimensions.md azimuth a and height z
function strut_point(a, z) = [strut_r * cos(az(a)), strut_r * sin(az(a)), z];

// A strut from p to q: a tube that tapers to a point at both ends
module strut(p, q) hull() for (t = [0, 0.15, 0.85, 1])
    translate(p + t * (q - p)) sphere(d = (t == 0 || t == 1) ? strut_d / 4 : strut_d, $fn = 12);

// The open hot-staging truss: an inverted V from each of the ring's attachment points down to the
// brackets either side, the brackets on the tank wall, and the ring the ship sits on
module truss() {
    da = strut_pair / 2 / strut_r * 180 / PI; // half the pair's spacing at the top, in degrees
    color(steel) {
        for (a = bracket_az) {
            strut(strut_point(a + 9 - da, ring_bottom), strut_point(a, wall_top));
            strut(strut_point(a + 9 + da, ring_bottom), strut_point(a + 18, wall_top));
        }
        rotate_extrude($fn = segments) translate([R - truss_ring_w, ring_bottom]) square([truss_ring_w, truss_ring_h]);
    }
    color(dark) for (a = bracket_az) rotate([0, 0, az(a)])
        translate([R - 150, -bracket[0] / 2, wall_top - bracket[1]]) cube([250, bracket[0], bracket[1]]);
}

// A grid fin's frame, its length along X from x0 to x1 and centred on y = 0, with or without
// the lattice inside. Both come from one outline, so the STL gets a clean solid.
module fin_outline(x0, x1, with_lattice) {
    n = ceil(norm([x1 - x0, fin_width]) / 2 / fin_pitch) + 1;
    inner = [x1 - x0 - 2 * fin_frame, fin_width - 2 * fin_frame];
    difference() {
        translate([x0, -fin_width / 2]) square([x1 - x0, fin_width]);
        translate([x0 + fin_frame, -inner[1] / 2]) square(inner);
    }
    if (with_lattice) intersection() {
        translate([x0 + fin_frame, -inner[1] / 2]) square(inner);
        translate([(x0 + x1) / 2, 0]) rotate(45) difference() {
            square(2 * n * fin_pitch, center = true);
            for (i = [-n : n - 1], j = [-n : n - 1]) translate([(i + 0.5) * fin_pitch, (j + 0.5) * fin_pitch])
                square(fin_pitch - fin_bar, center = true);
        }
    }
}

// One lattice plate in its own plane, along x and fin_depth tall, with arches cut out of its top
// and bottom edges between the crossings
module scalloped_plate(n) {
    a = (fin_pitch - fin_bar) / 2;
    difference() {
        translate([-n * fin_pitch, 0]) square([2 * n * fin_pitch, fin_depth]);
        for (m = [-n : n - 1], y = [0, fin_depth]) translate([(m + 0.5) * fin_pitch, y])
            scale([1, arch_depth / a]) circle(a, $fn = 24);
    }
}

// A grid fin pointing along +X: a level frame and diagonal lattice, on an arm from the round
// bearing it pivots on, with the round port above the bearing
module grid_fin() {
    x0 = R + pod_out;
    x1 = R + fin_reach;
    z0 = fin_zc - fin_depth / 2;
    n = ceil(norm([x1 - x0, fin_width]) / 2 / fin_pitch) + 1;
    color(fin_grey) {
        translate([0, 0, z0]) linear_extrude(fin_depth) fin_outline(x0, x1, fin_lattice && !$preview);
        if (fin_lattice && $preview) intersection() {
            translate([x0 + fin_frame, -fin_width / 2 + fin_frame, z0])
                cube([x1 - x0 - 2 * fin_frame, fin_width - 2 * fin_frame, fin_depth]);
            translate([(x0 + x1) / 2, 0, z0]) rotate([0, 0, 45]) for (k = [-n : n], turn = [0, 90])
                rotate([0, 0, turn]) translate([0, k * fin_pitch, 0]) rotate([90, 0, 0])
                    linear_extrude(fin_bar, center = true) scalloped_plate(n);
        }
        translate([R - 100, 0, fin_zc]) rotate([0, 90, 0]) cylinder(h = pod_out + 200, d = arm_d, $fn = 24);
    }
    color(bearing_bronze) translate([R - 150, 0, fin_zc]) rotate([0, 90, 0]) {
        cylinder(h = 150 + pod_proud, d = pod_d, $fn = 48);
        cylinder(h = 150 + pod_proud + 80, d = pod_d * 0.65, $fn = 48);
    }
    color(dark) translate([R - 100, 0, fin_zc + pod_port_up]) rotate([0, 90, 0]) cylinder(h = 180, d = port_d, $fn = 32);
}

// A flat panel outlined by [r, z] points in the XZ plane, from y = y0 to y0 + t
module panel(outline, y0, t) translate([0, y0 + t, 0]) rotate([90, 0, 0]) linear_extrude(t) polygon(outline);

// A chine at azimuth a with its top at `top`: a box standing off the hull, with its bottom cut on a
// slope up from the conduit band and its top chamfered
module chine(a, top) rotate([0, 0, az(a)]) panel([
    [R - 200, band_z[1]], [R, band_z[1]], [chine_out, band_z[1] + chine_cut],
    [chine_out, top - chine_chamfer], [R, top], [R - 200, top]], -chine_w / 2, chine_w);

// The raceway: a strip standing off the hull, with rounded ends
module raceway() rotate([0, 0, az(raceway_az)]) translate([R - 100, 0, raceway_z[0]]) rotate([90, 0, 90])
    linear_extrude(raceway_out + 100) hull() {
        translate([0, raceway_w / 2]) circle(d = raceway_w, $fn = 32);
        translate([0, raceway_z[1] - raceway_z[0] - raceway_w / 2]) circle(d = raceway_w, $fn = 32);
    }

module super_heavy() {
    barrel();
    thrust_plate();
    forward_dome();
    truss();
    for (a = fin_az) rotate([0, 0, az(a)]) grid_fin();
    color(steel) {
        for (a = tall_chine_az) chine(a, tall_chine_top);
        for (a = short_chine_az) chine(a, short_chine_top);
    }
    color(raceway_steel) raceway();
    engines();
}

scale(1 / model_scale) super_heavy();
