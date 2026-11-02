# Contributing

The Starship and Super Heavy models are OpenSCAD files in `model/`, built from the sizes in `dimensions.md`. The PNG renders and STL files made from them go in `renders/`, which git ignores, as it does the reference photos in `source_img/`.

## The model files

| File | What it is | Opened on its own, it shows |
|---|---|---|
| `model/starship.scad` | The ship (upper stage) | The ship |
| `model/super_heavy.scad` | The booster | The booster, with its 33 engines and three grid fins |
| `model/raptor.scad` | The Raptor 3 engines both vehicles use | One sea-level Raptor 3 and one Raptor Vacuum |
| `model/gridfins.scad` | The booster's grid fin | One grid fin |
| `model/materials.scad` | The materials the parts are made of, and the colours previews draw them in | A ball of each material, with its name |
| `model/details.scad` | Small parts both vehicles carry: round ports and windows, bands of vent slats, rods, bell-shaped vents and tile-covered boxes | One of each |

The vehicles pull in the part files with `use <raptor.scad>`, `use <gridfins.scad>` and `use <details.scad>`, so a change to `raptor.scad` changes the engines on both vehicles, a change to `gridfins.scad` changes the booster's fins, and a change to `details.scad` changes the small parts on both. Every file pulls in `materials.scad`; see [Materials and realistic renders](#materials-and-realistic-renders).

## Every .scad file must open in OpenSCAD

Each file in `model/` has to open in OpenSCAD 2021.01, the version the models are built and checked with (Ubuntu's `openscad` package), and preview and render there without errors or warnings. To keep it that way:

- Use only what OpenSCAD 2021.01 supports, not features from newer development snapshots.
- Pull a part file in with `use`, never `include`. `use` brings in a file's modules and functions but not its top-level geometry, so the call that draws the part when its file is opened alone stays out of the vehicle.
- Keep every part file drawing its part when it is opened on its own, so it can be checked by itself.
- Put the settings someone might want to change at the top of the file, in the Customizer sections the files already use: `[Print]` for print settings, `[Materials]` for the `material` setting, `[From dimensions.md]` for values taken from dimensions.md (comments mark the estimated ones), `[Estimates]` for guesses, and `[Hidden]` for derived values and tables. Everything but `[Hidden]` then shows up in OpenSCAD's Customizer panel.
- Draw every solid part inside `made_of("steel")`, or another of the materials in `materials.scad`, rather than `color()`. Leave parts that are cut away with `difference()` outside it, so they cut every material. A new material goes in the table in `materials.scad` and in the list on the `material` setting of each file that uses it, which is where the render script looks for a model's materials.
- Model in full-size millimetres with Z up. The comment at the top of each file says where z = 0 is; the ship stacks on the booster at z = 72300.
- Detail that makes the STL export slow can be drawn only in previews, inside `if ($preview)`, as the grid fins' notched plate edges are. It then shows in previews and PNGs but not in the STL.
- Anything that changes a model to make it easier to print is a `[Print]` setting whose default leaves the model true to size, so the full-size model never changes. See [Printing](#printing).

### Opening a model

Open a file from OpenSCAD's File menu, or from a terminal:

```bash
openscad model/starship.scad
```

- F5 (Design → Preview) draws the model quickly, each part in its material's colour.
- F6 (Design → Render) works out the exact geometry an STL will have. That takes a minute or more for the vehicles, and shows the result in one colour.
- Left-drag rotates the view, right-drag pans, and the scroll wheel zooms. View → View All fits the whole model in the window.
- Window → Customizer lists the settings from the top of the file with their comments (untick Window → Hide Customizer if the panel isn't showing). Changing one re-previews the model without editing the file.
- Design → Automatic Reload and Preview re-previews the model whenever its file changes on disk, which helps while the file is being edited somewhere else.

## Making PNGs and STLs

### With the render script

```bash
EDGES=0 scripts/render_openscad.sh model/starship.scad
```

That writes five files into `renders/starship/`:

- `starship_isometric.png`, `starship_front_right_low.png` and `starship_back_left_high.png`, three 1000 × 800 orthographic previews
- `starship.stl`, the STL
- `starship_sheet.png`, the three views on one sheet with the STL's size, volume and triangle count

The same command works for any file in `model/`, and the folder is named after the file. A second argument puts the files somewhere else: `scripts/render_openscad.sh model/raptor.scad /tmp/raptor`. `EDGES=0` turns off the outlines the script draws round every facet, which would stripe the curved hulls of the ship and booster.

The PNGs are previews, so they show the models' colours and preview-only detail, and they take seconds. The STL is a full render at the scale set in the file, which is full size unless `model_scale` has been changed there. It is the slow part, because OpenSCAD 2021.01 renders on a single core: it takes about 30 seconds for `raptor.scad`, a minute or two for the ship and several minutes for the booster. The booster's export also uses more than 2 GB of memory, so run exports one at a time; running several together can run the machine out of memory.

### With OpenSCAD's command line

To make a single view, or an STL at print size, run `openscad` yourself. It doesn't create the output folder, so make that first.

A PNG from one direction:

```bash
mkdir -p renders/starship
openscad -o renders/starship/starship_view.png --imgsize=1000,800 --projection=ortho --colorscheme=Tomorrow --viewall --autocenter --camera=1,-1,1,0,0,0 model/starship.scad
```

`--camera=1,-1,1,0,0,0` looks from the point (1, -1, 1) toward the origin. With `--viewall` and `--autocenter`, OpenSCAD fits the whole model in the image, so only the direction matters; the script's other two views look from 2,-1,0.6 and -1,1.5,2. Leave out `--projection=ortho` for a perspective view, and add `--render` to draw the exact STL geometry instead of the preview (slowly, and in one colour).

An STL at print size:

```bash
mkdir -p renders/super_heavy
openscad -D model_scale=300 -D nozzle_wall=0 -D fin_lattice=false -o renders/super_heavy/super_heavy_1-300.stl model/super_heavy.scad
```

`-D name=value` overrides a setting from the top of the file, the same settings the Customizer shows. `model_scale=300` prints at 1:300, which makes the booster 243 mm tall and the ship 174 mm tall. Below about 1:100 the 40 mm nozzle walls and the grid fins' lattice are too thin to print, so `nozzle_wall=0` makes the nozzles solid and `fin_lattice=false` makes the fins solid (only `super_heavy.scad` and `gridfins.scad` have that one). Add `--export-format binstl` for a binary STL, a quarter to a third the size of the default ASCII one. For a real print, start from a saved preset instead, as [Printing](#printing) describes.

### From the OpenSCAD window

- STL: press F6 to render, then use File → Export → Export as STL. For a print-size STL, pick a print preset at the top of the Customizer first, or set `model_scale`, `nozzle_wall` and `fin_lattice` there yourself.
- PNG: File → Export → Export as Image saves the 3D view as it is on screen.

### PNGs need a display

OpenSCAD draws PNGs with OpenGL, so it needs a display even from the command line. Over SSH, put `DISPLAY=:0` in front of the command or the render script to borrow the desktop's display, which works when you're logged in to that desktop as the same user. Without a display, OpenSCAD prints "Unable to open a connection to the X server" and leaves an empty PNG.

## Materials and realistic renders

OpenSCAD has no materials, only flat colours, and those show only in previews: a full render (F6) and an STL come out in one colour. So the models name what each part is made of, and a script turns those names into realistic surfaces in [Blender](https://www.blender.org/), the free 3D renderer.

### The materials

`model/materials.scad` lists them, with the colour each is drawn in by previews. The previews have no shine, so the dark materials are drawn lighter than they are, to keep their shapes readable.

| Material | What it is |
|---|---|
| `steel` | Bare stainless steel: the hulls, chines, raceways, truss and fittings |
| `tiles` | The ship's black hexagonal heat-shield tiles |
| `black` | Black-coated parts: the booster's aft skirt, its conduits and engine housings, the gimbal blocks, the truss's brackets and the ship's drogue cones |
| `aft_shield` | The heat shield under the booster's thrust plate, and the ship's engine bay |
| `dome` | The booster's forward dome inside the truss, a duller steel than the hull |
| `grid_fin` | The booster's grid fins: dark, heat-stained steel |
| `bronze` | The grid fins' bearings |
| `nozzle` | Raptor nozzles: dark satin metal |
| `engine` | Raptor chambers, powerheads and plumbing |
| `nozzle_extension` | The Raptor Vacuum's lighter nozzle extension |

Each file has a `material` setting, in the `[Materials]` section of the Customizer. "all", the default, draws the whole model, as for printing. Any other choice draws only the parts made of that material, in a preview or an export, which is how each material becomes a mesh of its own:

```bash
openscad -D 'material="tiles"' --export-format binstl -o renders/starship/starship_tiles.stl model/starship.scad
```

To see the shapes of dark parts in a preview, recolour them on the command line with `$colours`, a list of materials and colours, for example `-D '$colours=[["tiles", [0.62, 0.63, 0.68]]]'`.

### Rendering in Blender

```bash
scripts/render_blender.sh model/starship.scad
```

That exports the ship once per material, as binary STLs in `renders/starship/materials/`, then has Blender build a scene: each mesh gets a realistic surface, lit by a clear sky and the sun over flat ground, and the steel mirrors one of the photographed skies that come with Blender, as the real hull mirrors its surroundings. It writes into `renders/starship/blender/`:

- a PNG from each of several views: for the ship `leeward.png` and `windward.png` (the whole ship, as a photographer on the ground sees it), `nose.png` and `aft.png` (the engines from below); for the booster `tower_side.png`, `rudder_side.png`, `engines.png` and `truss_and_fins.png`; for the stack `stack.png`, `stack_windward.png` and `hot_staging.png`
- `starship.blend`, the scene, to open in Blender and render from any angle
- `starship.glb`, the model with each material's colour, shine and roughness, for other 3D viewers and programs. The tiles' hexagon pattern and the steel's weld seams are drawn by Blender as the image renders, so they aren't in it.

Several models go in one scene, each raised by the height after `@`, in mm. This stacks the ship on the booster and writes into `renders/super_heavy_and_starship/`:

```bash
scripts/render_blender.sh model/super_heavy.scad model/starship.scad@72300
```

- The script needs Blender 4.0 or later. On Ubuntu, `sudo snap install blender --classic` installs the latest.
- The meshes are exported with `$preview` set to true, so they keep the preview-only detail, such as the grid fins' teeth. They are exported again only when a file in `model/` has changed since. The exports run one at a time: about a minute for the ship and seven for the booster, which needs up to 2 GB of memory.
- Blender renders on the processor, leaving one core free: about a minute a view, so four or five minutes for each vehicle. Environment variables change that: `VIEWS=nose,aft` renders only those views, `SAMPLES=32` renders faster but grainier (the default is 128), and `SCALE=50` renders at half size. `BLENDER` names the blender command, if it isn't `blender`.
- The looks are in `scripts/render_blender.py`, matched to photos of the V3 vehicles: mirror-bright steel, which reflects the sky above and the ground below, with a slightly different shade on each ring and darker weld seams between rings; black hexagonal tiles about 0.25 m across, with points at top and bottom and a light pin near each one's top corner; and the booster's black skirt, charcoal engines and dark grid fins. The ring seams are about 1.83 m apart on the ship and 1.86 m on the booster, as dimensions.md has them.

## Printing

The models are true to the real vehicles by default. Everything that makes them easier to print is a setting in the `[Print]` section of each file, off unless it is turned on, and each print size is a saved preset of those settings. Nothing about printing needs a copy of a model.

### Print presets

Next to each vehicle is a file of OpenSCAD Customizer presets (parameter sets): `model/super_heavy.json` and `model/starship.json`. Both are for a printer 165 mm tall such as the MakerBot Replicator+:

- "1:460 print" prints each vehicle in one piece: the booster 158 mm tall, standing upside down on its truss, and the ship 113 mm with its engine bay filled.
- "1:230 print", twice the size, cuts the booster into three sections and the ship into two, which pin together. The booster's are 159, 127 and 31 mm tall; the top one is cut at the grid fins' lower face, so it prints with the fins lying flat on the bed, still attached and with no supports. The ship's are 111 and 115 mm, and its lowest section keeps its engines. The ship's forward flaps print flat as loose parts and plug into slots.

- In the OpenSCAD window, pick a preset from the list at the top of the Customizer panel. "design default values" goes back to the full-size model.
- To export both vehicles' STLs from a preset, one after the other:

  ```bash
  scripts/export_print.sh "1:460 print"
  ```

  That writes binary STLs, `super_heavy_1_460_print.stl` and `starship_1_460_print.stl`, into `renders/print/1_460_print/`. A second argument puts them somewhere else. For a preset with sections it writes one STL per section, numbered from the bottom (`super_heavy_1_230_print_section1.stl` and so on), each turned to stand ready to print, and `..._loose.stl` with any loose parts laid flat.
- For a single file from the command line, `-p` names the preset file and `-P` the preset. `-D` can set anything the preset leaves out, such as which section to draw:

  ```bash
  openscad -p model/starship.json -P "1:460 print" --export-format binstl -o starship_1-460.stl model/starship.scad
  openscad -p model/starship.json -P "1:230 print" -D section=2 --export-format binstl -o starship_1-230_s2.stl model/starship.scad
  ```

  A preset's own values win over `-D`, so to change one of them, copy the preset instead.

To add a preset for another size, set the values in the Customizer and save them as a new preset with the + button beside the list, or copy the "1:460 print" block in a .json file and change its values. Give it the same name in both vehicles' files, so `export_print.sh` finds it in each.

### The print settings

| Setting | In | What it does |
|---|---|---|
| `model_scale` | every file | Prints at 1:`model_scale`. |
| `nozzle_wall` | all but `gridfins.scad` | The engine nozzles' wall thickness, in full-size mm, thickened to `min_feature` on the vehicles. 0 makes the nozzles solid. |
| `fin_lattice` | `super_heavy.scad`, `gridfins.scad` | Off fills the grid fins' outline solid. |
| `fin_lattice_step` | `super_heavy.scad`, `gridfins.scad` | Draws only every this-many plates of the fins' lattice each way, so a coarser lattice keeps its holes open at small sizes. 1 is the real lattice; at 1:460, 3 leaves holes about 1 mm across. |
| `engine_detail` | all but `gridfins.scad` | Full, or Simple: each engine as one turned shape, bulked out round its chamber and powerhead to stand in for the plumbing, valves and rings, and without the steering actuators. Simple engines also make the booster's export more than twice as fast. |
| `min_feature` | every file | The thinnest part allowed on the print, in mm at print size. The flaps, the truss's struts and ring, the grid fins and their necks, the engines' necks and the ship's skirt wall are thickened to at least this, each only as much as that scale needs. 0 keeps them true to size. |
| `truss_pairs` | `super_heavy.scad` | How many inverted-V pairs of struts hold up the truss's ring. The real truss has 20. |
| `truss_fill` | `super_heavy.scad` | What fills the truss. Open is the real truss, with the methane tank's dome inside. For printing the booster upside down standing on its truss, Tall dome raises the dome to a flat top level with the ring, with the struts still open round it, and Solid core fills the truss, with the struts standing out from it as ribs. |
| `tall_dome_top` | `super_heavy.scad` | The tall dome's flat top, as a fraction of the hull's radius. Below about 0.4 its sides get too shallow to print upside down without support. |
| `print_upside_down` | `super_heavy.scad` | Turns the booster over, with the top of its truss on z = 0. |
| `fill_engine_bay` | `starship.scad` | Fills the engine bay up to its roof, so the ship stands on a flat base. The engines are left out, since they would be inside the fill. |
| `pin_d`, `pin_depth` | `super_heavy.scad`, `starship.scad` | Holes for pins, in mm at print size: their diameter (0 for none) and how deep each goes. One on the axis stacks the ship on the booster: down into the top of the booster's truss (into the dome's top when the truss is open) and up into the ship's base (into the engine bay's roof when the bay is open). Two more at every section cut line the sections up, at different radii so they only go together one way round. A 2 mm hole fits a piece of 1.75 mm filament. |
| `catch_pins` | `super_heavy.scad`, `starship.scad` | Draws the hardware the tower's chopsticks lift and catch the vehicles by: the lifting pins under the booster's two catch fins and the two catch pins on the ship's nose. Off leaves them out. They are under a millimetre at 1:460, so the 1:460 preset turns them off. |
| `fine_details` | `super_heavy.scad`, `starship.scad` | Draws the fine details. On the ship: the flaps' hinges, the thruster outlets on the aft flaps and the pipes that feed them, the Starlink dishes, the roll thrusters, the bands of vent slats, the ringed ports, the window between the drogues, the attic vent hoods, the drogues' bolts, and the heat shield's thickness with its bevelled edge. On the booster: the band of vent slats and the bell vents under it, the round ports, the plates behind the ports over the fins, the QD plates and the pipe down the rudder side. Off leaves them out. None is more than a few millimetres at 1:460, so both presets turn them off. |
| `section_z`, `section` | `super_heavy.scad`, `starship.scad` | `section_z` lists heights to cut the vehicle into sections at, in full-size mm in that file's frame; empty keeps it whole. `section` picks what to draw: 0 the whole vehicle, 1 and up one section, standing on a flat cut face for printing (the lowest section upside down, so the engines print upward, and the others upright), and -1 the loose parts laid flat. Presets leave `section` out, so the export script can step through the sections. |
| `loose_fins` | `super_heavy.scad` | Leaves the grid fins off the hull, each with a tab on its root that plugs into a slot in its bearing, so they print flat as loose parts with no supports. |
| `loose_flaps` | `starship.scad` | Leaves the forward flaps off the nose, each with a tab along its root that plugs into a slot along its hinge, so they print flat as loose parts. The two flaps are mirror images, so the loose STL has two copies of one, which is the same either way up. |
| `tab_depth`, `fit_clearance` | `super_heavy.scad`, `starship.scad` | How far the loose parts' tabs reach into the hull, and the gap round each tab in its slot, in mm at print size. |

### Choosing settings for a size

- The largest scale that stands up on a printer is the booster's height, 72.8 m from its lowest nozzle to the top of its truss, divided by the printer's build height less a few millimetres for the raft.
- Below about 1:100, set `nozzle_wall` to 0 and `fin_lattice` off: the 40 mm walls and the lattice's plates are thinner than a 0.4 mm nozzle.
- A `min_feature` of twice the nozzle's width keeps thin parts at least two lines thick; the 1:460 preset uses 1 mm.
- At small sizes the booster prints best upside down, standing on its truss with a tall dome or solid core inside. Its engines then grow upward like cones and need no support, and its grid fins sit just above the bed. The grid fins and the ship's forward flaps still overhang, so turn on the slicer's supports for them.
- For bigger prints, cut the vehicles into sections no taller than the printer, at seams where little crosses the cut: the 1:230 preset cuts the booster at 36 m, just below its raceway, and the ship at 25.62 m, a ring seam. The lowest section prints upside down, which also lets the ship keep its engines: they grow upward from the bay's roof.
- A cut at the grid fins' lower face (65.1 m while the fins keep their real 0.5 m depth) puts the fins flat on the bed in the section above it, so they print attached with no supports. Loose fins and flaps also print flat, with no supports to break off.

### Checking a print STL

`scripts/print_check.py` slices an STL into layers the way a slicer does and reports what touches the bed, where supports are needed, and what is thinner than one or two nozzle widths. It also draws side views with those places coloured in. It needs only Python 3 and PIL:

```bash
python3 scripts/print_check.py renders/print/1_460_print/super_heavy_1_460_print.stl renders/print/1_460_print/super_heavy_check
```

That writes `super_heavy_check.json`, `super_heavy_check_side_x.png` and `super_heavy_check_side_y.png`. `--width` sets the nozzle width (0.4 mm), `--layer` the layer height (0.2 mm), `--overhang` the steepest overhang that prints without support (50° from vertical), and `--flip` checks the model upside down. It is an approximation; the slicer's own preview has the final word.
