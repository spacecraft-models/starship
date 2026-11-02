// V3 Super Heavy grid fin, for super_heavy.scad to pull in with use <gridfins.scad>. Rendered on its
// own, this file shows one fin.
// Units are mm, Z up. The fin lies level, pointing along +X from its root at x = 0, centred on y = 0
// and on z = 0 through its depth.
// Values under [From dimensions.md] come from the grid fin notes in its "Super Heavy V3 in detail"
// section, which were measured from SpaceX's and NASASpaceFlight's photos (copies in source_img/);
// the comments mark the estimated ones. Values under [Estimates] aren't in dimensions.md.
// Inside, the fin is a lattice of diagonal plates. Plates run round its edge, and one runs straight
// across where its sides turn in toward the root. A solid triangle fills the root, from the root
// edge to the middle of that cross plate. Only the underside is toothed; the top face is flat.
// Previews draw the plates' notched lower edges, but the STL leaves them flat, because the notches
// would make it far slower to export.
// The fin's material, and its colour in previews, comes from materials.scad.

use <materials.scad>

/* [Print] */
// Print at 1:model_scale. 1 is full size; 20 makes the fin 197 mm long.
model_scale = 1; // [1:1000]
// The lattice. Off fills the fin's outline solid, which suits prints smaller than about 1:100.
fin_lattice = true;
// The thinnest part allowed on the print, in mm at print size: the fin's depth and its plates are
// thickened to at least this. 0 keeps them true to size.
min_feature = 0; // [0:0.1:3]
// Draws only every this-many plates of the lattice each way, for a coarser lattice whose holes stay
// open at small sizes. 1 is the real lattice.
fin_lattice_step = 1; // [1:1:4]

/* [Materials] */
// Draws only the parts made of one material, from materials.scad. "all" draws the whole fin.
material = "all"; // [all, grid_fin]

/* [From dimensions.md] */
// Length from the root to the tip: the 4.2 m the fin reaches out from the hull, less the 0.2 m its
// root stands off it. Then its width, which fits the 8 diamonds across and the rows of teeth counted
// in SpaceX's photo into that length, and its depth (estimated).
fin_length = 4000;
fin_width = 3500;
fin_depth = 500;
// Diamonds across the fin's width (an even number), and how deep the notches cut into the plates'
// lower edges between their junctions (estimated)
fin_diamonds = 8;
notch_depth = 220;

/* [Estimates] */
// The width of the root edge and the size of the 45° cuts across the outer corners (both rounded to
// fit the lattice), and the thickness of the edge plates and the lattice plates
root_w = 800;
corner_cut = 800;
edge_t = 60;
fin_bar = 40;

/* [Hidden] */
fin_h = 2 * round(fin_diamonds / 2); // diamonds across, rounded to an even number
fin_s = fin_width / (2 * fin_h);     // lattice node spacing along and across the fin

// The fin's outline seen from above, pointing along +X from its root edge at x0, as [corners in
// counterclockwise order, x of the cross plate]. Every corner sits on a lattice node, so the 45°
// edges run along lattice plates: the root tapers out to the full width at the cross plate, and the
// outer corners are cut off.
function fin_shape(x0) = let(
    s = fin_s, h = fin_h,
    r = max(1, round(root_w / 2 / s)),        // root half-width, in node steps
    k = h - r,                                 // length of the root's taper
    q = 2 * max(1, round(corner_cut / s / 2)), // the outer corner cuts, an even number of steps
    t = fin_length / s - k,
    m = q + 2 * round((t - q) / 2),            // cross plate to tip, so the tip corners are nodes
    xc = x0 + k * s, x1 = xc + m * s)
    [[[x0, -r * s], [xc, -h * s], [x1 - q * s, -h * s], [x1, (q - h) * s],
      [x1, (h - q) * s], [x1 - q * s, h * s], [xc, h * s], [x0, r * s]], xc];

// Length of the fin from root to tip once its corners are fitted to the lattice
function grid_fin_length() = fin_shape(0)[0][3][0];

// The fin's depth from its top face to its lower one, thickened to at least min_t as grid_fin() does
function grid_fin_depth(min_t = 0) = max(fin_depth, min_t);

// Width of the fin across, for laying fins out side by side
function grid_fin_width() = fin_width;

// The two families of diagonal lattice lines through the node at (xc, 0), as 2D strips w wide,
// every step-th line of each family
module fin_lines_2d(xc, n, w, step = 1) translate([xc, 0]) rotate(45) for (i = [-floor(n / step) * step : step : n]) {
    translate([i * fin_s * sqrt(2), 0]) square([w, 2 * n * fin_s * sqrt(2)], center = true);
    translate([0, i * fin_s * sqrt(2)]) square([2 * n * fin_s * sqrt(2), w], center = true);
}

// The triangular attachment area at the root: from the ends of the root edge to the middle of the
// cross plate
function fin_root_triangle(corners, xc) = [corners[0], [xc, 0], corners[len(corners) - 1]];

// The whole fin seen from above: the lattice, the plates round its edge, the cross plate and the
// root triangle, with lattice plates bar thick and edge plates edge thick, and every step-th lattice
// plate. With open = false it is the solid area the fin covers.
module fin_2d(corners, xc, n, open, bar = fin_bar, edge = edge_t, step = 1) {
    if (!open) polygon(corners);
    else {
        polygon(fin_root_triangle(corners, xc));
        intersection() {
            polygon(corners);
            fin_lines_2d(xc, n, bar, step);
        }
        difference() {
            polygon(corners);
            offset(delta = -edge) polygon(corners);
        }
        intersection() {
            polygon(corners);
            translate([xc - edge, -fin_width]) square([edge, 2 * fin_width]);
        }
    }
}

// A plate len long in its own plane, depth tall and t thick, with notches cut into its lower edge
// between junctions every d along it, leaving a sharp point at each junction. The notches are
// rounded, or V-shaped with vee = true.
module notched_plate_2d(len, d, t, vee = false, depth = fin_depth) {
    a = (d - t) / 2;
    difference() {
        square([len, depth]);
        for (k = [0 : round(len / d) - 1]) translate([(k + 0.5) * d, 0])
            if (vee) polygon([[-a, -1], [a, -1], [0, notch_depth]]);
            else scale([1, notch_depth / a]) circle(a, $fn = 24);
    }
}

// A notched plate standing on the line from a to b, on its left (the inside of the outline)
module plate_on(a, b, d, t, z0, vee = false, depth = fin_depth) {
    v = b - a;
    translate([a[0], a[1], z0]) rotate([0, 0, atan2(v[1], v[0])]) translate([0, t, 0]) rotate([90, 0, 0])
        linear_extrude(t) notched_plate_2d(norm(v), d, t, vee, depth);
}

// The fin, pointing along +X from its root at x = 0. With lattice = false its outline is solid.
// For small prints, min_t thickens its depth and plates to at least that, in mm, and a step above 1
// keeps only every step-th lattice plate.
module grid_fin(lattice = true, min_t = 0, step = 1) {
    depth = max(fin_depth, min_t);
    bar = max(fin_bar, min_t);
    edge = max(edge_t, min_t);
    shape = fin_shape(0);
    corners = shape[0];
    xc = shape[1];
    z0 = -depth / 2;
    n = ceil(norm([corners[3][0] - xc, fin_width / 2]) / (fin_s * sqrt(2))) + 1;
    if (lattice && $preview) {
        translate([0, 0, z0]) linear_extrude(depth) polygon(fin_root_triangle(corners, xc));
        intersection() {
            translate([0, 0, z0]) linear_extrude(depth) difference() {
                offset(delta = -edge / 2) polygon(corners);
                polygon(fin_root_triangle(corners, xc));
            }
            translate([xc, 0, z0]) rotate([0, 0, 45]) for (i = [-floor(n / step) * step : step : n], turn = [0, 90])
                rotate([0, 0, turn]) translate([-n * fin_s * sqrt(2), i * fin_s * sqrt(2) + bar / 2, 0])
                    rotate([90, 0, 0]) linear_extrude(bar)
                        notched_plate_2d(2 * n * fin_s * sqrt(2), step * fin_s * sqrt(2), bar, depth = depth);
        }
        for (i = [0 : len(corners) - 1]) let(a = corners[i], b = corners[(i + 1) % len(corners)])
            plate_on(a, b, step * (abs(b[0] - a[0]) > 1 && abs(b[1] - a[1]) > 1 ? fin_s * sqrt(2) : 2 * fin_s), edge, z0, depth = depth);
        plate_on([xc, -fin_h * fin_s], [xc, fin_h * fin_s], step * 2 * fin_s, edge, z0, vee = true, depth = depth);
    } else translate([0, 0, z0]) linear_extrude(depth) fin_2d(corners, xc, n, lattice, bar, edge, step);
}

scale(1 / model_scale, $material = material) made_of("grid_fin") grid_fin(fin_lattice, min_feature * model_scale, fin_lattice_step);
