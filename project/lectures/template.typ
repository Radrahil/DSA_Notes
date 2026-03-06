#let BookTemplate(doc) = {
  set page(
    margin: (x: 2.5cm, y: 2.5cm),
  )

  set text(
    font: "Libertinus Serif",
    size: 11pt,
  )

  set heading(numbering: "1.")

  set par(justify: true)

  set block(
    spacing: 1em,
  )

  show raw.where(block: true): block.with(
    fill: rgb("#f8f8f8"),
    inset: 12pt,
    radius: 4pt,
    stroke: rgb("#dddddd"),
  )

  // This applies the background styling to all inline raw/code
  show raw: it => box(
    fill: rgb("#dddddd"),
    inset: 4pt,
    radius: 3pt,
    it,
  )

  doc
}
