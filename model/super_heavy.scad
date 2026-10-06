// Super Heavy: the V3 booster, built from dimensions.md's "Super Heavy V3 in detail" and
// "Raptor engines" sections. The 33 engines are raptor.scad's sea-level Raptor 3, and the three grid
// fins come from gridfins.scad.
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
use <gridfins.scad>

/* [Print] */
// Print at 1:model_scale. 1 is full size; 300 makes the booster 243 mm tall.
model_scale = 1; // [1:1000]
// Facets around the hull
segments = 128;
// Engine nozzle walls. 0 makes the nozzles solid, which suits prints smaller than about 1:100.
nozzle_wall = 40;
// The grid fins' lattice. Off fills each fin's outline solid, which suits prints smaller than about 1:100.
fin_lattice = true;

/* [From dimensions.md] */
// Top of the hot-staging truss, where the ship sits
height = 72300;
diameter = 9000;
// Sea-level Raptor 3 nozzle exit
raptor_exit = 1300;
// The engines (estimated): 20 fixed ones in the outer ring at 9 + 18k degrees, 10 gimballed ones
// in the inner ring at 18 + 36k, and the gimballed centre trio. For each group, the radius of its
// circle and the height of its nozzle exits. Each engine's front, where its number is painted,
// faces outward, so its two coolant pipes run round the booster rather than out from it.
outer_r = 4400;
outer_exit_z = 0;
inner_r = 2500;
inner_exit_z = -200;
centre_az = [0, 108, 252];
centre_r = 1100;
centre_exit_z = -500;
// The black aft skirt runs flush with the hull from its bottom edge up to the top of the conduit
// band, where the chines end (estimated). The outer engines hang from the skirt's bottom edge, and
// the gimballed engines from the thrust plate on gimbal blocks gimbal_drop above their nozzle exits.
skirt_bottom = 2750;
band_top = 4950;
gimbal_drop = 3000;
// The conduit band (estimated): the height and diameter of each pipe running round the skirt, the
// bottom and top of the row of junction boxes, and the boxes' width round the hull and depth.
// There are 40 boxes, one every 9 degrees, so one sits above each outer engine.
band_pipes = [[3530, 140], [3880, 100], [4000, 50], [4100, 50], [4200, 50], [4430, 80], [4680, 80], [4910, 80]];
box_z = [3880, 4330];
box_size = [220, 150];
// Each outer engine hangs under a housing on the skirt, from its bottom edge up to just below the
// band's lowest pipe: width, height, and how far its front stands from the axis (estimated)
housing = [560, 550];
housing_out = 4700;
// Small rectangular openings in the skirt between the housings: width and height, and the height of
// their centres (estimated)
skirt_opening = [150, 240];
opening_z = 3050;
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
dome_rise = 1900;
// Grid fins, whose shape is in gridfins.scad: the rudder at 0 and the catch fins at 90 and 270.
// fin_z is their apparent span seen from below, and each fin is centred on it. Each fin's root
// stands only pod_out off the hull, with little more than its bearing between them (estimated).
fin_az = [0, 90, 270];
fin_z = [64600, 66100];
pod_out = 200;
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
// How far the fins' bearings stand proud of the wall, and the thickness of the neck from a bearing
// to its fin
pod_proud = 100;
arm_d = 400;
// Chines: width round the hull, and the rise of the sloping cut at the bottom and the chamfer at the top
chine_w = 1000;
chine_cut = 1350;
chine_chamfer = 1350;
// How far the raceway stands off the hull
raceway_out = 300;
// The thrust plate's underside is flat for plate_flat either side of each engine circle and slopes
// between them. The skirt wall is skirt_wall thick.
plate_flat = 350;
skirt_wall = 150;
// The collar each outer engine hangs from, between its top plate and the skirt's bottom edge: diameter
collar_d = 580;
// The block each gimballed engine hangs from, between its top plate and the thrust plate: diameter.
// Two actuators steer each gimballed engine, 45 degrees either side of its front. Each runs from
// actuator_r[0] out from the engine's axis, actuator_h above its nozzle exit, up to actuator_r[1]
// out at the thrust plate.
gimbal_d = 330;
actuator_d = 130;
actuator_r = [300, 500];
actuator_h = 2050;

/* [Hidden] */
R = diameter / 2;
wall_top = height - truss_open; // top of the tank wall, where the dome starts
ring_bottom = height - truss_ring_h;
outer_az = [for (k = [0 : 19]) 9 + 18 * k];
inner_az = [for (k = [0 : 9]) 18 + 36 * k];
bracket_az = [for (k = [0 : 19]) 18 * k];
mount = raptor_sl_mount(raptor_exit); // height of an engine's top plate above its nozzle exit
strut_r = R - 50;                      // radius of the circle the struts run on
fin_zc = (fin_z[0] + fin_z[1]) / 2;
steel = [0.78, 0.79, 0.81];
raceway_steel = [0.66, 0.67, 0.69];
dark = [0.22, 0.22, 0.24];
plate_grey = [0.42, 0.42, 0.44];
fin_grey = [0.5, 0.5, 0.52];
bearing_bronze = [0.45, 0.38, 0.28];
dome_steel = [0.7, 0.68, 0.63];

function az(a) = a + 90; // dimensions.md azimuth to OpenSCAD's angle from +X

// The tank barrel from the top of the conduit band to the top of the tank wall
module barrel() color(steel) translate([0, 0, band_top]) cylinder(h = wall_top - band_top, r = R, $fn = segments);

// The black aft skirt, flush with the hull from its bottom edge up to the top of the conduit band.
// The band is pipes running all the way round the skirt, with a row of junction boxes. Below it,
// the skirt has a small rectangular opening between each pair of outer engines.
module aft_skirt() color(dark) {
    difference() {
        rotate_extrude($fn = segments) translate([R - skirt_wall, skirt_bottom])
            square([skirt_wall, band_top - skirt_bottom + 10]);
        for (a = bracket_az) rotate([0, 0, az(a)])
            translate([R - 50, -skirt_opening[0] / 2, opening_z - skirt_opening[1] / 2])
                cube([100, skirt_opening[0], skirt_opening[1]]);
    }
    for (p = band_pipes) translate([0, 0, p[0]]) rotate_extrude($fn = segments)
        translate([R - 10 + p[1] / 2, 0]) circle(d = p[1], $fn = 8);
    for (k = [0 : 39]) rotate([0, 0, az(9 * k)])
        translate([R - 20, -box_size[0] / 2, box_z[0]]) cube([box_size[1] + 20, box_size[0], box_z[1] - box_z[0]]);
}

// The methane tank's forward dome, plated in steel. Its curve carries on up from the tank wall.
module forward_dome() color(dome_steel) translate([0, 0, wall_top]) rotate_extrude($fn = segments)
    polygon(concat([[0, 0]], [for (i = [0 : 16]) let(a = 90 * i / 16) [R * cos(a), dome_rise * sin(a)]]));

// The thrust plate that carries all 33 engines and closes the bottom of the skirt. Its tiled
// underside is level with the skirt's bottom edge out at the outer engines and steps down to the
// centre trio, so the gimballed engines each hang gimbal_drop above their nozzle exits.
module thrust_plate() {
    f = plate_flat;
    zc = centre_exit_z + gimbal_drop;
    zi = inner_exit_z + gimbal_drop;
    color(plate_grey) rotate_extrude($fn = segments) polygon([
        [0, zc], [centre_r + f, zc], [inner_r - f, zi], [inner_r + f, zi], [outer_r - f, skirt_bottom],
        [R - skirt_wall + 1, skirt_bottom], [R - skirt_wall + 1, band_top], [0, band_top]]);
}

// The housing over each outer engine's top, on the skirt from its bottom edge up to just below the
// band's lowest pipe, and the collar the engine hangs from
module housings() color(dark) for (a = outer_az) rotate([0, 0, az(a)]) {
    hull() {
        translate([R - 300, -housing[0] / 2, skirt_bottom]) cube([10, housing[0], housing[1]]);
        for (s = [-1, 1]) translate([housing_out - 120, s * (housing[0] / 2 - 120), skirt_bottom])
            cylinder(h = housing[1], r = 120, $fn = 24);
    }
    translate([outer_r, 0, outer_exit_z + mount - 10])
        cylinder(h = skirt_bottom - outer_exit_z - mount + 60, d = collar_d, $fn = 48);
}

// One group of Raptors, each with its front facing outward. Gimballed engines hang from a block
// under the thrust plate and are steered by two actuators.
module engine_group(azs, r, exit_z, gimballed) for (a = azs) rotate([0, 0, az(a)]) translate([r, 0, exit_z]) {
    raptor_sl(raptor_exit, nozzle_wall, $fn = 32);
    if (gimballed) color(dark) {
        translate([0, 0, mount - 10]) cylinder(h = gimbal_drop - mount + 60, d = gimbal_d, $fn = 24);
        for (s = [-1, 1]) rotate([0, 0, 45 * s]) hull() {
            translate([actuator_r[0], 0, actuator_h]) sphere(d = actuator_d, $fn = 12);
            translate([actuator_r[1], 0, gimbal_drop]) sphere(d = actuator_d, $fn = 12);
        }
    }
}

module engines() {
    engine_group(outer_az, outer_r, outer_exit_z, false);
    engine_group(inner_az, inner_r, inner_exit_z, true);
    engine_group(centre_az, centre_r, centre_exit_z, true);
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

// A grid fin from gridfins.scad pointing along +X, on a neck from the round bearing it pivots on,
// with the round port above the bearing. The neck reaches 60 mm into the fin's root plate.
module mounted_grid_fin() {
    color(fin_grey) {
        translate([R + pod_out, 0, fin_zc]) grid_fin(fin_lattice);
        translate([R - 100, 0, fin_zc]) rotate([0, 90, 0]) cylinder(h = pod_out + 160, d = arm_d, $fn = 24);
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
    [R - 200, band_top], [R, band_top], [chine_out, band_top + chine_cut],
    [chine_out, top - chine_chamfer], [R, top], [R - 200, top]], -chine_w / 2, chine_w);

// The raceway: a strip standing off the hull, with rounded ends
module raceway() rotate([0, 0, az(raceway_az)]) translate([R - 100, 0, raceway_z[0]]) rotate([90, 0, 90])
    linear_extrude(raceway_out + 100) hull() {
        translate([0, raceway_w / 2]) circle(d = raceway_w, $fn = 32);
        translate([0, raceway_z[1] - raceway_z[0] - raceway_w / 2]) circle(d = raceway_w, $fn = 32);
    }

module super_heavy() {
    barrel();
    aft_skirt();
    thrust_plate();
    housings();
    forward_dome();
    truss();
    for (a = fin_az) rotate([0, 0, az(a)]) mounted_grid_fin();
    color(steel) {
        for (a = tall_chine_az) chine(a, tall_chine_top);
        for (a = short_chine_az) chine(a, short_chine_top);
    }
    color(raceway_steel) raceway();
    engines();
}

scale(1 / model_scale) super_heavy();
