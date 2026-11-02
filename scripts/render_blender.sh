#!/usr/bin/env bash
# Render OpenSCAD models realistically in Blender. Each model is exported once per material, as its
# own mesh, and scripts/render_blender.py gives each mesh a realistic surface, lights the scene with
# a sky and a sun over flat ground, renders it from several views and saves the scene.
# Usage: scripts/render_blender.sh [-o OUTDIR] MODEL.scad[@Z] [MODEL.scad[@Z] ...]
# Several models go in one scene, each raised Z mm, so model/starship.scad@72300 stacks the ship on
# model/super_heavy.scad. OUTDIR defaults to renders/<model>/blender, or renders/<model>_and_<model>
# for several models. It gets a PNG per view, <name>.blend and <name>.glb.
# The materials are the ones listed in the model's `material` setting (see model/materials.scad).
# Each mesh is a binary STL in renders/<model>/materials/, exported with $preview true, so it keeps
# the preview-only detail such as the grid fins' teeth, and exported again only when a file in
# model/ has changed since. The exports run one after the other; the booster's take about 7 minutes.
# Settings, as environment variables: VIEWS (comma-separated view names, default all of them, or
# none to save the .blend and .glb without rendering), SAMPLES (render samples per pixel, default
# 128), SCALE (percentage of the full image size, default 100; 50 makes quick drafts), BLENDER (the
# blender command, default blender).
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
root="$(dirname "$here")"
out=""
if [ "${1:-}" = "-o" ]; then out="$2"; shift 2; fi
[ $# -ge 1 ] || { echo "usage: $0 [-o OUTDIR] MODEL.scad[@Z] [MODEL.scad[@Z] ...]" >&2; exit 2; }

models=()
names=()
for arg in "$@"; do
  file="${arg%@*}"
  z=0
  [ "$file" = "$arg" ] || z="${arg##*@}"
  [ -f "$file" ] || { echo "no such model: $file" >&2; exit 2; }
  model="$(realpath "$file")"
  name="$(basename "${model%.*}")"
  meshes="$root/renders/$name/materials"
  mkdir -p "$meshes"
  # The model's materials, from the list in the comment on its `material = "all";` line
  list="$(sed -n 's/^material = "all"; *\/\/ *\[\(.*\)\]/\1/p' "$model" | tr -d ' ' | tr ',' ' ')"
  [ -n "$list" ] || { echo "$file has no material setting listing its materials" >&2; exit 2; }
  for m in $list; do
    [ "$m" = all ] && continue
    stl="$meshes/${name}_$m.stl"
    empty="$meshes/${name}_$m.empty"
    # Up to date when newer than every file the models are built from
    if [ -e "$stl" ] || [ -e "$empty" ]; then
      done_file="$stl"; [ -e "$stl" ] || done_file="$empty"
      [ -z "$(find "$root/model" -newer "$done_file" -type f)" ] && { echo "UP TO DATE $name $m"; continue; }
    fi
    rm -f "$stl" "$empty"
    echo "EXPORTING $name $m"
    log="$meshes/${name}_$m.log"
    if openscad -D '$preview=true' -D "material=\"$m\"" --export-format binstl -o "$stl.part" "$model" 2> "$log"; then
      mv "$stl.part" "$stl"; rm -f "$log"
    elif grep -q 'top level object is empty' "$log"; then
      echo "  (nothing is made of $m)"
      touch "$empty"; rm -f "$log"
    else
      rm -f "$stl.part"; cat "$log" >&2; echo "export of $name $m failed" >&2; exit 1
    fi
  done
  models+=("$name:$meshes:$z")
  names+=("$name")
done

if [ -z "$out" ]; then
  if [ ${#names[@]} -eq 1 ]; then out="$root/renders/${names[0]}/blender"
  else
    joined="${names[0]}"
    for n in "${names[@]:1}"; do joined="${joined}_and_$n"; done
    out="$root/renders/$joined"
  fi
fi
out="$(realpath -m "$out")"
mkdir -p "$out"

blender="${BLENDER:-blender}"
# The snap puts it in /snap/bin, which isn't on every PATH
if ! command -v "$blender" > /dev/null && [ -z "${BLENDER:-}" ] && [ -x /snap/bin/blender ]; then blender=/snap/bin/blender; fi
if ! command -v "$blender" > /dev/null; then
  echo "The meshes are ready, but Blender isn't installed. On Ubuntu, install it with" >&2
  echo "  sudo snap install blender --classic" >&2
  echo "and run this again." >&2
  exit 3
fi
"$blender" -b --factory-startup --python "$here/render_blender.py" -- "$out" "${models[@]}"
