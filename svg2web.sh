#!/bin/bash

# svg2web
# Michael McMahon 2022
# Convert all SVG files recursively to PNG and WebP with multiple resolutions for modern web development.

# Depends on Inkscape 1.2, and cwebp, BASH, sed, and echo.
#   sudo apt install -y inkscape webp

convertsvgforweb() {
  # Generate default 96 dpi (1x).
  inkscape -C $1 -o "${1%.svg}.png"
  cwebp -progress -lossless -m 6 -z 9 -q 100 "${1%.svg}.png" -o "${1%.svg}.webp"

  # Generate 192 dpi (2x).
  inkscape -C $1 -d 192 -o "${1%.svg}-2x.png"
  cwebp -progress -lossless -m 6 -z 9 -q 100 "${1%.svg}-2x.png" -o "${1%.svg}-2x.webp"

  # Generate 288 dpi (3x).
  inkscape -C $1 -d 288 -o "${1%.svg}-3x.png"
  cwebp -progress -lossless -m 6 -z 9 -q 100 "${1%.svg}-3x.png" -o "${1%.svg}-3x.webp"

  # Generate example picture tag.
  IMAGE_DIR="img/"
  echo -e "<picture>\n  <source\n    type=\"image/webp\"\n    srcset=\"${IMAGE_DIR}${1%.svg}.webp 1x, ${IMAGE_DIR}${1%.svg}-2x.webp 2x, ${IMAGE_DIR}${1%.svg}-3x.webp 3x\">\n  <source\n    type=\"image/png\"\n    srcset=\"${IMAGE_DIR}${1%.svg}.png 1x, ${IMAGE_DIR}${1%.svg}-2x.png 2x, ${IMAGE_DIR}${1%.svg}-3x.png 3x\">\n  <img src=\"${IMAGE_DIR}$1\"\n    alt=\"\">\n</picture>" > ${1%.svg}.html
  sed -i 's|/./|/|g' ${1%.svg}.html
}

export -f convertsvgforweb
find ./ -type f -name '*.svg' -exec bash -c 'convertsvgforweb "$0"' {} \;
