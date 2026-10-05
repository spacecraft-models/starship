// Basic Starship: the V3 ship (upper stage) without small details.
// Units are mm at full size, Z up, with the bottom of the engine skirt on z = 0.
// Values under [From dimensions.md] come from that file. SpaceX doesn't publish the ones
// under [Estimates], so they were judged from photos and are worth adjusting.
// The heat shield (windward side, black tiles) faces +Y, so the default render views
// look at the bare steel leeward side.

/* [Print] */
// Print at 1:model_scale. 1 is full size; 300 makes the ship 174 mm tall.
model_scale = 1; // [1:1000]
// Facets around the hull
segments = 128;

/* [From dimensions.md] */
height = 52100;
diameter = 9000;
// Tip to tip across the aft flaps
aft_flap_span_total = 17000;
// Angle between the forward flaps, measured across the leeward side
fwd_flap_angle = 140;
// Sea-level Raptor length and nozzle exit diameter
raptor_len = 3100;
raptor_exit = 1300;
// Raptor Vacuum nozzle exit diameter
rvac_exit = 2400;

/* [Estimates] */
// Tapered nose, from where it leaves the cylinder to the tip
nose_len = 13400;
// Radius of the rounded nose tip
nose_tip_r = 1500;
// Aft flaps run up from the base: chord at the hull and at the tip
aft_flap_root = 12000;
aft_flap_tip = 8000;
// Forward flaps are hinged on the nose: start of the hinge above the nose's base, and its height
fwd_flap_start = 500;
fwd_flap_root = 6500;
// How far the forward flaps stick out, and their chord at the tip
fwd_flap_span = 3000;
fwd_flap_tip = 3000;
flap_thickness = 500;
// Raptor Vacuum length. Its nozzle ends level with the bottom of the skirt, so this is also the skirt's depth.
rvac_len = 4600;
// Each Raptor is a nozzle cone under a cylindrical powerhead
powerhead_h = 1400;
powerhead_r = 500;
// Radius of the circles the 3 sea-level engines (centre) and 3 vacuum engines (outside) sit on
sl_ring_r = 1000;
rvac_ring_r = 2900;
skirt_wall = 300;

/* [Hidden] */
R = diameter / 2;
nose_base = height - nose_len;
flap_embed = skirt_wall / 2; // how far flap roots sink into the hull
steel = [0.78, 0.79, 0.81];
tiles = [0.2, 0.2, 0.22];
engine_grey = [0.4, 0.38, 0.36];

// The nose is a tangent ogive whose point is rounded off by a sphere of radius nose_tip_r.
function ogive_rho(L) = (R * R + L * L) / (2 * R); // radius of the arc that sweeps out the ogive
function tip_centre(L) = sqrt(pow(ogive_rho(L) - nose_tip_r, 2) - pow(ogive_rho(L) - R, 2));
// Length of the pointed ogive that comes out nose_len long once its tip is rounded
function pointed_len(L = nose_len, n = 12) =
    n == 0 ? L : pointed_len(L + nose_len - tip_centre(L) - nose_tip_r, n - 1);
rho = ogive_rho(pointed_len());
tip_c = tip_centre(pointed_len());
function nose_r(h) = sqrt(rho * rho - h * h) - (rho - R); // hull radius h above the nose's base

// [r, h] points up the nose from its base to the tip
function nose_profile(n = 40) = let(
    a0 = atan2(rho - R, tip_c),        // where the tip sphere meets the ogive, as an angle from the axis
    h0 = tip_c + nose_tip_r * cos(a0))
    concat([for (i = [0 : n]) let(h = h0 * i / n) [nose_r(h), h]],
           [for (i = [1 : 10]) let(a = a0 * (1 - i / 10)) [nose_tip_r * sin(a), tip_c + nose_tip_r * cos(a)]]);

// Half of the hull, as a solid of revolution: the open skirt around the engines, the cylinder and the nose.
// The windward half (y >= 0) and the leeward half are separate so they can be coloured differently.
module half_hull(windward)
    rotate([0, 0, windward ? 0 : 180]) rotate_extrude(angle = 180, $fn = segments)
        polygon(concat([[0, rvac_len], [R - skirt_wall, rvac_len], [R - skirt_wall, 0], [R, 0]],
                       [for (p = nose_profile()) [p[0], nose_base + p[1]]]));

// A flat flap lying in the vertical plane at azimuth az, outlined by [r, z] points
module flap(az, outline)
    rotate([0, 0, az]) rotate([90, 0, 0]) linear_extrude(flap_thickness, center = true) polygon(outline);

function aft_flap() = let(span = (aft_flap_span_total - diameter) / 2) [
    [R - flap_embed, 0], [R + span, 0], [R + span, aft_flap_tip],
    [R, aft_flap_root], [R - flap_embed, aft_flap_root]];

// The forward flaps' hinge runs straight between two points on the nose, so the flaps lean in with it.
function fwd_flap() = let(
    p0 = [nose_r(fwd_flap_start), nose_base + fwd_flap_start],
    p1 = [nose_r(fwd_flap_start + fwd_flap_root), nose_base + fwd_flap_start + fwd_flap_root],
    u = (p1 - p0) / norm(p1 - p0), // up the hinge
    n = [u[1], -u[0]])              // out from the hinge
    [p0 - flap_embed * n, p0 + fwd_flap_span * n, p0 + fwd_flap_span * n + fwd_flap_tip * u,
     p1, p1 - flap_embed * n];

// A Raptor hanging from the roof of the skirt, which is at z = rvac_len
module raptor(len, exit) {
    nozzle = len - powerhead_h;
    translate([0, 0, rvac_len - len]) {
        cylinder(h = nozzle, r1 = exit / 2, r2 = powerhead_r * 0.6);
        translate([0, 0, nozzle]) cylinder(h = powerhead_h + 100, r = powerhead_r); // sinks 100 mm into the roof
    }
}

module engines() color(engine_grey) {
    for (a = [90, 210, 330]) rotate([0, 0, a]) translate([sl_ring_r, 0, 0]) raptor(raptor_len, raptor_exit, $fn = 64);
    for (a = [270, 30, 150]) rotate([0, 0, a]) translate([rvac_ring_r, 0, 0]) raptor(rvac_len, rvac_exit, $fn = 64);
}

module starship() {
    color(steel) half_hull(windward = false);
    color(tiles) {
        half_hull(windward = true);
        // Aft flaps on opposite sides; forward flaps 140 degrees apart, centred on the leeward side (-Y)
        for (a = [0, 180]) flap(a, aft_flap());
        for (a = [270 - fwd_flap_angle / 2, 270 + fwd_flap_angle / 2]) flap(a, fwd_flap());
    }
    engines();
}

scale(1 / model_scale) starship();
