#import "template.typ": BookTemplate

#show: doc => BookTemplate(doc)

#set heading(numbering: "1.")

// #show text.where(style: "monospace"): box(
//   fill: rgb("#eeeeee"),
//   inset: 2pt,
//   radius: 3pt,
// )
//
// #show text.where(style: "monospace"): set text(
//   fill: rgb("#222222"),
// )

#align(center)[
  #text(22pt, weight: "bold")[Data Structures & Algorithms]
  #v(1em)
  #text(12pt)[Rahil Prakash, 2026 Spring Semester]
]

#outline(
  title: "Contents",
  depth: 3,
)

#pagebreak()

#include "lectures/lec1.typ"
#include "lectures/lec2.typ"
#include "lectures/lec3.typ"
#include "lectures/lec4.typ"
#include "lectures/lec5.typ"
#include "lectures/lec6.typ"
#include "lectures/lec7.typ"
#include "lectures/lec8.typ"
#include "lectures/lec9.typ"
#include "lectures/lec11.typ"
#include "lectures/lec12.typ"
#include "lectures/lec13.typ"
#include "lectures/lec14.typ"
#include "lectures/lec15.typ"
#include "lectures/lec16.typ"
