#!/bin/bash

mkdir -p project/lectures

# Loop over all provided args
for f in "$@"; do
  # Skip if the file doesn't exist
  if [ ! -f "$f" ]; then
    echo "Error: file '$f' not found" >&2
    continue
  fi

  # Strip .md extension
  name="${f%.md}"

  # Convert to Typst
  pandoc -f gfm+tex_math_dollars+definition_lists "$f" -t typst -o "project/lectures/$name.typ"

  # Remove lines like <...>
  sed -i '/^<.*>$/d' "project/lectures/$name.typ"
done
