#!/usr/bin/env bash
set -euo pipefail

out="$(mktemp --suffix=.png)"
gnome-screenshot -a -f "$out"
tesseract "$out" stdout -l eng | xclip -selection clipboard
rm "$out"
