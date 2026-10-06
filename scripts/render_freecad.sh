#!/usr/bin/env bash
# Render a FreeCAD document from three angles, export an STL and build a summary sheet.
# Usage: scripts/render_freecad.sh MODEL.FCStd [OUTDIR]
# OUTDIR defaults to renders/<model name>. FreeCAD installed as a snap can't see /tmp,
# so MODEL and OUTDIR must be under /home.
set -euo pipefail
[ $# -ge 1 ] || { echo "usage: $0 MODEL.FCStd [OUTDIR]" >&2; exit 2; }
here="$(cd "$(dirname "$0")" && pwd)"
model="$(realpath "$1")"
name="$(basename "${model%.*}")"
out="$(realpath -m "${2:-$here/../renders/$name}")"

log="$(RENDER_MODEL="$model" RENDER_OUT="$out" freecad.cmd "$here/render_freecad.py" < /dev/null 2>&1)" || true
rm -rf "$here/__pycache__"   # FreeCAD compiles the script next to itself
grep -E '^(PARTS|RENDER|ERROR)' <<<"$log" || true
if ! grep -q '^RENDER back_left_high True' <<<"$log"; then
  echo "FreeCAD render failed. Full output:" >&2
  echo "$log" >&2
  exit 1
fi
python3 "$here/make_sheet.py" "$out" "$model" "FreeCAD $(awk '/^VERSION /{print $2}' <<<"$log")"
