// The materials the vehicles are made of, for the other model files to pull in with
// use <materials.scad>. Rendered on its own, this file shows a ball of each material in its preview
// colour, with its name.
// OpenSCAD has no materials, only flat colours, which show in previews but not in a full render or
// an STL. So every part of a model is drawn inside made_of("name"), which colours it for previews,
// and each model file has a `material` setting that draws only the parts made of one material.
// scripts/render_blender.sh uses that to export each material as its own mesh, and gives each one a
// realistic surface in Blender, looked up by the names below.

/* [Materials] */
// Draws only the parts made of one material. "all" draws the whole model.
material = "all"; // [all, steel, tiles, black, aft_shield, dome, grid_fin, bronze, nozzle, engine, nozzle_extension]

/* [Hidden] */
// Each material's name, its colour in previews and what it is. Previews have no shine, so the dark
// materials are drawn lighter than they are, to keep their shapes readable.
function materials() = [
    ["steel", [0.78, 0.79, 0.81], "Bare stainless steel: the hulls, chines, raceways, truss and fittings"],
    ["tiles", [0.2, 0.2, 0.22], "The ship's black hexagonal heat-shield tiles"],
    ["black", [0.22, 0.22, 0.24], "Black-coated parts: the booster's aft skirt, its conduits and engine housings, the gimbal blocks, the truss's brackets and the ship's drogue cones"],
    ["aft_shield", [0.42, 0.42, 0.44], "The heat shield under the booster's thrust plate, and the ship's engine bay"],
    ["dome", [0.7, 0.68, 0.63], "The booster's forward dome inside the truss, a duller steel than the hull"],
    ["grid_fin", [0.5, 0.5, 0.52], "The booster's grid fins: dark, heat-stained steel"],
    ["bronze", [0.45, 0.38, 0.28], "The grid fins' bearings"],
    ["nozzle", [0.32, 0.31, 0.3], "Raptor nozzles: dark satin metal"],
    ["engine", [0.46, 0.46, 0.48], "Raptor chambers, powerheads and plumbing"],
    ["nozzle_extension", [0.72, 0.72, 0.74], "The Raptor Vacuum's lighter nozzle extension"]];

// A material's preview colour. Previews can recolour materials without editing this file through
// $colours, a list of [name, colour] pairs: -D '$colours=[["tiles", [0.62, 0.63, 0.68]]]' on
// OpenSCAD's command line draws the tiles light grey, which shows the shapes of the dark parts.
function material_colour(name) = let(
    found = [for (m = materials()) if (m[0] == name) m[1]],
    override = is_undef($colours) ? [] : [for (c = $colours) if (c[0] == name) c[1]])
    assert(len(found) == 1, str("made_of(): unknown material \"", name, "\""))
    len(override) > 0 ? override[0] : found[0];

// The material being drawn: "all" for the whole model, or the one material the model's `material`
// setting picks. The model files pass the setting down to every part as $material.
function drawing_material() = is_undef($material) ? "all" : $material;

// Draws its children, which are made of material `name`, in that material's preview colour, or
// nothing when another material is being drawn on its own. Only solid parts go inside it: anything
// cut away with difference() stays outside, so it is cut from every material.
module made_of(name) {
    colour = material_colour(name);
    m = drawing_material();
    if (m == "all" || m == name) color(colour) children();
}

// A ball of each material, with its name standing below it facing -Y
for (i = [0 : len(materials()) - 1]) let(name = materials()[i][0])
    translate([1800 * i, 0, 0]) made_of(name, $material = material) {
        sphere(500, $fn = 48);
        translate([0, 0, -800]) rotate([90, 0, 0]) linear_extrude(20) text(name, size = 140, halign = "center");
    }
