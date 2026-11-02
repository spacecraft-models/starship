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
// Each part's material, and its colour in previews, comes from materials.scad. Small parts the ship
// shares, such as ports and vent slats, come from details.scad.

use <raptor.scad>
use <gridfins.scad>
use <materials.scad>
use <details.scad>

/* [Print] */
// Print at 1:model_scale. 1 is full size; 300 makes the booster 243 mm tall.
model_scale = 1; // [1:1000]
// Facets around the hull
segments = 128;
// Engine nozzle walls. 0 makes the nozzles solid, which suits prints smaller than about 1:100.
nozzle_wall = 40;
// The grid fins' lattice. Off fills each fin's outline solid, which suits prints smaller than about 1:100.
fin_lattice = true;
// Draws only every this-many plates of the fins' lattice each way, for a coarser lattice whose holes
// stay open at small sizes. 1 is the real lattice.
fin_lattice_step = 1; // [1:1:4]
// Full draws the engines' plumbing and steering actuators; Simple draws each engine as one turned
// shape, bulked out to stand in for its plumbing, and leaves out the actuators
engine_detail = 2; // [1:Simple, 2:Full]
// The thinnest part allowed on the print, in mm at print size. The truss's struts and ring, the grid
// fins and their necks, and the engines' necks are thickened to at least this. 0 keeps all of them
// true to size.
min_feature = 0; // [0:0.1:3]
// How many inverted-V pairs of struts hold up the truss's ring. The real truss has 20.
truss_pairs = 20; // [4:1:20]
// What fills the truss. Open is the real truss, with the methane tank's dome inside. For printing the
// booster upside down standing on its truss, Tall dome raises the dome to a flat top level with the
// ring, with the struts still open round it, and Solid core fills the truss, with the struts standing
// out from it as ribs.
truss_fill = 0; // [0:Open, 1:Tall dome, 2:Solid core]
// The tall dome's flat top, as a fraction of the hull's radius. Below about 0.4 its sides get too
// shallow to print upside down without support.
tall_dome_top = 0.5; // [0.2:0.05:0.9]
// Turns the booster upside down for printing, with the top of its truss on z = 0
print_upside_down = false;
// A hole down the middle of the truss's top for a pin that stacks the ship on the booster, in mm at
// print size: its diameter (0 for none) and depth. It needs a truss_fill to cut into.
pin_d = 0; // [0:0.1:5]
pin_depth = 6; // [1:0.5:20]
// Draws the lifting pins under the two catch fins. Off leaves them out; they hang less than a
// millimetre below the fins at 1:460, and the 1:460 print preset leaves them out.
catch_pins = true;
// Draws the fine details: the band of vent slats and the bell vents under it, the ports and their
// plates, the QD plates and the pipe down the rudder side. None stands more than about half a metre off
// the hull, about a millimetre at 1:460, so the print presets leave them out.
fine_details = true;
// For printing bigger than the printer in pieces: heights to cut the booster into sections at, in
// full-size mm as in this file. Empty keeps it whole. Pins of pin_d line the sections up at each cut.
section_z = [];
// What to draw: 0 the whole booster; 1 and up one section, standing on a flat cut face for printing
// (the lowest section upside down, the others upright); -1 the loose parts, laid flat.
section = 0; // [-1:1:6]
// Leaves the grid fins off the hull, each with a tab on its root that plugs into a slot in its
// bearing, so they can print flat as loose parts
loose_fins = false;
// The tabs on loose parts, in mm at print size: how far each reaches into the hull, and the gap round
// it in its slot
tab_depth = 3; // [1:0.5:10]
fit_clearance = 0.15; // [0:0.05:0.5]

/* [Materials] */
// Draws only the parts made of one material, from materials.scad. "all" draws the whole booster.
material = "all"; // [all, steel, black, aft_shield, dome, grid_fin, bronze, nozzle, engine]

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
// The two catch fins each have a lifting pin under the root, which the chopsticks lift and catch the
// booster by (estimated): a post down from the fin's root, catch_pin_out from the hull, with a steel
// bar at its foot pointing sideways, reaching catch_pin_reach from the fin's centreline. Both bars
// point clockwise round the booster seen from above: toward the tower side on the fin at 270° and
// toward the rudder on the fin at 90°. The bar's width and thickness, and how far the pin hangs
// below the fin's lower face.
catch_fin_az = [90, 270];
catch_pin_out = 300;
catch_pin_reach = 500;
catch_pin_bar = [150, 100];
catch_pin_drop = 270;
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
// The band of vent slats round the hull where the forward section is stacked on the LOX tank
// (estimated): its bottom and top, and each slat's width, spacing and how far it stands off the hull
vent_band = [47400, 48800];
vent_slat = [100, 255, 100];
// The bell-shaped vents hanging from the band's lower edge (estimated): their azimuths (the pair by
// the 270° fin is assumed by symmetry), and each bell's diameter at its top and at its mouth, and
// its length
cowbell_az = [79, 101, 259, 281];
cowbell = [280, 480, 900];
// Round ports in rings of holes (estimated), each [azimuth, centre height]: one over the rudder fin and
// one above a QD plate. The diameters of the port and of the ring round it.
round_ports = [[0, 50700], [324, 7000]];
round_port = [530, 1100];
// The hexagonal plate behind each port over a fin pod, across its flats, and the azimuths of more
// ports like them, at the same height, with no fin under them (estimated)
port_plate = 800;
extra_port_az = [55];
// The two QD plates on the rudder side (estimated): their azimuths, bottom and top, and how far each
// hexagon stands off the hull in its foil wrap
qd_plate_az = [325, 35];
qd_plate_z = [5000, 6300];
qd_plate_out = 150;
// The pipe down the rudder side from the band of slats (estimated): its azimuth and diameter, and how
// far apart the legs of its Y land on top of the conduit band
y_pipe = [0, 200, 600];

/* [Estimates] */
// The ring at the top of the truss that the ship sits on: height and radial width. Its height sets
// how far the struts lean, which dimensions.md puts at about 8° to 10° (10° with 300).
truss_ring_h = 300;
truss_ring_w = 350;
// How far the fins' bearings stand proud of the wall, and the thickness of the neck from a bearing
// to its fin
pod_proud = 100;
arm_d = 400;
// The thickness of the post each lifting pin hangs from, round the hull
catch_post_t = 120;
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
min_t = min_feature * model_scale; // the thinnest part allowed, in model millimetres
wall_top = height - truss_open; // top of the tank wall, where the dome starts
ring_w = max(truss_ring_w, min_t);
ring_h = max(truss_ring_h, min_t);
ring_bottom = height - ring_h;
outer_az = [for (k = [0 : 19]) 9 + 18 * k];
inner_az = [for (k = [0 : 9]) 18 + 36 * k];
bracket_az = [for (k = [0 : 19]) 18 * k];       // the skirt's openings
truss_az = [for (k = [0 : truss_pairs - 1]) 360 / truss_pairs * k]; // the truss's brackets
mount = raptor_sl_mount(raptor_exit); // height of an engine's top plate above its nozzle exit
strut_r = R - 50;                      // radius of the circle the struts run on
strut_t = max(strut_d, min_t);         // the struts' diameter, and at their tapered ends
strut_end = max(strut_d / 4, min_t);
wall = nozzle_wall > 0 ? max(nozzle_wall, min_t) : 0; // the nozzles' walls, thickened for printing
fin_zc = (fin_z[0] + fin_z[1]) / 2;

function az(a) = a + 90; // dimensions.md azimuth to OpenSCAD's angle from +X

// The tank barrel from the top of the conduit band to the top of the tank wall
module barrel() made_of("steel") translate([0, 0, band_top]) cylinder(h = wall_top - band_top, r = R, $fn = segments);

// The black aft skirt, flush with the hull from its bottom edge up to the top of the conduit band.
// The band is pipes running all the way round the skirt, with a row of junction boxes. Below it,
// the skirt has a small rectangular opening between each pair of outer engines.
module aft_skirt() made_of("black") {
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
module forward_dome() made_of("dome") translate([0, 0, wall_top]) rotate_extrude($fn = segments)
    polygon(concat([[0, 0]], [for (i = [0 : 16]) let(a = 90 * i / 16) [R * cos(a), dome_rise * sin(a)]]));

// For printing upside down with the truss open: the dome raised to a flat top level with the top of
// the truss, tall_dome_top of the hull's radius across, where the stacking pin's hole goes. Its sides
// leave the tank wall upright, as the real dome's do, and curve in more steeply than 45° (with the
// default tall_dome_top), so it prints upside down without support.
module tall_dome() made_of("dome") {
    a = tall_dome_top * R;
    h = height - wall_top;
    rotate_extrude($fn = segments) polygon(concat([[0, wall_top]],
        [for (i = [0 : 16]) let(t = i / 16) [R - (R - a) * pow(t, 1.3), wall_top + h * t]],
        [[0, height]]));
}

// The thrust plate that carries all 33 engines and closes the bottom of the skirt. Its tiled
// underside is level with the skirt's bottom edge out at the outer engines and steps down to the
// centre trio, so the gimballed engines each hang gimbal_drop above their nozzle exits.
module thrust_plate() {
    f = plate_flat;
    zc = centre_exit_z + gimbal_drop;
    zi = inner_exit_z + gimbal_drop;
    made_of("aft_shield") rotate_extrude($fn = segments) polygon([
        [0, zc], [centre_r + f, zc], [inner_r - f, zi], [inner_r + f, zi], [outer_r - f, skirt_bottom],
        [R - skirt_wall + 1, skirt_bottom], [R - skirt_wall + 1, band_top], [0, band_top]]);
}

// The housing over each outer engine's top, on the skirt from its bottom edge up to just below the
// band's lowest pipe, and the collar the engine hangs from
module housings() made_of("black") for (a = outer_az) rotate([0, 0, az(a)]) {
    hull() {
        translate([R - 300, -housing[0] / 2, skirt_bottom]) cube([10, housing[0], housing[1]]);
        for (s = [-1, 1]) translate([housing_out - 120, s * (housing[0] / 2 - 120), skirt_bottom])
            cylinder(h = housing[1], r = 120, $fn = 24);
    }
    translate([outer_r, 0, outer_exit_z + mount - 10])
        cylinder(h = skirt_bottom - outer_exit_z - mount + 60, d = collar_d, $fn = 48);
}

// One group of Raptors, each with its front facing outward. Gimballed engines hang from a block
// under the thrust plate and are steered by two actuators, which the simple engines leave out.
module engine_group(azs, r, exit_z, gimballed) for (a = azs) rotate([0, 0, az(a)]) translate([r, 0, exit_z]) {
    raptor_sl(raptor_exit, wall, engine_detail, min_t / 2, $fn = 32);
    if (gimballed) made_of("black") {
        translate([0, 0, mount - 10]) cylinder(h = gimbal_drop - mount + 60, d = max(gimbal_d, min_t), $fn = 24);
        if (engine_detail >= 2) for (s = [-1, 1]) rotate([0, 0, 45 * s]) hull() {
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

// A strut from p to q: a tube that tapers to a point at both ends (to strut_end across, which is
// only a point when min_feature is 0)
module strut(p, q) hull() for (t = [0, 0.15, 0.85, 1])
    translate(p + t * (q - p)) sphere(d = (t == 0 || t == 1) ? strut_end : strut_t, $fn = 12);

// The open hot-staging truss: an inverted V from each of the ring's attachment points down to the
// brackets either side, the brackets on the tank wall, and the ring the ship sits on. With
// truss_fill = 2, a solid core fills it, with the struts standing out from it.
module truss() {
    step = 360 / truss_pairs;                 // degrees between brackets
    da = strut_pair / 2 / strut_r * 180 / PI; // half the pair's spacing at the top, in degrees
    made_of("steel") {
        for (a = truss_az) {
            strut(strut_point(a + step / 2 - da, ring_bottom), strut_point(a, wall_top));
            strut(strut_point(a + step / 2 + da, ring_bottom), strut_point(a + step, wall_top));
        }
        rotate_extrude($fn = segments) translate([R - ring_w, ring_bottom]) square([ring_w, ring_h]);
        if (truss_fill == 2) translate([0, 0, wall_top - 1])
            cylinder(h = height - wall_top + 1, r = strut_r - strut_t / 4, $fn = segments);
    }
    made_of("black") for (a = truss_az) rotate([0, 0, az(a)])
        translate([R - 150, -bracket[0] / 2, wall_top - bracket[1]]) cube([250, bracket[0], bracket[1]]);
}

// A grid fin from gridfins.scad pointing along +X, on a neck from the round bearing it pivots on,
// with the round port above the bearing. The neck reaches 60 mm into the fin's root plate.
module mounted_grid_fin() {
    if (!loose_fins) made_of("grid_fin") {
        translate([R + pod_out, 0, fin_zc]) grid_fin(fin_lattice, min_t, fin_lattice_step);
        translate([R - 100, 0, fin_zc]) rotate([0, 90, 0]) cylinder(h = pod_out + 160, d = max(arm_d, min_t), $fn = 24);
    }
    made_of("bronze") translate([R - 150, 0, fin_zc]) rotate([0, 90, 0]) {
        cylinder(h = 150 + pod_proud, d = pod_d, $fn = 48);
        cylinder(h = 150 + pod_proud + 80, d = pod_d * 0.65, $fn = 48);
    }
    made_of("black") translate([R - 100, 0, fin_zc + pod_port_up]) rotate([0, 90, 0]) cylinder(h = 180, d = port_d, $fn = 32);
    if (fine_details) made_of("steel") on_hull(0, R, fin_zc + pod_port_up) hex_plate(port_plate, 20);
}

// The fine details on the hull: the band of vent slats and the bell vents hanging from it, the round
// ports, the ports with no fin under them, the QD plates and the pipe down the rudder side
module hull_fittings() {
    made_of("steel") slat_band(R, vent_band[0], vent_band[1], 0, 360, vent_slat);
    for (a = cowbell_az) made_of("steel") rotate([0, 0, az(a)]) translate([R + 300, 0, vent_band[0]]) {
        rotate([0, -8, 0]) bell(cowbell[0], cowbell[1], cowbell[2]);
        translate([-300 - sink(), -60, -150]) cube([sink() + 200, 120, 150]); // the bell's bracket
    }
    for (p = round_ports) on_hull(az(p[0]), R, p[1]) {
        bolted_port(round_port[0], round_port[0] + 120, 40);
        made_of("steel") raised_ring(round_port[1], 80, 25);
    }
    for (a = extra_port_az) rotate([0, 0, az(a)]) {
        made_of("black") translate([R - 100, 0, fin_zc + pod_port_up]) rotate([0, 90, 0]) cylinder(h = 180, d = port_d, $fn = 32);
        made_of("steel") on_hull(0, R, fin_zc + pod_port_up) hex_plate(port_plate, 20);
    }
    for (a = qd_plate_az) made_of("steel") on_hull(az(a), R, (qd_plate_z[0] + qd_plate_z[1]) / 2)
        hex_plate((qd_plate_z[1] - qd_plate_z[0]) * cos(30), qd_plate_out);
    // The pipe stands just off the hull and splits in a Y a little above the conduit band
    made_of("steel") rotate([0, 0, az(y_pipe[0])]) {
        d = y_pipe[1];
        x = R + d / 2 + 20;
        split = band_top + 600;
        translate([x, 0, split]) cylinder(h = vent_band[0] - split, d = d, $fn = 16);
        for (s = [-1, 1]) rod([x, 0, split], [R + d / 2, s * y_pipe[2] / 2, band_top + d / 2], d * 0.8);
    }
}

// The lifting pin under the root of a catch fin pointing along +X: a post hanging from the fin's root
// triangle, with a steel bar at its foot reaching out toward -Y, which is clockwise round the booster
// seen from above. The post runs up into the root.
module lifting_pin() made_of("steel") {
    w = catch_pin_bar[0];
    translate([R + catch_pin_out - w / 2, catch_post_t / 2, fin_zc - grid_fin_depth(min_t) / 2 - catch_pin_drop]) {
        translate([0, -catch_post_t, 0]) cube([w, catch_post_t, catch_pin_drop + 60]);
        translate([0, -catch_post_t / 2 - catch_pin_reach, 0]) cube([w, catch_post_t / 2 + catch_pin_reach, catch_pin_bar[1]]);
    }
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

// A loose grid fin pointing along +X from its root at x = 0, centred on z = 0 through its depth: the fin
// with a tab on its root in place of the neck, reaching back across the gap to the bearing and on
// tab_depth into the hull. grow widens the tab all round, to cut its slot.
module fin_tab(grow = 0) {
    d = grid_fin_depth(min_t);
    w = max(arm_d, min_t);
    t = pod_out + tab_depth * model_scale;
    translate([-t - grow, -w / 2 - grow, -d / 2 - grow]) cube([t + 60 + grow, w + 2 * grow, d + 2 * grow]);
}

module loose_fin() made_of("grid_fin") {
    grid_fin(fin_lattice, min_t, fin_lattice_step);
    fin_tab();
}

// The loose fins laid flat side by side for printing, top face down
module loose_fins_flat() {
    d = grid_fin_depth(min_t);
    for (i = [0 : len(fin_az) - 1]) translate([0, i * (grid_fin_width() + 1000), d / 2]) loose_fin();
}

// The slots the loose fins' tabs plug into, in the bearings
module fin_slots() for (a = fin_az) rotate([0, 0, az(a)]) translate([R + pod_out, 0, fin_zc])
    fin_tab(fit_clearance * model_scale);

// Holes for the pins that line up the sections at each cut: two at different radii, so the sections
// only go together one way round, each reaching pin_depth into both sides
module joint_pin_holes() for (z = section_z, p = [[0, 0.5], [180, 0.3]])
    rotate([0, 0, az(p[0])]) translate([p[1] * R, 0, z - pin_depth * model_scale])
        cylinder(h = 2 * pin_depth * model_scale, d = pin_d * model_scale, $fn = 24);

// The booster, with the hole for a stacking pin cut down into the top of its truss (or into the top
// of the dome when the truss is open) when pin_d is set, and the slots for loose fins
module super_heavy() difference() {
    union() {
        barrel();
        aft_skirt();
        thrust_plate();
        housings();
        if (truss_fill == 1) tall_dome();
        else forward_dome();
        truss();
        for (a = fin_az) rotate([0, 0, az(a)]) mounted_grid_fin();
        if (catch_pins) for (a = catch_fin_az) rotate([0, 0, az(a)]) lifting_pin();
        made_of("steel") {
            for (a = tall_chine_az) chine(a, tall_chine_top);
            for (a = short_chine_az) chine(a, short_chine_top);
        }
        made_of("steel") raceway();
        if (fine_details) hull_fittings();
        engines();
    }
    if (pin_d > 0) {
        top = truss_fill > 0 ? height : wall_top + dome_rise;
        translate([0, 0, top - pin_depth * model_scale])
            cylinder(h = pin_depth * model_scale + 1, d = pin_d * model_scale, $fn = 32);
        joint_pin_holes();
    }
    if (loose_fins) fin_slots();
}

// The part of the booster between heights z0 and z1
module cut(z0, z1) intersection() {
    children();
    translate([-50000, -50000, z0]) cube([100000, 100000, z1 - z0]);
}

// What gets drawn: the loose parts laid flat; one section standing on a flat cut face, the lowest one
// upside down on its top cut so its engines print upward, the others upright on their bottom cut; or
// the whole booster, turned upside down for printing with the top of its truss on z = 0 if asked.
// The material setting reaches every part as $material.
scale(1 / model_scale, $material = material) if (section < 0) loose_fins_flat();
    else if (section > 0 && len(section_z) > 0) {
        bounds = concat([-10000], section_z, [height + 10000]);
        k = min(section, len(section_z) + 1);
        e = 1; // each section stops 1 mm (full size) short of the cut, so faces lying on it don't leave slivers
        if (k == 1) translate([0, 0, bounds[1] - e]) rotate([180, 0, 0]) cut(bounds[0], bounds[1] - e) super_heavy();
        else translate([0, 0, -bounds[k - 1] - e]) cut(bounds[k - 1] + e, bounds[k] - e) super_heavy();
    }
    else if (print_upside_down) translate([0, 0, height]) rotate([180, 0, 0]) super_heavy();
    else super_heavy();
