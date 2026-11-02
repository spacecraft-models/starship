# Source analysis

Every **Estimated** figure in [dimensions.md](dimensions.md) was measured or counted in a photo. This file lists those photos, one section each: where to find the photo, what it shows, and what was taken from it and how. The aim is that anyone can check a figure, or measure it again and get the same answer.

The photos belong to their photographers and publishers, so they aren't in this repo. Each section links to the original. "Saved as" is the photo's name in a local `source_img/` folder, which git ignores; saving a copy under that name keeps it in step with these notes.

## How the figures were taken

- **Scale.** Each length is scaled from something of known size in the same photo: the 9 m hull diameter (between the hull's outer edges), the 1.3 m nozzle exit of a sea-level Raptor, the hexagonal heat-shield tiles (about 0.25 m across), or a part measured in another photo. Counts, such as engines, struts, hinges and lattice cells, need no scale.
- **Pixels.** A pixel figure belongs to the copy whose size is given with it, and scales with the copy. NASASpaceFlight's files ending in `-scaled` are 2,560 px on their long side. Taking `-scaled` out of the address gives the camera original, often 6,000 to 9,500 px across, which is better for small parts.
- **Frames.** Heights (z) and azimuths are in dimensions.md's frames; see "Reference frame" under "Super Heavy V3 in detail" and under "Starship V3 in detail". Engine heights (h) are measured up from the nozzle exit.
- **Azimuths.** A part's azimuth comes from where it sits across the hull's width: its offset from the hull's centreline, divided by the hull's radius, is the sine of the angle between the part and the camera's direction. The camera's direction is fitted from parts whose azimuths are known, such as the grid fins, the truss brackets, the chines and the flaps.
- **Perspective.** Most photos look up at the vehicle from the ground. A ring seen from below shows as an ellipse whose half-height divided by its half-width is about the sine of the viewing angle, and a part on the near side of the hull looks higher than a part at the same height on its outline. Corrections for this have gone wrong more than once, so the best check is to render the model from the photo's viewing angle with OpenSCAD's orthographic camera and compare the two at the same scale.
- **Accuracy.** The ± figures in dimensions.md come mostly from the scale, since a hull's edges blur over a pixel or two, and from the viewing angle. Blur widens every outline, so a small part is measured against its own blurred width in the same photo, not against its true size.
- **Checked again.** For this file, the scale of every saved photo was measured again on the copy named, and the figures whose derivation dimensions.md doesn't give were re-measured. Where a new reading differs from dimensions.md by more than about 5%, the section says so, and [Differences](#differences) at the end gathers them. No figure in dimensions.md or the models was changed.

## Super Heavy

### Whole booster

#### Pad 2 side view

- **Photo:** [COLLEEN-DSC09751-wmarked-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/COLLEEN-DSC09751-wmarked-scaled.jpg), 2560 × 1441, by Colleen Liedtke for NASASpaceFlight, May 2026, in [Super Heavy Block 3 the Booster of the Future](https://www.nasaspaceflight.com/2026/05/super-heavy-block-3-booster-future/)
- **Saved as:** not saved; measured online
- **Shows:** a V3 booster on the Pad 2 mount beside the tower, side on, from across the water.
- **Scale:** the 9 m hull, about 105 px across. The truss ring's ellipse shows the camera looking up about 14°. Heights are counted down from the top of the truss at z = 72.3 m.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Grid fin heights | Apparent span of the fins, scaled from the hull and corrected for the 14° view | z ≈ 64.6 to 66.1 m ± 0.5 m; all three fins within 0.3 m of each other | Grid fins; `super_heavy.scad` `fin_z` |
| Grid fin size | Scaled from the hull, allowing for the fins being turned about 18° from the camera | Reaches about 4.2 m ± 0.3 m out from the hull, 1.4 m top to bottom (apparent), 3.2 m round the hull | Grid fins; `gridfins.scad` `fin_length` (4.2 m less the 0.2 m stand-off) |
| Raceway azimuth | Offset across the hull; agrees with the B20 lift photo to about 3° | 178° ± 4° | Raceway and chines; `raceway_az` |
| Taller chine's top | Scaled from the hull; agrees with the B20 lift photo | z ≈ 36.8 m ± 0.6 m | `tall_chine_top` |
| Chine azimuths | Solved together with the B20 lift photo | One taller chine at 160°, one shorter at 301° (± 5°); the other two by symmetry | `tall_chine_az`, `short_chine_az` |
| Forward dome | Height above the tank wall | An earlier 2 m to 3 m, which overcorrected for the 14° view; superseded by the stacked photo | (none) |

#### Booster 20 lifted onto the mount

- **Photo:** [Booster-20-Being-Lifted-onto-the-Mount-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Being-Lifted-onto-the-Mount-scaled.jpg), 2560 × 1439, by Colleen Liedtke for NASASpaceFlight, July 2026, in [Booster 20 completes record duration Static Fire](https://www.nasaspaceflight.com/2026/07/booster-20-record-static-fire/)
- **Saved as:** not saved; measured online
- **Shows:** Booster 20 hanging from the chopsticks above the Pad 2 mount, side on, from a distance.
- **Scale:** the 9 m hull, about 102 px across.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Where the 72.3 m runs from | Truss top to the nozzle exits and to the skirt's bottom edge, scaled from the hull | 72.7 m ± 1.5 m above the exits, but only 69.4 m ± 1.5 m above the skirt, so the published 72.3 m includes the engines | Reference frame; `super_heavy.scad` `height` and its z = 0 |
| Truss struts | Counted | 20 brackets, 20 ring attachment points and 40 struts | Hot-staging truss |
| Ring attachment points | Where they fall across the hull | 9° + 18°·k (± 3°) | Hot-staging truss; the strut layout in `super_heavy.scad` |
| Shorter chine's top | Scaled from the hull | z ≈ 28.8 m ± 0.8 m | `short_chine_top` |
| Outer nozzles' outline | Width of the nozzle cluster against the hull's width | 1.12 to 1.17 times the hull, which fits a 4.4 m engine circle | Engines |
| Black aft section | Top of the dark band | Looked like z ≈ 3.3 m to 5.9 m; superseded by the B19 and B20 close-ups | (none) |

#### Booster 21 and Ship 41 stacked on Pad 2

- **Photo:** [Booster-21-and-Ship-41-Stacked-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/Booster-21-and-Ship-41-Stacked-scaled.jpg), 2560 × 1708, by Max Evans for NASASpaceFlight, September 2026, in [Ship 41 Makes it to Orbit, Booster 21 Nearly Perfect](https://www.nasaspaceflight.com/2026/09/starship-flight-14-orbit/)
- **Saved as:** not saved; measured online
- **Shows:** the whole V3 stack on Pad 2 from a long way off, with the ship's tiled windward side toward the camera. dimensions.md calls it "the stack photo" in the ship's sections.
- **Scale:** the 9 m hull, about 97 px across (10.8 px/m; checked again for this file). The truss ring's ellipse shows the camera looking up only about 6°.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Open truss height | Bracket tops to the top of the truss ring, which shows as a light band about 0.3 m deep under the ship's dark skirt | 3.0 m ± 0.15 m | Hot-staging truss; `truss_open` |
| Forward dome | The dome's outline shows about 1.4 m above the bracket tops. A 1.9 m model dome rendered from the same angle shows the same. | Top 1.9 m ± 0.3 m above the tank wall, about z = 71.2 m | `dome_rise` |
| Catch fin heights | Compared with a model built to the Pad 2 span, drawn from the same angle | About 0.5 m higher: within the ± 0.5 m, so the span stands | Grid fins |
| Ship's height | Skirt edge to nose tip, scaled from the hull and corrected for the camera looking up about 25° | 51.7 m ± 1.7 m, matching the published 52.1 m. See [Differences](#differences): the photo's viewing angle is nearer 6° | Ship's reference frame (a check only) |
| Tile line | The face toward the camera | Tiled all over (the camera faces mostly windward) | Heat shield |
| QD arm | Where the tower's arm meets the ship | z = 3.7 m ± 1 m, which agrees with the QD plate | Quick disconnect |
| Nosecone and forward flaps | Outline | Agree with the 13.7 m ogive and the Starfactory photo's flap figures, within their larger errors | Nosecone; flaps |

#### Booster 21 and Ship 41 in flight on Flight 14

- **Photo:** [DSC05253-wmarked.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/DSC05253-wmarked.jpg), 6266 × 3523, by Ceaser G for NASASpaceFlight, September 2026, in [Ship 41 Makes it to Orbit, Booster 21 Nearly Perfect](https://www.nasaspaceflight.com/2026/09/starship-flight-14-orbit/)
- **Saved as:** not saved; measured online
- **Shows:** the stack climbing on Flight 14, from below and to one side, with all 33 of the booster's exits glowing, its grid fins and a chine. It is the only photo that ties the engine pattern to the fins.
- **Scale:** none needed; the figures are angles and ratios.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Camera direction | The rudder fin's offset across the hull, where the catch fins' tips fall, and the catch fins' heights relative to each other | 27° ± 2° (an earlier 17.5° used a misread centreline) | Engines |
| Engine clocking | Fitting the 33 exits with the camera direction above. A mirror-symmetric pattern gives 26.6°; one lined up with the truss brackets would need 16°, which the fins rule out. | Outer ring at 9° + 18°·k, inner ring at 18° + 36°·k, centre trio at 0°, 108° and 252° (± 3°) | Engines; the engine placement in `super_heavy.scad`, `centre_az` |
| Engine layout | Ellipse fits, as for the liftoff view | Agrees with the liftoff view: inner engines midway between outer ones, centre engines midway between inner ones, inner and centre exits 0.2 m and 0.5 m lower | `inner_exit_z`, `centre_exit_z` |
| Shorter chine's top | Scaled from the hull | z ≈ 28.3 m (the B20 lift photo gives 28.8 m) | Raceway and chines |

### Hot-staging truss and grid fins

#### Truss and grid fin close-up

- **Photo:** [2Q5A8394-wmarked.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8394-wmarked.jpg), 8058 × 5375, and the [2560 × 1708 copy](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8394-wmarked-scaled.jpg), by Max Evans for NASASpaceFlight, May 2026, in [Super Heavy Block 3 the Booster of the Future](https://www.nasaspaceflight.com/2026/05/super-heavy-block-3-booster-future/)
- **Saved as:** `nsf_v3_grid_fins_and_truss_closeup_full.jpg` and `nsf_v3_grid_fins_and_truss_closeup.jpg`
- **Shows:** the top of a V3 booster from between the rudder fin and the 270° catch fin (about 315°), looking up. The truss, its brackets and the dome are at the top. The 270° catch fin is on the left, the rudder fin right of centre, and the far 90° catch fin low on the right. A round port sits above each of the two near fin pods.
- **Scale:** the 9 m hull, 1,324 px across in the 2,560 px copy (147 px/m) and about 4,170 px in the full-size copy (463 px/m). A weld seam's curve shows the camera looking up about 24°.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Truss brackets | Counted, and their positions against the fin pods | 20, at 18°·k; the brackets above the rudder and the near catch fin line up with the pods to within about 1° | Hot-staging truss; the truss in `super_heavy.scad` |
| Strut pairs | Spacing of the two struts at each ring attachment | About 0.4 m (roughly 5°) apart; each inverted V spans about 5° at the top and 18° at the bottom | `strut_pair` |
| Strut lean | Angle from vertical | 8° to 10°, round the hull rather than inward | The truss ring height in `truss_ring_h` |
| Struts and brackets | Scaled from the hull | Struts are tubes 0.2 m to 0.25 m across, pointed at both ends; brackets are dark U-shaped clevises about 0.25 m wide and 0.6 m tall | `strut_d`, `bracket` |
| Forward dome | Where its curve starts | At the seam level with the bracket tops, with no step; steel panels with rows of rivets | Hot-staging truss |
| Ports above the pods | Scaled from the hull | About 0.4 m across with a ring of bolts, about 2 m above the pod's centre | `port_d`, `pod_port_up` |
| Fin bearings | Scaled from the hull, full-size copy | About 1.2 m across with a toothed rim. Checked again: the toothed rim is about 600 px (1.3 m) tall and the bearing ring inside it about 460 px (1.0 m). | `pod_d` |
| Fin stand-off | Gap between the fin's root and the hull | About 0.2 m, with little more than the bearing between them (Tom's correction, from this photo) | `pod_out` |
| Fin depth | The side plate against the 0.4 m spacing of its teeth | About 0.5 m (an earlier 0.8 m was far too thick) | `gridfins.scad` `fin_depth` |
| Toothed face | Which face of the fin is scalloped | The lower face; the top edges are straight | `gridfins.scad` (teeth on the underside) |
| Fin heights | Compared with each other | The rudder and the near catch fin sit at the same height | Grid fins |
| Lifting pin, 270° fin | Full-size copy, against the hull's scale | A short post down from the root triangle, just outboard of the bearing, with a bar at its foot pointing away from the camera, toward the tower side. The rudder fin's root has nothing like it. See [Differences](#differences) for the bar's size. | Catch and lift points; `catch_pin_out`, `catch_pin_reach`, `catch_pin_bar`, `catch_pin_drop` |
| Zigzag strip | Offset across the hull, and width | About 318° ± 2°, about 0.15 m wide, from the top of the tank wall to at least z ≈ 58 m (the bottom of the frame) | Lines down the side (not modelled) |
| Dark patches by the pods | Looked at closely | Flat stains or reflections, not hardware | (none) |

#### First V3 grid fin, hanging from a crane

- **Photo:** [2nd-Gen-Super-Heavy-Grid-Fin-Design.jpg](https://www.teslaoracle.com/wp-content/uploads/2025/08/2nd-Gen-Super-Heavy-Grid-Fin-Design.jpg), 1920 × 1080, SpaceX's photo and render as copied by [Tesla Oracle, August 2025](https://www.teslaoracle.com/2025/08/16/spacex-reveals-grid-fins-of-the-next-gen-starship-super-heavy-booster/); SpaceX first posted the fin [on X](https://x.com/SpaceX/status/1955715300256616451)
- **Saved as:** `spacex_v3_grid_fin_hanging_and_render.jpg`
- **Shows:** the first V3 grid fin hanging in front of its build fixture with its flat face toward the camera, beside a SpaceX render of a V3 booster with one fin circled.
- **Scale:** none needed; the photo gives the fin's shape.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Edge plates | Looked at | Solid plates along both sides, carrying on round the cut-off outer corners and the outer end (Tom's correction) | `gridfins.scad` edge plates, `edge_t` |
| Flat face | Looked at | The plates' edges are straight on this face, so only the other face is toothed | `gridfins.scad` |
| Diamonds across | Counted across the whole fin, which shows here | About 8 (rough; checked for this file) | `fin_diamonds` |

#### First V3 grid fin from above, with a person

- **Photo:** [Next-Gen-Super-Heavy-Grid-Fin-Human-Scale_web.jpg](https://www.teslaoracle.com/wp-content/uploads/2025/08/Next-Gen-Super-Heavy-Grid-Fin-Human-Scale_web.jpg), 960 × 1440, SpaceX's photo as copied by [Tesla Oracle, August 2025](https://www.teslaoracle.com/2025/08/16/spacex-reveals-grid-fins-of-the-next-gen-starship-super-heavy-booster/)
- **Saved as:** `spacex_v3_grid_fin_from_above_person.jpg`
- **Shows:** the fin lying in its build fixture, from above, with a person standing in it. The fixture's machined box sits under the fin's root.
- **Scale:** the person, and the lattice itself fitted to the 4.2 m reach from the Pad 2 side view.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Outline | Looked at | Roughly an octagon: a nearly square body, root corners tapering in at 45° to a narrow root, outer corners cut off at 45° | `gridfins.scad` outline, `root_w`, `corner_cut` |
| Lattice | Looked at | Thin plates set diagonally, so the cells are diamonds; the 45° edges run along cell walls | `gridfins.scad` lattice |
| Diamonds across | Counted along the cross plate | 8, according to dimensions.md. See [Differences](#differences): this copy shows only about 6. | `fin_diamonds` |
| Rows of teeth | Counted from the cross plate to the tip | 11 to 12 | Fitting the lattice |
| Fin size | The lattice fitted to the 4.2 m reach | 3.5 m wide and 3.9 m from root to tip, plates about 0.3 m apart | `fin_width`, `fin_length` |
| Depth | The plates against the person | Up to about the knees, which fits 0.5 m | `fin_depth` |
| Cross plate | Looked at | A solid plate straight across between the corners where the sides turn in, parallel to the booster's side, with V-shaped teeth (Tom's correction) | `gridfins.scad` cross plate |
| Root triangle | Looked at | Two plates from the ends of the root edge to the middle of the cross plate, filled solid (Tom's correction) | `gridfins.scad` root triangle |
| Box inside | Looked at | None: the machined box with a bore belongs to the fixture (Tom's correction) | (none) |

#### SpaceX's V3 render from below

- **Photo:** [Starship-Super-Heavy-Grid-Fins-1st-vs-2nd-Gen.jpg](https://www.teslaoracle.com/wp-content/uploads/2025/08/Starship-Super-Heavy-Grid-Fins-1st-vs-2nd-Gen.jpg), 1338 × 720, SpaceX's render and photo as put side by side by [Tesla Oracle, August 2025](https://www.teslaoracle.com/2025/08/16/spacex-reveals-grid-fins-of-the-next-gen-starship-super-heavy-booster/)
- **Saved as:** `spacex_v3_vs_v2_grid_fins.jpg`
- **Shows:** SpaceX's render of a V3 booster's top seen from below, beside a photo of a V2 booster from above with its four older fins.
- **Scale:** none needed.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Fin outline | Looked at | All three fins are octagons seen from below | `gridfins.scad` outline |

### Catch fins

#### Booster 19 held by the Pad 2 chopsticks

- **Photo:** [IMG_9583-wmarked.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/03/IMG_9583-wmarked.jpg), 4032 × 3024, by Gage (Rough Riders Show) for NASASpaceFlight, March 2026, in [SpaceX enters a new era with Booster 19 testing on Pad 2](https://www.nasaspaceflight.com/2026/03/spacexs-booster-19-pad-2/)
- **Saved as:** `nsf_b19_lifted_by_pad2_chopsticks.jpg`
- **Shows:** Booster 19 being lifted onto the Pad 2 mount, seen from the rudder side, with the rudder fin facing the camera and both catch fins resting on the chopstick arms.
- **Scale:** the 9 m hull, about 754 px across near the bottom of the frame (84 px/m); no figure needed it.

| Quantity | How | Result | Used in |
|---|---|---|---|
| How the booster is held | Looked at | Both catch fins rest on top of the arms, near their tips | Catch and lift points |

#### Booster 19 in Mega Bay 1

- **Photo:** [HC3VGs1XAAABRJY](https://pbs.twimg.com/media/HC3VGs1XAAABRJY?format=jpg&name=orig), 1790 × 1194, by Starship Gazer, March 7, 2026, [posted on X](https://x.com/StarshipGazer/status/2030513829986160752)
- **Saved as:** `starshipgazer_b19_catch_fin_lift_pin.jpg`
- **Shows:** the top of Booster 19 inside Mega Bay 1, from about 136° (between the 90° catch fin and the tower side). The 90° fin is seen side on at the left, with its lifting pin end on under its root. The raceway is right of centre.
- **Scale:** the 9 m hull, 960 px across (107 px/m). Checked for this file: the fin's root sits about 46° left of the camera's direction and the raceway about 41° right, which puts the camera at about 136°.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Lifting pin | Scaled from the hull | A dark block about 0.4 m wide and 0.28 m tall. Checked again: its face is 33 px wide, or 42 px with the darker strip at its side, and 29 px tall, which gives 0.31 m to 0.39 m by 0.27 m. | `catch_pin_bar`, `catch_pin_drop` |
| Which way the bar points | Where the block falls along the fin | Further out than a bar pointing toward the tower would show, so this bar points toward the rudder. With the 270° fin's bar pointing toward the tower, both point clockwise seen from above (tentative). | The bar directions in `super_heavy.scad` |

### Engine section

#### Booster 20's aft end

- **Photo:** [Booster-20-Engines-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Engines-scaled.jpg), 2560 × 1439, by Colleen Liedtke for NASASpaceFlight, July 2026, in [Booster 20 completes record duration Static Fire](https://www.nasaspaceflight.com/2026/07/booster-20-record-static-fire/)
- **Saved as:** `nsf_b20_aft_engines_closeup.jpg`
- **Shows:** Booster 20's aft end from the side, close up, with the camera square on to the front outer engines. The conduit band runs round the black skirt, and two chines' cut ends are at the top.
- **Scale:** the 1.3 m nozzle exits, about 242 px across for the front engines (186 px/m), ± 0.1 m on heights.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Outer ring's radius | The gap between neighbouring front exits against their width. Seen square on, the spacing of two neighbours is r·sin 18° = exit + gap. | Gaps about 0.03 exit diameters (8 px against 240), so a pitch circle of 3.34 exit diameters, 4.35 m. Checked again: gaps of 5 to 7 px between exits 241 px and 244 px across. | Engines; `outer_r` (4.4 m, with the liftoff view) |
| Outer ring's spacing | Fitting the engine positions | 18° | The outer ring in `super_heavy.scad` |
| Skirt and collars | Scaled from the exits | The skirt is flush with the hull, with its bottom edge at z ≈ 2.75 m. Each outer engine hangs from a dark collar about 0.58 m across, about 2.75 m above its exit. | `skirt_bottom`, `collar_d` |
| Housings | Scaled from the exits | One over each outer engine, from the skirt edge to about z = 3.3 m, about 0.56 m wide and 0.55 m tall, its front about 0.2 m proud (4.7 m from the axis) | `housing`, `housing_out` |
| Skirt openings | Scaled from the exits | About 0.15 m wide and 0.24 m tall, centred at z ≈ 3.05 m, between the housings | `skirt_opening`, `opening_z` |
| Conduit band | Scaled from the exits | Pipes round the skirt at z ≈ 3.53 m (the biggest, 0.14 m), 3.88, 4.43, 4.68 and 4.91 m; 40 junction boxes, one every 9°, from z ≈ 3.88 to 4.33 m, each 0.22 m wide and 0.15 m deep, linked by three 0.05 m pipes at z ≈ 4.0, 4.1 and 4.2 m. The band stands up to 0.15 m off the skirt, so it is about 9.3 m across. | `band_pipes`, `box_z`, `box_size`, `band_top` |
| Which way the engines face | The painted numbers and "TCA SN" serials, here and round the ring | Every engine's front faces away from the booster's axis | The engine clocking in `super_heavy.scad` |
| Raptor plumbing | One outer engine square on, scaled to its 1.3 m exit (± 0.03 m) | The two coolant pipes, the manifold ring (0.82 m across at h ≈ 1.17 m to 1.26 m), the ring round the throat (0.55 m across), the two chamber rings, the two shielded valves and the ring of ports at h ≈ 2.47 m, as listed in dimensions.md's "Plumbing on the flight engines" | `raptor.scad` `coolant_pipes`, `core_rings`, `valve_pods`, `valve_lines`, `powerhead_ports`, the manifold ring in `sl_nozzle` |

#### Booster 20's engines at liftoff

- **Photo:** [Booster-20-Raptor-Engines-at-Liftoff-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Raptor-Engines-at-Liftoff-scaled.jpg), 2560 × 1707, by Max Evans for NASASpaceFlight, at Flight 13's liftoff (July 2026), in [Ship 41 Makes it to Orbit, Booster 21 Nearly Perfect](https://www.nasaspaceflight.com/2026/09/starship-flight-14-orbit/)
- **Saved as:** `nsf_b20_engines_at_liftoff.jpg`. It is the same size as the linked file but not byte for byte the same.
- **Shows:** Booster 20's 33 glowing nozzle exits from below at liftoff, with smoke hiding part of the right side.
- **Scale:** the exits themselves, each about 190 px across (146 px/m); the figures are ratios of exit diameters.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Outer ring's radius | An ellipse through 16 outer exits | Semi-major axis 3.41 exit diameters, 4.43 m with 1.3 m exits | `outer_r` |
| Inner ring's radius | The inner ring's own ellipse against the outer ring's | 0.57 times the outer ring's, about 1.94 exit diameters, 2.5 m ± 0.1 m | `inner_r` |
| Centre trio's radius | Fitted in both bottom views | About 1.1 m ± 0.1 m | `centre_r` |
| Layout | Ellipse fits through each group | The outer ring fits an ellipse to within 0.3% to 3%. Inner engines sit midway between outer ones (9° ± 3° from them), and centre engines midway between inner ones. | The engine placement in `super_heavy.scad` |
| Exit heights | Where each group's ellipse sits | The inner ring's exits are about 0.2 m below the outer ring's and the centre trio's about 0.5 m below (± 0.1 m; the Flight 14 photo agrees) | `inner_exit_z`, `centre_exit_z` |

#### Aft end from below

- **Photo:** [2Q5A8810-wmarked-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8810-wmarked-scaled.jpg), 2560 × 1708, by Max Evans for NASASpaceFlight, May 2026, in [Super Heavy Block 3 the Booster of the Future](https://www.nasaspaceflight.com/2026/05/super-heavy-block-3-booster-future/)
- **Saved as:** `nsf_b19_aft_engines_from_below.jpg`
- **Shows:** an aft end with all 33 engines, from below and to one side, most likely Booster 19. The thrust plate's tiled underside shows between the engines.
- **Scale:** the 1.3 m nozzle exits, about 320 px across for the front engines (246 px/m).

| Quantity | How | Result | Used in |
|---|---|---|---|
| Thrust plate's underside | Looked at | A speckled tiled surface between the engines, starting at the skirt's bottom edge | Thrust plate |
| Engine mounts | Looked at | Each gimballed engine hangs from a dark block above its top plate; one block carries the painted number 467 | Thrust plate; `gimbal_d` |
| Skirt, housings and band | As in Booster 20's aft end | The same layout seen from below | Thrust plate |

#### Booster 19 in its first engine tests

- **Photo:** [NSF-2026-03-18-18-41-35-084.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/03/NSF-2026-03-18-18-41-35-084.jpg), 2000 × 1107, by Colleen Liedtke for NASASpaceFlight, March 18, 2026, in [Ship 39 and Booster 19 Both Complete Full Engine Static Fires](https://www.nasaspaceflight.com/2026/04/ship-39-booster-19-static-fire/)
- **Saved as:** `nsf_b19_first_engine_test_partial_engines.jpg`
- **Shows:** Booster 19's aft end before it was painted, with only some engines fitted. The engines are labelled E1, E3, E4, E8, E9, E30, E31 and E33, and the conduit band is bare steel.
- **Scale:** the 1.3 m nozzle exits; E1's is about 242 px across (186 px/m).

| Quantity | How | Result | Used in |
|---|---|---|---|
| Gimballed engines' drop | The centre engine E1 and the inner engine E4, from nozzle exit to the plate | About 3.0 m, so the plate is at about z = 2.8 m at the inner ring and 2.5 m round the centre trio. Checked again on E1: 538 px from its exit plane to the bottom of the frame above its gimbal block, 2.9 m. | Thrust plate; `gimbal_drop` |
| Gimbal block | Scaled from the exits | A dark block about 0.33 m across above each gimballed engine's top plate | `gimbal_d` |
| Steering actuators | On E1, scaled from the exits | Two dark rods about 0.13 m thick in a V, one either side of the engine's front, from its manifold disk (h ≈ 2.05 m, 0.3 m from its axis) up to the plate (0.5 m from its axis). Their angles aren't measured; the model puts them 45° either side of the front. | `actuator_d`, `actuator_r`, `actuator_h` |
| Band top | Scaled from the exits; agrees with Booster 20's aft end | z ≈ 4.95 m ± 0.15 m, where the chines end | `band_top` |
| Empty mounts | Looked at | Open square frames at the outer positions that had no engine yet; fixtures rather than flight hardware (inference) | (none) |
| Other | Looked at | The painted number 141 on one block. The inner and centre engines face outward too. The band's pipes and boxes match Booster 20's in bare steel. | Engines |

#### Booster 19's aft end before its engines

- **Photo:** [COLLEEN_-_CRL00220-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/COLLEEN_-_CRL00220-scaled.jpg), 2560 × 1440, by Colleen Liedtke for NASASpaceFlight, February 2026, used in [Super Heavy Block 3 the Booster of the Future](https://www.nasaspaceflight.com/2026/05/super-heavy-block-3-booster-future/)
- **Saved as:** `nsf_b19_aft_conduits_no_engines.jpg`. It is the same size as the linked file but not byte for byte the same.
- **Shows:** Booster 19's aft end at night before its engines were fitted, with the conduit band in bare steel between two chines' cut ends, two foil-wrapped plates and a vertical pipe that splits in a Y.
- **Scale:** none usable; nothing of known size shows square on.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Chines' bottom ends | Looked at | Cut at an angle: the inner corner meets the top of the band and the cut slopes up toward the outer face | `chine_cut` |
| QD plates | Looked at | Two foil-wrapped plates just above the band, between two chines, either side of the vertical pipe. Probably the two QD plates, but their azimuths can't be read without a scale. | Aft skirt (unresolved) |
| Vertical pipe | Looked at | Comes down the hull and splits in a Y onto it at the band's top (z ≈ 4.95 m) | Lines down the side (not modelled) |

## Starship

### Whole ship

#### Ship 39 beside the Starfactory sign

- **Photo:** [2Q5A8534-wmarked-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8534-wmarked-scaled.jpg), 2560 × 1707, and the [full-size original](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8534-wmarked.jpg), 7566 × 5046, by Max Evans for NASASpaceFlight, May 2026, in [Flight 12 readies for the debut of SpaceX's next Ship evolution](https://www.nasaspaceflight.com/2026/05/fligth12-debut-spacex-ship-evolution/)
- **Saved as:** `nsf_s39_starfactory_drogues_from_side.jpg` (the 2,560 px copy)
- **Shows:** Ship 39 standing beside the Starfactory's "Gateway to Mars" sign, from about 209°, 130 m to 170 m away, looking up. dimensions.md calls it "the Starfactory photo", and most of the ship's estimates come from it. The sign hides the aft flaps' lower ends.
- **Scale:** the 9 m hull, about 243 px across at the payload bay (27 px/m; about 80 px/m in the full-size original). Heights are measured down from the nose tip at z = 52.1 m and corrected for the camera looking up: a part on the near side of the hull looks up to about 1 m higher than one at the same height on the outline. Azimuths come from offsets across the hull. Lengths are ± 0.6 m and angles ± 5° unless stated.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Forward flap hinges | Offsets and heights of the hinge line | At about 98° and 262°, running up the nose from z ≈ 43.3 m (nose radius about 4.0 m) to z ≈ 48.6 m (about 2.2 m), about 5.6 m along the slope | Flaps; `fwd_hinge_az`, `fwd_hinge_z` |
| Forward flap tips | Scaled from the hull | Tip edge about 2.0 m ± 0.2 m long, roughly upright, from z ≈ 42.4 to 44.4 m, about 3.7 m ± 0.4 m out from the hinge line. The trailing edge drops about 1 m going out; the leading edge is about 4 m lower at the tip. | `fwd_tip_z`, `fwd_tip_out` |
| Forward flap planes | How far each flap is turned from radial | About 14° toward leeward, so the planes are about 136° apart, matching the reported "about 140°" | `fwd_flap_angle` |
| Aft flaps | Scaled from the hull (± 0.8 m) | The leading edge leaves the hull at z ≈ 15 m and runs down and out to the top of the tip edge at z ≈ 8.6 m. The left flap, about 30° off face on, reaches 3.7 m to 4 m from the hull. The hinges fit 90° and 270° (± 10°). Their leeward faces are tiled too. | `aft_flap_root_top`, `aft_flap_tip_top` |
| Tile line | Where the tiles end across the hull | About 104° to 105° from windward on the payload bay, and about 128° on the nosecone. Next to the right aft flap the black area reaches about 126°, most likely the flap's own tiled face. | Heat shield; `tile_line`, `nose_tile_line` |
| Payload bay door | Ends and edges of the slot's outline | From about 124° to 236° (± 4°), about 8.8 m round the hull, 0.85 m ± 0.1 m tall at z ≈ 35.3 to 36.2 m ± 0.5 m. The 124° end is at the photo's edge, so it assumes the door is symmetric. | `door_az`, `door_z` |
| Payload bay docking ports | Offsets and heights | At about 140° and 220° (± 4°), z ≈ 34.5 m ± 0.5 m, centred about 0.9 m below the door | `docking_ports` |
| Docking port housings | The length of housing that shows in the full-size original. The 140° housing barely reaches past the hull's outline. | All four show the same side, so their axes are parallel and point toward 180°. Each stands about 0.4 m ± 0.2 m out along its centreline, and the aft ones up to about 0.6 m. | `docking_ports` (third value of each) |
| Raceways | Offsets | About 165° and 195° (± 4°), with rounded tops at z ≈ 35 m; bronze collars round both at z ≈ 21.5 m and 29.3 m (± 0.6 m) | `raceway_az`, `raceway_z` |
| Other parts | Offsets and heights | Leeward Starlink dishes: dark squares about 0.75 m across at 148° and 212°, z ≈ 41 m. A band of vertical slats at z ≈ 6 m ± 1 m. A round port about 1 m across, ringed with holes, at 224°, z ≈ 9 m ± 0.8 m. Two flanged ports at 211° and 224°, z ≈ 31.3 m (with the nose close-up). | Vents, RCS, cameras (not modelled) |
| Tile test patches | Looked at | The patches at 218° show a hex pattern on the bare steel | Docking ports section |

#### Ship 39 on the road by the Starfactory

- **Photo:** [2Q5A8582-wmarked-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8582-wmarked-scaled.jpg), 2560 × 1708, by Max Evans for NASASpaceFlight, May 2026, in [Flight 12 readies for the debut of SpaceX's next Ship evolution](https://www.nasaspaceflight.com/2026/05/fligth12-debut-spacex-ship-evolution/)
- **Saved as:** `nsf_s39_roadside_drogues.jpg`
- **Shows:** Ship 39 on its transport stand on the road beside the Starfactory, leeward side toward the camera, with all four drogues fitted.
- **Scale:** the 9 m hull, about 228 px across (25 px/m).

| Quantity | How | Result | Used in |
|---|---|---|---|
| Tile test patches | Offsets, sizes and heights of the two pairs of dark rectangles | At about 142° and 218° (± 5°). The upper pair are about 2.3 m × 2.4 m at z ≈ 27.2 to 29.7 m ± 0.6 m, and the lower pair about 3.6 m × 3.0 m at z ≈ 11.7 to 14.8 m ± 0.8 m. | Docking ports section (not modelled) |
| Docking ports | Looked at | All four drogues fitted | Docking ports |

#### Ship 39 ready to roll out to Massey's

- **Photo:** [Ship-39-preparing-for-rollout-to-Masseys.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39-preparing-for-rollout-to-Masseys.jpg), 9504 × 5344, by Ceaser G for NASASpaceFlight, February 2026, in [Flight 12: Ship 39 rolls out to Masseys to begin testing](https://www.nasaspaceflight.com/2026/02/ship-39-masseys-testing/)
- **Saved as:** `nsf_s39_rollout_catch_pins_leeward.jpg`
- **Shows:** Ship 39 from its leeward side, both sides square on, with both catch pins in profile at the hull's edges under red covers.
- **Scale:** the 9 m hull, 741 px across between its edges at mid-height (82 px/m; dimensions.md has about 81).

| Quantity | How | Result | Used in |
|---|---|---|---|
| Catch pin positions | Where they stand out from the hull | One each side, at about 90° and 270° (± 10°), at the same height | Catch and lift points; `catch_az` |
| Catch pin fairing | Scaled from the hull | The top slopes down and out from the hull at z ≈ 39.9 m to an upright outer end about 0.44 m ± 0.05 m off the hull and about 0.15 m tall; the underside is level at z ≈ 39.0 m ± 0.3 m. Checked again: the outer end is 36 px beyond the hull's edge and the fairing about 80 px tall. | `catch_z`, `catch_out`, `catch_end` |
| Tile line's step | Height of the step where the tiles widen | z ≈ 39.5 m ± 0.3 m, level with the pins and about 1 m above the nosecone's base (an earlier 38 m from the Starfactory photo is superseded) | Heat shield; `nose_tile_step` |

#### Ship 42 held by the chopsticks

- **Photo:** [NSF-2026-09-14-17-44-21-003.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/NSF-2026-09-14-17-44-21-003.jpg), 1747 × 1129, by Colleen Liedtke for NASASpaceFlight, September 14, 2026, in [Ship 42 wraps chopsticks tests, Flight 14 moves to NET Sept. 22](https://www.nasaspaceflight.com/2026/09/ship-42-chopsticks-tests-flight-14-net/)
- **Saved as:** `nsf_s42_in_chopsticks.jpg`
- **Shows:** Ship 42 held by the Pad 2 chopsticks in a simulated catch, from a long way off.
- **Scale:** the ship's 52.1 m height, about 333 px (6.4 px/m).

| Quantity | How | Result | Used in |
|---|---|---|---|
| Where the arms hold the ship | Height of the arms above the skirt's bottom edge | About z = 40.5 m (checked again: about 40.3 m). With a fitting in the Starfactory photo, this gave the first catch pin estimate of z = 40 m ± 1 m, which the rollout photo superseded. | Catch and lift points |

### Nose, payload bay and catch pins

#### Ship 39's nose and payload bay

- **Photo:** [Ship-39s-Nose-Cone-and-Paylod-Bay.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39s-Nose-Cone-and-Paylod-Bay.jpg), 9504 × 5344, and the [2560 × 1439 copy](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39s-Nose-Cone-and-Paylod-Bay-scaled.jpg), by Ceaser G for NASASpaceFlight, February 2026, in [Flight 12: Ship 39 rolls out to Masseys to begin testing](https://www.nasaspaceflight.com/2026/02/ship-39-masseys-testing/)
- **Saved as:** `nsf_s39_nose_catch_pins_full.jpg` and `nsf_s39_payload_bay_drogue_housings.jpg`
- **Shows:** Ship 39's nose and payload bay from close below on the leeward side, with the camera at about 171° (by the symmetry of the parts). Both payload-bay drogue housings are fitted but still empty. Both raceways, the door's outline and the catch pins under red covers also show. dimensions.md calls it "the nose close-up", "the leeward nose close-up" or "the February close-up".
- **Scale:** the 9 m hull, 661 px to 665 px across in the 2,560 px copy (73.6 px/m; dimensions.md has about 73) and about 273 px/m in the full-size copy.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Docking port mouths | Scaled from the hull, before the drogues were fitted | Keyhole-shaped: a round opening with a notch about 0.2 m wide and 0.15 m deep at the bottom | `port_notch` |
| Tile line | Where the tiles end on the payload bay | About 104° to 105° | `tile_line` |
| Raceways | Offsets | About 165° and 195°, each a ladder-like cover 0.5 m to 0.75 m wide | `raceway_az`, `raceway_w` |
| Ports | Offsets and heights | A small round port at about 185°, z ≈ 34.6 m. Two round flanged ports at about 211° and 224°, z ≈ 31.3 m, which may be roll thrusters. | Vents, RCS, cameras (not modelled) |
| Catch pins | The full-size copy, from close below | The pins' shape under their covers, used with the rollout photo and the close-up below | Catch and lift points |
| Slots below the door | Looked at | A band of vertical slots round the leeward side just below the door (dimensions.md puts it at z ≈ 32.3 to 33.3 m without naming its photo) | Payload bay (not modelled) |

#### A V3 ship's catch pin

- **Photo:** [DSC09019-wmarked.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/DSC09019-wmarked.jpg), 4042 × 2275, by Ceaser G for NASASpaceFlight, May 2026, in [Flight 12 readies for the debut of SpaceX's next Ship evolution](https://www.nasaspaceflight.com/2026/05/fligth12-debut-spacex-ship-evolution/)
- **Saved as:** `nsf_v3_ship_catch_pin_closeup.jpg`
- **Shows:** the 270° catch pin on a V3 ship's nose with its cover off, at the step in the tile line: the tiled fairing and the steel pad under its outer end.
- **Scale:** the hexagonal tiles, about 0.25 m across, about 135 px each here (540 px/m).

| Quantity | How | Result | Used in |
|---|---|---|---|
| Fairing width | Scaled from the tiles | About 0.55 m across its sloping top and outer end, and about 1.5 m where its underside meets the hull, its sides sloping out to the hull | `catch_w` |
| Steel pad | Scaled from the tiles | About 0.33 m wide and 0.1 m tall. See [Differences](#differences): checked again, it is 160 px × 50 px, 0.30 m × 0.09 m. | `catch_pad` |

### Aft end and docking ports

#### A V3 ship's aft end on its transport stand

- **Photo:** [COLLEEN-CRL00300-wmarked-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/COLLEEN-CRL00300-wmarked-scaled.jpg), 2560 × 1441, by Colleen Liedtke for NASASpaceFlight, May 2026, in [Flight 12 readies for the debut of SpaceX's next Ship evolution](https://www.nasaspaceflight.com/2026/05/fligth12-debut-spacex-ship-evolution/)
- **Saved as:** `nsf_v3_ship_aft_drogues_and_qd.jpg`
- **Shows:** a V3 ship's aft end on its transport stand, from within about 1° of the leeward centreline. Both aft drogues, the QD plate, the silver hoods at the raceways' lower ends and the tiles at both edges all show. dimensions.md calls it "the aft close-up".
- **Scale:** the 9 m hull, 1,793 px between its edges (199 px/m), about 207 px/m on the near side, allowing about 5% because it is closer to the camera. z is measured from the top of the stand, where the skirt's bottom edge sits.

| Quantity | How | Result | Used in |
|---|---|---|---|
| QD plate | Scaled from the hull | At 180° ± 2°, z ≈ 2.6 to 3.5 m ± 0.2 m, its main connectors at about 3.0 m. Two plates side by side between guide rails, each about 0.27 m wide and 0.87 m tall, about 0.8 m wide overall; the right-hand one has a grid of 8 small connectors. | `qd_z`, `qd_w`, `qd_connector_z` |
| Aft docking ports | Offsets and heights | At about 156° and 204° (± 2°), z ≈ 2.2 to 2.9 m ± 0.2 m (centre 2.55 m); both seen square on, so their axes point straight out to leeward | `docking_ports` |
| Housings and drogues | Each part against its own blurred width | Housings about 0.8 m ± 0.05 m across. Each drogue cone's rim is about 0.6 m across, held by 8 bolts on a circle about 0.5 m across, narrowing to a central hole about 0.07 m across. A tab about 0.2 m wide hangs 0.14 m below the rim, with a small white label. | `port_d`, `drogue_d`, `drogue_hole`, `drogue_tab` |
| Attic vents | Offsets and heights | Silver hoods about 0.75 m wide, open at the bottom, at about 167° and 193° (± 2°), their lower edges at z ≈ 2.4 m ± 0.2 m: the raceways' lower ends | `raceway_az` (13° at the lower end), `raceway_z` |
| Thin pipes | Offsets | About 6 cm across with orange tips, at about 162° and 198° (± 2°), down to z ≈ 0.9 m | Lines down the side (not modelled) |
| Tile line | Where the tiles end at the skirt | About 108° | Heat shield |

#### Ship 39's QD plates

- **Photo:** [Ship-39-Quick-Disconnect-scaled.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39-Quick-Disconnect-scaled.jpg), by Ceaser G for NASASpaceFlight, February 2026, in [Flight 12: Ship 39 rolls out to Masseys to begin testing](https://www.nasaspaceflight.com/2026/02/ship-39-masseys-testing/)
- **Saved as:** `nsf_s39_quick_disconnect.jpg`, 2560 × 1439. The linked file is now 4.9 MB against the saved copy's 0.8 MB, so the online version may differ.
- **Shows:** Ship 39's QD plates between the raceways' lower ends, before the aft drogues were fitted, with the band of vertical slats above them.
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| QD plates and raceway ends | Looked at | Shows how the plates sit between the raceways' lower ends; the figures come from the aft close-up | Quick disconnect |

### Flaps

These photos come from two Ringwatchers articles, which credit each photographer: [The Business End: Starship's Upgraded Aft Section](https://ringwatchers.com/article/s33-aft) for the aft flaps and [It's About Damn Time: Starship's Upgraded Flaps & Nosecone](https://ringwatchers.com/article/s33-nose) for the forward flaps. Most show V2 ships, whose flaps V3 keeps on the outside.

#### Stowed aft flaps, V1 and V2

- **Photo:** [e2f45851-…-large.jpg](https://api.ringwatchers.com/images/e2f45851-02c2-4eb1-a947-73dc17be71fb-large.jpg), 1920 × 1080, by RGV Aerial Photography (V1, left) and Shaun Gisler for Marcus House (V2, right), in the aft section article
- **Saved as:** `ringwatchers_aft_flap_hinge_stowed_v1_v2.jpg`
- **Shows:** a stowed aft flap on a V1 and a V2 ship, with the tiled "static aero" strip along the hinge line and the "leading edge aero cap" over the top of the hinge.
- **Scale:** the hexagonal tiles, about 0.25 m across; about 29 px each on the V2 cap (116 px/m).

| Quantity | How | Result | Used in |
|---|---|---|---|
| Static aero strip | Scaled from the tiles | About 0.6 m to 0.8 m wide | Flaps; `aft_static_aero_w` |
| Cap's height | Scaled from the tiles | Its tip about 1.5 m to 1.7 m above the flap's root. Checked again on V2: about 185 px, 1.6 m. | `aft_cap_h` |
| Cap's width | Scaled from the tiles | About 0.8 m at its base. An earlier 1.3 m took in the flap's root beside it. See [Differences](#differences). | The cap's base, as wide as `aft_static_aero_w` |

#### Deployed aft flaps from windward, V1 and V2

- **Photo:** [be8a0443-…-large.jpg](https://api.ringwatchers.com/images/be8a0443-99cc-48f2-b641-732fb9bd9935-large.jpg), 1920 × 1080, by Shaun Gisler for Marcus House (V1) and Sean Doherty for WAI Media (V2), in the aft section article
- **Saved as:** `ringwatchers_aft_flaps_deployed_windward_v1_v2.jpg`
- **Shows:** both aft flaps deployed on a V1 and a V2 ship, from the windward side.
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Hinge line with the flaps out | Looked at | Nothing stands out along the hinge line apart from the static aero and the cap | Flaps |

#### An aft flap on its transport stand

- **Photo:** [cd87ed84-…-large.jpg](https://api.ringwatchers.com/images/cd87ed84-5c11-4340-ab27-e2f8691e1826-large.jpg), 1920 × 1080, by Kevin Randolph for WAI Media, in the aft section article
- **Saved as:** `ringwatchers_aft_flap_tapered_profile.jpg`
- **Shows:** an aft flap lying on its transport stand, end on enough to show its tapered profile, with a rounded root at the right and a rounded outboard edge at the left.
- **Scale:** the flap's span, roughly 4 m, about 1,740 px end to end (435 px/m).

| Quantity | How | Result | Used in |
|---|---|---|---|
| Taper | Thickness at each end, scaled from the span | About 0.7 m at the rounded root and 0.35 m at the outboard edge, so the faces aren't parallel. Checked again: 285 px and 150 px, 0.66 m and 0.34 m. | `aft_flap_thickness` |
| Edges | Looked at | The root and the outboard edge are rounded | Flap sections |

#### A V2 aft static aero segment

- **Photo:** [6acab4a4-…-large.jpg](https://api.ringwatchers.com/images/6acab4a4-d11e-4956-bca5-289f4f12da0f-large.jpg), 1920 × 1080, by LabPadre, in the aft section article
- **Saved as:** `ringwatchers_v2_aft_static_aero_segment.jpg`
- **Shows:** a tiled segment of aft static aero fitted to a barrel section before stacking.
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| How the strip is built | Looked at | In segments, each fitted to its barrel section before stacking | Flaps |

#### V2 central and lower aft flap hinges

- **Photo:** [e16469a1-…-large.jpg](https://api.ringwatchers.com/images/e16469a1-2683-4476-9059-7fba74666080-large.jpg), 1920 × 1080, by LabPadre, in the aft section article
- **Saved as:** `ringwatchers_v2_aft_flap_central_lower_hinges.jpg`
- **Shows:** the central and lower aft flap hinges on a V2 ship (a soft frame from a video).
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Central hinge | Looked at | Bulkier than the others, carrying the actuator | Flaps |

#### Four aft flap hinges on V1

- **Photo:** [9698f4ea-…-large.jpg](https://api.ringwatchers.com/images/9698f4ea-68b5-42a5-bd63-5aac088f9719-large.jpg), 1920 × 1080, by RGV Aerial Photography, in the aft section article
- **Saved as:** `ringwatchers_v1_aft_flap_four_hinges.jpg`
- **Shows:** a V1 aft flap with its four hinges marked by arrows.
- **Scale:** none needed.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Aft flap hinges | Counted | Four along the root; the third from the top is the central hinge | Flaps |

#### Forward flaps' static aero, V1 and V2

- **Photo:** [eee95c19-…-large.jpg](https://api.ringwatchers.com/images/eee95c19-c9cd-429b-8d1c-003f4d517e2f-large.jpg), 1920 × 1080, by RGV Aerial Photography (V1) and LabPadre (V2), in the forward flaps article
- **Saved as:** `ringwatchers_fwd_flap_static_aero_v1_v2.jpg`
- **Shows:** the static aero along a forward flap's hinge line on a V1 and a V2 ship.
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| V2 forward static aero | Looked at, against V1 | A much smaller strip, mostly hidden from the airflow behind the nosecone, with no cap | `fwd_static_aero` |

#### Stowed forward flaps, V1 and V2

- **Photo:** [5e6ff640-…-large.jpg](https://api.ringwatchers.com/images/5e6ff640-0b57-42e7-849e-1c2b1dc65109-large.jpg), 1920 × 1080, by RGV Aerial Photography (V1) and Shaun Gisler for Marcus House (V2), in the forward flaps article
- **Saved as:** `ringwatchers_fwd_flaps_stowed_v1_v2.jpg`
- **Shows:** the stowed forward flaps on a V1 and a V2 nose; the V2 flaps sit further leeward.
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Forward flap position | Looked at | Moved toward leeward on V2, as reported | Flaps |

#### V2 forward flap hinge attachments

- **Photo:** [fd0d29bc-…-large.jpg](https://api.ringwatchers.com/images/fd0d29bc-3741-4cf1-ac82-426fcb6f88b8-large.jpg), 1920 × 1080, by SpaceX, in the forward flaps article
- **Saved as:** `ringwatchers_v2_fwd_flap_hinge_attachments.jpg`
- **Shows:** a V2 nose before its forward flap is fitted, with the hinge attachments marked by arrows.
- **Scale:** none needed.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Forward flap hinges | Counted | Three: small upper and lower ones and a bulkier central one with the single control arm | Flaps |

#### Ship 33's deployed forward flaps

- **Photo:** [c2444435-…-large.jpg](https://api.ringwatchers.com/images/c2444435-ef10-4ad5-837a-b0d82a6f9f6c-large.jpg), 2160 × 1441, by Starship Gazer, in the forward flaps article
- **Saved as:** `ringwatchers_v2_fwd_flaps_deployed.jpg`
- **Shows:** Ship 33's nose from windward with both forward flaps deployed.
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Flap faces and edges | Looked at | Flat faces with rounded edges | Flap sections |

#### A V2 forward flap's lower edge

- **Photo:** [d7e8ccaf-…-large.jpg](https://api.ringwatchers.com/images/d7e8ccaf-7d7e-4209-ba32-22df61238009-large.jpg), 1920 × 1080, by Starship Gazer, in the forward flaps article
- **Saved as:** `ringwatchers_v2_fwd_flap_lower_edge.jpg`
- **Shows:** a V2 forward flap on a trailer, partly covered, with its lower edge end on.
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Section | Looked at | Stadium-shaped: one thickness, with semicircular leading and trailing edges | Flap sections; the forward flaps in `starship.scad` |

#### Forward flap thicknesses, V1 and V2

- **Photo:** [81a22080-…-large.jpg](https://api.ringwatchers.com/images/81a22080-861c-422e-ac34-92c71faa01c9-large.jpg), 1920 × 1080, by Nic Ansuini (V1, top) and Starship Gazer (V2, bottom), in the forward flaps article
- **Saved as:** `ringwatchers_fwd_flap_thickness_v1_v2.jpg`
- **Shows:** a V1 and a V2 forward flap on trailers, side by side for thickness.
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| V2 thickness | Against V1 | One thickness throughout, about as thin as the old flaps' outboard edges | `fwd_flap_thickness` |

## Raptor engines

#### Raptors 1, 2 and 3 side by side

- **Photo:** SpaceX's Raptor 3 reveal photo (August 2024), on the Starship SpaceX Wiki's [file page](https://starship-spacex.fandom.com/wiki/File:240803-Raptor3-update-SpaceX-Twitter-a.jpg), 3840 × 2414. The wiki refuses direct requests for its [image file](https://static.wikia.nocookie.net/starship-spacex/images/5/51/240803-Raptor3-update-SpaceX-Twitter-a.jpg) unless it is opened from the wiki. SpaceX's figures for the engines are quoted in [NASASpaceFlight, August 2024](https://www.nasaspaceflight.com/2024/08/flight-5-6-preparations-raptor-3/).
- **Saved as:** `spacex_raptor_1_2_3_side_by_side.jpg` (a WebP image, despite its name)
- **Shows:** Raptors 1, 2 and 3 standing on pallets in front of a light corrugated wall, Raptor 3 serial 1 on the right.
- **Scale:** Raptor 3's 1.3 m nozzle exit, 770 px across in this copy (592 px/m). dimensions.md's 573 px/m fits a smaller copy, about 3,700 px wide; the engine's proportions are the same in both.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Sea-level outline | Edge scans of the silhouette against the wall; the radius measured from the axis of the symmetric bell | The h and radius table in dimensions.md's "Shape for modelling", ± 0.02 m on the bell and ± 0.03 m elsewhere | `raptor.scad` `sl_nozzle`, `sl_core` |
| Length | Nozzle exit plane to the cover on the top port | 2.91 m. Checked again: 1,714 px, 2.90 m. | `sl_core` (top at 2.91 m) |
| Throat and chamber | Scaled from the exit | The throat about 0.32 m across outside its cooling jacket; the chamber about 0.42 m across outside | `sl_core` |
| Top mount | Scaled from the exit | Top plate about 0.50 m across at h = 2.56 to 2.60 m, a ring of 16 to 20 studs on a circle about 0.39 m across, a domed hub about 0.28 m across, and a top port about 0.22 m across | `sl_core`, `sl_mount` |
| Equipment side | Scaled from the exit | The pipe, the corrugated duct, the capped ports (0.22 m on top and 0.16 m at h ≈ 2.35 m), the valve block and a possible actuator lug, as dimensions.md lists them | Attachment points |

#### Raptor 3 on the McGregor test stand

- **Photo:** SpaceX's Raptor 3 reveal photo (August 2024), on the Starship SpaceX Wiki's [file page](https://starship-spacex.fandom.com/wiki/File:240803-Raptor3-update-SpaceX-Twitter-d.jpg), 3840 × 3363, also shown on its [Raptor 3 page](https://starship-spacex.fandom.com/wiki/Raptor_3)
- **Saved as:** `spacex_raptor3_sn1_test_stand.jpg` (a WebP image, despite its name)
- **Shows:** Raptor 3 serial 1 on a test stand at McGregor, close up.
- **Scale:** none used.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Detail | Looked at | The ribbed chamber, the pipe, the corrugated duct and the manifold ring in more detail than the side-by-side photo | Shape for modelling |

#### RVac 3 serial 8 beside Raptor 3 serial 6

- **Photo:** [Raptor-3.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2025/05/Raptor-3.jpg), 2545 × 1364, a SpaceX presentation slide, in [NASASpaceFlight, May 2025: The Future of the Starship Program, Block 3 and Mars](https://www.nasaspaceflight.com/2025/05/future-starship-block-3-mars/)
- **Saved as:** not saved; measured online
- **Shows:** a SpaceX slide with RVac 3 serial 8 and sea-level Raptor 3 serial 6 standing on a factory floor at about the same distance from the camera. The RVac's top is cut off by the photo's edge.
- **Scale:** serial 6's 1.3 m exit, which makes the RVac's exit 2.3 m ± 0.2 m. To use the 2.4 m figure instead, multiply by 1.04.

| Quantity | How | Result | Used in |
|---|---|---|---|
| RVac outline | Diameters at heights above the exit, ± 0.1 m across and ± 0.15 m in height | The table in dimensions.md: a ribbed lower extension to h = 1.8 m (nearly a cone at 12°, bulging slightly), a junction ring, and a dark upper bell flaring at 24° to the throat at about h = 3.0 m. Above that it follows the sea-level engine. | `raptor.scad` `vac_nozzle`, `vac_ext_top`, `vac_bell_top`, `vac_ring` |
| RVac 3 length | Assuming it shares the sea-level engine's chamber and powerhead | About 4.4 m | RVac length |
| Bracing | Looked at | No struts on the engine; the nozzle is stiffened by its rings | Attachment points |

#### RVac 2 serial 580 on a trailer

- **Photo:** [NSF-2025-08-12-02-40-47-269.jpg](https://www.nasaspaceflight.com/wp-content/uploads/2025/08/NSF-2025-08-12-02-40-47-269.jpg), 2293 × 1279, from NASASpaceFlight's McGregor Live camera, August 2025, in [Raptor 3 testing ramps up at SpaceX McGregor](https://www.nasaspaceflight.com/2025/08/raptor-3-ramps-spacex-mcgregor/)
- **Saved as:** not saved; measured online
- **Shows:** RVac 2 serial 580 lying on a trailer, side on.
- **Scale:** the engine's own exit diameter.

| Quantity | How | Result | Used in |
|---|---|---|---|
| Length | Length against the exit diameter | About 1.95 exit diameters, 4.5 m to 4.7 m | RVac length (about 4.5 m) |

## Photos checked that gave nothing usable

- [Ship 41 waiting to be stacked on Booster 21](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/Ship-41-waiting-to-be-stacked-on-Booster-21-scaled.jpg) (NASASpaceFlight, September 2026), checked with the truss photos, the B20 lift photo and the stacked photo for the actuators that hold the ship to the booster. None of them shows the actuators.
- For the ship's engine layout, about 18 V3 photos were checked: on the stand, in Mega Bay, at static fire, during stacking and at splashdown, plus the aft close-up. None shows the engines from below together with something that fixes their clocking. As V2 stand-ins, these were also checked: the [Ship 37 gallery on the Starship SpaceX Wiki](https://starship-spacex.fandom.com/wiki/Ship_37_(S37)), NASASpaceFlight's [Ship 35](https://www.nasaspaceflight.com/2025/05/ship-35-sf-spacex-has-fleet-vehicles-flight/) and [Ship 37](https://www.nasaspaceflight.com/2025/08/ship-37-spin-prime-engine-swap/) articles (2025), SpaceX's [2022 photos of Ship 24's engines](https://interestingengineering.com/innovation/spacex-mars-raptor-engine-setup) (V1, and too oblique), SpaceX's [Ship 25 static-fire photos](https://www.space.com/spacex-starship-ship-25-engine-test-fire-photos) and SpaceX's [Flight 14 hot-staging video](https://starlust.org/video/w130-mury20fo/), which looks down from the ship. None gives a usable bottom view.

## Differences

Checking the photos again for this file turned up these differences from dimensions.md. None of its figures, and nothing in the models, has been changed.

- **Lifting pin's bar** (truss and grid fin close-up, full size). dimensions.md has a bar 0.15 m wide and 0.1 m thick. Its end face reads about 33 px tall here, about 0.07 m, with a darker face above it about as tall again. The camera looks up about 24° and the bar points away from it, so this is rough, but the bar may be thinner than modelled.
- **Grid fin diamonds** (photo from above). dimensions.md counts 8 diamonds along the cross plate in this photo. In this 960 px copy the cross plate's notches repeat every 155 px to 160 px, so only about 6 diamonds fit across the frame, which seems to cut off the fin's sides. The hanging fin, which shows the whole fin, gives about 8, so the count stands, but it comes from the other photo.
- **Aft hinge cap's width** (stowed aft flaps). The tiled area at the cap's base is about 142 px, 1.2 m, wide on V2. That includes the edge of the flap's root, and the cap's own edge can't be told from the root's here, so the 0.8 m couldn't be confirmed.
- **Stacked photo's viewing angle.** dimensions.md's ship height check corrects for the camera looking up about 25°, but its truss and dome notes read about 6° from the same photo. The skirt's bottom edge is nearly straight in the photo, which fits 6°: at 25° it would sag about 20 px. So the 51.7 m ± 1.7 m height check needs redoing. The models use the published 52.1 m.
- **Catch pin's steel pad** (catch pin close-up). 0.30 m × 0.09 m against dimensions.md's 0.33 m × 0.1 m, about 10% smaller, within what the tiles' size allows as a scale.
- **Raptor photo's scale** (Raptors 1, 2 and 3). 592 px/m in the 3,840 px copy against dimensions.md's 573 px/m, which came from a smaller copy. The engine's length comes out the same, 2.90 m against 2.91 m.

These checks agreed with dimensions.md to within 5%: the rollout photo's scale (82 px/m against 81), the aft close-up's (about 209 px/m on the near side against 207), the nose close-up's (73.6 px/m against 73), the stacked photo's (10.8 px/m), the outer exits' gaps in Booster 20's aft end, E1's drop to the plate (2.9 m against 3.0 m), the lifting pin block in Mega Bay 1, the aft flap's taper, the aft cap's height, the ship's catch pin fairing and where the chopsticks hold Ship 42.
