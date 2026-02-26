#let note(body) = block(
  fill: luma(240),
  inset: 10pt,
  radius: 6pt,
)[
  #text(fill: purple)[#strong[Note: ]]#body
]

#note[
  The inorder traversal of all n! BSTs is the same (Ascending order).
]
