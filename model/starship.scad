// Starship: the V3 ship (upper stage), built from dimensions.md's "Starship V3 in detail" and
// "Raptor engines" sections. The engines come from raptor.scad.
// Units are mm at full size, Z up, with the bottom edge of the aft skirt on z = 0. That is where
// the ship sits on the booster's truss, so it stacks on super_heavy.scad at z = 72300.
// Values under [From dimensions.md] come from that file, which tags each one Published, Reported
// or Estimated (measured from photos); the comments mark the estimated ones. Values under
// [Estimates] aren't in dimensions.md, so they are guesses worth adjusting.
// Azimuths are dimensions.md's: 0 is the windward (tiled) centreline, increasing counterclockwise
// seen from above. Windward faces +Y, so the default render views look at the steel leeward side.

use <raptor.scad>

/* [Print] */
// Print at 1:model_scale. 1 is full size; 300 makes the ship 174 mm tall.
model_scale = 1; // [1:1000]
// Facets around the hull
segments = 128;
// Engine nozzle walls. 0 makes the nozzles solid, which suits prints smaller than about 1:100.
nozzle_wall = 40;

/* [From dimensions.md] */
height = 52100;
diameter = 9000;
// The barrel is 21 rings of 1.83 m. The nosecone, a tangent ogive, takes the rest of the height.
rings = 21;
ring_h = 1830;
// Tile line in degrees either side of windward, on the barrel and on the nosecone (estimated)
tile_line = 105;
nose_tile_line = 128;
// Tip to tip across the aft flaps
aft_flap_span_total = 17000;
// The aft flaps are hinged at 90° and 270°. Their leading edge leaves the hull at aft_flap_root_top
// and runs down to the top of the upright tip edge at aft_flap_tip_top (estimated).
aft_flap_root_top = 15000;
aft_flap_tip_top = 8600;
// The tiled hinge fairings (aerocovers) on the aft flaps reach round to this azimuth on the leeward
// side, and come to a point at the top of the hinge (estimated)
aerocover_edge = 126;
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
// Nozzle exit diameters of the sea-level Raptor 3 and the Raptor 3 Vacuum
raptor_exit = 1300;
rvac_exit = 2400;

/* [Estimates] */
// Radius of the rounded nose tip, and the height of the tip that is tiled all the way round
nose_tip_r = 1000;
tip_tiles = 1500;
// Bottom of the aft flaps, and the flaps' thicknesses
aft_flap_bottom = 0;
aft_flap_thickness = 500;
fwd_flap_thickness = 350;
// The aerocovers: how far they stand off the hull, where they start, and the height up to which they
// keep their full width before narrowing to the point at the top of the hinge
aerocover_out = 250;
aerocover_bottom = 4500;
aerocover_full = 9000;
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
nose_base = rings * ring_h; // where the nosecone leaves the cylinder
nose_len = height - nose_base;
roof = rvac_exit_z + raptor_vac_mount(rvac_exit, raptor_exit); // the engine bay's roof
flap_embed = skirt_wall / 2; // how far flap roots sink into the hull
steel = [0.78, 0.79, 0.81];
raceway_steel = [0.66, 0.67, 0.69];
tiles = [0.2, 0.2, 0.22];
bay_grey = [0.5, 0.5, 0.52];
seam_dark = [0.25, 0.25, 0.27];
fitting_grey = [0.55, 0.56, 0.58];
housing_grey = [0.42, 0.43, 0.46];
drogue_grey = [0.3, 0.34, 0.39];

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
bay_inside = [[0, roof], [R - skirt_wall, roof], [R - skirt_wall, 0]];
tiled_from = nose_len - tip_tiles; // height on the nose above which it is tiled all the way round
assert(tiled_from < cap_h, "tip_tiles must reach below the rounded tip");
assert(aerocover_bottom > roof, "the aerocovers must start above the engine bay's roof");
nose_lower = concat([[0, nose_base]], ogive(0, tiled_from, 32), [[0, nose_base + tiled_from]]);
nose_top = concat([[0, nose_base + tiled_from]], ogive(tiled_from, cap_h, 8), tip_cap());
whole = concat(bay_inside, [[R, 0]], ogive(0, cap_h, 40), tip_cap());

// A slice of the hull turned all the way round, tiled for `tiled` degrees either side of windward
module tiled_turn(outline, tiled) {
    color(tiles) rotate([0, 0, az(-tiled)]) rotate_extrude(angle = 2 * tiled, $fn = segments) polygon(outline);
    color(steel) rotate([0, 0, az(tiled)]) rotate_extrude(angle = 360 - 2 * tiled, $fn = segments) polygon(outline);
}

// The hull. Previews colour its tiled side and give the engine bay one colour, using a skin over
// the barrel; the STL export gets one smooth solid, since STL has no colour.
module body()
    if ($preview) {
        skin = skirt_wall / 3;
        tiled_turn([[R - skin, 0], [R, 0], [R, nose_base], [R - skin, nose_base]], tile_line);
        color(bay_grey) rotate_extrude($fn = segments)
            polygon(concat(bay_inside, [[R - skin, 0], [R - skin, nose_base], [0, nose_base]]));
        tiled_turn(nose_lower, nose_tile_line);
        color(tiles) rotate_extrude($fn = segments) polygon(nose_top);
    } else rotate_extrude($fn = segments) polygon(whole);

module both_sides() {
    children();
    mirror([1, 0, 0]) children();
}

// A flat panel outlined by [r, z] points in the XZ plane, from y = y0 to y0 + t
module panel(outline, y0, t) translate([0, y0 + t, 0]) rotate([90, 0, 0]) linear_extrude(t) polygon(outline);

// The aft flap on +X (dimensions.md's 270°), tiled on both faces
function aft_flap() = let(span = (aft_flap_span_total - diameter) / 2) [
    [R - flap_embed, aft_flap_bottom], [R + span, aft_flap_bottom], [R + span, aft_flap_tip_top],
    [R, aft_flap_root_top], [R - flap_embed, aft_flap_root_top]];

// The tiled fairing over the +X aft flap's hinge: a low shell hugging the hull from the hinge round
// toward leeward (-Y) as far as aerocover_edge. It keeps that width up to aerocover_full and then
// narrows to a point over the hinge at the top of the flap's root.
module aerocover() {
    a = aerocover_edge - 90; // degrees round the hull from the hinge
    hull() {
        for (z = [aerocover_bottom, aerocover_full]) rotate([0, 0, -a]) rotate_extrude(angle = a, $fn = segments)
            translate([R - 100, z]) square([100 + aerocover_out, 1]);
        translate([R - 100, -50, aft_flap_root_top - 1]) cube([100 + aerocover_out / 2, 100, 1]);
    }
}

// The forward flap on +X (dimensions.md's 262°) as [r, z] points in its hinge's plane. The hinge
// runs straight up the nose, and the upright tip edge is fwd_tip_out from the hinge line at its middle.
function fwd_flap() = let(
    p0 = [nose_r(fwd_hinge_z[0] - nose_base), fwd_hinge_z[0]],
    p1 = [nose_r(fwd_hinge_z[1] - nose_base), fwd_hinge_z[1]],
    u = (p1 - p0) / norm(p1 - p0), // up the hinge
    n = [u[1], -u[0]],             // out from it
    zm = (fwd_tip_z[0] + fwd_tip_z[1]) / 2,
    rt = p0[0] + (fwd_tip_out - (zm - p0[1]) * n[1]) / n[0])
    [p0 - flap_embed * n, p0, [rt, fwd_tip_z[0]], [rt, fwd_tip_z[1]], p1, p1 - flap_embed * n];

// The flap turns about its hinge toward leeward (-Y) so the two flaps' planes end up fwd_flap_angle
// apart. Its windward face is tiled and its leeward face is bare steel.
module fwd_flap_x() {
    f = fwd_flap();
    p0 = [f[1][0], 0, f[1][1]];
    p1 = [f[4][0], 0, f[4][1]];
    turn = (360 - fwd_flap_angle) / 2 - fwd_hinge_az;
    rotate([0, 0, az(-fwd_hinge_az)]) translate(p0) rotate(a = -turn, v = p1 - p0) translate(-p0) {
        color(tiles) panel(f, 0, fwd_flap_thickness / 2);
        color(steel) panel(f, -fwd_flap_thickness / 2, fwd_flap_thickness / 2);
    }
}

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
        color(housing_grey) difference() {
            cylinder(h = p[2] + 1500, d = port_d, $fn = 48);
            translate([0, 0, -1]) linear_extrude(drogue_recess + len + 1) {
                circle(r = bore, $fn = 48);
                translate([-port_notch / 2, -port_d]) square([port_notch, port_d]);
            }
        }
        color(drogue_grey) translate([0, 0, drogue_recess]) {
            difference() {
                cylinder(h = len, r = bore + 1, $fn = 48);
                translate([0, 0, -1]) cylinder(h = drogue_depth + 1, r1 = drogue_d / 2 - 20, r2 = drogue_hole / 2, $fn = 48);
                cylinder(h = drogue_depth + 60, r = drogue_hole / 2, $fn = 16);
            }
            translate([-drogue_tab[0] / 2, -(drogue_d / 2 + drogue_tab[1]), 0])
                cube([drogue_tab[0], drogue_tab[1] + 50, len]);
        }
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

// The six Raptors hang from the engine bay's roof, each with its front facing outward as on the
// booster, so their coolant pipes run round the ship rather than out from it
module engines() {
    for (a = sl_az) rotate([0, 0, az(a)]) translate([sl_ring_r, 0, roof - raptor_sl_mount(raptor_exit)])
        raptor_sl(raptor_exit, nozzle_wall, $fn = 48);
    for (a = rvac_az) rotate([0, 0, az(a)]) translate([rvac_ring_r, 0, rvac_exit_z])
        raptor_vac(rvac_exit, nozzle_wall, raptor_exit, $fn = 48);
}

module starship() {
    difference() {
        body();
        color(seam_dark) door_seam();
    }
    // The docking ports' housings are trimmed where they run back inside the hull's wall
    difference() {
        for (p = docking_ports) docking_port(p);
        translate([0, 0, -1]) cylinder(r = R - 150, h = height, $fn = segments);
    }
    color(fitting_grey) qd_plate();
    color(tiles) both_sides() {
        panel(aft_flap(), -aft_flap_thickness / 2, aft_flap_thickness);
        aerocover();
    }
    both_sides() fwd_flap_x();
    color(raceway_steel) for (s = [-1, 1]) raceway(180 + s * raceway_az[0], 180 + s * raceway_az[1]);
    engines();
}

scale(1 / model_scale) starship();
