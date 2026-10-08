# Starship and Super Heavy dimensions

All main figures are for **V3 (Block 3)**, the version flying now: Flight 12 (May 22, 2026), Flight 13 (July 24, 2026) and Flight 14 (Sept 28, 2026, the first orbital flight). Earlier versions are compared further down.

Metric comes first, with feet in brackets. Compiled 2026-10-03; sources are listed at the end.

## Full stack (V3)

| Dimension | Value |
|---|---|
| Height | 124.4 m (408 ft) |
| Diameter | 9 m (29.5 ft) |

The stack height is the booster plus the ship: 72.3 m + 52.1 m = 124.4 m.

## Starship, the upper stage (V3)

| Dimension | Value |
|---|---|
| Height | 52.1 m (171 ft) |
| Diameter | 9 m (29.5 ft) |
| Engines | 6 Raptor 3: 3 sea-level engines in the centre and 3 vacuum engines (RVac) around them |
| Flaps | 4: two forward flaps on the payload bay near the nose, and two aft flaps on the sides of the engine bay and LOX tank |
| Aft flap position | Directly opposite each other (180° apart) |
| Forward flap position | About 140° apart, shifted toward the leeward (unshielded) side. They have been placed like this since V2; on V1 they were 180° apart like the aft flaps. |
| Span across the aft flaps | About 17 m (56 ft) tip to tip, so each aft flap reaches about 4 m beyond the hull. This figure is not tied to a version. |
| Heat shield | Black hexagonal tiles cover the windward side; the leeward side is bare stainless steel |

## Super Heavy, the booster (V3)

| Dimension | Value |
|---|---|
| Height | 72.3 m (237 ft), including the hot-staging interstage on top and, judging from photos, the engines below the skirt (see the reference frame further down) |
| Diameter | 9 m (29.5 ft) |
| Engines | 33 Raptor 3: 3 in the centre and 10 in an inner ring (these 13 gimbal), plus 20 fixed engines in an outer ring |
| Grid fins | 3, spaced 90° / 90° / 180° (a T shape seen from above). Each is about 1.5 times the size of the earlier fins, and they sit lower on the booster than before. |
| Hot-staging interstage | Built into the top of the booster as an open, vented truss above the methane tank's forward dome. There is no separate ring as on V1 and V2. |

## Super Heavy V3 in detail

This section covers where things sit on the V3 booster. Each figure is tagged **Published** (SpaceX), **Reported** (credible press, Wikipedia or the Starship SpaceX Wiki) or **Estimated** (measured or derived from photos, with the method given). Gaps are left as gaps and listed under "Not published by SpaceX".

### Reference frame

- z = 0 is the plane of the engine nozzle exits, and z points up, in metres. The published 72.3 m appears to run from there to the top of the hot-staging truss. In NASASpaceFlight's photo of Booster 20 hanging from the chopsticks, scaled from the 9 m hull, the truss top is about 72.7 m ± 1.5 m above the nozzle exits but only about 69.4 m ± 1.5 m above the bottom edge of the aft skirt (**Estimated**; most of the ± comes from the hull-width scale). The published height therefore appears to include the engines. In that photo the black aft section looks like it ends at about z = 3.3 m, but sharper close-ups show its lowest pipe at about z = 3.5 m and the skirt carrying on below it to a bottom edge at about z = 2.75 m (see "Thrust plate and how it meets the skirt"). The datum is the outer ring's exit plane. The inner ring's exits hang about 0.2 m below it and the centre trio's about 0.5 m below (see Engines).
- The truss top stays at z = 72.3 m under this datum, so heights measured down from it are unaffected.
- Azimuth 0° is the rudder grid fin (the stem of the T), increasing counterclockwise seen from above, so the two catch fins sit at 90° and 270°.
- NASASpaceFlight puts the catch fins on the port and starboard sides, and the third fin on the non-tower side, which is the ship's heat-shield side (**Reported**, NSF May 2025). So azimuth 0° lines up with the ship's tiled windward side and the tower side is at 180°. This fixes how the ship is clocked on the booster.
- The other azimuths were measured from photos.
  - Each photo's viewing direction was fitted from features whose azimuth is known: the fin pods, the truss brackets or the chines.
  - Each part's azimuth was then read from where it falls across the hull's width.
  - As a cross-check, the polished hull reflects the launch tower as a dark vertical band, which always appears halfway between the tower side and the camera. That band is a reflection, not a part, so leave it off the model.
- Estimated heights were measured in two NASASpaceFlight side-on photos: the Pad 2 side view, where the hull is about 105 pixels across, and the B20 lift photo, where it is about 102. Each is scaled from the 9 m diameter, corrected for the camera looking up, and counted down from the top of the truss at z = 72.3 m.

### Construction

| Item | Detail |
|---|---|
| Barrel | 36 stacked steel rings: a 25-ring main tank assembly (the 2-ring aft section, five 4-ring LOX barrels and the 3-ring common-dome section) with an 11-ring forward section on top (two CH4 barrels plus the staging ring that holds the forward dome). **Reported** (NSF Starfactory article; Starship SpaceX Wiki, B19) |
| Order, bottom to top | Aft section with the engines, LOX tank, common dome, CH4 tank, forward dome, hot-staging truss. **Reported** |
| Ring height | Standard V3 rings are about 2 m tall. **Reported** (NSF Sept 2025, describing the B18.3 forward test tank). With the engines counted in the 72.3 m (see the reference frame), the barrel from the skirt's bottom edge (z ≈ 2.75 m) to the base of the 4 m hot-staging ring (z ≈ 68.3 m) is about 65.5 m. If the 36 rings fill that span, they average about 1.8 m each, close to the 1.83 m (6 ft) rings of earlier boosters (**Estimated**). Measure before drawing panel lines. |
| Tanks | The CH4 tank is shorter and the LOX tank longer than on V2. **Reported** (NSF). Dome positions and tank lengths aren't published. |
| Fuel transfer tube | About 50 m tall and 3 m wide, carrying methane from the CH4 tank down through the LOX tank to the engines. **Reported** (NSF). SpaceX calls it roughly the size of a Falcon 9 first stage (**Published**). It is internal. |
| LOX landing tank | A separate tank that feeds the inner 13 engines, now beside the main LOX tank. **Reported** (NSF; Starship SpaceX Wiki). It is internal. |

### Engines

All 33 Raptor 3s mount to one steel thrust plate that carries the thrust of every engine. On V1 and V2 the inner 13 hung from a thrust puck in the aft dome. **Reported** (NSF; Wikipedia for V1/V2). The plate tapers downward, so the engines hang lower out of the skirt than before, and metallic tiles cover its exposed steel for heat protection (**Reported**, NSF May 2025 and May 2026). The large individual engine shrouds are gone. Shielding now covers the surface between the engines and the thrust vector control hardware on the inner 13 (**Published**).

| Group | Count | Gimbal | Angular spacing | Pitch-circle radius |
|---|---|---|---|---|
| Centre | 3 | Yes | 108° / 108° / 144°, where earlier boosters used 120°. **Reported** (NSF; the bottom views show the same) | About 1.1 m ± 0.1 m (**Estimated**, two bottom views) |
| Inner ring | 10 | Yes | 36°, confirmed by fitting the engine positions in two bottom views (**Estimated**). On V3 the ring is rotated so no engine sits over the ridge of Pad 2's flame diverter (**Reported**, NSF). | About 2.5 m ± 0.1 m (**Estimated**, B20 liftoff view; see below) |
| Outer ring | 20 | No, fixed | 18°, confirmed by fitting the engine positions in the B20 aft close-up (**Estimated**) | About 4.4 m ± 0.1 m, so the engine centres sit just inside the hull line and the nozzles overhang it (**Estimated**; see below) |

- **Nozzle size.** Wikipedia gives a diameter of 1.3 m and a length of 3.1 m for Raptor, without separating Raptor 3 (**Reported**). In NASASpaceFlight's Booster 20 photos the booster nozzle exits measure about 1.33 m ± 0.1 m across (**Estimated**).
- **Outer-ring fit.** Twenty nozzles about 1.3 m across can't sit side by side inside the 4.5 m hull radius. They need a pitch circle of at least about 4.15 m, so they must hang partly outside the hull line, and the photos show this.
  - In NASASpaceFlight's B20 aft close-up the camera faces one outer engine square on. The gaps between that engine's exit and its neighbours' are only about 0.03 nozzle diameters (8 pixels against 240), and the spacing of the next three engines on each side fits the same circle. That puts the pitch circle at about 3.34 nozzle diameters (**Estimated**).
  - In the B20 liftoff view from below, an ellipse through 16 outer exits has a semi-major axis of about 3.41 nozzle diameters (**Estimated**).
  - With 1.3 m exits these give 4.35 m and 4.43 m, so the pitch-circle radius is about 4.4 m ± 0.1 m (about 4.5 m if the exits are 1.33 m). The engine centres sit about 0.1 m inside the hull line, and the nozzle edges reach about 5.05 m from the axis, about 0.55 m outside the hull (**Estimated**).
  - In the B20 lift photo the outer nozzles' silhouette is about 1.12 to 1.17 times the hull width, depending on how its blurred edges are read, which fits.
  - The earlier figure of 4.6 m ± 0.25 m, from a fit of 3.45 nozzle diameters and the high end of that silhouette, and an earlier rough 4.3 m are superseded.
- **Protrusion.** Nearly the whole engine, powerhead included, hangs below the skirt. In the B19 and B20 close-ups each outer engine hangs from a collar at the skirt's bottom edge, about 2.75 m ± 0.1 m above its nozzle exit, and the conduit band's lowest pipe is about 3.5 m above it (**Estimated**). Raptor 3 measures about 2.9 m from the nozzle exit to the top (see "Raptor engines"), so the top of each outer engine sits just inside its collar. That fits NSF's report that the tapered thrust plate makes the engines protrude further.
- **Layout of the three groups.** Two bottom views of the glowing nozzle exits agree on how the groups sit relative to each other: B20 at Flight 13 liftoff, and B21 in flight on Flight 14. In each, the outer ring fits an ellipse to within 0.3% to 3%, with 18° spacing (**Estimated**).
  - Each inner-ring engine sits midway between two outer-ring engines, at 9° ± 3° from them.
  - Each centre engine sits midway between two inner-ring engines.
  - In the B20 liftoff view the inner ring's own ellipse has a semi-major axis of 0.57 times the outer ring's, about 1.94 nozzle diameters, so the inner ring's radius is about 2.5 m ± 0.1 m (**Estimated**; it replaces an earlier 2.6 m ± 0.2 m). The centre trio's 1.1 m hasn't been re-measured.
  - The exits step down toward the middle. The inner ring's nozzle exits are about 0.2 m below the outer ring's, and the centre trio's about 0.5 m below (± 0.1 m; the two photos agree), which fits NSF's tapered thrust plate.
- **Clocking against the fins.** The Flight 14 photo shows the grid fins and a chine as well as all 33 exits, so it ties the pattern to the fins directly.
  - The camera direction is about 27° ± 2°. That comes from three readings: the rudder fin's offset across the hull, where the catch fins' tips fall, and the catch fins' relative heights (**Estimated**). An earlier fit of 17.5° used a misread hull centreline and is superseded.
  - The engines alone give the same direction, about 26.6°, if the pattern is mirror-symmetric about the rudder–tower line. The bracket-aligned alternative would need about 16°, which the fins rule out by about 10°.
  - So the 33 engines are mirror-symmetric about the rudder–tower line, like the fins, truss brackets, chines and raceway (**Estimated**, ± 3°):
    - The outer ring is at 9° + 18°·k, so each grid fin, and the raceway side at 180°, sits midway between two outer engines.
    - The inner ring is at 18° + 36°·k, so inner engines sit directly below the two catch fins.
    - The centre trio is at 0°, 108° and 252°. Its single engine is on the rudder line, and its 144° gap is centred on 180°.
  - The earlier side-view estimates for the outer ring (4° and 8° + 18°·k, and 12° on one reading) also sit closer to 9°. The liftoff photo shows no fin or chine, so it can only confirm the relative layout.
- **Which way each engine faces.** Every engine is turned so its front, where its number is painted, faces away from the booster's axis, and its two coolant pipes run round the booster on either side of it rather than out from it (**Estimated**, B19 and B20 close-ups; see "Plumbing on the flight engines" under Raptor engines). Each gimballed engine's two steering actuators sit either side of its front (see the next section).
- **Relighting.** All Raptor 3s on the booster can relight (**Reported**, Wikipedia), and Pad 2 has no ground spin-start connections for the outer 20 (**Reported**, NSF Pad 2 article).

### Thrust plate and how it meets the skirt

- On V3 the engines no longer hang from a dome. A single steel plate carries the thrust of all 33 Raptor 3s and closes the bottom of the 2-ring aft section (**Reported**, NSF May 2026; the 2-ring aft section from NSF's Starfactory article). Wikipedia calls it an updated aft dome with metallic heat-shield tiles mounted on it (**Reported**).
- The plate tapers down toward the middle, so the engines hang lower than before, and metallic tiles cover its exposed steel (**Reported**, NSF). Its tiled underside shows as a speckled surface between the engines in the close-ups.
- The large aft cavity, the individual engine shrouds and the CO2 fire suppression are gone, and shielding now covers the surface between the engines and the TVC hardware on the inner 13 (**Published**). NSF says the only shielding left on the engines is round the main propellant valves, the TVC actuators and the primary inlets (**Reported**).
- What NASASpaceFlight's close-ups show: B20's aft end from the side (July 2026), an aft end from below (May 2026), and B19 in its first engine tests in March 2026, unpainted and with only some engines fitted. Heights are scaled from the 1.3 m nozzle exits, ± 0.1 m (**Estimated**):
  - The aft skirt is flush with the hull, and it is painted black on B19 and B20 in flight trim. Its bottom edge is at about z = 2.75 m, where the plate's tiled underside starts.
  - Each outer engine hangs from a dark collar about 0.58 m across, between its top plate and the skirt's bottom edge.
  - Above each collar a dark housing stands on the skirt, from its bottom edge to about z = 3.3 m, just below the band's lowest pipe. It is about 0.56 m wide and 0.55 m tall with rounded corners, and its front is about 0.2 m proud of the skirt, about 4.7 m from the axis. Going by NSF's description, the housings are probably the shields over those engines' inlets and valves (inference).
  - Between the housings the skirt has a small rectangular opening, about 0.15 m wide and 0.24 m tall, centred at about z = 3.05 m.
  - The gimballed engines hang from the plate on a dark block about 0.33 m across, above their top plates. In the March photo the centre engine E1 and the inner engine E4 each measure about 3.0 m from nozzle exit to plate, so the plate is about z = 2.8 m at the inner ring and 2.5 m round the centre trio. Some blocks carry painted numbers (141 in the March photo, 467 in the May photo).
  - Two actuators in a V steer each gimballed engine. They are dark rods about 0.13 m thick, running from the engine's manifold disk (about 2.05 m above its exit and 0.3 m from its axis) up to the plate (about 0.5 m from its axis), one either side of the engine's front. The March photo shows them on E1. Their exact angles aren't measured; the model puts them 45° either side of the front.
  - In the March photo, open square frames hang under the skirt at the outer-engine positions that had no engine yet. They look like fixtures for the empty mounts rather than flight hardware (inference); B20 doesn't have them.
- How the plate is joined to the skirt wall (welded, bolted, or carried by a separate thrust ring) isn't documented and can't be seen in the photos.

### Hot-staging truss

- Sits on top of the CH4 tank and carries the ship. It is an open, N1-style truss, and the ship's exhaust hits the forward dome directly (**Reported**, NSF). The dome is covered by a non-structural steel layer (**Published**).
- The struts zigzag between a top ring and brackets on the tank wall: 20 brackets, 20 attachment points on the ring and 40 struts (**Estimated**, confirmed in the fin close-up and the B20 lift photo).
  - The brackets sit at 0° + 18°·k, so there is a bracket directly above each grid fin (0°, 90° and 270°) and one at 180° on the raceway side. In the close-up, the brackets above the rudder and the near catch fin line up with the fin pods to within about 1° (**Estimated**, ± 1.5°).
  - The ring attachment points sit midway between the brackets, at 9° + 18°·k (**Estimated**, ± 3°, from the B20 lift photo).
  - Each ring attachment takes two struts side by side, about 0.4 m (roughly 5°) apart. The two struts spread down to the neighbouring brackets, so each inverted V spans about 5° at the top and 18° at the bottom, and each bracket takes one strut from each neighbouring V.
  - The struts lean about 8° to 10° from vertical, around the hull rather than inward (**Estimated**).
  - No irregular struts or gaps show between about 160° and 360°, the arc covered by the photos, which includes the struts above the rudder and the 270° catch fin. The 0° to 160° side, including the 90° catch fin, and the ship's attachment actuators haven't been seen closely.
- About 4 m tall, so about z = 68.3 to 72.3 m. NASASpaceFlight describes the hot-staging ring on the B18.3 forward test tank as nearly four metres tall (**Reported**, NSF Sept 2025).
- The photo measurement gave only about 3.0 m ± 0.3 m from the top of the tank wall to the top of the truss ring (**Estimated**). That may cover just the open truss rather than the whole ring.
  - NASASpaceFlight's photo of Booster 21 and Ship 41 stacked on Pad 2, whose camera looks up only about 6°, agrees: about 3.0 m ± 0.15 m from the bracket tops to the top of the truss's ring, which shows as a light band about 0.3 m deep under the ship's dark skirt (**Estimated**, scaled from the 9 m hull at about 10.8 pixels per metre).
- The actuators that hold the ship to the booster retract after separation (**Published**).
- Struts and brackets, from NASASpaceFlight's truss and fin close-up (**Estimated**):
  - Each strut is a steel tube about 0.2 m to 0.25 m across, tapering to a point at both ends where it meets its fitting.
  - The brackets are dark U-shaped clevises, about 0.25 m wide and 0.6 m tall, on the tank wall just below its top edge. The pointed ends of two struts, one from each neighbouring V, meet at the top of each.
- **Forward dome.** The truss is built round the methane tank's forward dome, so the hot-staging ring is a direct extension of the dome rather than a separate part (**Reported**, Starship SpaceX Wiki).
  - The dome is exposed to the ship's engines at separation, protected by the tank pressure and a non-structural layer of steel (**Published**). NSF calls it added steel plating (**Reported**). In the close-up it shows as steel panels with rows of rivets.
  - The dome's curve starts at the seam where the tank wall stops, level with the bracket tops, and carries on up from the wall without a step (**Estimated**, close-up).
  - Its top is about 1.9 m ± 0.3 m above the top of the tank wall, about z = 71.2 m, leaving a dark gap about 1.1 m tall above it inside the truss (**Estimated**).
    - This comes from the stacked Booster 21 and Ship 41 photo. The curve of the truss ring there shows the camera looking up about 6°.
    - In the photo the dome's outline shows about 1.4 m above the bracket tops. Rendered from the same angle, a 1.9 m model dome shows the same.
    - An earlier reading of 2 m to 3 m from the Pad 2 side view overcorrected for that camera looking up 14°.

### Grid fins

- There are three, in a T. The two catch fins are on the port and starboard sides, at 90° and 270°. The rudder fin is on the non-tower side, which is the ship's heat-shield side, at 0° (**Reported**, NSF and Wikipedia; the azimuths follow from this frame).
- This layout keeps all three fins in the airflow during the glide back and descent (**Reported**, NSF May 2025).
- They sit on the CH4 tank just below the truss, lower than the old fins, to reduce heating during hot staging (**Published**; the position is **Reported** by NSF).
- Each fin pivots on a round bearing in a pod welded to the tank wall. The shaft, actuator and fixed structure are inside the CH4 tank (**Published**), so the pod is the only housing outside.
- A round port on the tank wall sits directly above each visible fin pod, between the pod and the truss bracket above it (**Estimated**, from the fin close-up). It is about 0.4 m across, with a ring of bolts, about 2 m above the pod's centre (**Estimated**, rough).
- SpaceX says they are 50% larger and stronger than the V1/V2 fins (**Published**). Tesla Oracle's estimate of about 7.5 × 3.75 m, against 5 × 2.5 m for the old fins, is unverified. Measured in the side view on Pad 2, allowing for the fins being turned about 18° from the camera, each fin reaches about 4.2 m ± 0.3 m out from the hull, is about 1.4 m ± 0.3 m deep from top to bottom, and is about 3.2 m ± 0.4 m wide around the hull (**Estimated**).
- **Depth.** The fin is about 0.5 m deep (**Estimated**). Tom judged a 0.8 m model fin much too thick against NASASpaceFlight's close-up. In that photo the side plate looks only about as deep as the 0.4 m spacing of its teeth, and in SpaceX's photo from above the plates come up to about the knees of the person standing in the fin. The 1.4 m above is the fin's apparent top-to-bottom extent: both photos look up at the fins, so the underside shows below the near edge. An earlier reading of 0.8 m, from taking off an assumed camera angle, overstated it.
- **Shape.** SpaceX's August 2025 photos of the first V3 fin show its shape best: one hanging from a crane beside a V3 render, and one lying in its build fixture with a person standing on it. SpaceX's V3 render shows the three fins from below, and NASASpaceFlight's close-up shows them on a booster. Copies are in `source_img/` (see Sources). From these (**Estimated** unless tagged):
  - Inside, the fin is a lattice of thin steel plates set diagonally to its edges, so its cells are diamonds.
  - Solid plates run along both sides of the fin (Tom's correction; they show as smooth bands in the photo of the hanging fin). The photo shows the plating carrying on round the cut-off outer corners and the outer end. These edge plates are notched like the lattice on the toothed face, so the outline still looks scalloped.
  - Seen from above it is roughly an octagon. The body is nearly square. At the root its two corners taper in at about 45° to a narrow root on the centreline, and its two outer corners are cut off at about 45°. Tesla Oracle describes the new fins as bulkier and more squarish, with rounded front corners (**Reported**). SpaceX's render shows all three as octagons from below.
  - Because the cells are diagonal, the 45° edges at the root and the outer corners run straight along cell walls. Along the tapered root edges those walls show as smooth plates.
  - Only one face is toothed (Tom's correction). On it the plates' edges rise to sharp points where they cross and dip in deep, rounded notches between, reaching nearly halfway through the fin. On the other face the plates' edges are straight, so it is flat, as in the photo of the hanging fin.
  - On the booster the toothed face is underneath, toward the engines: in NASASpaceFlight's close-up the fins' lower edges are scalloped and their tops straight.
  - In the photo from above there are 8 diamonds across the fin, counted along the cross plate, and about 11 to 12 rows of teeth from the cross plate out to the tip. Fitting that lattice to the 4.2 m reach gives a fin about 3.5 m wide and 3.9 m from root to tip, inside the measured ranges, with the plates about 0.3 m apart (**Estimated**).
  - A solid plate runs straight across the fin, parallel to the booster's side, between the two corners where the sides turn in toward the root (Tom's correction; it shows in the photo from above). Its toothed edge is cut in V shapes rather than rounded notches.
  - A triangular attachment area fills the root (Tom's correction). Two plates run from the ends of the root edge to the middle of the cross plate, and NASASpaceFlight's close-up shows the triangle as a solid area at the fin's root, next to the bearing. The fin joins the shaft that turns it there.
  - There is no box inside the fin (Tom's correction). The machined box with a bore in the photo from above belongs to the build fixture, under the triangle.
  - On the booster, a short neck runs from the fin's root to the pod. The pod is a round bearing about 1.2 m across, set on the tank wall, with a toothed or bolted rim. The fin's root sits close to the hull, about 0.2 m off it, with little more than the bearing between them (Tom's correction; NASASpaceFlight's close-up).
- The rudder fin's internal grid is angled so that air passes through it at a better angle (**Reported**, NSF). Wikipedia says the grids in the fin without an opposite are slightly angled to offset the asymmetry (**Reported**).
- Height: all three fins sit at the same height, to within about 0.3 m. They span about z = 64.6 to 66.1 m ± 0.5 m (**Estimated**). That is the apparent span; a fin about 0.5 m deep centred on it runs from about z = 65.1 to 65.6 m.
  - These figures come from the side view on Pad 2, corrected for perspective using the ellipse of the truss ring, which shows the camera looking up about 14°.
  - They were cross-checked on NASASpaceFlight's close-up of the fins, where a weld seam's curvature shows the camera looking up about 24°. In that photo the rudder and the near catch fin sit at the same height.
  - The 2 m drop reported earlier for the rudder was a perspective error: in photos taken from the ground, fins on the near side of the booster look higher than those on the far side.
  - In the stacked Booster 21 and Ship 41 photo the catch fins sit about 0.5 m higher than a model built to the span above, drawn from the same angle. That is within the ± 0.5 m, so the span stands.

### Catch and lift points

- They are on the two opposite grid fins, at 90° and 270°, and V3 has no separate catch pins on the hull as V1 and V2 had (**Reported**, NSF and Starship SpaceX Wiki). SpaceX says the fins add a new catch point and sit lower to line up with the tower's catch arms (**Published**). The fins take the booster's weight when it is lifted or caught (**Reported**, Starship SpaceX Wiki).
- Each of the two catch fins is fitted with a lifting pin, a new feature on V3. The rudder fin has none (**Reported**, NSF March 2026; Starship Gazer calls them lift/catch pins).
- Measured (**Estimated**, rough; the shape isn't documented):
  - Each pin hangs under its fin's root, just outboard of the bearing, about 0.3 m out from the hull. A short post comes down from the root triangle, and a steel bar at its foot, about 0.15 m wide and 0.1 m thick, points sideways round the booster, reaching about 0.5 m from the fin's centreline. Together they hang about 0.27 m below the fin's lower face.
  - Each fin has been seen from one side only. In the full-resolution copy of NASASpaceFlight's fin close-up, on the 270° fin seen from its rudder side, the bar runs from the foot of the post away from the camera, toward the tower side. In Starship Gazer's photo of B19 in Mega Bay 1, on the 90° fin seen from its tower side, the pin shows as a dark block about 0.4 m wide and 0.28 m tall. It sits further out along the fin than a bar pointing toward the tower would show, which fits a bar pointing toward the rudder. So both bars seem to point clockwise round the booster seen from above, rather than mirroring each other (tentative). The rudder fin's root in the close-up has nothing like them.
  - The dark patches on the hull beside and below the fin pods in several photos are flat stains or reflections, not hardware.
- Pad 2's chopsticks centre the booster with one sled on each catch beam and a telescopic pusher at each arm's tip, which together centre the vehicle's catch pins near the ends of the arms (**Reported**, NSF Pad 2 article). In NASASpaceFlight's photo of B19 being lifted onto the Pad 2 mount in March 2026, the two catch fins rest on top of the arms near their tips.
- No V3 booster has been caught yet. Booster 22, on Flight 15, is set to be the first attempt (**Reported**, NSF Sept 2026).

### Raceway and chines

- A single external raceway runs from the top about halfway down the booster, then goes inside and branches into one of the taller chines. It carries the flight termination charges, so the separate FTS raceways of V1 and V2 are gone (**Reported**, NSF).
- The raceway sits at about 178° ± 4°, on the tower-side centreline opposite the rudder fin (**Estimated**, from the Pad 2 side view and the B20 lift photo, which agree to about 3°; NSF implies the same side).
  - It looks roughly 0.5 m to 1 m wide, but that isn't pinned down.
  - Lower down, it can't be told apart from the rows of stringer rivets on the hull, so its lower end follows NSF's "about halfway".
- There are four chines on the LOX tank, holding avionics, COPVs and batteries (**Reported**, NSF May 2025 and May 2026). As on V1/V2, they give some lift during descent (**Reported**, Wikipedia).
- On V3 the two chines on the raceway side are taller and closer together, and the two on the rudder-fin side are shorter and farther apart. The wider spacing gives more lift during the glide back (**Reported**, NSF May 2025 and May 2026). The taller, raceway-side chine's chamfered top is at about z = 36.8 m ± 0.6 m (it agrees in the Pad 2 side view and the B20 lift photo). The shorter, rudder-side chine's top is at about z = 28.8 m ± 0.8 m, from the B20 lift photo, and the Flight 14 photo gives about 28.3 m. Both come down to the top of the aft conduit band, at about z = 4.95 m ± 0.15 m (**Estimated**, from the March 2026 B19 and July 2026 B20 close-ups, scaled from the nozzle exits). An earlier 5.9 m from the low-resolution B20 lift photo is superseded.
- Azimuths (**Estimated**, ± 5°, solved from the Pad 2 side view and the B20 lift photo together):
  - One taller chine is at about 160°, close beside the raceway, and one shorter chine is at about 301°.
  - If the pairs are mirror-symmetric about the rudder axis, as NSF's description implies, the other two are at about 200° and 59°. That puts the taller pair about 40° apart and the shorter pair about 118° apart.
  - The chines stand about 1.35 m off the hull, so their outer faces are about 5.85 m from the axis.
- Their bottom ends are cut at an angle. The inner corner meets the top of the conduit band, and the cut slopes upward toward the outer face, as seen in NASASpaceFlight's photo of B19's aft end.

### Lines down the side

| Line | Azimuth | Width | z range | Carries | Lines up with |
|---|---|---|---|---|---|
| Raceway | About 178° ± 4° (**Estimated**) | Roughly 0.5 to 1 m | From just below the truss (about 68 m) to about halfway down (**Reported**), then inside toward the taller chine at about 160° | Cables and the flight termination charges (**Reported**, NSF) | The tower side, opposite the rudder fin; the truss bracket at 180° sits above it |
| Narrow zigzag strip | About 318° ± 2° (**Estimated**) | About 0.15 m | From the top of the tank wall down past the fins, to at least z ≈ 58 m, the bottom of the fin close-up | Not documented; it may be a seam or cable cover | Nothing obvious; seen only in the fin close-up |
| Vertical pipe ending in a Y | Probably about 180°, on the tower side (**Estimated**, tentative) | About 0.2 m | Down the lower hull to the top of the conduit band (about z = 4.95 m), where it splits in a Y onto the hull | Not documented | In line with the raceway; the two QD plates sit symmetrically either side of it in the B19 aft photo. Seen in the B19 and B20 aft photos, and probably the long thin line at about 180° in the side views. An earlier reading put it at about 82°. |
| Aft conduit band | All the way round | Pipes about 0.05 m to 0.14 m across, standing up to about 0.15 m off the black skirt, which is flush with the hull, so the band is about 9.3 m across (**Estimated**). An earlier reading of 10.0 m is superseded. | z ≈ 3.5 to 4.95 m (**Estimated**, B19 and B20 close-ups; an earlier 3.3 to 5.9 m from the B20 lift photo is superseded) | Raptor commodities, tank pressurization, power, data, and spin-start and igniter gas (**Reported**, NSF) | The chines' cut ends come down to its top edge |

- **Conduit band in detail** (**Estimated**, B20 close-up, ± 0.1 m). Pipes run all the way round at about z = 3.53 m (the biggest, about 0.14 m across), 3.88, 4.43, 4.68 and 4.91 m. A row of 40 junction boxes spans about z = 3.88 to 4.33 m, one every 9°, so one sits above each outer engine and one between each pair. Each box is about 0.22 m wide and 0.15 m deep, and three thin pipes, about 0.05 m across, link each box to the next at about z = 4.0, 4.1 and 4.2 m. On B19 in March 2026, before it was painted, the same pipes and boxes show as bare steel.

No other external lines show in the photos. The many vertical rows of dots on the hull are rivets for the internal stringers, not lines.

### Aft skirt, quick disconnects and hold-downs

- The aft section is a 2-ring section that holds the thrust plate (**Reported**, NSF Starfactory article; Starship SpaceX Wiki). The black-painted part that carries the conduit band runs from the skirt's bottom edge at about z = 2.75 m to the band's top at about z = 4.95 m (**Estimated**); the section's full height hasn't been measured.
- A band of pipes and junction boxes runs around the outside of the aft end. It carries the Raptor commodities, the tank pressurization manifolds, power, data, and spin-start and igniter gas, which used to run inside the engine shielding (**Reported**, NSF). The CO2 fire-suppression system has been removed (**Published**).
- Two separate QD plates replace the single QD (**Published**). One is for LOX and the other for CH4, and both also carry other commodities (**Reported**, NSF May 2025 and May 2026). Their position on the skirt isn't documented. NASASpaceFlight's photo of B19's aft shows two foil-wrapped plates just above the conduit band, between two chines, which are probably these. They sit symmetrically either side of the vertical pipe that ends in a Y. If that pipe is the line at about 180°, the plates are on the tower side either side of it, but the photo has no usable scale, so their azimuths can't be read yet (**Estimated**, unresolved).
- On Pad 2 they mate with two triangular ground QD plates on the opposite side of the mount from where Pad 1's sat. The mount holds the booster with 20 hold-down clamp arms (**Reported**, NSF Pad 2 article). The fittings on the booster side aren't documented.

### Vents, thrusters, cameras and antennas

- V1/V2 had four vents in the interstage and more vents just below the common dome (**Reported**, Wikipedia). V3 vent positions aren't documented. NASASpaceFlight's close-up shows a round port on the tank wall directly above each visible fin pod, just below the truss brackets. Their purpose isn't documented.
- No cold-gas thrusters are documented on the V3 booster.
- SpaceX says V3 has about 50 camera views across the ship and booster (**Published**), but camera and antenna positions on the booster aren't published.

### Fins

Super Heavy has no fins besides the three grid fins. The chines are its only other aerodynamic surfaces.

## Starship V3 in detail

This section covers where things sit on the V3 ship. Each figure is tagged **Published** (SpaceX), **Reported** (credible press, Wikipedia or the Starship SpaceX Wiki) or **Estimated** (measured or derived from photos, with the method given). Gaps are left as gaps and listed under "Not published by SpaceX".

### Reference frame

- Ship z = 0 is the bottom edge of the aft skirt, where the ship sits on the booster's truss top (booster z = 72.3 m). So stack z = ship z + 72.3 m. z points up, in metres.
- Azimuth 0° is the windward (tiled) centreline, increasing counterclockwise seen from above. This is the same frame as the booster's: the ship's 0° sits over the booster's rudder fin, and 180° is the leeward, tower side.
- **Height check.** In NASASpaceFlight's photo of Booster 21 and Ship 41 stacked on Pad 2, the ship runs from its skirt's bottom edge at the truss top to the nose tip. That measures about 51.7 m ± 1.7 m, scaled from the 9 m hull and corrected for the camera looking up about 25°, which matches the published 52.1 m (**Estimated**). The camera angle comes from the curve of the skirt's bottom edge. So 52.1 m runs from z = 0 to the nose tip.
- Nothing has been seen hanging below the skirt into the truss; the engine nozzles' exit heights haven't been measured yet (see Engines).
- **Photo method.** Most ship estimates below come from NASASpaceFlight's photo of Ship 39 beside the Starfactory's "Gateway to Mars" sign (the "Starfactory photo"). Its camera sits at about 209°, roughly 130 m to 170 m away, looking up.
  - Heights are scaled from the 9 m hull and measured down from the nose tip at z = 52.1 m.
  - They are corrected for perspective. Because the camera looks up, a feature on the near side of the hull appears higher than a feature at the same height on the silhouette, by up to about 1 m.
  - Azimuths come from each feature's sideways offset from the hull's centreline.

### Construction

| Item | Detail |
|---|---|
| Barrel | 21 rings, each 1.83 m tall and 3.97 mm thick (**Reported**, Wikipedia), stacked in six sections. From the top: the nosecone plus three rings (the payload bay, N:3), the forward-dome section (FX:4), the common-dome section (CX:3), two LOX barrels (A2:3 and A3:4) and the aft section (AX:4) (**Reported**, NSF Starfactory article). |
| Order, bottom to top | Aft skirt and engine bay, LOX tank, common dome, CH4 tank, forward dome, payload bay, and the nosecone with the header tanks. **Reported** |
| Header tanks | In the nosecone: the LOX header tank at the top and the CH4 header tank directly below it. **Reported** (Wikipedia) |
| Tanks | V3 keeps V2's height but lowers the common dome and then the aft dome by about 1.106 m, which adds both CH4 and LOX. **Reported** (NSF May 2026). Dome positions aren't published; rough estimates are below the table. |
| Payload bay | 614 m³ for V2 (**Reported**, Wikipedia); the V3 figure isn't stated. |
| Nosecone | A tangent ogive about 13.7 m ± 1 m long, from where it leaves the cylinder at about z = 38.4 m to the tip at z = 52.1 m (**Estimated**). This comes from the 21 rings of 1.83 m below it, and it agrees with the silhouette in the stack photo. The taper first shows about 2 m above its true start, at about z = 40 m. The tip is rounded and covered in black tiles. The tile line steps out at about z = 39.5 m, level with the catch pins and about 1 m above the nosecone's base (see Heat shield). |

Domes (**Estimated**, rough). The weld lines don't show from outside, so these come from the ring sections plus a few clues.

| Section | z range (rings of 1.83 m from the skirt's bottom edge) | Dome in it |
|---|---|---|
| N:3 (payload bay) | 32.9 m to 38.4 m | None |
| FX:4 | 25.6 m to 32.9 m | Forward dome |
| CX:3 | 20.1 m to 25.6 m | Common dome |
| A2:3 and A3:4 (LOX barrels) | 7.3 m to 20.1 m | None |
| AX:4 (aft section and skirt) | 0 to 7.3 m | Aft dome |

- Bronze collars ring both raceways at z ≈ 21.5 m and 29.3 m (± 0.6 m) in the Starfactory photo. NSF says the raceways carry the FTS charges at the forward and common domes, so the collars may mark them.
- The 21.5 m collar would put the common dome low in CX. That gives a sensible propellant split:
  - a methane tank about 11.4 m long, up to a forward dome near the top of FX (z ≈ 32.9 m);
  - a LOX tank down to an aft dome near z ≈ 6 m ± 1.5 m, for a mixture ratio of about 3.6 (ignoring the domes' shapes and the header tanks).
- A forward dome near the top of FX also fits V2's 614 m³ payload bay. The nosecone (about 480 m³) plus the three payload-bay rings (about 350 m³), less the header tanks and the dome's bulge, comes to roughly that. With the dome at 29.3 m, the bay would be about 200 m³ bigger. So what the 29.3 m collar marks is still open.
- On V2 the common and aft domes sat about 1.1 m higher than on V3.

### Engines

- 3 sea-level Raptor 3s in the centre and 3 Raptor 3 Vacuums (RVacs) around them (**Reported**). The sea-level engines gimbal; the RVacs don't (**Reported**, Wikipedia).
- On V3 the RVacs sit slightly recessed into the LOX tank. The attic now covers only the tops of the RVacs, under a metal roof over a flattened thrust puck (**Reported**, NSF May 2026). The individual engine shrouds and the large aft close-out volume were deleted (**Published**).
- On V1 and V2 the RVacs mounted directly to the aft dome and the sea-level engines to the thrust puck at its bottom (**Reported**, Wikipedia).
- The pitch-circle radii and the clocking of the six engines aren't measured. No photo checked shows the engines from below together with something that fixes the clocking, such as the tile line or the aft flaps.
  - For V3, about 18 photos were checked: on the stand, in Mega Bay, at static fire, during stacking and at splashdown, plus the aft close-up.
  - As a V2 stand-in, these were also checked:
    - the Ship 37 gallery on the Starship SpaceX Wiki;
    - NASASpaceFlight's 2025 Ship 35 and Ship 37 photos;
    - SpaceX's 2022 photo of Ship 24's engines from below, which is V1 and too oblique;
    - SpaceX's Ship 25 static-fire photos;
    - SpaceX's Flight 14 hot-staging video, which looks down from the ship.
- One bound holds (**Estimated**): the RVac nozzle exit is about 2.4 m, and it has to fit inside the 9 m hull. So each RVac's centre is at most about 3.2 m from the ship's axis. The sea-level engines, with exits of about 1.3 m, cluster near the centre.

### Flaps

- There are four: two forward flaps on the nosecone and payload bay, and two aft flaps on the sides of the engine bay and LOX tank (**Reported**). The hinges are sealed in aerocovers, the flaps carry static wicks, and both pairs have cameras in their hinges (**Reported**, Wikipedia).
- Forward flaps: since V2 they sit further leeward, are thinner and are angled, about 140° apart across the leeward side (**Reported**, Wikipedia). V3 didn't change them much from the outside (**Reported**, NSF May 2026).
- Forward flaps, measured (**Estimated**, Starfactory photo; ± 0.6 m and ± 5° unless noted). Each is a flat four-sided panel:

| Part | Position |
|---|---|
| Hinge line | At about 98° and 262°, close to the sides. Each runs up the nosecone surface from z ≈ 43.3 m, where the nose's radius is about 4.0 m, to z ≈ 48.6 m, where it is about 2.2 m. That is about 5.6 m along the slope. |
| Tip edge | About 2.0 m ± 0.2 m long and roughly parallel to the ship's axis, from z ≈ 42.4 m to 44.4 m. It sits about 3.7 m ± 0.4 m out from the hinge line. |
| Lower (trailing) edge | From the hinge's bottom end out to the bottom of the tip edge, dropping about 1 m on the way out. |
| Upper (leading) edge | From the hinge's top end down to the top of the tip edge, about 4 m lower, so it is strongly swept. |
| Flap planes | In this photo each flap is turned about 14° from radial toward the leeward side, so the two planes are about 136° apart. This fits the reported "about 140°", which describes the flap planes rather than the hinge positions. |

  - The leeward nose close-up and the stack photo agree with these figures within their larger errors, once the flaps' angle is allowed for.
- Aft flaps: the same size as on V2, but their tiles were redesigned to be pinned rather than glued wherever possible (**Reported**, NSF May 2026). Each is now driven by a single actuator with three motors instead of two actuators (**Published**).
- Aft flaps, measured (**Estimated**, Starfactory photo, ± 0.8 m). A sign hides their lower ends.
  - The leading edge meets the hull at about z = 15 m. It runs down and outward, steeply swept, to the top of the tip edge at about z = 8.6 m. The tip edge then runs down, parallel to the axis, out of sight.
  - The left flap is seen about 30° off face-on and reaches about 3.7 m to 4 m from the hull. That fits the table's 17 m span, which is about 4 m each side. The right flap is turned to a different angle in this photo, so it can't be checked.
  - Hinges: the photo is consistent with 90° and 270° (± 10°). The left flap appears from behind the hull's edge, as one hinged at 90° would from this camera, and the right flap's root is on the near side, as 270° would be.
  - A tiled cap tops each hinge at about z = 15 m; the right-hand one comes to a point. Next to the right flap, the black area reaches about 126° from windward, wider than the 104° to 108° tile line above and below it. That flap is turned toward leeward in this photo, so the black area is most likely the flap's own tiled face. No photo shows a raised fairing that wide; see Hinge areas below.
  - Both aft flaps are tiled on their leeward faces as well. The forward flaps' leeward faces are bare steel.
- **Hinge areas.** Ringwatchers' breakdowns of the V2 ship, whose flaps V3 keeps on the outside, show the hinge hardware close up (**Reported**, Ringwatchers; the photos are saved in `source_img/`, see Sources).
  - Aft flaps: four hinges along the root. The third from the top is the bulkier central hinge that carries the actuator: two control arms on V2, each with its own motor, and on V3 one actuator with three motors (see above).
  - The hinges sit behind the "static aero", a fixed tiled strip that runs the length of the root and bridges the gap between the hull and the flap. Its segments are fitted to each barrel section before stacking. On V2 the engine chill vent pipes run down behind it.
  - A tiled "leading edge aero cap" covers the top of the hinge. It is streamlined: it carries on up from the flap's root at about the strip's width and tapers into the hull, continuing the slope of the flap's leading edge, to a rounded tip.
  - Measured in the stowed-flap photos (**Estimated**, scaled from the hex tiles, which are about 0.25 m across): the static aero is about 0.6 m to 0.8 m wide, and the cap about 0.8 m wide at its base, with its tip about 1.5 m to 1.7 m above the flap's root. An earlier reading of 1.3 m for the cap's width took in the flap's root beside it.
  - Nothing else stands out along the hinge line when the flaps are out. With a flap stowed toward leeward, a hinge's struts show between the hull and the flap's root, and white blanket material shows at the root's windward edge. On V2 the engine chill pipes come out from under the static aero near the bottom of the skirt and bend away from its wall; whether V3 keeps them isn't documented. NSF reports that V3's new RCS has outlets fed by pipes through the aft flap hinges onto a plate that steers the gas (see Vents, RCS thrusters, cameras and antennas), but no photo checked shows them.
  - The aft flaps taper. Each is about 0.7 m thick at its rounded root and about 0.35 m at the outboard edge, so the faces aren't parallel (**Estimated**, from a photo of a flap on its transport stand, scaled from its roughly 4 m span; Ringwatchers reports the taper).
  - Forward flaps (V2 and V3): three hinges, small upper and lower ones and a bulkier central one, and a single control arm at the central hinge, so probably one motor per flap. The flaps are one thickness throughout, about as thin as the old flaps' outboard edges. Their static aero is a much smaller strip than before, mostly hidden from the airflow behind the nosecone, and they have no cap at the top (**Reported**, Ringwatchers).
- **Flap sections** (**Reported**, Ringwatchers, with photos): every edge is rounded and the faces between are flat. A V2 forward flap's end, seen on its trailer, is stadium-shaped: one thickness with semicircular leading and trailing edges. The aft flaps taper from root to outboard edge, and their root, outboard edge and swept leading edge are rounded too.

### Heat shield

- About 18,000 hexagonal tiles, pinned with small gaps for expansion, over a secondary ablative layer (**Reported**, Wikipedia).
- V3 changes (**Reported**, NSF May 2026):
  - There is a new, simpler tile pin.
  - One horizontal seam was removed from the nosecone.
  - The aft end now uses the standard hull tile.
  - Specially cut transition tiles sit at the forward and aft dome seams.
  - Ships 39 and 40 carried test patches with a purple adhesive on the leeward side.
- Tile line (**Estimated**, ± 5°): on the barrel, the tiles reach about 105° either side of the windward centreline, about 15° past each side.
  - It measures about 104° to 105° on the payload bay (the leeward nose close-up and the Starfactory photo) and about 108° at the skirt (the aft close-up).
  - In the stack photo, which faces mostly windward, the whole visible face is tiled.
- On the nosecone the tiles wrap further, to about 128° (**Estimated**, Starfactory photo). So the forward flaps' hinges, about 98° from windward, sit inside the tiled area.
- The step out from the barrel's line is level, at about z = 39.5 m ± 0.3 m, in line with the catch pins (**Estimated**, from the full-resolution rollout photo of Ship 39, which sees both sides square on). That is about 1 m above the nosecone's base. An earlier reading of about 38 m from the Starfactory photo is superseded.
- The nose tip is tiled all the way round the top.
- Near the aft flaps, the tiled hinge fairings widen the black area to about 126° (see Flaps).

### Payload bay and door

- The Starlink door ("Pez dispenser") opens by folding into the payload bay. The dispenser mounts on the forward dome (**Reported**, Wikipedia).
- V3 adds vents for the payload bay interior, to equalise its pressure before the door opens (**Reported**, NSF May 2026).
- Door, measured (**Estimated**, Starfactory photo): the outline of a long, closed slot with rounded ends, centred on the leeward side.
  - It runs from about 124° to 236° (± 4°), about 8.8 m around the hull. The 124° end is at the photo's edge, so that end assumes the door is symmetric about 180°.
  - It is about 0.85 m ± 0.1 m tall, at z ≈ 35.3 m to 36.2 m ± 0.5 m. That is near the middle of the payload bay's three rings, which run from z ≈ 32.9 m to 38.4 m.
  - Nothing else sits in the slot. The funnel-shaped fittings at 140° and 220° and the small round port near 185° are separate parts below the door. Their centres are about 0.9 m under its lower edge, at z ≈ 34.5 m, and they lie within the door's span of azimuths. The raceways' rounded tops are at about the same height, z ≈ 35 m.
- A band of vertical slots runs around the leeward side just below the door, at z ≈ 32.3 m to 33.3 m (**Estimated**). These may be the new payload bay vents; that isn't confirmed.

### Catch and lift points

- V3 ships have two catch pins on the nosecone, a refined design moved up from the payload bay section, where V2 carried them from Ship 35 on. The pin sockets used to lift ships since Ship 20, and the tiled ramps over them, are deleted, so the catch pins are now the main lifting point (**Reported**, NSF Nov 2025 and May 2026; Starship SpaceX Wiki for Ship 35).
- Ship 39 was squeeze-tested by a pair of chopstick simulators at Massey's, and in September 2026 the Pad 2 chopsticks lifted Ship 42 by its pins into a simulated catch position (**Reported**, NSF). No ship has been caught yet.
- Measured (**Estimated**) in NASASpaceFlight's photos saved in `source_img/` (see Sources): the full-resolution leeward view of Ship 39 rolling out to Massey's in February 2026, about 81 pixels per metre, with both pins in profile at the hull's edges; the full-resolution photo of Ship 39's nose from close below; and a close-up of a V3 ship's 270° pin with its cover off.
  - There is one on each side, at about 90° and 270° (± 10°), where the chopstick arms meet the ship. In the leeward views both stand out from the hull's edges at the same height.
  - Each is a tiled fairing shaped like a wedge, with a flat underside. Its top slopes down and out from the hull at about z = 39.9 m to an upright outer end about 0.44 m ± 0.05 m off the hull and about 0.15 m tall. Its underside is level at about z = 39.0 m ± 0.3 m.
  - Its sloping top and outer end are about 0.55 m wide. Its sides slope out to meet the hull, so where its underside meets the hull it is about 1.5 m wide (scaled from the hex tiles, about 0.25 m across, in the close-up).
  - A steel pad about 0.33 m wide and 0.1 m tall sits under the outer end. Before flight a red cover is strapped over the end.
  - The pins sit at the step where the tile line widens from the barrel's 105° to the nosecone's 128°, at about z = 39.5 m (see Heat shield), and about 2.5 m below the forward flaps' lowest corners.
  - This replaces the earlier estimate of z = 40 m ± 1 m, which came from where the chopsticks' arms hold Ship 42 (about 40.5 m) and a fitting at the right-hand edge of the Starfactory photo (about 39.4 m). Both agree with it.

### Quick disconnect and docking ports

- There are four passive (drogue) docking ports: two on the payload bay section and two on the aft section (**Reported**, NSF May 2026). SpaceX says V3 ships have docking ports and can be fitted with probes to act as tankers (**Published**).
- The aft pair flank the new ship QD plate. The plate is split between methane and oxygen, but it is still a single plate on the ground side, and it is designed for in-space propellant transfer (**Reported**, NSF; **Published**, SpaceX). The tower's ship QD arm mates with it (**Reported**, NSF Sept 2026).
- Aft end, measured (**Estimated**) on NASASpaceFlight's close-up of a V3 ship's aft end on its transport stand.
  - The camera faces the leeward centreline to within about 1°.
  - Sizes and heights are scaled from the 9 m hull, allowing about 5% because the near side is closer to the camera.
  - z is measured from the top of the stand, where the skirt's bottom edge sits.

| Item | Azimuth | z | Size and shape |
|---|---|---|---|
| QD plate | 180° ± 2° | 2.6 m to 3.5 m ± 0.2 m; main connectors at about 3.0 m | Two plates side by side between guide rails, each about 0.27 m wide and 0.87 m tall; about 0.8 m wide overall. Each has a large round propellant connector with its ground line. The right-hand one also has a grid of 8 small connectors. |
| Aft docking ports (drogues) | About 156° and 204° (180° ± 24°), ± 2° | About 2.2 m to 2.9 m ± 0.2 m (centre 2.55 m) | Dark grey drogue cones in steel housings about 0.8 m across that point straight out to leeward; see "Docking ports, measured" below |
| Attic vents | About 167° and 193° (180° ± 13°), ± 2° | Lower edge at about 2.4 m ± 0.2 m; the hood runs out of the frame above 3.7 m | Silver hoods about 0.75 m wide, open at the bottom. They are the lower ends of the raceways. |

- The dark funnels are the drogues. The hoods at the raceways' lower ends are the attic vents, matching NSF's description of "attic vents beside the QD plate and at the bottom of the raceways".
- The stack photo's estimate for where the QD arm meets the ship, z = 3.7 m ± 1 m, agrees with the plate's height.
- Payload bay pair (**Estimated**, Starfactory photo): the other two docking ports sit at about 140° and 220° (± 4°), at z ≈ 34.5 m ± 0.5 m, just below the door.
  - They are the same hardware as the aft pair. NSF's February 2026 close-up shows their housings fitted but still empty, which NSF describes as "a pair of drogue housings" (**Reported**, NSF Feb 2026).
  - The earlier reading of 1 m to 1.3 m across included the housings seen from the side.
- Docking ports, measured (**Estimated**) in NASASpaceFlight's photos saved in `source_img/` (see Sources). All four look the same.
  - Each is a steel housing tube about 0.8 m ± 0.05 m across, sticking out of the hull, with a dark grey drogue cone set in its open end. Distances are scaled from the 9 m hull in the aft close-up (about 207 pixels per metre on the near side) and the February close-up (about 73 pixels per metre).
  - The four housings' axes are parallel. They all point straight out from the leeward side, toward 180°, not radially. The aft close-up, taken from the leeward centreline, sees both aft drogues square on, and in the Starfactory photo, taken from about 209°, all four show the same side of their housings.
  - So each housing is longer on its outer side, where the hull curves away. Along its centreline it stands about 0.4 m ± 0.2 m out from the hull, so its inner edge is nearly flush and its outer side is about 0.7 m to 0.8 m long. This comes from the length of housing that shows in the Starfactory photo at full resolution, where the 140° housing also barely reaches past the hull's silhouette. The aft housings show slightly more length there, so they may stand out up to about 0.6 m. An earlier reading of about 1 m compared the blurred outline with the housing's true width, which overstates the length.
  - The housing's mouth is keyhole-shaped: a round opening with a notch about 0.2 m wide and 0.15 m deep at the bottom, seen in the February close-up before the drogues were fitted.
  - The drogue cone's rim is about 0.6 m across, held by 8 bolts on a circle about 0.5 m across. It narrows like a funnel to a central hole about 0.07 m across. How deep it goes doesn't show.
  - A tab about 0.2 m wide hangs from the bottom of the cone's rim into the notch, reaching about 0.14 m below the rim. It carries a small white label.
  - These are the passive (drogue) halves of a probe-and-drogue system. Ships fitted with probes carry the active halves (**Reported**, NSF May 2026).
- Tile test patches, not ports (**Estimated**): the two pairs of dark rectangles in the roadside photo, at about 142° and 218° (± 5°), are square patches of hexagonal tiles on the bare steel. The Starfactory photo shows the hex pattern on the 218° patches.
  - The upper pair are about 2.3 m × 2.4 m, at z ≈ 27.2 m to 29.7 m ± 0.6 m, on the methane tank.
  - The lower pair are about 3.6 m × 3.0 m, at z ≈ 11.7 m to 14.8 m ± 0.8 m.
  - They are probably the leeward test patches NSF reported on Ships 39 and 40 (see Heat shield).
- V3 ships carry DragonEye navigation sensors for rendezvous (**Published**).

### Interface with the booster

- The ship's aft skirt sits on the booster's truss top ring. The actuators that hold it retract after separation (**Published**).
- Their number and azimuths aren't documented, and none of the photos checked shows them. Those photos are the truss close-ups and the B20 lift photo, the stacked Pad 2 photo, and NASASpaceFlight's night photo of Ship 41 waiting to be stacked on Booster 21.
- The truss top ring has 20 strut attachment points at 9° + 18°·k (see the booster's Hot-staging truss). Actuators placed at the strut nodes would sit directly on the load path, so some of those azimuths are the likeliest places for them. That is an inference, not a measurement.

### Raceways and lines down the side

- V3's raceways were redesigned to carry the flight termination charges at the forward and common domes, so there is no separate FTS raceway (**Reported**, NSF May 2026).
- High-pressure outlet lines on the raceways suggest at least 32 COPVs (**Reported**, NSF May 2026).

| Line | Azimuth | z range | Carries | Notes |
|---|---|---|---|---|
| Raceway pair | About 165° and 195° (± 4°), 15° either side of the leeward centreline (**Estimated**, from the nose close-up, the Starfactory photo and the aft close-up). Near their lower ends they are at about 167° and 193°. | From their rounded tops at about z = 35 m, just below the door, down to the attic vent hoods at about z = 2.4 m (**Estimated**) | Cabling, COPV outlet lines and the FTS charges at the forward and common domes (**Reported**, NSF) | Ladder-like covers about 0.5 m to 0.75 m wide (**Estimated**) |
| Thin pipes | About 162° and 198° (± 2°) (**Estimated**, aft close-up) | Down to about z = 0.9 m; the upper end isn't measured | Not identified | About 6 cm across, with orange tips |

### Vents, RCS thrusters, cameras and antennas

- RCS: completely redesigned on V3 (**Reported**, NSF May 2026). On V1 and V2 there were cold-gas thrusters fed with ullage gas, four just below the payload bay and two on the LOX tank (**Reported**, Wikipedia). V3 has:
  - roll thrusters on the payload bay section, in two pairs facing opposite ways;
  - another set about midway down the ship;
  - outlets fed by pipes through the aft flap hinges onto a plate that steers the gas.
- Measured positions (**Estimated**, ± 5° and ± 0.6 m unless noted). These come from the Ship 39 nose close-up, whose camera sits at about 171° by the symmetry of these features, and from the Starfactory photo.
  - The payload bay's roll thrusters aren't identified for certain. Two round, flanged ports at about 211° and 224°, z ≈ 31.3 m, may be thrusters; a matching pair on the other side wasn't resolved. The funnel-shaped fittings at 140° and 220° are more likely docking ports (see Quick disconnect and docking ports).
  - A small round port, probably a vent or camera, sits on or near the leeward centreline (about 185°) at z ≈ 34.6 m.
  - A round port about 1 m across, ringed with holes, sits at about 224°, z ≈ 9 m ± 0.8 m. Its purpose isn't identified.
- Starlink dishes: two on the sides of the heat shield and two on the leeward side, on the nosecone (**Reported**, NSF May 2026).
  - The leeward pair show as dark squares about 0.75 m across, at about 148° and 212°, z ≈ 41 m ± 0.6 m (**Estimated**, Starfactory photo).
- Vents: two header-tank vents near the top of the nose on earlier ships (**Reported**, Wikipedia). V3 adds payload bay vents, and attic vents beside the QD plate and at the bottom of the raceways (**Reported**, NSF May 2026). For the attic vents' positions, see Quick disconnect and docking ports.
- A band of vertical slats runs around the leeward side at about z = 6 m ± 1 m, just above the aft hardware (**Estimated**, Starfactory photo). Its purpose isn't identified.

## Raptor engines

This section covers the Raptor 3 engines that V3 flies. Each figure is tagged **Published** (SpaceX), **Reported** (credible press, Wikipedia or the Starship SpaceX Wiki) or **Estimated** (measured or derived from photos, with the method given). Gaps are left as gaps and listed under "Not published by SpaceX".

These sizes are useful for modelling the engine bells.

| Engine | Size |
|---|---|
| Sea-level Raptor | About 3.1 m (10 ft) long, with a 1.3 m (4.3 ft) nozzle exit. The 3.1 m is Wikipedia's figure and isn't tied to a version; Raptor 3 measures about 2.9 m from the nozzle exit to the top (see Specifications). |
| Raptor Vacuum (ship only) | Nozzle exit about 2.4 m (7.9 ft); about 4.5 m long (**Estimated**, see Specifications) |

### Variants and where they fly

| Variant | Where on V3 | Gimbal | Notes |
|---|---|---|---|
| Raptor 3, sea-level, gimballed (NSF calls the ship's ones "Raptor Center", RC) | Booster: the centre 3 and the inner ring of 10. Ship: the 3 centre engines | Yes | Steered by electric actuators. SpaceX replaced the hydraulic system from Booster 9 on (**Reported**, Wikipedia) |
| Raptor 3, sea-level, fixed | Booster: the outer ring of 20 | No | See below |
| Raptor 3 Vacuum (RVac) | Ship: the 3 outer engines | No | Larger nozzle extension for use in vacuum |

- **Gimbal range.** The gimballed engines swing about ±15° on both axes (**Reported**, Everyday Astronaut). SpaceX released video of a Raptor firing at a 15° gimbal angle in September 2026, without saying which version (**Published**).
- **The fixed booster engines.** SpaceX hasn't said whether Raptor 3's outer 20 are a separate build.
  - On V1 and V2, the outer 20 had no start system of their own. The launch mount spun them up, so they couldn't relight (**Reported**, Wikipedia).
  - On V3 all 33 relight, and Pad 2 has no ground spin-start for the outer 20 (**Reported**, Wikipedia and NSF). So the fixed engines now carry their own start system.
  - They differ from the gimballed engines at least in their mount, which has no gimbal or actuators (**Estimated**).
- In 2021 Musk said every booster Raptor would be the same engine, dropping a planned "Raptor Boost" variant without gimbal (**Reported**, Teslarati).

### Specifications

Raptor 2 is given only where SpaceX published the figure for both versions.

| Figure | Raptor 3 sea-level | Raptor 3 Vacuum | Raptor 2 |
|---|---|---|---|
| Thrust | 280 tf in testing (**Published**, Aug 2024 and the April 2024 presentation). About 250 tf nominal as flown on V3 (**Reported**, Wikipedia, May 2026) | 306 tf (**Published**, April 2024 presentation). About 275 tf nominal on V3 (**Reported**, Wikipedia, May 2026) | Sea-level 230 tf, vacuum 258 tf (**Published**) |
| Specific impulse | 350 s in vacuum (**Published**; SpaceX doesn't say which, but it is the vacuum value, see below). About 333 s at sea level (**Estimated**, from the thrust and the exit area) | About 380 s in vacuum (**Reported**) | Sea-level engine, 347 s in vacuum (**Published**; SpaceX doesn't say which) |
| Mass, engine only | 1,525 kg (**Published**) | Not published | 1,630 kg (**Published**) |
| Mass with vehicle-side commodities and hardware | 1,720 kg (**Published**) | Not published | 2,875 kg (**Published**) |
| Chamber pressure | About 330 bar (**Reported**, Wikipedia; the Starship SpaceX Wiki gives 350 bar) | Same chamber | |
| Mixture ratio | About 3.6, oxygen to methane by mass (**Reported**, not tied to a version) | Same | |
| Throttle range | 40% to 100% (**Reported**, not tied to a version) | | |
| Expansion ratio | 34.34 (**Reported**, a 2019 figure) | 80 (**Reported**, not tied to a version); probably nearer 95 to 105 on RVac 3 (**Estimated**, see below) | |
| Throat | About 0.23 m across inside, the same on both (**Estimated**, see below). The outside of the cooling jacket there measures about 0.32 m. | Same | |
| Main combustion chamber | About 0.42 m across outside (**Estimated**, SpaceX's photo) | Same | |
| Nozzle exit | 1.3 m (**Reported**). Booster 20's exits measure 1.33 m ± 0.1 m (**Estimated**). | 2.4 m (**Reported**, a 2018 design figure). SpaceX's May 2025 photo of RVac 3 gives about 2.3 m ± 0.2 m (**Estimated**). | |
| Length, nozzle exit to top | About 2.9 m ± 0.15 m (**Estimated**) | About 4.5 m ± 0.3 m (**Estimated**) | |
| Gimbal | ±15° (**Reported**) | Fixed | |

- **Specific impulse.** SpaceX lists 350 s for the sea-level Raptor 3 and 347 s for the sea-level Raptor 2 without saying whether they are vacuum or sea-level figures. Wikipedia's infobox gives the sea-level Raptor's 350 s as its vacuum value and 327 s at sea level (**Reported**). The figures agree:
  - At sea level, air pressure on a 1.3 m exit takes off about 13.7 tf of thrust.
  - For Raptor 2, 230 tf at sea level is about 244 tf in vacuum, so 347 s in vacuum becomes about 327 s at sea level.
  - The same sum for Raptor 3 gives about 333 s at sea level from 280 tf and 350 s.
- **Throat.** The throat size comes from the thrust, the chamber pressure and an ideal nozzle. Both 280 tf at 350 bar and 250 tf at 330 bar give about 0.23 m to 0.24 m.
  - With an expansion ratio of 34.34, that throat gives a sea-level exit of about 1.35 m, which matches the photos.
  - An expansion ratio of 80 would give an RVac exit of only about 2.1 m. So with a 2.3 m to 2.4 m exit, RVac 3's ratio is probably nearer 95 to 105.
- **Raptor 3 length.** SpaceX's August 2024 photo shows Raptor 1, 2 and 3 standing side by side. Scaled to a 1.3 m exit, Raptor 3 measures 2.91 m from the plane of the nozzle exit to the top of the engine. A 1.33 m to 1.39 m exit would make it 3.0 m to 3.1 m.
- **RVac 3 length.** Two photos give it, assuming the RVac shares the sea-level engine's chamber and powerhead:
  - SpaceX's May 2025 photo of RVac 3 serial 8 next to sea-level Raptor 3 serial 6 gives about 4.4 m.
  - NASASpaceFlight's McGregor Live view of RVac 2 serial 580 lying on a trailer gives a length of about 1.95 times its exit diameter, about 4.5 m to 4.7 m.
- **A larger-nozzle RVac.** A development RVac 3 with a noticeably larger nozzle appeared in McGregor's parade in September 2026 (**Reported**, KWTX). Musk has said a Raptor 3 or 4 vacuum version with a "giant nozzle" will come later (**Reported**, Starship SpaceX Wiki). The ships flying now aren't known to carry it.

### Shape for modelling

**Sea-level Raptor 3** (**Estimated**).
- Measured from SpaceX's August 2024 photo of Raptor 3 serial 1, standing beside Raptors 1 and 2. Edge scans of the silhouette against the light wall give the outline, scaled to the 1.3 m exit (573 pixels per metre).
- h is the height above the plane of the nozzle exit. The radius is measured from the engine's axis, which comes from the symmetric bell.
- Accuracy: ± 0.02 m on the bell and ± 0.03 m elsewhere. If the exit is really 1.33 m to 1.39 m, scale everything up 2% to 7%.

| h (m) | Radius (m) | Part |
|---|---|---|
| 0 | 0.65 | Nozzle exit, 1.3 m across |
| 0.1 | 0.64 | Bell |
| 0.2 | 0.62 | Bell |
| 0.3 | 0.60 | Bell |
| 0.4 | 0.58 | Bell |
| 0.5 | 0.55 | Bell |
| 0.6 | 0.52 | Bell |
| 0.7 | 0.485 | Bell |
| 0.8 | 0.45 | Bell |
| 0.9 | 0.41 | Bell |
| 1.0 | 0.37 | Bell |
| 1.05 | 0.35 | Top of the visible bell |
| 1.09 to 1.14 | 0.40 to 0.42 | Manifold ring around the nozzle, where a coolant pipe joins |
| 1.15 to 1.45 | Hidden | Upper nozzle, hidden behind pipes on both sides in this photo. It narrows smoothly to the throat (about 0.23 m at h = 1.33 m on B20's engines). |
| 1.5 | 0.16 | Throat, outside of the cooling jacket. The bore is about 0.115 m in radius. |
| 1.6 to 1.75 | 0.21 | Main combustion chamber, with ribbed bands |
| 1.8 | 0.27 | Chamber flaring into the manifold disk |
| 1.85 to 1.98 | 0.29 | Wide manifold disk |
| 2.0 to 2.06 | 0.20 to 0.25 | Ring of bolts: the flange at the base of the powerhead |
| 2.1 to 2.4 | 0.17 to 0.23 | Powerhead body, on the plain side |
| 2.42 to 2.5 | 0.23 to 0.25 | Upper powerhead, with three round ports facing out |
| 2.56 to 2.60 | 0.25 | Top plate, about 0.50 m across |
| 2.60 to 2.67 | 0.20 | Ring of about 16 to 20 studs standing up from the top plate, on a circle about 0.39 m across (stud centres) |
| 2.63 to 2.75 | 0.14 | Domed hub inside the stud ring, about 0.28 m across |
| 2.75 to 2.91 | 0.11 | Central top port, about 0.22 m across, with a thin cover in the photo. The engine's top is at 2.91 m. |

- The powerhead isn't round. In this view of serial 1, one side carries the equipment:
  - a pipe about 0.09 m across, rather than a large duct, arcs from a bolted flange on the powerhead out to 0.66 m to 0.74 m from the axis between h = 1.9 m and 2.3 m, runs down at 0.57 m to 0.60 m from h = 1.5 m to 1.85 m, and curves in to the rings round the nozzle at h ≈ 1.1 m to 1.5 m. Behind it a fatter, corrugated duct runs straight down to an elbow into the top of the bell;
  - a capped port about 0.16 m across faces up at h ≈ 2.35 m, about 0.5 m from the axis;
  - a valve block sits between the port and the duct.
- On the opposite side, a smaller pipe loop reaches 0.29 m from the axis between h = 1.15 m and 1.45 m.
- So across the powerhead this view is about 1.0 m wide: 0.29 m on the plain side and 0.74 m on the side with the pipe. This photo doesn't show the engine from 90° round; the flight engines below do.
- SpaceX's close-up of Raptor 3 serial 1 on the McGregor test stand shows the same parts in more detail: the ribbed chamber, the pipe and the corrugated duct, and the manifold ring.

**Plumbing on the flight engines** (**Estimated**). The Raptor 3s flying on B19 and B20 in 2026 are tidier than serial 1. These figures come from NASASpaceFlight's B20 aft close-up, which shows an outer engine square on from outside the booster, scaled to its 1.3 m exit (± 0.03 m). Copies of the photos are in `source_img/` (see Sources).
- Each engine's front, where its number is painted on the nozzle and its "TCA SN" serial on the chamber, faces away from the booster's axis. Engines further round the ring show the same face turned with them, so every engine is clocked the same way relative to the booster's centre. B19's inner and centre engines in the March 2026 photo face outward too.
- Two coolant pipes, each about 0.08 m to 0.09 m across, run down the engine's sides rather than its front or back. Looking at the front:
  - the right-hand pipe leaves the manifold disk at h ≈ 2.05 m, runs out to about 0.6 m from the axis, down to h ≈ 1.5 m, and turns back in to a ring round the throat at h ≈ 1.47 m;
  - the left-hand pipe leaves the chamber below the disk at h ≈ 1.85 m, curves out to about 0.44 m from the axis and down into the manifold ring at the top of the bell.
- That manifold ring is a fat torus about 0.82 m across at h ≈ 1.17 m to 1.26 m, about 0.1 m higher than the ring measured on serial 1, with the bell carrying on up to it at about 0.35 m radius.
- The ring round the throat is about 0.55 m across, with a tube about 0.11 m thick. Two thinner rings band the chamber at h ≈ 1.63 m and 1.72 m.
- A shielded valve, a rounded canister, sits either side of the powerhead just above the disk: about 0.28 m wide from h ≈ 2.08 m to 2.36 m on the right, and about 0.24 m wide from h ≈ 2.02 m to 2.26 m on the left. A thin line hooks up from each to the top plate. NSF says the main propellant valves are among the few parts still shielded (**Reported**), so these are probably them.
- A ring of round ports, each about 0.07 m across, circles the upper powerhead at h ≈ 2.47 m.
- So across the sides the flight engine is about 1.1 m wide over its pipes, while front to back it is only as deep as its 0.58 m manifold disk.
- The collars, shields and gimbal hardware above the top plate belong to the vehicle; see "Thrust plate and how it meets the skirt".

**Raptor 3 Vacuum** (**Estimated**, coarse).
- Measured from SpaceX's May 2025 photo of RVac 3 serial 8, which stands about level with sea-level Raptor 3 serial 6.
- Scaled so the exit is 2.3 m, from serial 6 at about the same distance. Multiply by 1.04 to use the 2.4 m figure instead.
- Accuracy: ± 0.1 m across and ± 0.15 m in height.
- The engine's top is cut off at the photo's edge, so the upper part follows the sea-level engine's.

| h (m) | Diameter (m) | Part |
|---|---|---|
| 0 | 2.30 | Nozzle exit |
| 0.3 | 2.37 | Stiffening ring near the exit; the wall itself is about 2.28 m across |
| 0.85 | 2.05 | Band round the extension |
| 0 to 1.8 | | Lower extension: lighter grey, with close-spaced vertical ribs |
| 1.8 | 1.46 to 1.49 | Junction ring between the extension and the dark upper bell |
| 1.9 | 1.35 | Dark upper bell |
| 2.1 | 1.19 | Dark upper bell |
| 2.3 | 1.04 | Dark upper bell |
| 2.5 | 0.88 | Dark upper bell |
| 2.7 | 0.66 | Ring round the upper bell |
| About 3.0 | 0.32 outside | Throat |
| 3.0 to 4.4 | | Chamber and powerhead, as on the sea-level engine. Add 1.5 m to the sea-level table's heights from the throat up. |
| About 4.4 | | Top of the engine |

- The lower extension is nearly a cone, about 12° from the axis. It bulges slightly: about 2.05 m across at 0.85 m above the exit, where a straight cone would give about 1.9 m.
- The dark upper bell flares much faster, about 24° from the axis.
- Wikipedia describes the RVac's nozzle as an extended, regeneratively cooled nozzle (**Reported**). Whether the ribbed lower part is also cooled isn't published.

### Attachment points

- **Top mount.** In SpaceX's photos the only structural interface at the top of Raptor 3 is the studded top plate. So the engine probably hangs from it (**Estimated**):
  - the top plate, about 0.50 m across, is 2.56 m to 2.60 m above the nozzle exit;
  - a ring of about 16 to 20 studs stands up from the plate to about 2.67 m, on a circle about 0.39 m across at the stud centres;
  - inside the ring, a domed hub about 0.28 m across rises to about 2.75 m;
  - the central port continues to 2.91 m.
- On the RVac the same plate sits about 1.5 m higher, at roughly 4.1 m above its exit (**Estimated**).
- The gimballed engines pivot on a gimbal mount. The fixed outer 20 and the RVacs are mounted rigidly (**Reported**). Where exactly the pivot sits isn't published.
- **Shielding.** On V3 only the thrust vector control (TVC) actuators and the gimbal mounts appear to be shielded (**Reported**, NSF May 2025). SpaceX says shielding covers the surface between the engines and the TVC hardware on the booster's inner 13 (**Published**).
- **TVC actuators.** They are electric (**Reported**, Wikipedia). Their count and attachment points on Raptor 3 aren't published.
  - A two-axis gimbal is normally driven by two actuators about 90° apart.
  - A pair of clevis lugs on the powerhead's plain side, at about h = 2.1 m and about 0.2 m from the axis, may be one actuator's attachment (**Estimated**, tentative).
  - The second actuator's attachment would be round the other side, out of view.
- **Propellant inlets.** Two ports are capped for handling in SpaceX's photo (**Estimated**):
  - the central top port, about 0.22 m across and facing up, at h = 2.73 m to 2.91 m;
  - a port about 0.16 m across, also facing up, on the side with the bigger pipe at h ≈ 2.35 m, about 0.5 m from the axis.
  - They are probably the oxygen and methane inlets, with the oxygen entering through the centre of the mount; that isn't published. Raptor 2, in the same photo, shows the same pair of capped ports, its covers in red and blue.
- **Other connections.**
  - Igniters: torch igniters fire in both preburners. The main chamber has had no igniter since Raptor 2 (**Reported**, Wikipedia).
  - Spin-start: on V3 every engine starts and relights with its own system, the booster's outer 20 included (see Variants).
  - Pneumatics, power and data: their connections aren't documented. Raptor 3 moves most of its plumbing and sensors inside the engine's structure (**Reported**, Wikipedia), so few lines show on the outside.
- **RVac mounting.** The RVacs don't gimbal.
  - On V1 and V2 they mounted directly to the aft dome (**Reported**, Wikipedia).
  - On V3 they sit slightly recessed into the LOX tank. The attic covers only their tops, under a metal roof over a flattened thrust puck (**Reported**, NSF May 2026).
  - How the large nozzle is braced isn't documented. RVac 3 serial 8 shows no struts on the engine. Its nozzle is stiffened by the junction ring 1.8 m above the exit, the band at 0.85 m and the ring near the exit (**Estimated**).

### Where the engines sit on the vehicles

**Booster.** z = 0 is the outer ring's nozzle exits; see the booster's reference frame. These heights are **Estimated**, ± 0.2 m. They combine the engine's 2.9 m length with the measured exit heights.

| Group | Nozzle exits | Top plate and studs | Top of the engine |
|---|---|---|---|
| Outer ring (20, fixed) | z = 0 | z ≈ 2.6 m to 2.7 m | z ≈ 2.9 m |
| Inner ring (10, gimballed) | z ≈ −0.2 m | z ≈ 2.4 m to 2.5 m | z ≈ 2.7 m |
| Centre (3, gimballed) | z ≈ −0.5 m | z ≈ 2.1 m to 2.2 m | z ≈ 2.4 m |

- The skirt's bottom edge is at about z = 2.75 m. The outer engines hang from collars there, and the gimballed engines from blocks under the thrust plate, which is about z = 2.8 m at the inner ring and 2.5 m round the centre trio (**Estimated**; see "Thrust plate and how it meets the skirt"). NSF reports the plate is tapered (**Reported**).

**Ship.** z = 0 is the aft skirt's bottom edge.
- The engines' exit heights aren't measured, since no photo shows the ship's engines from below. Nothing has been seen below the skirt, so the exits are at or above z = 0.
- RVacs: with exits at the skirt edge, a 4.5 m RVac would put its top plate at about z = 4.1 m and its top at about z = 4.5 m, inside the aft section (AX, z = 0 to 7.3 m).
  - The aft dome is estimated at about z = 6 m ± 1.5 m, so that top would sit below the dome's rim.
  - For the RVacs to be recessed into the LOX tank, as reported, one of two things must hold. Either the aft dome dips to about z = 4.5 m or lower at the RVacs' radius (up to about 3.2 m from the axis), or the RVac exits sit higher than the skirt edge.
  - Neither is measured, so this is a constraint on the dome's depth or the exit height, not a confirmation (**Estimated**).
- Sea-level engines: they hang from the thrust puck under the aft dome and are about 2.9 m long. Their exit heights and the puck's height aren't measured.

## Earlier versions

The diameter is 9 m on every version.

| Version | Flights | Ship | Booster | Full stack |
|---|---|---|---|---|
| V1 (Block 1) | 1 to 6, Apr 2023 to Nov 2024 | 50.3 m (165 ft) | 71 m (233 ft) with the 1.8 m hot-staging ring, or 69 m (226 ft) without it | 121.3 m (398 ft) |
| V2 (Block 2) | 7 to 11, Jan 2025 to Oct 2025 | 52.1 m (171 ft) | 71 m (233 ft) with the 1.8 m hot-staging ring | 123.1 m (404 ft) |
| V3 (Block 3), current | 12 to 14, May 2026 to Sept 2026 | 52.1 m (171 ft) | 72.3 m (237 ft) with the integrated interstage | 124.4 m (408 ft) |

On V1 and V2 the booster had 4 grid fins, both stages used Raptor 2 engines, and a separate 1.8 m (5.9 ft) vented hot-staging ring sat on top of the booster. Flight 1 flew before that ring existed.

## Not published by SpaceX

SpaceX doesn't publish these, so they will need to be measured from reference photos or drawings:

- the length of the ship's nosecone (the tapered ogive)
- the outline and size of each flap
- the size of the grid fins
- the exact height of the V3 interstage truss
- the booster's engine pitch-circle radii, and how the engine pattern is clocked relative to the grid fins
- the Raptor 3 nozzle exit size on the booster, and how far the nozzles hang below the skirt
- the exact grid fin sizes, depth and heights, the cell count, and the shape of the catch fins' lifting pins
- the number of struts in the V3 truss
- the azimuths and lengths of the chines and the raceway
- the positions of the booster's QD plates, hold-down fittings, vents, cameras and antennas
- how the booster's thrust plate is joined to the skirt wall, and the forward dome's exact height
- the booster's dome positions, tank lengths and exact V3 ring height
- the ship's engine layout: the pitch-circle radii and clocking of the 3 sea-level and 3 vacuum Raptors, and how far their nozzles reach below the skirt
- the ship's flap planforms, hinge lines and deflection angles
- the ship's exact tile line, and the positions and sizes of its payload door, catch pins, QD plate, docking ports and vents
- the ship's dome positions and tank lengths, and the number and azimuths of the actuators that hold it to the booster
- Raptor 3's length, nozzle contour and powerhead outline; the RVac 3's nozzle exit, expansion ratio and length; where the TVC actuators attach; and where the propellant inlets and other connections sit

Rough estimates for many of these are in "Super Heavy V3 in detail" and "Starship V3 in detail".


## Sources

- [SpaceX Starship (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Starship): full-stack heights for Block 1, 2 and 3, and the booster and ship heights.
- [SpaceX Super Heavy (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Super_Heavy): the Block 3 booster height of 72.3 m, the 69 m and 71 m Block 1/2 heights, the 1.8 m vented interstage, the engine layout, and the Block 3 grid fin count, spacing and size. Also the catch points and internal actuators on the fins, the two quick disconnects, Raptor 3 relighting, the V1/V2 thrust puck, and the V1/V2 chines and vents. Also the electric thrust vector control used from Booster 9 on, the ground spin-start of the V1/V2 outer engines, the angled grid in the rudder fin and the tiled aft dome.
- [SpaceX Starship (spacecraft) (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Starship_(spacecraft)): the V1 and V2 ship heights, flap layout and angles, the 17 m span and the heat shield. Also the ship's 21 rings of 1.83 m, header tanks, payload bay, Starlink door, RCS, vents and engine mounting.
- [SpaceX Raptor (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Raptor): engine length, nozzle exit diameters and the switch from Raptor 2 to Raptor 3. Also Raptor 3's nominal thrust on V3, the chamber pressures, expansion ratios, masses, throttle range and mixture ratio, the RVac's regeneratively cooled nozzle, the preburner torch igniters, and Raptor 3's internal plumbing.
- [Spaceflight Now, Sept 21, 2026](https://spaceflightnow.com/2026/09/21/spacexs-super-heavy-booster-arrives-at-pad-ahead-of-first-orbital-starship-launch/): the Flight 14 booster is 72 m (236 ft) tall and 9 m across, and the ship is 52 m (171 ft) tall.
- [NASASpaceFlight, May 2026: Super Heavy Block 3](https://www.nasaspaceflight.com/2026/05/super-heavy-block-3-booster-future/): the open hot-staging truss, the 3 larger grid fins in a T formation, and Raptor 3 on the booster. Also the catch fins and rudder fin, the raceway and chines, the thrust plate, the engine clocking and shielding, the split quick disconnect, the aft conduits, and the 50 m × 3 m transfer tube.
- [Next Spaceflight: Starship](https://nextspaceflight.com/rockets/174/): stack heights of 124.4 m for V3, 123.1 m for V2 and 121.3 m for V1.
- [Space.com: Flight 12](https://www.space.com/space-exploration/launches-spacecraft/spacex-starship-v3-megarocket-first-test-flight) and [Flight 14](https://www.space.com/space-exploration/launches-spacecraft/spacex-starship-megarocket-flight-14-orbital-launch-success): flight dates, V3 status, and the ship's six engines.
- [SpaceX Updates: Starship V3 change highlights](https://www.spacex.com/updates/index): the grid fin changes, the integrated hot stage, the transfer tube, the aft shielding, the two QD points, the camera count and the Pad 2 changes.
- [SpaceX on X, Aug 2025](https://x.com/SpaceX/status/1955715300256616451): the first V3 grid fin, 50% larger and stronger.
- [NASASpaceFlight, Mar 2026: From Steel Rolls to Starship](https://www.nasaspaceflight.com/2026/03/steel-rolls-to-starship/): how the V3 booster and ship are stacked from ring sections.
- [NASASpaceFlight, Aug 2025: Starbase Pad 2](https://nasaspaceflight.com/2025/08/starbase-pad-2-advancements-pad-1/): the 20 hold-down arms, the two booster QDs, the chopstick sleds and the flame diverter ridge.
- [NASASpaceFlight, May 2025: The Future of the Starship Program, Block 3 and Mars](https://www.nasaspaceflight.com/2025/05/future-starship-block-3-mars/): the grid fins on the port, starboard and non-tower (heat-shield) sides, the chine spacing, the two quick disconnects and the aft metallic tiles.
- [NASASpaceFlight, Sept 2025: Eye on the future, as SpaceX prepare Pad 2 and Block 3 at Starbase](https://www.nasaspaceflight.com/2025/09/spacex-prepare-pad-2-block-3-starbase/): standard rings about 2 m tall and the nearly 4 m hot-staging ring on the B18.3 forward test tank.
- [Starship SpaceX Wiki: Booster 19](https://starship-spacex.fandom.com/wiki/Booster_19_(B19)) and [Super Heavy Booster](https://starship-spacex.fandom.com/wiki/Super_Heavy_Booster): the 25 + 11 ring stack, the catch points on the grid fins and the LOX landing tank position.
- [Starship SpaceX Wiki: Hot Staging](https://starship-spacex.fandom.com/wiki/Hot_Staging): the V3 hot-staging ring as a direct extension of the forward dome.
- [Tesla Oracle, Aug 2025](https://www.teslaoracle.com/2025/08/16/spacex-reveals-grid-fins-of-the-next-gen-starship-super-heavy-booster/): an unverified estimate of the V3 grid fin size, the description of their shape, and copies of SpaceX's grid fin photos.
- Grid fin reference images, saved in the gitignored `source_img/` folder:
  - `spacex_v3_grid_fin_hanging_and_render.jpg`: SpaceX's photo of the first V3 fin hanging from a crane, beside a V3 render (via [Tesla Oracle](https://www.teslaoracle.com/wp-content/uploads/2025/08/2nd-Gen-Super-Heavy-Grid-Fin-Design.jpg)).
  - `spacex_v3_grid_fin_from_above_person.jpg`: SpaceX's photo of the fin from above with a person for scale (via [Tesla Oracle](https://www.teslaoracle.com/wp-content/uploads/2025/08/Next-Gen-Super-Heavy-Grid-Fin-Human-Scale_web.jpg)).
  - `spacex_v3_vs_v2_grid_fins.jpg`: SpaceX's V3 render from below beside a V2 photo (via [Tesla Oracle](https://www.teslaoracle.com/wp-content/uploads/2025/08/Starship-Super-Heavy-Grid-Fins-1st-vs-2nd-Gen.jpg)).
  - `nsf_v3_grid_fins_and_truss_closeup.jpg`: NASASpaceFlight's close-up of the fins and truss on a V3 booster ([NSF, May 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8394-wmarked-scaled.jpg)).
- [Ringwatchers: The Business End: Starship's Upgraded Aft Section](https://ringwatchers.com/article/s33-aft): the V2 aft flaps' four hinges, static aero, leading edge aero cap and tapered profile, and the engine chill pipes behind the static aero.
- [Ringwatchers: It's About Damn Time: Starship's Upgraded Flaps & Nosecone](https://ringwatchers.com/article/s33-nose): the V2 forward flaps' three hinges, single control arm, constant thickness and smaller static aero.
- Flap hinge reference images from those two articles, saved in the gitignored `source_img/` folder (each credited to its photographer there):
  - `ringwatchers_aft_flap_hinge_stowed_v1_v2.jpg`: stowed aft flaps on V1 and V2, showing the static aero and the leading edge aero cap (RGV Aerial Photography; Shaun Gisler for Marcus House) ([image](https://api.ringwatchers.com/images/e2f45851-02c2-4eb1-a947-73dc17be71fb-large.jpg)).
  - `ringwatchers_aft_flaps_deployed_windward_v1_v2.jpg`: deployed aft flaps on V1 and V2 from the windward side (Shaun Gisler for Marcus House; Sean Doherty for WAI Media) ([image](https://api.ringwatchers.com/images/be8a0443-99cc-48f2-b641-732fb9bd9935-large.jpg)).
  - `ringwatchers_aft_flap_tapered_profile.jpg`: an aft flap on its transport stand, showing the tapered profile (Kevin Randolph for WAI Media) ([image](https://api.ringwatchers.com/images/cd87ed84-5c11-4340-ab27-e2f8691e1826-large.jpg)).
  - `ringwatchers_v2_aft_static_aero_segment.jpg`: a segment of aft static aero fitted to a barrel section before stacking (LabPadre) ([image](https://api.ringwatchers.com/images/6acab4a4-d11e-4956-bca5-289f4f12da0f-large.jpg)).
  - `ringwatchers_v2_aft_flap_central_lower_hinges.jpg`: the central and lower aft flap hinges on V2 (LabPadre) ([image](https://api.ringwatchers.com/images/e16469a1-2683-4476-9059-7fba74666080-large.jpg)).
  - `ringwatchers_v1_aft_flap_four_hinges.jpg`: the four aft flap hinges on V1 (RGV Aerial Photography) ([image](https://api.ringwatchers.com/images/9698f4ea-68b5-42a5-bd63-5aac088f9719-large.jpg)).
  - `ringwatchers_fwd_flap_static_aero_v1_v2.jpg`: the forward flaps' static aero on V1 and V2 (RGV Aerial Photography; LabPadre) ([image](https://api.ringwatchers.com/images/eee95c19-c9cd-429b-8d1c-003f4d517e2f-large.jpg)).
  - `ringwatchers_fwd_flaps_stowed_v1_v2.jpg`: stowed forward flaps on V1 and V2 (RGV Aerial Photography; Shaun Gisler for Marcus House) ([image](https://api.ringwatchers.com/images/5e6ff640-0b57-42e7-849e-1c2b1dc65109-large.jpg)).
  - `ringwatchers_v2_fwd_flap_hinge_attachments.jpg`: the three forward flap hinge attachments on V2 before the flap is fitted (SpaceX) ([image](https://api.ringwatchers.com/images/fd0d29bc-3741-4cf1-ac82-426fcb6f88b8-large.jpg)).
  - `ringwatchers_v2_fwd_flaps_deployed.jpg`: Ship 33's deployed forward flaps (Starship Gazer) ([image](https://api.ringwatchers.com/images/c2444435-ef10-4ad5-837a-b0d82a6f9f6c-large.jpg)).
  - `ringwatchers_v2_fwd_flap_lower_edge.jpg`: the lower edge of a V2 forward flap on its trailer, showing the stadium-shaped section (Starship Gazer) ([image](https://api.ringwatchers.com/images/d7e8ccaf-7d7e-4209-ba32-22df61238009-large.jpg)).
  - `ringwatchers_fwd_flap_thickness_v1_v2.jpg`: V1 and V2 forward flaps' thicknesses compared (Nic Ansuini; Starship Gazer) ([image](https://api.ringwatchers.com/images/81a22080-861c-422e-ac34-92c71faa01c9-large.jpg)).
- Ship docking port reference images, saved in the gitignored `source_img/` folder:
  - `nsf_v3_ship_aft_drogues_and_qd.jpg`: NASASpaceFlight's close-up of a V3 ship's aft end on its transport stand, showing the aft drogues and the QD plate square on ([NSF, May 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/COLLEEN-CRL00300-wmarked-scaled.jpg)).
  - `nsf_s39_payload_bay_drogue_housings.jpg`: Ship 39's nose and payload bay with the payload-bay drogue housings fitted but empty ([NSF, Feb 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39s-Nose-Cone-and-Paylod-Bay-scaled.jpg), from [Flight 12: Ship 39 rolls out to Masseys to begin testing](https://www.nasaspaceflight.com/2026/02/ship-39-masseys-testing/)).
  - `nsf_s39_starfactory_drogues_from_side.jpg`: the Starfactory photo, showing all four housings from the side ([NSF, May 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8534-wmarked-scaled.jpg)).
  - `nsf_s39_roadside_drogues.jpg`: Ship 39 on the road by the Starfactory with all four drogues fitted ([NSF, May 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8582-wmarked-scaled.jpg)).
  - `nsf_s39_quick_disconnect.jpg`: Ship 39's QD plates between the raceways' lower ends, with no aft drogues fitted yet ([NSF, Feb 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39-Quick-Disconnect-scaled.jpg)).
- Booster engine section and Raptor plumbing reference images, saved in the gitignored `source_img/` folder:
  - `nsf_b20_aft_engines_closeup.jpg`: B20's aft end from the side, with an outer engine square on to the camera; the main reference for the skirt, conduit band, housings, ring radius and plumbing ([NSF, July 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Engines-scaled.jpg), from [Booster 20 completes record duration Static Fire](https://www.nasaspaceflight.com/2026/07/booster-20-record-static-fire/)).
  - `nsf_b19_aft_engines_from_below.jpg`: an aft end with all 33 engines from below, most likely B19 ([NSF, May 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8810-wmarked-scaled.jpg), from [Super Heavy Block 3 the Booster of the Future](https://www.nasaspaceflight.com/2026/05/super-heavy-block-3-booster-future/)).
  - `nsf_b19_first_engine_test_partial_engines.jpg`: B19 unpainted during its first engine tests, with only some engines fitted, showing the gimballed engines' blocks and actuators ([NSF, March 18, 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/03/NSF-2026-03-18-18-41-35-084.jpg), from [Ship 39 and Booster 19 Both Complete Full Engine Static Fires](https://www.nasaspaceflight.com/2026/04/ship-39-booster-19-static-fire/)).
  - `nsf_b19_aft_conduits_no_engines.jpg`: B19's aft end before its engines, with the conduit band in bare steel ([NSF, Feb 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/COLLEEN_-_CRL00220-scaled.jpg)).
  - `nsf_b20_engines_at_liftoff.jpg`: B20's 33 exits from below at Flight 13 liftoff, used for the ring radii ([NSF](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Raptor-Engines-at-Liftoff-scaled.jpg)).
  - `spacex_raptor_1_2_3_side_by_side.jpg` and `spacex_raptor3_sn1_test_stand.jpg`: SpaceX's Raptor 3 reveal photos (Aug 2024), from the Starship SpaceX Wiki links further down.
- [NASASpaceFlight, May 2026: Flight 12 readies for the debut of SpaceX's next Ship evolution](https://www.nasaspaceflight.com/2026/05/fligth12-debut-spacex-ship-evolution/): the V3 ship changes, including the catch and lift points, docking ports, QD plate, lowered domes, smaller attic, RCS, raceways, Starlink dishes, vents and tiles.
- [NASASpaceFlight, Sept 2026: Ship 42 wraps chopsticks tests](https://www.nasaspaceflight.com/2026/09/ship-42-chopsticks-tests-flight-14-net/): the chopsticks lifting Ship 42 by its catch points, and the tower's ship QD arm mating with the ship.
- NASASpaceFlight photos used for the ship estimates: [Booster 21 and Ship 41 stacked on Pad 2](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/Booster-21-and-Ship-41-Stacked-scaled.jpg) (from the Flight 14 article above), [Ship 39's nose and payload bay](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39s-Nose-Cone-and-Paylod-Bay-scaled.jpg), [Ship 39 on the road by the Starfactory](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8582-wmarked-scaled.jpg), [Ship 39 beside the Starfactory's "Gateway to Mars" sign](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8534-wmarked-scaled.jpg) (the "Starfactory photo") and [a V3 ship's aft end on its transport stand](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/COLLEEN-CRL00300-wmarked-scaled.jpg) (all from the May 2026 ship article), and [Ship 42 held by the chopsticks](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/NSF-2026-09-14-17-44-21-003.jpg) (Sept 14, 2026). Also checked for the interface actuators: [Ship 41 waiting to be stacked on Booster 21](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/Ship-41-waiting-to-be-stacked-on-Booster-21-scaled.jpg) (Sept 2026).
- Checked for the ship's engine layout as a V2 stand-in; none gives a usable bottom view: [Ship 37 on the Starship SpaceX Wiki](https://starship-spacex.fandom.com/wiki/Ship_37_(S37)), NASASpaceFlight's [Ship 35](https://www.nasaspaceflight.com/2025/05/ship-35-sf-spacex-has-fleet-vehicles-flight/) and [Ship 37](https://www.nasaspaceflight.com/2025/08/ship-37-spin-prime-engine-swap/) articles (2025), SpaceX's [2022 photos of Ship 24's engines](https://interestingengineering.com/innovation/spacex-mars-raptor-engine-setup), SpaceX's [Ship 25 static-fire photos](https://www.space.com/spacex-starship-ship-25-engine-test-fire-photos) and SpaceX's [Flight 14 hot-staging video](https://starlust.org/video/w130-mury20fo/).
- NASASpaceFlight photos used for the engine layout and clocking: [B20's engines at Flight 13 liftoff](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Raptor-Engines-at-Liftoff-scaled.jpg) and [B21 and Ship 41 in flight on Flight 14](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/DSC05253-wmarked.jpg), both from [Ship 41 Makes it to Orbit, Booster 21 Nearly Perfect](https://www.nasaspaceflight.com/2026/09/starship-flight-14-orbit/) (Sept 2026). That article also says Booster 22 is set to be the first V3 booster caught.
- [NASASpaceFlight, Nov 2025: Starship Block 3 and HLS: The path to get back to the Moon](https://www.nasaspaceflight.com/2025/11/starship-block-3-path-moon/): the ship's catch pins refined and moved to the nosecone on Ship 39, and the lifting pin sockets and the ramps over them deleted.
- [NASASpaceFlight, March 2026: SpaceX enters a new era with Booster 19 testing on Pad 2](https://www.nasaspaceflight.com/2026/03/spacexs-booster-19-pad-2/): the lifting pins on the two catch fins, B19 lifted onto the Pad 2 mount by the chopsticks, and Ship 39's squeeze tests with the chopstick simulators. The chopstick simulators are also described in [Flight 12: Ship 39 rolls out to Masseys to begin testing](https://www.nasaspaceflight.com/2026/02/ship-39-masseys-testing/) (Feb 2026).
- [Starship Gazer on X, March 7, 2026](https://x.com/StarshipGazer/status/2030513829986160752): B19 in Mega Bay 1 with the new grid fins and their lift/catch pins.
- [Starship SpaceX Wiki: Ship (Starship's Second Stage)](https://starship-spacex.fandom.com/wiki/Ship_(Starship%27s_Second_Stage)): Ship 35 as the first ship with working catch pins.
- Catch pin reference images, saved in the gitignored `source_img/` folder:
  - `nsf_s39_rollout_catch_pins_leeward.jpg`: Ship 39 from the leeward side as it prepared to roll out to Massey's, at full resolution (9504 pixels across), with both catch pins in profile under red covers ([NSF, Feb 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39-preparing-for-rollout-to-Masseys.jpg), from the February 2026 Ship 39 article above).
  - `nsf_s39_nose_catch_pins_full.jpg`: the full-resolution original of Ship 39's nose and payload bay from close below, with both catch pins under their covers ([NSF, Feb 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39s-Nose-Cone-and-Paylod-Bay.jpg)).
  - `nsf_v3_ship_catch_pin_closeup.jpg`: the 270° catch pin on a V3 ship's nose with its cover off, showing the tiled fairing and the steel pad under it ([NSF, May 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/DSC09019-wmarked.jpg), from the May 2026 Flight 12 ship article).
  - `nsf_s42_in_chopsticks.jpg`: Ship 42 held by the Pad 2 chopsticks in a simulated catch position ([NSF, Sept 14, 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/NSF-2026-09-14-17-44-21-003.jpg)).
  - `nsf_b19_lifted_by_pad2_chopsticks.jpg`: B19 held by the Pad 2 chopsticks from the rudder side, its two catch fins resting on the arms (Gage, Rough Riders Show, for NSF; [March 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/03/IMG_9583-wmarked.jpg), from the March 2026 B19 article above).
  - `starshipgazer_b19_catch_fin_lift_pin.jpg`: the top of B19 in Mega Bay 1, with the lifting pin end-on under the 90° catch fin's root (Starship Gazer, [March 7, 2026](https://pbs.twimg.com/media/HC3VGs1XAAABRJY?format=jpg&name=orig)).
  - `nsf_v3_grid_fins_and_truss_closeup_full.jpg`: the full-resolution original (8058 pixels across) of the fin and truss close-up, which shows the 270° catch fin's lifting pin and the bare root of the rudder ([NSF, May 2026](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8394-wmarked.jpg)).
- NASASpaceFlight photos used for the other estimates: [Booster 20 lifted onto the mount](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Being-Lifted-onto-the-Mount-scaled.jpg) and [Booster 20's aft end close-up](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Engines-scaled.jpg) (both from [Booster 20 completes record duration Static Fire](https://www.nasaspaceflight.com/2026/07/booster-20-record-static-fire/), July 2026), [side view on Pad 2](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/COLLEEN-DSC09751-wmarked-scaled.jpg), [truss and grid fins](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8394-wmarked-scaled.jpg), [aft end with engines](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8810-wmarked-scaled.jpg) and [B19's aft end without engines](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/COLLEEN_-_CRL00220-scaled.jpg). The stacked [Booster 21 and Ship 41](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/Booster-21-and-Ship-41-Stacked-scaled.jpg) photo was also used for the hot-staging truss and dome heights.
- SpaceX's Raptor 3 reveal photos (Aug 2024), as hosted on the [Starship SpaceX Wiki's Raptor 3 page](https://starship-spacex.fandom.com/wiki/Raptor_3): [Raptors 1, 2 and 3 side by side](https://static.wikia.nocookie.net/starship-spacex/images/5/51/240803-Raptor3-update-SpaceX-Twitter-a.jpg), used for the sea-level profile, and [Raptor 3 on the McGregor test stand](https://static.wikia.nocookie.net/starship-spacex/images/4/44/240803-Raptor3-update-SpaceX-Twitter-d.jpg). The published figures (280 tf, 350 s, 1,525 kg and 1,720 kg, and the Raptor 1 and 2 comparison) are quoted in [NASASpaceFlight, Aug 2024: Flight 5 and 6 preparations as SpaceX reveals Raptor 3](https://www.nasaspaceflight.com/2024/08/flight-5-6-preparations-raptor-3/). The wiki page also gives the 350 bar chamber pressure and the 250 tf and 275 tf nominal thrust.
- [SpaceX's April 2024 presentation slide of the Raptor versions](https://static.wikia.nocookie.net/starship-spacex/images/6/6a/Raptor-engines-Variants-06-April-2024-SpaceX-Twitter.png), via the [Starship SpaceX Wiki's Raptor Engine page](https://starship-spacex.fandom.com/wiki/Raptor_Engine): sea-level and vacuum thrust for Raptors 1, 2 and 3 (306 tf for RVac 3). The same page quotes Musk on a later vacuum version with a "giant nozzle".
- [SpaceX's May 2025 slide photo of RVac 3 serial 8 and sea-level Raptor 3 serial 6](https://www.nasaspaceflight.com/wp-content/uploads/2025/05/Raptor-3.jpg), used for the RVac profile, from [The Future of the Starship Program, Block 3 and Mars](https://www.nasaspaceflight.com/2025/05/future-starship-block-3-mars/) (NSF, May 2025). That article also gives the "Raptor Center" (RC) name and the shielded TVC actuators and gimbal mounts.
- [NASASpaceFlight, Aug 2025: Raptor 3 testing ramps up at SpaceX McGregor](https://www.nasaspaceflight.com/2025/08/raptor-3-ramps-spacex-mcgregor/), with its [McGregor Live view of RVac 2 serial 580](https://www.nasaspaceflight.com/wp-content/uploads/2025/08/NSF-2025-08-12-02-40-47-269.jpg), used for the RVac's length-to-exit ratio.
- [Everyday Astronaut: Raptor 1 vs Raptor 2](https://everydayastronaut.com/spacex-raptor-engine-comparison/): the ±15° gimbal on both axes.
- [SpaceX video of a Raptor firing at a 15° gimbal angle](https://starlust.org/video/spacex-raptor-15-degree-gimbal-test-mp4-mujo5zz4/) (via Starlust, Sept 27, 2026).
- [Teslarati, July 2021](https://www.teslarati.com/spacex-elon-musk-starship-raptor-upgrades-2021/): Musk saying all booster Raptors, fixed or gimballed, would be the same engine.
- [KWTX, Sept 21, 2026](https://www.kwtx.com/2026/09/21/spacex-raptor-rocket-engines-roll-down-main-street-mcgregor-founders-day-parade/): the development RVac 3 with a larger nozzle in McGregor's parade.
