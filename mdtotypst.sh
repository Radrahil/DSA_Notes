#!/bin/bash

mkdir -p project/lectures

for f in "$@"; do
  if [ ! -f "$f" ]; then
    echo "Error: file '$f' not found" >&2
    continue
  fi

  name="$(basename "$f" .md)"

  pandoc \
    -f markdown+tex_math_dollars-auto_identifiers \
    -t typst \
    --wrap=none \
    "$f" \
    -o "project/lectures/$name.typ"

done
