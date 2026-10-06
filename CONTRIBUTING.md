# Contributing

The Starship and Super Heavy models are OpenSCAD files in `model/`, built from the sizes in `dimensions.md`. The PNG renders and STL files made from them go in `renders/`, which git ignores, as it does the reference photos in `source_img/`.

## The model files

| File | What it is | Opened on its own, it shows |
|---|---|---|
| `model/starship.scad` | The ship (upper stage) | The ship |
| `model/super_heavy.scad` | The booster | The booster, with its 33 engines and three grid fins |
| `model/raptor.scad` | The Raptor 3 engines both vehicles use | One sea-level Raptor 3 and one Raptor Vacuum |
| `model/gridfins.scad` | The booster's grid fin | One grid fin |

The vehicles pull in the part files with `use <raptor.scad>` and `use <gridfins.scad>`, so a change to `raptor.scad` changes the engines on both vehicles, and a change to `gridfins.scad` changes the booster's fins.

## Every .scad file must open in OpenSCAD

Each file in `model/` has to open in OpenSCAD 2021.01, the version the models are built and checked with (Ubuntu's `openscad` package), and preview and render there without errors or warnings. To keep it that way:

- Use only what OpenSCAD 2021.01 supports, not features from newer development snapshots.
- Pull a part file in with `use`, never `include`. `use` brings in a file's modules and functions but not its top-level geometry, so the call that draws the part when its file is opened alone stays out of the vehicle.
- Keep every part file drawing its part when it is opened on its own, so it can be checked by itself.
- Put the settings someone might want to change at the top of the file, in the Customizer sections the files already use: `[Print]` for print settings, `[From dimensions.md]` for values taken from dimensions.md (comments mark the estimated ones), `[Estimates]` for guesses, and `[Hidden]` for derived values and tables. Everything but `[Hidden]` then shows up in OpenSCAD's Customizer panel.
- Model in full-size millimetres with Z up. The comment at the top of each file says where z = 0 is; the ship stacks on the booster at z = 72300.
- Detail that makes the STL export slow can be drawn only in previews, inside `if ($preview)`, as the grid fins' notched plate edges are. It then shows in previews and PNGs but not in the STL.

### Opening a model

Open a file from OpenSCAD's File menu, or from a terminal:

```bash
openscad model/starship.scad
```

- F5 (Design → Preview) draws the model quickly, in colour.
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

`-D name=value` overrides a setting from the top of the file, the same settings the Customizer shows. `model_scale=300` prints at 1:300, which makes the booster 243 mm tall and the ship 174 mm tall. Below about 1:100 the 40 mm nozzle walls and the grid fins' lattice are too thin to print, so `nozzle_wall=0` makes the nozzles solid and `fin_lattice=false` makes the fins solid (only `super_heavy.scad` and `gridfins.scad` have that one). Add `--export-format binstl` for a binary STL, a quarter to a third the size of the default ASCII one.

### From the OpenSCAD window

- STL: press F6 to render, then use File → Export → Export as STL. For a print-size STL, set `model_scale`, `nozzle_wall` and `fin_lattice` in the Customizer first.
- PNG: File → Export → Export as Image saves the 3D view as it is on screen.

### PNGs need a display

OpenSCAD draws PNGs with OpenGL, so it needs a display even from the command line. Over SSH, put `DISPLAY=:0` in front of the command or the render script to borrow the desktop's display, which works when you're logged in to that desktop as the same user. Without a display, OpenSCAD prints "Unable to open a connection to the X server" and leaves an empty PNG.
