#!/usr/bin/env bash
set -euo pipefail

SRC="images/_incoming"
DST="images/works"
mkdir -p "$DST"

FILES=(
  "portrait-01.jpg" "portrait-02.jpg" "portrait-03.jpg" "portrait-04.jpg" "portrait-05.jpg"
  "exhibition-yami-no-ou.jpg" "exhibition-ny-junkfood.jpg"
  "still-canva-01.jpg" "still-canva-02.jpg" "still-canva-03.jpg" "still-canva-04.jpg"
  "still-canva-05.jpg" "still-canva-06.jpg" "still-canva-07.jpg" "still-canva-08.jpg"
  "still-canva-09.jpg" "still-canva-10.jpg" "still-canva-11.jpg" "still-canva-12.jpg"
  "still-canva-13.jpg" "still-canva-14.jpg"
  "apparel-punktum.jpg" "mv-kaminagi-rabbits.jpg"
)

for f in "${FILES[@]}"; do
  in="$SRC/$f"
  out="$DST/$f"
  [[ -f "$in" ]] || { echo "skip: $in (not found)"; continue; }
  cp "$in" "$out"
  sips -Z 1600 "$out" >/dev/null
  sips -s format jpeg -s formatOptions 80 "$out" --out "$out" >/dev/null
  echo "done: $out ($(du -h "$out" | cut -f1))"
done
