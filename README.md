# Starship + Super Heavy Model

A model of SpaceX's Starship and its Super Heavy booster, in their V3 versions, that can be 3-D printed. The models are OpenSCAD files at full size, built from the dimensions collected in [dimensions.md](dimensions.md).

This work is not affiliated with or endorsed by SpaceX.

## What's in the repo

| Path | What it holds |
|---|---|
| `model/starship.scad` | The ship (upper stage): the hull and nosecone, the forward and aft flaps with their hinges, the payload bay door, the docking ports and quick disconnect plate, the two catch pins on the nose, six Raptor engines, and fine details: the Starlink dishes, thrusters, vents and ports, and the heat shield's raised, bevelled edge |
| `model/super_heavy.scad` | The booster: the hull and chines, the aft skirt and thrust plate, 33 Raptor engines, three grid fins (the two catch fins with their lifting pins), the hot-staging truss the ship sits on, and fine details: the band of vent slats and its bell vents, the ports, the QD plates and the pipe down the rudder side |
| `model/raptor.scad` | The Raptor 3 and Raptor 3 Vacuum engines, which both vehicles use |
| `model/gridfins.scad` | The booster's grid fin |
| `model/materials.scad` | The materials the parts are made of (stainless steel, heat-shield tiles, the engines' metals and so on), with the colours previews draw them in |
| `model/details.scad` | Small parts both vehicles carry, such as ports, windows and bands of vent slats |
| `model/super_heavy.json`, `model/starship.json` | Print presets for the two vehicles: "1:460 print" in one piece each, and "1:230 print" in sections that pin together, with loose forward flaps. Each is a set of saved settings that scale a model and simplify it for printing |
| `dimensions.md` | The sizes the models are built from: the full stack, each vehicle in detail and the Raptor engines, plus earlier versions, what SpaceX hasn't published, and the sources. The detailed sections tag each figure as published, reported or estimated from photos. |
| `source_analysis.md` | The photos the estimated sizes were measured from: a link to each original, what was measured or counted in it and how, and which model settings use the result |
| `scripts/render_openscad.sh` | Renders a `.scad` file from three angles, exports an STL and makes a summary sheet |
| `scripts/render_freecad.sh`, `scripts/render_freecad.py` | The same for a FreeCAD document |
| `scripts/make_sheet.py` | Lays out the summary sheet for both render scripts, with the STL's size and volume |
| `scripts/export_print.sh` | Exports print STLs of both vehicles from one of their presets |
| `scripts/render_blender.sh`, `scripts/render_blender.py` | Renders models realistically in Blender, giving each material its own surface, and saves the scene |
| `scripts/print_check.py` | Checks an STL layer by layer for what needs support and what is too thin to print |
| `CONTRIBUTING.md` | How to open the models in OpenSCAD and make PNGs and STLs, how the print presets and settings work, and how the materials and realistic renders work |

Git ignores two more folders: `renders/`, where the render scripts write their PNGs, STLs and sheets, and `source_img/`, local copies of the reference photos used to measure the estimated dimensions. `source_analysis.md` links to each photo online.

## Quick start

Open any file in `model/` in OpenSCAD. To render the ship to PNGs and an STL in `renders/starship/`:

```bash
EDGES=0 scripts/render_openscad.sh model/starship.scad
```

The models are full size in millimetres and true to the real vehicles. Their `[Print]` settings scale them down and simplify them for printing, and a preset saves those settings for one size. To export both vehicles at 1:460, sized for a printer 165 mm tall:

```bash
scripts/export_print.sh "1:460 print"
```

For realistic renders, with stainless steel and black heat-shield tiles, install [Blender](https://www.blender.org/) and run:

```bash
scripts/render_blender.sh model/starship.scad
```

[CONTRIBUTING.md](CONTRIBUTING.md) has the details.
