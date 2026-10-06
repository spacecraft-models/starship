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
// Raceways (estimated): degrees either side of the leeward centreline, bottom and top, and width
raceway_az = 15;
raceway_z = [2400, 35000];
raceway_w = 600;
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
// How far the aerocovers stand off the hull, and the height of their lower point
aerocover_out = 800;
aerocover_bottom = 4500;
// How far the raceways stand off the hull
raceway_out = 250;
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

// The tiled fairing over the +X aft flap's hinge. It bulges round toward leeward (-Y) as far as
// aerocover_edge and narrows to a point at each end, the top one over the hinge.
module aerocover() {
    a = aerocover_edge - 90; // degrees round the hull from the hinge
    z0 = aerocover_bottom;
    z1 = aft_flap_root_top;
    hull() {
        rotate([0, 0, -a / 2]) translate([R, 0, z0]) cube(1, center = true);
        for (f = [0.35, 0.65]) rotate([0, 0, -a / 2]) translate([R, 0, z0 + f * (z1 - z0)])
            linear_extrude(1) scale([aerocover_out, R * sin(a / 2)]) circle(1, $fn = 48);
        rotate([0, 0, -a / 8]) translate([R, 0, z1]) cube(1, center = true);
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

// A raceway at dimensions.md azimuth a: a strip standing off the hull, with a rounded top
module raceway(a) rotate([0, 0, az(a)]) translate([R - 100, 0, raceway_z[0]]) rotate([90, 0, 90])
    linear_extrude(raceway_out + 100) hull() {
        translate([-raceway_w / 2, 0]) square([raceway_w, 1]);
        translate([0, raceway_z[1] - raceway_z[0] - raceway_w / 2]) circle(d = raceway_w, $fn = 32);
    }

// The six Raptors hang from the engine bay's roof, each with its big duct facing outward
module engines() {
    for (a = sl_az) rotate([0, 0, az(a)]) translate([sl_ring_r, 0, roof - raptor_sl_mount(raptor_exit)])
        raptor_sl(raptor_exit, nozzle_wall, $fn = 48);
    for (a = rvac_az) rotate([0, 0, az(a)]) translate([rvac_ring_r, 0, rvac_exit_z])
        raptor_vac(rvac_exit, nozzle_wall, raptor_exit, $fn = 48);
}

module starship() {
    body();
    color(tiles) both_sides() {
        panel(aft_flap(), -aft_flap_thickness / 2, aft_flap_thickness);
        aerocover();
    }
    both_sides() fwd_flap_x();
    color(raceway_steel) for (a = [180 - raceway_az, 180 + raceway_az]) raceway(a);
    engines();
}

scale(1 / model_scale) starship();
