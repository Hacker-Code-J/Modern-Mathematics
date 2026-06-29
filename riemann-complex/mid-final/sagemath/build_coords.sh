#!/usr/bin/env bash
# Run every Sage script in numeric order and concatenate the resulting
# coords_*.tex into a single coords.tex that the main document can \input.
set -euo pipefail
cd "$(dirname "$0")"

for f in 0?_*.sage; do
  echo "==> running $f"
  sage "$f"
done

{
  echo "% Auto-generated from sagemath/*.sage scripts."
  echo "% Do not edit by hand --- re-run sagemath/build_coords.sh."
  for cf in coords_lattice.tex coords_group.tex coords_curve.tex \
            coords_chord.tex coords_tangent.tex coords_torsion.tex \
            coords_branch.tex coords_torus_markers.tex coords_sphere.tex \
            coords_correspondence.tex coords_curve_sample.tex; do
    if [[ -f "$cf" ]]; then
      echo
      echo "% --- from $cf ---"
      cat "$cf"
    fi
  done
} > coords.tex

echo "==> wrote $(pwd)/coords.tex"
echo "Lines: $(wc -l < coords.tex)"
