#!/bin/bash

for f in lectures/*.typ; do
  # Remove all lines that contain #link(<...>)
  sed -i '/#link(<.*>)/d' "$f"
done

typst compile book.typ build/dsa-book.pdf
