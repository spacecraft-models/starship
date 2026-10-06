# Starship + Super Heavy Model

A model of SpaceX's Starship and its Super Heavy booster, in their V3 versions, that can be 3-D printed. The models are OpenSCAD files at full size, built from the dimensions collected in [dimensions.md](dimensions.md).

## What's in the repo

| Path | What it holds |
|---|---|
| `model/starship.scad` | The ship (upper stage): the hull and nosecone, the forward and aft flaps, the payload bay door, the docking ports and quick disconnect plate, and six Raptor engines |
| `model/super_heavy.scad` | The booster: the hull and chines, the aft skirt and thrust plate, 33 Raptor engines, three grid fins and the hot-staging truss the ship sits on |
| `model/raptor.scad` | The Raptor 3 and Raptor 3 Vacuum engines, which both vehicles use |
| `model/gridfins.scad` | The booster's grid fin |
| `dimensions.md` | The sizes the models are built from: the full stack, each vehicle in detail and the Raptor engines, plus earlier versions, what SpaceX hasn't published, and the sources. The detailed sections tag each figure as published, reported or estimated from photos. |
| `scripts/render_openscad.sh` | Renders a `.scad` file from three angles, exports an STL and makes a summary sheet |
| `scripts/render_freecad.sh`, `scripts/render_freecad.py` | The same for a FreeCAD document |
| `scripts/make_sheet.py` | Lays out the summary sheet for both render scripts, with the STL's size and volume |
| `CONTRIBUTING.md` | How to open the models in OpenSCAD and make PNGs and STLs, including STLs at print size |

Git ignores two more folders: `renders/`, where the render scripts write their PNGs, STLs and sheets, and `source_img/`, reference photos used to measure the estimated dimensions. `dimensions.md` lists where each photo came from.

## Quick start

Open any file in `model/` in OpenSCAD. To render the ship to PNGs and an STL in `renders/starship/`:

```bash
EDGES=0 scripts/render_openscad.sh model/starship.scad
```

The models are full size in millimetres. Each one's `model_scale` setting scales it down for printing: at 1:300 the booster is 243 mm tall and the ship 174 mm. [CONTRIBUTING.md](CONTRIBUTING.md) has the details.
