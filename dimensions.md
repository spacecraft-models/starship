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

- z = 0 is the plane of the engine nozzle exits, and z points up, in metres. The published 72.3 m appears to run from there to the top of the hot-staging truss. In NASASpaceFlight's photo of Booster 20 hanging from the chopsticks, scaled from the 9 m hull, the truss top is about 72.7 m ± 1.5 m above the nozzle exits but only about 69.4 m ± 1.5 m above the bottom edge of the aft skirt (**Estimated**; most of the ± comes from the hull-width scale). The published height therefore appears to include the engines, and the skirt's bottom edge is at about z = 3.3 m. The datum is the outer ring's exit plane. The inner ring's exits hang about 0.2 m below it and the centre trio's about 0.5 m below (see Engines).
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
| Ring height | Standard V3 rings are about 2 m tall. **Reported** (NSF Sept 2025, describing the B18.3 forward test tank). With the engines counted in the 72.3 m (see the reference frame), the barrel from the skirt's bottom edge (z ≈ 3.3 m) to the base of the 4 m hot-staging ring (z ≈ 68.3 m) is about 65 m. If the 36 rings fill that span, they average about 1.8 m each, close to the 1.83 m (6 ft) rings of earlier boosters (**Estimated**). Measure before drawing panel lines. |
| Tanks | The CH4 tank is shorter and the LOX tank longer than on V2. **Reported** (NSF). Dome positions and tank lengths aren't published. |
| Fuel transfer tube | About 50 m tall and 3 m wide, carrying methane from the CH4 tank down through the LOX tank to the engines. **Reported** (NSF). SpaceX calls it roughly the size of a Falcon 9 first stage (**Published**). It is internal. |
| LOX landing tank | A separate tank that feeds the inner 13 engines, now beside the main LOX tank. **Reported** (NSF; Starship SpaceX Wiki). It is internal. |

### Engines

All 33 Raptor 3s mount to one steel thrust plate that carries the thrust of every engine. On V1 and V2 the inner 13 hung from a thrust puck in the aft dome. **Reported** (NSF; Wikipedia for V1/V2). The plate tapers downward, so the engines hang lower out of the skirt than before, and metallic tiles cover its exposed steel for heat protection (**Reported**, NSF May 2025 and May 2026). The large individual engine shrouds are gone. Shielding now covers the surface between the engines and the thrust vector control hardware on the inner 13 (**Published**).

| Group | Count | Gimbal | Angular spacing | Pitch-circle radius |
|---|---|---|---|---|
| Centre | 3 | Yes | 108° / 108° / 144°, where earlier boosters used 120°. **Reported** (NSF; the bottom views show the same) | About 1.1 m ± 0.1 m (**Estimated**, two bottom views) |
| Inner ring | 10 | Yes | 36°, confirmed by fitting the engine positions in two bottom views (**Estimated**). On V3 the ring is rotated so no engine sits over the ridge of Pad 2's flame diverter (**Reported**, NSF). | About 2.6 m ± 0.2 m (**Estimated**, two bottom views) |
| Outer ring | 20 | No, fixed | 18°, confirmed by fitting the engine positions in the B20 aft close-up (**Estimated**) | About 4.6 m ± 0.25 m, so the engine centres sit roughly on the hull line (**Estimated**; see below) |

- **Nozzle size.** Wikipedia gives a diameter of 1.3 m and a length of 3.1 m for Raptor, without separating Raptor 3 (**Reported**). In NASASpaceFlight's Booster 20 photos the booster nozzle exits measure about 1.33 m ± 0.1 m across (**Estimated**).
- **Outer-ring fit.** Twenty nozzles about 1.3 m across can't sit side by side inside the 4.5 m hull radius. They need a pitch circle of at least about 4.15 m, so they must hang partly outside the hull line, and the photos show this.
  - In the B20 lift photo the outer nozzles' edges span about 10.5 m, 1.165 times the hull width.
  - In the B20 aft close-up a least-squares fit of nine engine positions gives a pitch-circle radius of 3.45 nozzle diameters, with 18° spacing.
  - Together these give a pitch-circle radius of about 4.6 m ± 0.25 m, with the nozzle edges reaching about 5.2 m from the axis, roughly 0.7 m outside the hull (**Estimated**).
  - An earlier rough reading of 4.3 m, taken from a downscaled photo, is superseded.
- **Protrusion.** Nearly the whole engine, powerhead included, hangs below the skirt. The nozzle exits are about 3.3 m ± 0.4 m below the bottom edge of the skirt's conduit band (**Estimated**, from the B20 lift photo and the B20 aft close-up, which agree to about 0.2 m). With Wikipedia's Raptor length of 3.1 m, the tops of the engines sit about 0.2 m below the skirt edge, which fits NSF's report that the tapered thrust plate makes them protrude further.
- **Layout of the three groups.** Two bottom views of the glowing nozzle exits agree on how the groups sit relative to each other: B20 at Flight 13 liftoff, and B21 in flight on Flight 14. In each, the outer ring fits an ellipse to within 0.3% to 3%, with 18° spacing (**Estimated**).
  - Each inner-ring engine sits midway between two outer-ring engines, at 9° ± 3° from them.
  - Each centre engine sits midway between two inner-ring engines.
  - The exits step down toward the middle. The inner ring's nozzle exits are about 0.2 m below the outer ring's, and the centre trio's about 0.5 m below (± 0.1 m; the two photos agree), which fits NSF's tapered thrust plate.
- **Clocking against the fins.** The Flight 14 photo shows the grid fins and a chine as well as all 33 exits, so it ties the pattern to the fins directly.
  - The camera direction is about 27° ± 2°. That comes from three readings: the rudder fin's offset across the hull, where the catch fins' tips fall, and the catch fins' relative heights (**Estimated**). An earlier fit of 17.5° used a misread hull centreline and is superseded.
  - The engines alone give the same direction, about 26.6°, if the pattern is mirror-symmetric about the rudder–tower line. The bracket-aligned alternative would need about 16°, which the fins rule out by about 10°.
  - So the 33 engines are mirror-symmetric about the rudder–tower line, like the fins, truss brackets, chines and raceway (**Estimated**, ± 3°):
    - The outer ring is at 9° + 18°·k, so each grid fin, and the raceway side at 180°, sits midway between two outer engines.
    - The inner ring is at 18° + 36°·k, so inner engines sit directly below the two catch fins.
    - The centre trio is at 0°, 108° and 252°. Its single engine is on the rudder line, and its 144° gap is centred on 180°.
  - The earlier side-view estimates for the outer ring (4° and 8° + 18°·k, and 12° on one reading) also sit closer to 9°. The liftoff photo shows no fin or chine, so it can only confirm the relative layout.
- **Relighting.** All Raptor 3s on the booster can relight (**Reported**, Wikipedia), and Pad 2 has no ground spin-start connections for the outer 20 (**Reported**, NSF Pad 2 article).

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
- The actuators that hold the ship to the booster retract after separation (**Published**).

### Grid fins

- There are three, in a T. The two catch fins are on the port and starboard sides, at 90° and 270°. The rudder fin is on the non-tower side, which is the ship's heat-shield side, at 0° (**Reported**, NSF and Wikipedia; the azimuths follow from this frame).
- This layout keeps all three fins in the airflow during the glide back and descent (**Reported**, NSF May 2025).
- They sit on the CH4 tank just below the truss, lower than the old fins, to reduce heating during hot staging (**Published**; the position is **Reported** by NSF).
- Each fin pivots on a round bearing in a pod welded to the tank wall. The shaft, actuator and fixed structure are inside the CH4 tank (**Published**), so the pod is the only housing outside.
- A round port on the tank wall sits directly above each visible fin pod, between the pod and the truss bracket above it (**Estimated**, from the fin close-up).
- SpaceX says they are 50% larger and stronger than the V1/V2 fins (**Published**). Tesla Oracle's estimate of about 7.5 × 3.75 m, against 5 × 2.5 m for the old fins, is unverified. Measured in the side view on Pad 2, allowing for the fins being turned about 18° from the camera, each fin reaches about 4.2 m ± 0.3 m out from the hull, is about 1.4 m ± 0.3 m deep from top to bottom, and is about 3.2 m ± 0.4 m wide around the hull (**Estimated**).
- The rudder fin's internal grid is angled so that air passes through it at a better angle (**Reported**, NSF).
- Height: all three fins sit at the same height, to within about 0.3 m. Their frames span about z = 64.6 to 66.1 m ± 0.5 m (**Estimated**).
  - These figures come from the side view on Pad 2, corrected for perspective using the ellipse of the truss ring, which shows the camera looking up about 14°.
  - They were cross-checked on NASASpaceFlight's close-up of the fins, where a weld seam's curvature shows the camera looking up about 24°. In that photo the rudder and the near catch fin sit at the same height.
  - The 2 m drop reported earlier for the rudder was a perspective error: in photos taken from the ground, fins on the near side of the booster look higher than those on the far side.

### Catch and lift points

- They are on the two opposite grid fins, at 90° and 270°, and V3 has no separate catch pins (**Reported**, NSF and Starship SpaceX Wiki). SpaceX says the fins include a new catch point (**Published**). The fins take the booster's weight when it is lifted or caught (**Reported**, Starship SpaceX Wiki).
- The shape and exact position of the catch hardware on each fin aren't documented.
- Pad 2's chopsticks centre the booster with one sled on each arm and a telescopic pusher at the arm tip (**Reported**, NSF Pad 2 article).

### Raceway and chines

- A single external raceway runs from the top about halfway down the booster, then goes inside and branches into one of the taller chines. It carries the flight termination charges, so the separate FTS raceways of V1 and V2 are gone (**Reported**, NSF).
- The raceway sits at about 178° ± 4°, on the tower-side centreline opposite the rudder fin (**Estimated**, from the Pad 2 side view and the B20 lift photo, which agree to about 3°; NSF implies the same side).
  - It looks roughly 0.5 m to 1 m wide, but that isn't pinned down.
  - Lower down, it can't be told apart from the rows of stringer rivets on the hull, so its lower end follows NSF's "about halfway".
- There are four chines on the LOX tank, holding avionics, COPVs and batteries (**Reported**, NSF May 2025 and May 2026). As on V1/V2, they give some lift during descent (**Reported**, Wikipedia).
- On V3 the two chines on the raceway side are taller and closer together, and the two on the rudder-fin side are shorter and farther apart. The wider spacing gives more lift during the glide back (**Reported**, NSF May 2025 and May 2026). The taller, raceway-side chine's chamfered top is at about z = 36.8 m ± 0.6 m (it agrees in the Pad 2 side view and the B20 lift photo). The shorter, rudder-side chine's top is at about z = 28.8 m ± 0.8 m, from the B20 lift photo, and the Flight 14 photo gives about 28.3 m. Both come down to the top of the aft conduit band, at about z = 5.9 m ± 0.3 m (**Estimated**, B20 lift photo and B19 aft photo).
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
| Vertical pipe ending in a Y | Probably about 180°, on the tower side (**Estimated**, tentative) | About 0.2 m | Down the lower hull to the top of the conduit band (about z = 5.9 m), where it splits in a Y onto the hull | Not documented | In line with the raceway; the two QD plates sit symmetrically either side of it in the B19 aft photo. Seen in the B19 and B20 aft photos, and probably the long thin line at about 180° in the side views. An earlier reading put it at about 82°. |
| Aft conduit band | All the way round | About 10.0 m across (**Estimated**) | z ≈ 3.3 to 5.9 m (**Estimated**, B20 lift photo) | Raptor commodities, tank pressurization, power, data, and spin-start and igniter gas (**Reported**, NSF) | The chines' cut ends come down to its top edge |

No other external lines show in the photos. The many vertical rows of dots on the hull are rivets for the internal stringers, not lines.

### Aft skirt, quick disconnects and hold-downs

- The aft section is a 2-ring section that holds the thrust plate (**Reported**, NSF Starfactory article; Starship SpaceX Wiki). Its height hasn't been measured.
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
| Nosecone | A tangent ogive about 13.7 m ± 1 m long, from where it leaves the cylinder at about z = 38.4 m to the tip at z = 52.1 m (**Estimated**). This comes from the 21 rings of 1.83 m below it, and it agrees with the silhouette in the stack photo. The taper first shows about 2 m above its true start, at about z = 40 m. The tip is rounded and covered in black tiles. In the Starfactory photo the tile line steps at about z = 38 m ± 0.5 m, which fits the nosecone's base (see Heat shield). |

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
  - A tiled hinge fairing (aerocover) tops each hinge at about z = 15 m; the right-hand one comes to a point. Next to the right flap, the black tiled area reaches about 126° from windward. That is wider than the 104° to 108° tile line above and below it, so it is probably the fairing.
  - Both aft flaps are tiled on their leeward faces as well. The forward flaps' leeward faces are bare steel.

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
- On the nosecone the tiles wrap further, to about 128° (**Estimated**, Starfactory photo). A curved step at about z = 38 m, the nosecone's base, joins this to the barrel's line. So the forward flaps' hinges, about 98° from windward, sit inside the tiled area.
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

- V3 adds new catch and lift points on the nosecone, higher up than V2's, and deletes the pin sockets used to lift ships since Ship 20 (**Reported**, NSF May 2026).
- In September 2026 the chopsticks lifted Ship 42 by them into a simulated catch position (**Reported**, NSF).
- Measured (**Estimated**):
  - In NASASpaceFlight's photo of Ship 42 held by the chopsticks, the arms take the ship just below the forward flaps, at about z = 40.5 m ± 1 m.
  - In the Starfactory photo, a small fitting sticks out at the right-hand edge at about z = 39.4 m ± 0.6 m, where a fitting at 270° would show. It is probably the starboard catch point.
  - So the catch points are probably at 90° and 270°, where the arms meet the sides, at about z = 40 m ± 1 m. That puts them on the nosecone, about 1.5 m above its base and below the forward flaps' hinges. Their size isn't resolved.

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
| Aft docking ports (drogues) | About 156° and 204° (180° ± 24°), ± 2° | About 2.2 m to 2.9 m ± 0.2 m (centre 2.55 m) | Black funnels with a central cone, about 0.8 m across the rim |
| Attic vents | About 167° and 193° (180° ± 13°), ± 2° | Lower edge at about 2.4 m ± 0.2 m; the hood runs out of the frame above 3.7 m | Silver hoods about 0.75 m wide, open at the bottom. They are the lower ends of the raceways. |

- The funnels with central cones are the drogues. The hoods at the raceways' lower ends are the attic vents, matching NSF's description of "attic vents beside the QD plate and at the bottom of the raceways".
- The stack photo's estimate for where the QD arm meets the ship, z = 3.7 m ± 1 m, agrees with the plate's height.
- Payload bay pair (**Estimated**, Starfactory photo): a pair of black, funnel-shaped fittings sits at about 140° and 220° (± 4°), at z ≈ 34.5 m ± 0.5 m, just below the door.
  - They are about 1 m to 1.3 m across.
  - They look like the aft drogues, so they are probably the payload-bay docking ports. They could instead be roll-thruster outlets, but their funnel shape matches the drogues.
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

These sizes are useful for modelling the engine bells.

| Engine | Size |
|---|---|
| Sea-level Raptor | About 3.1 m (10 ft) long, with a 1.3 m (4.3 ft) nozzle exit |
| Raptor Vacuum (ship only) | Nozzle exit about 2.4 m (7.9 ft) |

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
- the exact grid fin sizes and heights, and the catch-point hardware
- the number of struts in the V3 truss
- the azimuths and lengths of the chines and the raceway
- the positions of the booster's QD plates, hold-down fittings, vents, cameras and antennas
- the booster's dome positions, tank lengths and exact V3 ring height
- the ship's engine layout: the pitch-circle radii and clocking of the 3 sea-level and 3 vacuum Raptors, and how far their nozzles reach below the skirt
- the ship's flap planforms, hinge lines and deflection angles
- the ship's exact tile line, and the positions and sizes of its payload door, catch and lift points, QD plate, docking ports and vents
- the ship's dome positions and tank lengths, and the number and azimuths of the actuators that hold it to the booster

Rough estimates for many of these are in "Super Heavy V3 in detail" and "Starship V3 in detail".


## Sources

- [SpaceX Starship (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Starship): full-stack heights for Block 1, 2 and 3, and the booster and ship heights.
- [SpaceX Super Heavy (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Super_Heavy): the Block 3 booster height of 72.3 m, the 69 m and 71 m Block 1/2 heights, the 1.8 m vented interstage, the engine layout, and the Block 3 grid fin count, spacing and size. Also the catch points and internal actuators on the fins, the two quick disconnects, Raptor 3 relighting, the V1/V2 thrust puck, and the V1/V2 chines and vents.
- [SpaceX Starship (spacecraft) (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Starship_(spacecraft)): the V1 and V2 ship heights, flap layout and angles, the 17 m span and the heat shield. Also the ship's 21 rings of 1.83 m, header tanks, payload bay, Starlink door, RCS, vents and engine mounting.
- [SpaceX Raptor (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Raptor): engine length, nozzle exit diameters and the switch from Raptor 2 to Raptor 3.
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
- [Tesla Oracle, Aug 2025](https://www.teslaoracle.com/2025/08/16/spacex-reveals-grid-fins-of-the-next-gen-starship-super-heavy-booster/): an unverified estimate of the V3 grid fin size.
- [NASASpaceFlight, May 2026: Flight 12 readies for the debut of SpaceX's next Ship evolution](https://www.nasaspaceflight.com/2026/05/fligth12-debut-spacex-ship-evolution/): the V3 ship changes, including the catch and lift points, docking ports, QD plate, lowered domes, smaller attic, RCS, raceways, Starlink dishes, vents and tiles.
- [NASASpaceFlight, Sept 2026: Ship 42 wraps chopsticks tests](https://www.nasaspaceflight.com/2026/09/ship-42-chopsticks-tests-flight-14-net/): the chopsticks lifting Ship 42 by its catch points, and the tower's ship QD arm mating with the ship.
- NASASpaceFlight photos used for the ship estimates: [Booster 21 and Ship 41 stacked on Pad 2](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/Booster-21-and-Ship-41-Stacked-scaled.jpg) (from the Flight 14 article above), [Ship 39's nose and payload bay](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/Ship-39s-Nose-Cone-and-Paylod-Bay-scaled.jpg), [Ship 39 on the road by the Starfactory](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8582-wmarked-scaled.jpg), [Ship 39 beside the Starfactory's "Gateway to Mars" sign](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8534-wmarked-scaled.jpg) (the "Starfactory photo") and [a V3 ship's aft end on its transport stand](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/COLLEEN-CRL00300-wmarked-scaled.jpg) (all from the May 2026 ship article), and [Ship 42 held by the chopsticks](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/NSF-2026-09-14-17-44-21-003.jpg) (Sept 14, 2026). Also checked for the interface actuators: [Ship 41 waiting to be stacked on Booster 21](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/Ship-41-waiting-to-be-stacked-on-Booster-21-scaled.jpg) (Sept 2026).
- Checked for the ship's engine layout as a V2 stand-in; none gives a usable bottom view: [Ship 37 on the Starship SpaceX Wiki](https://starship-spacex.fandom.com/wiki/Ship_37_(S37)), NASASpaceFlight's [Ship 35](https://www.nasaspaceflight.com/2025/05/ship-35-sf-spacex-has-fleet-vehicles-flight/) and [Ship 37](https://www.nasaspaceflight.com/2025/08/ship-37-spin-prime-engine-swap/) articles (2025), SpaceX's [2022 photos of Ship 24's engines](https://interestingengineering.com/innovation/spacex-mars-raptor-engine-setup), SpaceX's [Ship 25 static-fire photos](https://www.space.com/spacex-starship-ship-25-engine-test-fire-photos) and SpaceX's [Flight 14 hot-staging video](https://starlust.org/video/w130-mury20fo/).
- NASASpaceFlight photos used for the engine layout and clocking: [B20's engines at Flight 13 liftoff](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Raptor-Engines-at-Liftoff-scaled.jpg) and [B21 and Ship 41 in flight on Flight 14](https://www.nasaspaceflight.com/wp-content/uploads/2026/09/DSC05253-wmarked.jpg), both from [Ship 41 Makes it to Orbit, Booster 21 Nearly Perfect](https://www.nasaspaceflight.com/2026/09/starship-flight-14-orbit/) (Sept 2026).
- NASASpaceFlight photos used for the other estimates: [Booster 20 lifted onto the mount](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Being-Lifted-onto-the-Mount-scaled.jpg) and [Booster 20's aft end close-up](https://www.nasaspaceflight.com/wp-content/uploads/2026/07/Booster-20-Engines-scaled.jpg) (both from [Booster 20 completes record duration Static Fire](https://www.nasaspaceflight.com/2026/07/booster-20-record-static-fire/), July 2026), [side view on Pad 2](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/COLLEEN-DSC09751-wmarked-scaled.jpg), [truss and grid fins](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8394-wmarked-scaled.jpg), [aft end with engines](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8810-wmarked-scaled.jpg) and [B19's aft end without engines](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/COLLEEN_-_CRL00220-scaled.jpg).
