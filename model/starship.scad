// Starship: the V3 ship (upper stage), built from dimensions.md's "Starship V3 in detail" and
// "Raptor engines" sections. The engines come from raptor.scad.
// Units are mm at full size, Z up, with the bottom edge of the aft skirt on z = 0. That is where
// the ship sits on the booster's truss, so it stacks on super_heavy.scad at z = 72300.
// Values under [From dimensions.md] come from that file, which tags each one Published, Reported
// or Estimated (measured from photos); the comments mark the estimated ones. Values under
// [Estimates] aren't in dimensions.md, so they are guesses worth adjusting.
// Azimuths are dimensions.md's: 0 is the windward (tiled) centreline, increasing counterclockwise
// seen from above. Windward faces +Y, so the default render views look at the steel leeward side.
// Each part's material, and its colour in previews, comes from materials.scad. Small parts the booster
// shares, such as ports and vent slats, come from details.scad.

use <raptor.scad>
use <materials.scad>
use <details.scad>

/* [Print] */
// Print at 1:model_scale. 1 is full size; 300 makes the ship 174 mm tall.
model_scale = 1; // [1:1000]
// Facets around the hull
segments = 128;
// Engine nozzle walls. 0 makes the nozzles solid, which suits prints smaller than about 1:100.
nozzle_wall = 40;
// Full draws the engines' plumbing; Simple draws each engine as one turned shape, bulked out to stand
// in for it
engine_detail = 2; // [1:Simple, 2:Full]
// The thinnest part allowed on the print, in mm at print size. The flaps, and the skirt's wall and
// the engines' necks when they show, are thickened to at least this. 0 keeps all of them true to size.
min_feature = 0; // [0:0.1:3]
// Fills the engine bay solid up to its roof, hiding the engines, so the ship stands on a flat base
fill_engine_bay = false;
// A hole up the middle of the skirt's bottom for a pin that stacks the ship on the booster, in mm at
// print size: its diameter (0 for none) and depth. It needs fill_engine_bay to cut into.
pin_d = 0; // [0:0.1:5]
pin_depth = 6; // [1:0.5:20]
// Draws the two catch pins on the nose. Off leaves them out; they stand out less than a millimetre at
// 1:460, and the 1:460 print preset leaves them out.
catch_pins = true;
// Draws the fine details: the flaps' hinges and thrusters, the Starlink dishes, the vents and the ports,
// and the heat shield's thickness with its bevelled edge. None stands more than about a third of a
// metre off the hull, under a millimetre at 1:460, so the print presets leave them out.
fine_details = true;
// For printing bigger than the printer in pieces: heights to cut the ship into sections at, in
// full-size mm as in this file. Empty keeps it whole. Pins of pin_d line the sections up at each cut.
section_z = [];
// What to draw: 0 the whole ship; 1 and up one section, standing on a flat cut face for printing (the
// lowest section upside down, so its engines print upward, the others upright); -1 the loose parts,
// laid flat.
section = 0; // [-1:1:6]
// Leaves the forward flaps off the nose, each with a tab along its root that plugs into a slot along
// its hinge, so they can print flat as loose parts
loose_flaps = false;
// The tabs on loose parts, in mm at print size: how far each reaches into the hull, and the gap round
// it in its slot
tab_depth = 3; // [1:0.5:10]
fit_clearance = 0.15; // [0:0.05:0.5]

/* [Materials] */
// Draws only the parts made of one material, from materials.scad. "all" draws the whole ship.
material = "all"; // [all, steel, tiles, black, aft_shield, nozzle, engine, nozzle_extension]

/* [From dimensions.md] */
height = 52100;
diameter = 9000;
// The barrel is 21 rings of 1.83 m. The nosecone, a tangent ogive, takes the rest of the height.
rings = 21;
ring_h = 1830;
// Tile line in degrees either side of windward, on the barrel and on the nosecone (estimated)
tile_line = 105;
nose_tile_line = 128;
// Height where the tile line steps out from the barrel's to the nosecone's, level with the catch pins
// (estimated). It can't go below the nosecone's base.
nose_tile_step = 39500;
// How far down from the tip the nose is tiled all the way round (estimated)
tip_tiles = 4200;
// Tip to tip across the aft flaps
aft_flap_span_total = 17000;
// The aft flaps are hinged at 90° and 270°. Their leading edge leaves the hull at aft_flap_root_top
// and runs down to the top of the upright tip edge at aft_flap_tip_top (estimated).
aft_flap_root_top = 15000;
aft_flap_tip_top = 8600;
// The aft flaps taper from their rounded root to the outboard edge: thickness at each (estimated)
aft_flap_thickness = [700, 350];
// Each aft flap's hinge line is covered by a tiled "static aero" strip, topped by a streamlined "leading
// edge aero cap" over the top of the hinge (estimated): the strip's width, and the cap's height above
// the flap's root. The cap is as wide as the strip at its base and tapers to a rounded tip.
aft_static_aero_w = 700;
aft_cap_h = 1600;
// Angle between the forward flaps' planes, measured across the leeward side
fwd_flap_angle = 140;
// Forward flaps (estimated): the hinge's azimuth and the heights of its ends on the nose, the
// heights of the upright tip edge's ends, and the tip edge's distance from the hinge line
fwd_hinge_az = 98;
fwd_hinge_z = [43300, 48600];
fwd_tip_z = [42400, 44400];
fwd_tip_out = 3700;
// Raceways (estimated): degrees either side of the leeward centreline at the top and at the lower end,
// bottom and top, and width
raceway_az = [15, 13];
raceway_z = [2400, 35000];
raceway_w = 600;
// Payload bay door (the Starlink "Pez dispenser"), estimated: a long slot with rounded ends,
// centred on the leeward side. Azimuths of its ends, and its bottom and top.
door_az = [124, 236];
door_z = [35300, 36200];
// The four passive (drogue) docking ports, estimated: two on the payload bay just below the door,
// and two on the aft section either side of the QD plate. Each is a steel housing tube whose axis
// points straight out from the leeward side (all four are parallel), with a dark drogue cone set in
// its mouth. Each entry is [azimuth, centre height, how far the mouth stands out from the hull along
// the port's centreline]; the aft housings look a little longer in the photos.
docking_ports = [[140, 34500, 400], [220, 34500, 400], [156, 2550, 550], [204, 2550, 550]];
// The housing's diameter
port_d = 800;
// Width of the notch cut up into the bottom of the mouth, where the drogue's tab sits
port_notch = 200;
// The drogue cone's rim diameter and its central hole, and the tab hanging from its rim into the
// notch: width and how far it reaches below the rim
drogue_d = 600;
drogue_hole = 70;
drogue_tab = [190, 140];
// The QD plate for propellant transfer, on the leeward centreline (estimated): its bottom and top,
// its width, and the height of its two round propellant connectors
qd_z = [2600, 3500];
qd_w = 800;
qd_connector_z = 3000;
// The two catch pins the tower's chopsticks lift and catch the ship by, on the nose just above its
// base (estimated). Each is a tiled fairing standing out from the hull, with its top sloping down from
// the hull to a short upright outer end, sides sloping out to the hull, and a level underside. Their
// azimuths; the underside and where the top meets the hull; how far the outer end stands off the
// hull, and its height; and the fairing's width where its underside meets the hull, and across its
// top and outer end.
catch_az = [90, 270];
catch_z = [39000, 39900];
catch_out = 440;
catch_end = 150;
catch_w = [1500, 550];
// The steel pad under each catch pin's outer end, which rests on the chopstick: width and height
catch_pad = [330, 100];
// The bolts holding each drogue cone: how many, the circle they're on, and their heads' diameter
drogue_bolts = [8, 500, 40];
// The heat shield's tiles (estimated, rough): their thickness, and the width of the bevelled tiles
// along its edges, where it ends at the tile line and at the step
tile_t = 40;
tile_ramp = 120;
// The forward flaps' three hinges (estimated), each [height, length of its fitting along the flap's
// root, thickness of the strut from the fitting across to the nose, and how far round the nose the
// strut reaches]: the lower hinge, the central one with the control arm, and the upper one
fwd_hinges = [[43300, 400, 70, 1000], [45200, 750, 120, 700], [47700, 400, 60, 500]];
// The aft flaps' four hinges (estimated), each [height, length of its fitting along the flap's root,
// thickness of its link to the hull]. The lower two were seen; the upper two follow V1's spacing.
aft_hinges = [[500, 400, 80], [3000, 600, 120], [10100, 400, 80], [14100, 400, 80]];
// The thruster outlets low on each aft flap's leeward face (estimated): columns out from the root and
// rows up, each outlet's width across its flats and how far it stands out, their spacing out and up,
// and the first one's distance out from the root and up from the flap's bottom. Every other row is
// set half a step further out.
rcs_outlets = [3, 4];
rcs_outlet = [180, 100];
rcs_outlet_pitch = [300, 330];
rcs_outlet_start = [400, 560];
// The pipes that feed them, running down the hull beside each aft flap's root (estimated): how many,
// their diameter, and the height they come down from
rcs_pipes = [4, 120, 7000];
// The two leeward Starlink dishes on the nose (estimated): their azimuths and centre height, and each
// tiled box's width, height and how far it stands off the hull
starlink_az = [148, 212];
starlink_z = 40900;
starlink_size = [720, 820, 100];
// The roll thrusters (estimated): the two pairs' azimuths, the heights of the set midway down and the
// set on the payload bay, and the diameters of each opening and of its flange
rcs_az = [137, 149, 211, 223];
rcs_z = [21800, 30900];
rcs_d = [370, 480];
// The round window between the payload bay drogues (estimated): azimuth, centre height (0.3 m above
// the drogues' centres, as in the photos), and the diameters of the window, its flange and the plate
// behind it. The two small round grilles beside it: their azimuths, at the same height, and diameter.
sensor_window = [188, 34800, 700, 880, 1250];
small_ports = [170, 174.5];
small_port_d = 200;
// The bands of vent slats round the leeward side (estimated), each [bottom, top, its two end
// azimuths, 1 if the slats between the raceways are further apart], and each slat's width, spacing,
// spacing between the raceways, and how far it stands off the hull
vent_bands = [[32000, 32800, 105, 255, 1], [22600, 23200, 105, 255, 1], [4900, 6000, 105, 255, 0]];
vent_slat = [70, 120, 260, 30];
// Round ports in rings of slots (estimated), each [azimuth, centre height], and the diameters of the
// dark centre and of the outer ring
ringed_ports = [[136, 25300], [215, 9200]];
ringed_port = [700, 1600];
// The attic vent hood on each raceway's lower end (estimated): its width, and how far up it reaches
// from the raceway's lower end
attic_vent = [750, 1400];
// Nozzle exit diameters of the sea-level Raptor 3 and the Raptor 3 Vacuum
raptor_exit = 1300;
rvac_exit = 2400;

/* [Estimates] */
// Radius of the rounded nose tip
nose_tip_r = 1000;
// Bottom of the aft flaps, and the flaps' thicknesses
aft_flap_bottom = 0;
fwd_flap_thickness = 350;
// How far the aft static aero strip stands off the hull, and the forward flaps' smaller static aero
// strip: its width and how far it stands off the nose
aft_static_aero_out = 350;
fwd_static_aero = [500, 250];
// How far the raceways stand off the hull
raceway_out = 250;
// The door is flush on the ship, so it is drawn as a groove round its outline, this wide and deep
door_seam = 150;
// How deep the drogue cones' funnels go, and how far they sit back from the housing's mouth
drogue_depth = 250;
drogue_recess = 30;
// How far the QD plate and its guide rails stand off the hull, and the connectors' diameter
qd_out = 120;
qd_rail_out = 250;
qd_connector_d = 220;
// How far the catch pins' steel pads reach in under the fairing from its outer end
catch_pad_depth = 300;
// How far the attic vent hoods stand off the hull, and how high their open bottoms reach inside
attic_vent_out = 350;
attic_vent_open = 900;
// The engine layout, which dimensions.md leaves open: azimuths and pitch-circle radii of the
// 3 sea-level engines and the 3 vacuum engines, and the height of the vacuum engines' nozzle exits.
// All six hang from a flat roof at the vacuum engines' top plates, so the sea-level exits sit higher.
sl_az = [0, 120, 240];
sl_ring_r = 1100;
rvac_az = [60, 180, 300];
rvac_ring_r = 2900;
rvac_exit_z = 0;
skirt_wall = 300;

/* [Hidden] */
R = diameter / 2;
min_t = min_feature * model_scale; // the thinnest part allowed, in model millimetres
bay_wall = max(skirt_wall, min_t);   // the skirt's wall round the open engine bay
wall = nozzle_wall > 0 ? max(nozzle_wall, min_t) : 0; // the nozzles' walls, thickened for printing
nose_base = rings * ring_h; // where the nosecone leaves the cylinder
nose_len = height - nose_base;
roof = rvac_exit_z + raptor_vac_mount(rvac_exit, raptor_exit); // the engine bay's roof
flap_embed = skirt_wall / 2; // how far flap roots sink into the hull
seam_dark = [0.25, 0.25, 0.27]; // the door's groove in previews

function az(a) = a + 90; // dimensions.md azimuth to OpenSCAD's angle from +X

// The nose is a tangent ogive whose point is rounded off by a sphere of radius nose_tip_r.
function ogive_rho(L) = (R * R + L * L) / (2 * R); // radius of the arc that sweeps out the ogive
function tip_centre(L) = sqrt(pow(ogive_rho(L) - nose_tip_r, 2) - pow(ogive_rho(L) - R, 2));
// Length of the pointed ogive that comes out nose_len long once its tip is rounded
function pointed_len(L = nose_len, n = 12) =
    n == 0 ? L : pointed_len(L + nose_len - tip_centre(L) - nose_tip_r, n - 1);
rho = ogive_rho(pointed_len());
tip_c = tip_centre(pointed_len());
tip_a = atan2(rho - R, tip_c);           // where the tip sphere meets the ogive, as an angle from the axis
cap_h = tip_c + nose_tip_r * cos(tip_a); // and that point's height above the nose's base
function nose_r(h) = sqrt(rho * rho - h * h) - (rho - R); // hull radius h above the nose's base

function ogive(h0, h1, n) = [for (i = [0 : n]) let(h = h0 + (h1 - h0) * i / n) [nose_r(h), nose_base + h]];
function tip_cap(n = 8) = [for (i = [1 : n]) let(a = tip_a * (1 - i / n))
    [nose_tip_r * sin(a), nose_base + tip_c + nose_tip_r * cos(a)]];

// [r, z] outlines of the hull, turned about the Z axis. The engine bay is open below: its outline
// runs out along the roof and down the inside of the skirt's wall.
bay_inside = [[0, roof], [R - bay_wall, roof], [R - bay_wall, 0]];
tiled_from = nose_len - tip_tiles; // height on the nose above which it is tiled all the way round
assert(tiled_from < cap_h, "tip_tiles must reach below the rounded tip");
step_h = max(0, nose_tile_step - nose_base); // height of the tile step above the nose's base
assert(step_h < tiled_from, "nose_tile_step must be below the nose's fully tiled tip");
// The nose below the tile step, tiled like the barrel, and the nose above it
nose_band = concat([[0, nose_base]], ogive(0, step_h, 4), [[0, nose_base + step_h]]);
nose_lower = concat([[0, nose_base + step_h]], ogive(step_h, tiled_from, 32), [[0, nose_base + tiled_from]]);
nose_top = concat([[0, nose_base + tiled_from]], ogive(tiled_from, cap_h, 8), tip_cap());
whole = concat(bay_inside, [[R, 0]], ogive(0, cap_h, 40), tip_cap());

// A slice of the hull turned all the way round, tiled for `tiled` degrees either side of windward
module tiled_turn(outline, tiled) {
    made_of("tiles") rotate([0, 0, az(-tiled)]) rotate_extrude(angle = 2 * tiled, $fn = segments) polygon(outline);
    made_of("steel") rotate([0, 0, az(tiled)]) rotate_extrude(angle = 360 - 2 * tiled, $fn = segments) polygon(outline);
}

// The hull. Previews, and exports of a single material, split it into its tiled side, its steel side
// and the engine bay, using a skin over the barrel; the STL of the whole ship gets one smooth solid,
// since STL has no colour.
module body()
    if ($preview || drawing_material() != "all") {
        skin = skirt_wall / 3;
        tiled_turn([[R - skin, 0], [R, 0], [R, nose_base], [R - skin, nose_base]], tile_line);
        made_of("aft_shield") rotate_extrude($fn = segments)
            polygon(concat(bay_inside, [[R - skin, 0], [R - skin, nose_base], [0, nose_base]]));
        if (step_h > 0) tiled_turn(nose_band, tile_line);
        tiled_turn(nose_lower, nose_tile_line);
        made_of("tiles") rotate_extrude($fn = segments) polygon(nose_top);
    } else rotate_extrude($fn = segments) polygon(whole);

// The heat shield's thickness: a layer tile_t thick over the tiled part of the hull. Along its edges,
// where the tiles stop at the tile line and at its step, the layer slopes down to the steel over
// tile_ramp, as the bevelled edge tiles do. The barrel and the nose below the step get one patch, the
// nose above the step a wider one, and the fully tiled tip a turned shell.
module tile_skin() {
    skin_patch(concat([[R, 0]], ogive(0, step_h + tile_ramp, 4)), az(-tile_line), az(tile_line), [true, true, false]);
    skin_patch(concat([[nose_r(step_h), nose_base + step_h]], ogive(step_h + tile_ramp, tiled_from + tile_ramp, 32)),
        az(-nose_tile_line), az(nose_tile_line), [true, true, true]);
    tip_skin();
}

// The running totals of the lengths between the points p, from the first one
function cum_len(p, i = 0, acc = [0]) = i >= len(p) - 1 ? acc :
    cum_len(p, i + 1, concat(acc, [acc[i] + norm(p[i + 1] - p[i])]));

// A patch of the heat shield's layer over the hull's [r, z] outline pts, from OpenSCAD angle a0 to a1,
// sloping down to the hull along the edges flagged in bevel = [start, end, bottom]. Its other edges
// stop square, inside a neighbouring patch. Its inside is 5 mm under the hull's surface, so the two join.
module skin_patch(pts, a0, a1, bevel) {
    n = len(pts);
    m = max(4, ceil((a1 - a0) / (360 / segments)));
    s = cum_len(pts);
    // The angle of column j on row i: the first and last steps are the bevels' widths at that radius
    function col(i, j) = let(d = tile_ramp / pts[i][0] * 180 / PI)
        j == 0 ? a0 : j == m ? a1 : a0 + d + (a1 - a0 - 2 * d) * (j - 1) / (m - 2);
    function thick(i, j) = tile_t * ((bevel[0] && j == 0) || (bevel[1] && j == m) ? 0 : 1)
        * (bevel[2] ? min(1, s[i] / tile_ramp) : 1);
    function pt(i, j, k) = let(r = pts[i][0] + (k == 0 ? -5 : thick(i, j)), a = col(i, j)) [r * cos(a), r * sin(a), pts[i][1]];
    function id(i, j, k) = (k * n + i) * (m + 1) + j;
    polyhedron(points = [for (k = [0, 1], i = [0 : n - 1], j = [0 : m]) pt(i, j, k)], faces = concat(
        [for (i = [0 : n - 2], j = [0 : m - 1]) [id(i, j, 1), id(i + 1, j, 1), id(i + 1, j + 1, 1), id(i, j + 1, 1)]],
        [for (i = [0 : n - 2], j = [0 : m - 1]) [id(i, j, 0), id(i, j + 1, 0), id(i + 1, j + 1, 0), id(i + 1, j, 0)]],
        [for (i = [0 : n - 2]) [id(i, 0, 0), id(i + 1, 0, 0), id(i + 1, 0, 1), id(i, 0, 1)]],
        [for (i = [0 : n - 2]) [id(i, m, 1), id(i + 1, m, 1), id(i + 1, m, 0), id(i, m, 0)]],
        [for (j = [0 : m - 1]) [id(0, j, 0), id(0, j, 1), id(0, j + 1, 1), id(0, j + 1, 0)]],
        [for (j = [0 : m - 1]) [id(n - 1, j + 1, 0), id(n - 1, j + 1, 1), id(n - 1, j, 1), id(n - 1, j, 0)]]));
}

// The layer over the fully tiled tip, all the way round, sloping down to the hull at its lower edge.
// Each point of the outline moves out along the hull's normal.
module tip_skin() {
    p = concat([[nose_r(tiled_from), nose_base + tiled_from]], ogive(tiled_from + tile_ramp, cap_h, 8), tip_cap());
    n = len(p);
    s = cum_len(p);
    nrm = [for (i = [0 : n - 1]) let(d = p[min(i + 1, n - 1)] - p[max(i - 1, 0)]) [d[1], -d[0]] / norm(d)];
    inner = [for (i = [0 : n - 1]) i == n - 1 ? [0, p[i][1] - 5] : let(q = p[i] - 5 * nrm[i]) [max(0, q[0]), q[1]]];
    outer = [for (i = [n - 1 : -1 : 0]) i == n - 1 ? [0, p[i][1] + tile_t] : p[i] + tile_t * min(1, s[i] / tile_ramp) * nrm[i]];
    rotate_extrude($fn = segments) polygon(concat(inner, outer));
}

module both_sides() {
    children();
    mirror([1, 0, 0]) children();
}

// The corners of a convex, counterclockwise [r, z] outline moved in by d, so that a hull of spheres of
// radius d on them fills the outline exactly
function inset(p, d) = let(n = len(p)) [for (i = [0 : n - 1]) let(
    a = p[(i + n - 1) % n], b = p[i], c = p[(i + 1) % n],
    u = (b - a) / norm(b - a), v = (c - b) / norm(c - b),
    nu = [-u[1], u[0]], nv = [-v[1], v[0]]) // inward normals of the edges either side
    b + d / (1 + nu * nv) * (nu + nv)];

// A flap 2d thick in the XZ plane with the given [r, z] outline and every edge rounded, as on the
// real flaps
module rounded_plate(outline, d) hull() for (q = inset(outline, d)) translate([q[0], 0, q[1]]) sphere(d, $fn = 16);

// The aft flap on +X (dimensions.md's 270°), tiled on both faces
module aft_flap() {
    span = (aft_flap_span_total - diameter) / 2;
    r0 = max(aft_flap_thickness[0], min_t) / 2;
    r1 = max(aft_flap_thickness[1], min_t) / 2;
    // It tapers from its root to its outboard edge, and both are rounded, as is the swept leading edge
    // between them, so it is the hull of a rounded edge at each end. The root sits on the hull's line.
    hull() for (e = [[R, r0, aft_flap_root_top], [R + span - r1, r1, aft_flap_tip_top]]) {
        translate([e[0], 0, aft_flap_bottom]) cylinder(h = e[2] - aft_flap_bottom - e[1], r = e[1], $fn = 24);
        translate([e[0], 0, e[2] - e[1]]) sphere(e[1], $fn = 24);
    }
}

// The tiled static aero strip along the +X aft flap's hinge line, and the leading edge aero cap over
// the top of the hinge. The strip is an elliptic cylinder half-buried in the hull, with its back inside
// the skirt's wall.
module aft_hinge_cover() {
    ar = (aft_static_aero_out + 0.8 * skirt_wall) / 2; // the strip's radial half-depth
    module section(h) translate([R + aft_static_aero_out - ar, 0, 0]) scale([ar, aft_static_aero_w / 2, 1])
        cylinder(h = h, r = 1, $fn = 32);
    translate([0, 0, aft_flap_bottom]) section(aft_flap_root_top - aft_flap_bottom);
    // The cap carries the strip's section up from the top of the flap's root and tapers into the hull,
    // continuing the slope of the flap's leading edge, to a rounded tip
    hull() {
        translate([0, 0, aft_flap_root_top - 1]) section(1);
        translate([R + 50, 0, aft_flap_root_top + aft_cap_h - 200]) sphere(200, $fn = 24);
    }
}

// Where the +X aft flap's leeward face (toward -Y) is, at distance x from the axis
function aft_face_y(x) = let(span = (aft_flap_span_total - diameter) / 2,
    r0 = max(aft_flap_thickness[0], min_t) / 2, r1 = max(aft_flap_thickness[1], min_t) / 2)
    -(r0 + (r1 - r0) * (x - R) / (span - r1));

// The +X aft flap's hinges, on its leeward side: each a clevis on the hull just beside the static aero
// strip, with a link into the flap's root under the strip
module aft_hinges_x() made_of("steel") for (h = aft_hinges) {
    y = -(aft_static_aero_w / 2 + 100);
    clevis = [sqrt(R * R - y * y), y, h[0]];
    rod(clevis + [100, 0, 0], [R + 200, aft_face_y(R + 200) - h[2] / 2, h[0]], h[2]);
    translate(clevis) rotate([0, 0, atan2(y, clevis[0])]) translate([-sink(), -100, -h[1] / 2])
        cube([sink() + 160, 200, h[1]]);
}

// The thruster outlets low on the +X aft flap's leeward face: hexagons in staggered rows on a steel
// plate that follows the face
module rcs_outlets_x() {
    x0 = R + rcs_outlet_start[0] - 250;
    z0 = aft_flap_bottom + rcs_outlet_start[1] - 250;
    k = atan2(aft_face_y(R + 1000) - aft_face_y(R), 1000); // the face's angle to the X axis
    made_of("steel") translate([x0, aft_face_y(x0), z0]) rotate([0, 0, k]) translate([0, -10, 0])
        cube([(rcs_outlets[0] - 0.5) * rcs_outlet_pitch[0] + 500, 40, (rcs_outlets[1] - 1) * rcs_outlet_pitch[1] + 500]);
    made_of("black") for (i = [0 : rcs_outlets[0] - 1], j = [0 : rcs_outlets[1] - 1]) {
        x = R + rcs_outlet_start[0] + (i + (j % 2) / 2) * rcs_outlet_pitch[0];
        translate([x, aft_face_y(x) + 30, aft_flap_bottom + rcs_outlet_start[1] + j * rcs_outlet_pitch[1]])
            rotate([90, 0, 0]) cylinder(h = rcs_outlet[1] + 30, d = rcs_outlet[0] / cos(30), $fn = 6);
    }
}

// The pipes that feed the +X aft flap's thrusters. Each comes out from under the static aero strip,
// runs down the hull beside it on the leeward side and turns back in under it near the bottom.
module rcs_pipes_x() made_of("steel") for (k = [0 : rcs_pipes[0] - 1]) {
    d = rcs_pipes[1];
    b = 150; // the bends' radius
    y = -(aft_static_aero_w / 2 + 230 + d / 2 + k * (d + 30));
    x = sqrt(R * R - y * y) + d / 2 - 10;
    z0 = aft_flap_bottom + 1100 + k * 80;
    z1 = rcs_pipes[2] - k * 80;
    translate([x, y, z0]) cylinder(h = z1 - z0, d = d, $fn = 16);
    for (e = [[z0, 0], [z1, 1]]) translate([x, y, e[0]]) mirror([0, 0, e[1]]) {
        elbow(b, d);
        translate([0, b, -b]) rotate([-90, 0, 0]) cylinder(h = -y - b - aft_static_aero_w / 2 + 100, d = d, $fn = 16);
    }
}

// The forward flap on +X (dimensions.md's 262°) as [r, z] points in its hinge's plane. The hinge
// runs straight up the nose, and the upright tip edge is fwd_tip_out from the hinge line at its middle.
// The root sinks embed into the nose; a loose flap's tab reaches deeper.
function fwd_flap(embed = flap_embed) = let(
    p0 = [nose_r(fwd_hinge_z[0] - nose_base), fwd_hinge_z[0]],
    p1 = [nose_r(fwd_hinge_z[1] - nose_base), fwd_hinge_z[1]],
    u = (p1 - p0) / norm(p1 - p0), // up the hinge
    n = [u[1], -u[0]],             // out from it
    zm = (fwd_tip_z[0] + fwd_tip_z[1]) / 2,
    rt = p0[0] + (fwd_tip_out - (zm - p0[1]) * n[1]) / n[0])
    [p0 - embed * n, p0, [rt, fwd_tip_z[0]], [rt, fwd_tip_z[1]], p1, p1 - embed * n];

// The flap turns about its hinge toward leeward (-Y) so the two flaps' planes end up fwd_flap_angle
// apart. Its windward face is tiled and its leeward face is bare steel. A small tiled static aero strip,
// fixed to the nose, runs along the hinge.
module fwd_flap_x() {
    f = fwd_flap();
    p0 = [f[1][0], 0, f[1][1]];
    p1 = [f[4][0], 0, f[4][1]];
    zm = (p0[2] + p1[2]) / 2;
    turn = (360 - fwd_flap_angle) / 2 - fwd_hinge_az;
    rotate([0, 0, az(-fwd_hinge_az)]) {
        // The strip follows the nose's surface through the hinge's ends and middle
        made_of("tiles") hull() for (p = [p0, [nose_r(zm - nose_base), 0, zm], p1]) translate(p)
            scale([fwd_static_aero[1], fwd_static_aero[0] / 2, fwd_static_aero[1]]) sphere(1, $fn = 24);
        if (!loose_flaps) translate(p0) rotate(a = -turn, v = p1 - p0) translate(-p0) {
            for (side = [["tiles", 0], ["steel", -1]]) made_of(side[0]) intersection() {
                rounded_plate(f, max(fwd_flap_thickness, min_t) / 2);
                translate([0, side[1] * 2000, nose_base]) cube([2 * R, 2000, nose_len]); // the windward or leeward half
            }
        }
        if (fine_details && !loose_flaps) fwd_hinges_x(p0, p1, turn);
    }
}

// A point p moved as the forward flap is: turned by -turn about its hinge line from p0 to p1
function flap_turned(p, p0, p1, turn) = let(k = (p1 - p0) / norm(p1 - p0), v = p - p0, c = cos(-turn), s = sin(-turn))
    p0 + v * c + cross(k, v) * s + k * (k * v) * (1 - c);

// The hinges on the leeward side of the +X forward flap's root, in fwd_flap_x()'s frame. Each is a
// fitting on the flap's leeward face at its root, which turns with the flap, and a strut from the
// fitting across to a clevis on the nose, further round toward leeward.
module fwd_hinges_x(p0, p1, turn) made_of("steel") {
    u = (p1 - p0) / norm(p1 - p0); // up the hinge line
    n = [u[2], 0, -u[0]];          // out from it, along the flap
    t = max(fwd_flap_thickness, min_t);
    for (h = fwd_hinges) {
        q = p0 + (h[0] - p0[2]) / u[2] * u; // the hinge line at this hinge's height
        w = 2 * h[2] + 160;                 // the fitting's width out along the flap
        a = q + w / 2 * n - [0, t / 2, 0];  // the middle of the fitting's base, on the flap's leeward face
        r = nose_r(h[0] - nose_base);
        phi = h[3] / r * 180 / PI;
        clevis = [r * cos(phi), -r * sin(phi), h[0]];
        translate(p0) rotate(a = -turn, v = p1 - p0) translate(-p0)
            multmatrix([[u[0], n[0], 0, a[0]], [0, 0, 1, a[1]], [u[2], n[2], 0, a[2]], [0, 0, 0, 1]])
                translate([-h[1] / 2, -w / 2, -150]) cube([h[1], w, 170]);
        rod(flap_turned(a - [0, 150 - h[2] / 2, 0], p0, p1, turn), clevis, h[2]);
        translate(clevis) rotate([0, 0, -phi]) translate([-sink(), -100, -120]) cube([sink() + 150, 200, 240]);
    }
}

// Places a forward flap's [r, z] outline as fwd_flap_x() does, turned about its hinge on +X
module fwd_flap_place() {
    f = fwd_flap();
    p0 = [f[1][0], 0, f[1][1]];
    p1 = [f[4][0], 0, f[4][1]];
    turn = (360 - fwd_flap_angle) / 2 - fwd_hinge_az;
    rotate([0, 0, az(-fwd_hinge_az)]) translate(p0) rotate(a = -turn, v = p1 - p0) translate(-p0) children();
}

// A loose forward flap in its hinge's plane, with its root carried on into the nose as a tab
module loose_flap() rounded_plate(fwd_flap(tab_depth * model_scale), max(fwd_flap_thickness, min_t) / 2);

// The slot along a forward flap's hinge that the loose flap's tab plugs into: the tab grown by the
// clearance all round, carried out through the static aero strip
module fwd_flap_slot() fwd_flap_place() {
    f = fwd_flap();
    c = fit_clearance * model_scale;
    u = (f[4] - f[1]) / norm(f[4] - f[1]);              // up the hinge
    n = [u[1], -u[0]];                                   // out from it
    d = tab_depth * model_scale + c;
    t = max(fwd_flap_thickness, min_t) + 2 * c;
    translate([0, t / 2, 0]) rotate([90, 0, 0]) linear_extrude(t) polygon([
        f[1] - d * n - c * u, f[1] + 600 * n - c * u, f[4] + 600 * n + c * u, f[4] - d * n + c * u]);
}

// The two loose forward flaps laid flat side by side for printing. They are mirror images, but each
// is the same both ways through its thickness, so two copies of one flap make the pair.
module loose_flaps_flat() {
    f = fwd_flap(tab_depth * model_scale);
    x0 = min([for (p = f) p[0]]) - 500;
    z0 = min([for (p = f) p[1]]);
    w = max([for (p = f) p[0]]) - x0 + 1000;
    t = max(fwd_flap_thickness, min_t);
    for (i = [0, 1]) translate([i * w - x0, -z0, t / 2]) rotate([-90, 0, 0]) made_of("tiles") loose_flap();
}

// Holes for the pins that line up the sections at each cut: two at different radii, so the sections
// only go together one way round, each reaching pin_depth into both sides
module joint_pin_holes() for (z = section_z, p = [[0, 0.5], [180, 0.3]])
    rotate([0, 0, az(p[0])]) translate([p[1] * R, 0, z - pin_depth * model_scale])
        cylinder(h = 2 * pin_depth * model_scale, d = pin_d * model_scale, $fn = 24);

// A raceway: a strip standing off the hull with a rounded top, at dimensions.md azimuth a_top at
// the top and a_bottom at its lower end
module raceway(a_top, a_bottom) hull() {
    rotate([0, 0, az(a_bottom)]) translate([R - 100, 0, raceway_z[0]]) rotate([90, 0, 90])
        linear_extrude(raceway_out + 100) translate([-raceway_w / 2, 0]) square([raceway_w, 1]);
    rotate([0, 0, az(a_top)]) translate([R - 100, 0, raceway_z[1] - raceway_w / 2]) rotate([90, 0, 90])
        linear_extrude(raceway_out + 100) circle(d = raceway_w, $fn = 32);
}

// The door's slot shape grown by g all round, as a solid reaching from radius r0 to r1
module door_slot(g, r0, r1) {
    half = (door_z[1] - door_z[0]) / 2;
    zc = door_z[0] + half;
    ends = [door_az[0] + half / R * 180 / PI, door_az[1] - half / R * 180 / PI]; // centres of the rounded ends
    rotate([0, 0, az(ends[0])]) rotate_extrude(angle = ends[1] - ends[0], $fn = segments)
        translate([r0, zc - half - g]) square([r1 - r0, 2 * (half + g)]);
    for (a = ends) rotate([0, 0, az(a)]) translate([r0, 0, zc]) rotate([0, 90, 0])
        cylinder(h = r1 - r0, r = half + g, $fn = 32);
}

// The groove round the door's outline, to cut from the hull
module door_seam() difference() {
    door_slot(door_seam / 2, R - door_seam, R + 100);
    door_slot(-door_seam / 2, R - door_seam - 50, R + 150);
}

// A passive (drogue) docking port, p = [azimuth, centre height, reach]: a steel housing tube pointing
// straight out from the leeward side (-Y), with a notch cut up into the bottom of its mouth. A dark
// drogue cone sits in the mouth, narrowing to a central hole, and its tab hangs down through the
// notch. The housing runs on back into the hull, where starship() trims it.
module docking_port(p) {
    x = -R * sin(p[0]);
    bore = drogue_d / 2 + 10;
    len = drogue_depth + 100; // length of the drogue's body
    // Local z runs from the mouth back toward the hull (+Y), and local -y is down
    translate([x, -sqrt(R * R - x * x) - p[2], p[1]]) rotate([-90, 0, 0]) rotate([0, 0, 180]) {
        made_of("steel") difference() {
            cylinder(h = p[2] + 1500, d = port_d, $fn = 48);
            translate([0, 0, -1]) linear_extrude(drogue_recess + len + 1) {
                circle(r = bore, $fn = 48);
                translate([-port_notch / 2, -port_d]) square([port_notch, port_d]);
            }
        }
        made_of("black") translate([0, 0, drogue_recess]) {
            difference() {
                cylinder(h = len, r = bore + 1, $fn = 48);
                translate([0, 0, -1]) cylinder(h = drogue_depth + 1, r1 = drogue_d / 2 - 20, r2 = drogue_hole / 2, $fn = 48);
                cylinder(h = drogue_depth + 60, r = drogue_hole / 2, $fn = 16);
            }
            translate([-drogue_tab[0] / 2, -(drogue_d / 2 + drogue_tab[1]), 0])
                cube([drogue_tab[0], drogue_tab[1] + 50, len]);
        }
        // The bolts round the cone, standing out of its sloping face
        if (fine_details) made_of("steel") for (i = [0 : drogue_bolts[0] - 1])
            rotate([0, 0, (i + 0.5) * 360 / drogue_bolts[0]]) translate([drogue_bolts[1] / 2, 0, drogue_recess + 6])
                cylinder(h = 40, d = drogue_bolts[2], $fn = 8);
    }
}

// The QD plate on the leeward centreline: a backing plate between two guide rails, with the two
// round propellant connectors facing out
module qd_plate() rotate([0, 0, az(180)]) translate([R - 100, 0, qd_z[0]]) {
    h = qd_z[1] - qd_z[0];
    translate([0, -qd_w / 2, 0]) cube([100 + qd_out, qd_w, h]);
    for (y = [-qd_w / 2, qd_w / 2 - 60]) translate([0, y, 0]) cube([100 + qd_rail_out, 60, h]);
    for (y = [-0.17, 0.17] * qd_w) translate([100 + qd_out - 1, y, qd_connector_z - qd_z[0]])
        rotate([0, 90, 0]) cylinder(h = 120, d = qd_connector_d, $fn = 32);
}

// A catch pin on +X (dimensions.md's 270°): a tiled fairing whose top slopes down from the hull to a
// short upright outer end, with sides sloping out to the hull, a level underside and a steel pad under
// the outer end. Its back is a flat plate inside the curve of the nose, so its top is carried on down
// the same slope to meet the hull at catch_z[1].
module catch_pin() {
    rh = nose_r(catch_z[1] - nose_base); // the nose's radius where the top meets it
    back = rh - 80;
    x1 = R + catch_out;
    slope = (catch_z[1] - catch_z[0] - catch_end) / (x1 - rh);
    top = catch_z[1] + (rh - back) * slope;
    made_of("tiles") hull() {
        translate([back, -catch_w[0] / 2, catch_z[0]]) cube([1, catch_w[0], 1]);
        translate([back, -catch_w[1] / 2, top - 1]) cube([1, catch_w[1], 1]);
        translate([x1 - 1, -catch_w[1] / 2, catch_z[0]]) cube([1, catch_w[1], catch_end]);
    }
    made_of("steel") translate([x1 - catch_pad_depth, -catch_pad[0] / 2, catch_z[0] - catch_pad[1]])
        cube([catch_pad_depth, catch_pad[0], catch_pad[1] + 1]);
}

// The attic vent hood on a raceway's lower end at azimuth a, a box with rounded front corners, or with
// opening = true the space inside it, open at the bottom, to cut from the hood and the raceway
module attic_vent(a, opening = false) rotate([0, 0, az(a)]) translate([0, 0, raceway_z[0]]) {
    g = opening ? 60 : 0; // the hood's walls
    hull() {
        translate([R - 100 + 2 * g, -attic_vent[0] / 2 + g, -g]) cube([10, attic_vent[0] - 2 * g, (opening ? attic_vent_open : attic_vent[1]) + g]);
        for (s = [-1, 1]) translate([R + attic_vent_out - 120, s * (attic_vent[0] / 2 - 120), -g])
            cylinder(h = (opening ? attic_vent_open : attic_vent[1]) + g, r = 120 - g, $fn = 24);
    }
}

// The fine details on the hull: the leeward Starlink dishes, the window and grilles between the payload
// bay drogues, the roll thrusters, the bands of vent slats and the ringed ports
module hull_fittings() {
    for (a = starlink_az) {
        h = starlink_z - nose_base;
        made_of("tiles") on_hull(az(a), nose_r(h), starlink_z, atan(h / sqrt(rho * rho - h * h)))
            rounded_box(starlink_size[0], starlink_size[1], starlink_size[2]);
    }
    on_hull(az(sensor_window[0]), R, sensor_window[1])
        bolted_port(sensor_window[2], sensor_window[3], 40, [32, (sensor_window[2] + sensor_window[3]) / 2, 40], [sensor_window[4], 15]);
    for (a = small_ports) on_hull(az(a), R, sensor_window[1])
        bolted_port(small_port_d, small_port_d + 160, 30, [8, small_port_d + 80, 30], opening = "steel");
    for (z = rcs_z, a = rcs_az) on_hull(az(a), R, z)
        bolted_port(rcs_d[0], rcs_d[1], 50, [10, rcs_d[1] + 140, 50], [rcs_d[1] + 220, 12]);
    for (b = vent_bands) made_of("steel") slat_band(R, b[0], b[1], az(b[2]), az(b[3]), [vent_slat[0], vent_slat[1], vent_slat[3]],
        b[4] == 1 ? [az(180 - raceway_az[0]), az(180 + raceway_az[0]), vent_slat[2]] : [0, 0, 0]);
    for (p = ringed_ports) on_hull(az(p[0]), R, p[1]) {
        bolted_port(ringed_port[0], ringed_port[0] + 150, 40, plate = [ringed_port[1], 12]);
        made_of("steel") for (d = [0.72, 0.9]) raised_ring(d * ringed_port[1], 60, 25);
    }
}

// The six Raptors hang from the engine bay's roof, each with its front facing outward as on the
// booster, so their coolant pipes run round the ship rather than out from it
module engines() {
    for (a = sl_az) rotate([0, 0, az(a)]) translate([sl_ring_r, 0, roof - raptor_sl_mount(raptor_exit)])
        raptor_sl(raptor_exit, wall, engine_detail, min_t / 2, $fn = 48);
    for (a = rvac_az) rotate([0, 0, az(a)]) translate([rvac_ring_r, 0, rvac_exit_z])
        raptor_vac(rvac_exit, wall, raptor_exit, engine_detail, min_t / 2, $fn = 48);
}

// The ship. For printing, the engine bay can be filled up to its roof, which leaves the engines out,
// and a hole for the stacking pin cut up into the middle of the bottom (or of the roof, when the bay
// is open), with the joint pins' holes at any section cuts and the slots for loose flaps.
module starship() difference() {
    union() {
        difference() {
            body();
            color(seam_dark) door_seam();
        }
        // The docking ports' housings are trimmed where they run back inside the hull's wall
        difference() {
            for (p = docking_ports) docking_port(p);
            translate([0, 0, -1]) cylinder(r = R - 150, h = height, $fn = segments);
        }
        made_of("steel") qd_plate();
        if (fine_details) {
            made_of("tiles") tile_skin();
            hull_fittings();
            both_sides() {
                aft_hinges_x();
                rcs_outlets_x();
                rcs_pipes_x();
            }
        }
        if (catch_pins) for (a = catch_az) rotate([0, 0, az(a)]) catch_pin();
        // The aft flaps' rounded roots are trimmed where they would reach into the engine bay
        made_of("tiles") both_sides() {
            difference() {
                aft_flap();
                translate([0, 0, -1]) cylinder(r = R - skirt_wall / 2, h = roof + 1, $fn = segments);
            }
            aft_hinge_cover();
        }
        both_sides() fwd_flap_x();
        // The raceways, ending in the attic vent hoods
        made_of("steel") difference() {
            union() {
                for (s = [-1, 1]) raceway(180 + s * raceway_az[0], 180 + s * raceway_az[1]);
                if (fine_details) for (s = [-1, 1]) attic_vent(180 + s * raceway_az[1]);
            }
            if (fine_details) for (s = [-1, 1]) attic_vent(180 + s * raceway_az[1], true);
        }
        if (fill_engine_bay) made_of("aft_shield") cylinder(r = R - bay_wall + 1, h = roof + 1, $fn = segments);
        else engines();
    }
    if (pin_d > 0) {
        bottom = fill_engine_bay ? 0 : roof;
        translate([0, 0, bottom - 1]) cylinder(h = pin_depth * model_scale + 1, d = pin_d * model_scale, $fn = 32);
        joint_pin_holes();
    }
    if (loose_flaps) both_sides() fwd_flap_slot();
}

// The part of the ship between heights z0 and z1
module cut(z0, z1) intersection() {
    children();
    translate([-50000, -50000, z0]) cube([100000, 100000, z1 - z0]);
}

// What gets drawn: the loose parts laid flat; one section standing on a flat cut face, the lowest one
// upside down on its top cut so its engines print upward from the bay's roof, the others upright on
// their bottom cut; or the whole ship. The material setting reaches every part as $material.
scale(1 / model_scale, $material = material) if (section < 0) loose_flaps_flat();
    else if (section > 0 && len(section_z) > 0) {
        bounds = concat([-10000], section_z, [height + 10000]);
        k = min(section, len(section_z) + 1);
        e = 1; // each section stops 1 mm (full size) short of the cut, so faces lying on it don't leave slivers
        if (k == 1) translate([0, 0, bounds[1] - e]) rotate([180, 0, 0]) cut(bounds[0], bounds[1] - e) starship();
        else translate([0, 0, -bounds[k - 1] - e]) cut(bounds[k - 1] + e, bounds[k] - e) starship();
    }
    else starship();
