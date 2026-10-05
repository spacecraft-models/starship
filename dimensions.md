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
| Height | 72.3 m (237 ft), including the hot-staging interstage on top |
| Diameter | 9 m (29.5 ft) |
| Engines | 33 Raptor 3: 3 in the centre and 10 in an inner ring (these 13 gimbal), plus 20 fixed engines in an outer ring |
| Grid fins | 3, spaced 90° / 90° / 180° (a T shape seen from above). Each is about 1.5 times the size of the earlier fins, and they sit lower on the booster than before. |
| Hot-staging interstage | Built into the top of the booster as an open, vented truss above the methane tank's forward dome. There is no separate ring as on V1 and V2. |

## Super Heavy V3 in detail

This section covers where things sit on the V3 booster. Each figure is tagged **Published** (SpaceX), **Reported** (credible press, Wikipedia or the Starship SpaceX Wiki) or **Estimated** (measured or derived from photos, with the method given). Gaps are left as gaps and listed under "Not published by SpaceX".

### Reference frame

- z = 0 is the bottom of the aft skirt and z points up, in metres. This assumes the published 72.3 m runs from the bottom of the skirt to the top of the hot-staging truss and leaves out the engine bells. SpaceX doesn't say exactly what the figure measures.
- Azimuth 0° is the rudder grid fin (the stem of the T), increasing counterclockwise seen from above, so the two catch fins sit at 90° and 270°.
- NASASpaceFlight puts the catch fins on the port and starboard sides, and the third fin on the non-tower side, which is the ship's heat-shield side (**Reported**, NSF May 2025). So azimuth 0° lines up with the ship's tiled windward side and the tower side is at 180°. This fixes how the ship is clocked on the booster.
- Apart from the grid fins and the ship's heat shield, nothing has been tied to this azimuth frame yet, so the other azimuths below are relative patterns only.
- Estimated heights were measured in NASASpaceFlight's side-on photo of a V3 booster on Pad 2. The scale comes from the 9 m diameter (about 105 pixels across), counting down from the top of the truss at z = 72.3 m.

### Construction

| Item | Detail |
|---|---|
| Barrel | 36 stacked steel rings: a 25-ring main tank assembly (the 2-ring aft section, five 4-ring LOX barrels and the 3-ring common-dome section) with an 11-ring forward section on top (two CH4 barrels plus the staging ring that holds the forward dome). **Reported** (NSF Starfactory article; Starship SpaceX Wiki, B19) |
| Order, bottom to top | Aft section with the engines, LOX tank, common dome, CH4 tank, forward dome, hot-staging truss. **Reported** |
| Ring height | Standard V3 rings are about 2 m tall. **Reported** (NSF Sept 2025, describing the B18.3 forward test tank). If the 36-ring count leaves out the hot-staging ring, 36 rings of about 1.9 m plus the 4 m hot-staging ring come to about 72.3 m, which fits (**Estimated**). Measure before drawing panel lines. |
| Tanks | The CH4 tank is shorter and the LOX tank longer than on V2. **Reported** (NSF). Dome positions and tank lengths aren't published. |
| Fuel transfer tube | About 50 m tall and 3 m wide, carrying methane from the CH4 tank down through the LOX tank to the engines. **Reported** (NSF). SpaceX calls it roughly the size of a Falcon 9 first stage (**Published**). It is internal. |
| LOX landing tank | A separate tank that feeds the inner 13 engines, now beside the main LOX tank. **Reported** (NSF; Starship SpaceX Wiki). It is internal. |

### Engines

All 33 Raptor 3s mount to one steel thrust plate that carries the thrust of every engine. On V1 and V2 the inner 13 hung from a thrust puck in the aft dome. **Reported** (NSF; Wikipedia for V1/V2). The plate tapers downward, so the engines hang lower out of the skirt than before, and metallic tiles cover its exposed steel for heat protection (**Reported**, NSF May 2025 and May 2026). The large individual engine shrouds are gone. Shielding now covers the surface between the engines and the thrust vector control hardware on the inner 13 (**Published**).

| Group | Count | Gimbal | Angular spacing | Pitch-circle radius |
|---|---|---|---|---|
| Centre | 3 | Yes | 108° / 108° / 144°, where earlier boosters used 120°. **Reported** (NSF) | Not published |
| Inner ring | 10 | Yes | 36° if evenly spaced (**Estimated**). On V3 the ring is rotated so no engine sits over the ridge of Pad 2's flame diverter (**Reported**, NSF). | Not published |
| Outer ring | 20 | No, fixed | 18° if evenly spaced (**Estimated**) | About 4.3 m (**Estimated**, rough; see below) |

- **Nozzle size.** Wikipedia gives a diameter of 1.3 m and a length of 3.1 m for Raptor, without separating Raptor 3 (**Reported**). In NASASpaceFlight's photo of the aft end the booster nozzles look about 1.2 to 1.3 m across (**Estimated**, rough).
- **Outer-ring fit.** Twenty nozzles about 1.3 m across can't sit side by side inside the 4.5 m hull radius. They need a pitch circle of at least about 4.15 m, which puts their outer edges near 4.8 m. The photos agree: the outer nozzles' edges span roughly 9.9 m, about 0.4 m outside the hull line on each side. That gives a pitch-circle radius of about 4.3 m ± 0.15 m (**Estimated**, read from a downscaled copy of the photo without correcting for perspective).
- **Protrusion.** Nearly the whole engine, powerhead included, hangs below the skirt in NASASpaceFlight's photos. The nozzle exits are therefore roughly an engine length (about 3 m) below the thrust plate. The drop below the skirt edge hasn't been measured.
- **Clocking.** How the engine pattern is rotated relative to the grid fins isn't known yet. Until it is, model each group with a free rotation: the centre engines at θc, θc + 108° and θc + 216°, the inner ring at θi + 36°·k, and the outer ring at θo + 18°·k.
- **Relighting.** All Raptor 3s on the booster can relight (**Reported**, Wikipedia), and Pad 2 has no ground spin-start connections for the outer 20 (**Reported**, NSF Pad 2 article).

### Hot-staging truss

- Sits on top of the CH4 tank and carries the ship. It is an open, N1-style truss, and the ship's exhaust hits the forward dome directly (**Reported**, NSF). The dome is covered by a non-structural steel layer (**Published**).
- In NASASpaceFlight's photos it is made of pairs of struts in an inverted V, running from a top ring down to brackets on the tank wall. The struts haven't been counted yet.
- About 4 m tall, so about z = 68.3 to 72.3 m. NASASpaceFlight describes the hot-staging ring on the B18.3 forward test tank as nearly four metres tall (**Reported**, NSF Sept 2025).
- The photo measurement gave only about 3.0 m ± 0.3 m from the top of the tank wall to the top of the truss ring (**Estimated**). That may cover just the open truss rather than the whole ring.
- The actuators that hold the ship to the booster retract after separation (**Published**).

### Grid fins

- There are three, in a T. The two catch fins are on the port and starboard sides, at 90° and 270°. The rudder fin is on the non-tower side, which is the ship's heat-shield side, at 0° (**Reported**, NSF and Wikipedia; the azimuths follow from this frame).
- This layout keeps all three fins in the airflow during the glide back and descent (**Reported**, NSF May 2025).
- They sit on the CH4 tank just below the truss, lower than the old fins, to reduce heating during hot staging (**Published**; the position is **Reported** by NSF).
- Each fin pivots on a round bearing in a pod welded to the tank wall. The shaft, actuator and fixed structure are inside the CH4 tank (**Published**), so the pod is the only housing outside.
- SpaceX says they are 50% larger and stronger than the V1/V2 fins (**Published**). Tesla Oracle's estimate of about 7.5 × 3.75 m, against 5 × 2.5 m for the old fins, is unverified. Measured from the fin seen side-on in the side view, each fin reaches about 3.9 m ± 0.3 m out from the hull and is about 1.4 m ± 0.3 m deep from top to bottom (**Estimated**).
- The rudder fin's internal grid is angled so that air passes through it at a better angle (**Reported**, NSF).
- Height: in the side view, the top of the fin facing the camera is at about z = 66.5 to 67 m, and the top of the fin pointing away from the tower at about z = 64.5 m (**Estimated**). The fin pointing away from the tower is the rudder, so it would sit about 2 m below the catch fins. A second NASASpaceFlight photo doesn't clearly confirm this, so check it before modelling.

### Catch and lift points

- They are on the two opposite grid fins, at 90° and 270°, and V3 has no separate catch pins (**Reported**, NSF and Starship SpaceX Wiki). SpaceX says the fins include a new catch point (**Published**). The fins take the booster's weight when it is lifted or caught (**Reported**, Starship SpaceX Wiki).
- The shape and exact position of the catch hardware on each fin aren't documented.
- Pad 2's chopsticks centre the booster with one sled on each arm and a telescopic pusher at the arm tip (**Reported**, NSF Pad 2 article).

### Raceway and chines

- A single external raceway runs from the top about halfway down the booster, then goes inside and branches into one of the taller chines. It carries the flight termination charges, so the separate FTS raceways of V1 and V2 are gone (**Reported**, NSF).
- NSF's description puts the raceway on the side opposite the rudder fin, so around 180° (**Reported**, implied). Its width hasn't been measured.
- There are four chines on the LOX tank, holding avionics, COPVs and batteries (**Reported**, NSF May 2025 and May 2026). As on V1/V2, they give some lift during descent (**Reported**, Wikipedia).
- On V3 the two chines on the raceway side are taller and closer together, and the two on the rudder-fin side are shorter and farther apart. The wider spacing gives more lift during the glide back (**Reported**, NSF May 2025 and May 2026). Their azimuths and lengths haven't been measured. In the side view one chine's top end is at roughly z = 34 to 35 m (**Estimated**, rough; which chine it is isn't known).
- Their bottom ends are cut at an angle and stop just above the aft conduit band, as seen in NASASpaceFlight's photo of B19's aft end.

### Aft skirt, quick disconnects and hold-downs

- The aft section is a 2-ring section that holds the thrust plate (**Reported**, NSF Starfactory article; Starship SpaceX Wiki). Its height hasn't been measured.
- A band of pipes and junction boxes runs around the outside of the aft end. It carries the Raptor commodities, the tank pressurization manifolds, power, data, and spin-start and igniter gas, which used to run inside the engine shielding (**Reported**, NSF). The CO2 fire-suppression system has been removed (**Published**).
- Two separate QD plates replace the single QD (**Published**). One is for LOX and the other for CH4, and both also carry other commodities (**Reported**, NSF May 2025 and May 2026). Their position on the skirt isn't documented. NASASpaceFlight's photo of B19's aft shows two foil-wrapped plates just above the conduit band between two chines, which may be these.
- On Pad 2 they mate with two triangular ground QD plates on the opposite side of the mount from where Pad 1's sat. The mount holds the booster with 20 hold-down clamp arms (**Reported**, NSF Pad 2 article). The fittings on the booster side aren't documented.

### Vents, thrusters, cameras and antennas

- V1/V2 had four vents in the interstage and more vents just below the common dome (**Reported**, Wikipedia). V3 vent positions aren't documented. NASASpaceFlight's close-up shows a pair of round ports on the tank wall just below the truss, whose purpose isn't documented.
- No cold-gas thrusters are documented on the V3 booster.
- SpaceX says V3 has about 50 camera views across the ship and booster (**Published**), but camera and antenna positions on the booster aren't published.

### Fins

Super Heavy has no fins besides the three grid fins. The chines are its only other aerodynamic surfaces.

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
- the grid fins' heights (including whether the rudder fin sits lower) and the catch-point hardware
- the number of struts in the V3 truss
- the azimuths and lengths of the chines and the raceway
- the positions of the booster's QD plates, hold-down fittings, vents, cameras and antennas
- the booster's dome positions, tank lengths and exact V3 ring height

Rough estimates for some of these are in "Super Heavy V3 in detail".


## Sources

- [SpaceX Starship (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Starship): full-stack heights for Block 1, 2 and 3, and the booster and ship heights.
- [SpaceX Super Heavy (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Super_Heavy): the Block 3 booster height of 72.3 m, the 69 m and 71 m Block 1/2 heights, the 1.8 m vented interstage, the engine layout, and the Block 3 grid fin count, spacing and size. Also the catch points and internal actuators on the fins, the two quick disconnects, Raptor 3 relighting, the V1/V2 thrust puck, and the V1/V2 chines and vents.
- [SpaceX Starship (spacecraft) (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Starship_(spacecraft)): the V1 and V2 ship heights, flap layout and angles, the 17 m span and the heat shield.
- [SpaceX Raptor (Wikipedia)](https://en.wikipedia.org/wiki/SpaceX_Raptor): engine length, nozzle exit diameters and the switch from Raptor 2 to Raptor 3.
- [Spaceflight Now, Sept 21, 2026](https://spaceflightnow.com/2026/09/21/spacexs-super-heavy-booster-arrives-at-pad-ahead-of-first-orbital-starship-launch/): the Flight 14 booster is 72 m (236 ft) tall and 9 m across, and the ship is 52 m (171 ft) tall.
- [NASASpaceFlight, May 2026: Super Heavy Block 3](https://www.nasaspaceflight.com/2026/05/super-heavy-block-3-booster-future/): the open hot-staging truss, the 3 larger grid fins in a T formation, and Raptor 3 on the booster. Also the catch fins and rudder fin, the raceway and chines, the thrust plate, the engine clocking and shielding, the split quick disconnect, the aft conduits, and the 50 m × 3 m transfer tube.
- [Next Spaceflight: Starship](https://nextspaceflight.com/rockets/174/): stack heights of 124.4 m for V3, 123.1 m for V2 and 121.3 m for V1.
- [Space.com: Flight 12](https://www.space.com/space-exploration/launches-spacecraft/spacex-starship-v3-megarocket-first-test-flight) and [Flight 14](https://www.space.com/space-exploration/launches-spacecraft/spacex-starship-megarocket-flight-14-orbital-launch-success): flight dates, V3 status, and the ship's six engines.
- [SpaceX Updates: Starship V3 change highlights](https://www.spacex.com/updates/index): the grid fin changes, the integrated hot stage, the transfer tube, the aft shielding, the two QD points, the camera count and the Pad 2 changes.
- [SpaceX on X, Aug 2025](https://x.com/SpaceX/status/1955715300256616451): the first V3 grid fin, 50% larger and stronger.
- [NASASpaceFlight, Mar 2026: From Steel Rolls to Starship](https://www.nasaspaceflight.com/2026/03/steel-rolls-to-starship/): how the V3 booster is stacked from ring sections.
- [NASASpaceFlight, Aug 2025: Starbase Pad 2](https://nasaspaceflight.com/2025/08/starbase-pad-2-advancements-pad-1/): the 20 hold-down arms, the two booster QDs, the chopstick sleds and the flame diverter ridge.
- [NASASpaceFlight, May 2025: The Future of the Starship Program, Block 3 and Mars](https://www.nasaspaceflight.com/2025/05/future-starship-block-3-mars/): the grid fins on the port, starboard and non-tower (heat-shield) sides, the chine spacing, the two quick disconnects and the aft metallic tiles.
- [NASASpaceFlight, Sept 2025: Eye on the future, as SpaceX prepare Pad 2 and Block 3 at Starbase](https://www.nasaspaceflight.com/2025/09/spacex-prepare-pad-2-block-3-starbase/): standard rings about 2 m tall and the nearly 4 m hot-staging ring on the B18.3 forward test tank.
- [Starship SpaceX Wiki: Booster 19](https://starship-spacex.fandom.com/wiki/Booster_19_(B19)) and [Super Heavy Booster](https://starship-spacex.fandom.com/wiki/Super_Heavy_Booster): the 25 + 11 ring stack, the catch points on the grid fins and the LOX landing tank position.
- [Tesla Oracle, Aug 2025](https://www.teslaoracle.com/2025/08/16/spacex-reveals-grid-fins-of-the-next-gen-starship-super-heavy-booster/): an unverified estimate of the V3 grid fin size.
- NASASpaceFlight photos used for the estimates: [side view on Pad 2](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/COLLEEN-DSC09751-wmarked-scaled.jpg), [truss and grid fins](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8394-wmarked-scaled.jpg), [aft end with engines](https://www.nasaspaceflight.com/wp-content/uploads/2026/05/2Q5A8810-wmarked-scaled.jpg) and [B19's aft end without engines](https://www.nasaspaceflight.com/wp-content/uploads/2026/02/COLLEEN_-_CRL00220-scaled.jpg).
