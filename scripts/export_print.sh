#!/usr/bin/env bash
# Export print STLs of the booster and the ship from one of their saved Customizer presets.
# Usage: scripts/export_print.sh "PRESET" [OUTDIR]
# PRESET is a parameter set in model/super_heavy.json and model/starship.json, such as "1:460 print".
# OUTDIR defaults to renders/print/<the preset's name, with anything but letters, digits, . - and _
# turned into _>. A preset that cuts a vehicle into sections gets one STL per section,
# <vehicle>_<preset>_section<N>.stl from the bottom up, each standing ready to print; one with loose
# parts (fins or flaps) also gets <vehicle>_<preset>_loose.stl with them laid flat. Otherwise each
# vehicle is one STL, <vehicle>_<preset>.stl. The exports run one after the other, because the
# booster's alone can take several minutes and more than 2 GB of memory.
set -euo pipefail
[ $# -ge 1 ] || { echo "usage: $0 PRESET [OUTDIR]" >&2; exit 2; }
here="$(cd "$(dirname "$0")" && pwd)"
preset="$1"
slug="$(printf '%s' "$preset" | tr -c 'A-Za-z0-9._-' '_')"
out="$(realpath -m "${2:-$here/../renders/print/$slug}")"
mkdir -p "$out"

# How many sections the preset cuts a vehicle into, and whether it has loose parts (1 or 0)
plan() {
  python3 -c '
import json, sys
sets = json.load(open(sys.argv[1]))["parameterSets"]
if sys.argv[2] not in sets:
    sys.exit(sys.argv[1] + " has no preset \"" + sys.argv[2] + "\"")
s = sets[sys.argv[2]]
cuts = json.loads(s.get("section_z", "[]"))
loose = any(k.startswith("loose_") and v == "true" for k, v in s.items())
print(len(cuts) + 1, int(loose))' "$1" "$2"
}

for name in super_heavy starship; do
  plan "$here/../model/$name.json" "$preset" > /dev/null
done
for name in super_heavy starship; do
  params="$here/../model/$name.json"
  read -r sections loose < <(plan "$params" "$preset")
  export_one() { # section number, output file
    openscad -q -p "$params" -P "$preset" -D "section=$1" --export-format binstl -o "$2" "$here/../model/$name.scad"
    echo "EXPORTED $2"
  }
  if [ "$sections" -eq 1 ]; then
    export_one 0 "$out/${name}_$slug.stl"
  else
    for k in $(seq 1 "$sections"); do export_one "$k" "$out/${name}_${slug}_section$k.stl"; done
  fi
  if [ "$loose" -eq 1 ]; then export_one -1 "$out/${name}_${slug}_loose.stl"; fi
done
