#!/bin/bash

mkdir -p project/lectures

for f in *.md; do
  name="${f%.md}"

  pandoc -f gfm "$f" -t typst -o "project/lectures/$name.typ"
  sed -i '/^<.*>$/d' "project/lectures/$name.typ"

done
