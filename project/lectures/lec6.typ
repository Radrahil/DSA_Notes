= Lecture 6
== Table of Contents
- #link(<evaluating-mathematical-expressions>)[Evaluating Mathematical Expressions]
  - #link(<evaluation>)[Evaluation]
  - #link(<infix-notation>)[Infix Notation]
  - #link(<postfix-notation>)[Postfix Notation]
    - #link(<advantages-of-postfix>)[Advantages of Postfix]
    - #link(<rules-for-postfix-evaluation>)[Rules for Postfix Evaluation]
    - #link(<puzzle>)[Puzzle]
    - #link(<evaluating-postfix>)[Evaluating Postfix]
- #link(<queue>)[Queue]
  - #link(<queue-operations>)[Queue Operations]

== Evaluating Mathematical Expressions
=== Evaluation
#box(image("lec6_EvalTree.jpg"))

=== Infix Notation
`A + ((B · C) - (D/E^F) · G ) · H`

`(a+b) left subtree · operator · right subtree`

Readable by humans

=== Postfix Notation
Readable by computers/calculators. Used in languages like LISP

`(ab+) left subtree · right subtree · operator`

==== Advantages of Postfix
- No parenthesis

- No operator precedence

- No associativity

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Infix], [Postfix],),
    table.hline(),
    [A + ((B · C) - (D/E^F) · G ) · H], [ABC · DEF^/G · -H · +],
  )]
  , kind: table
  )

Postfix notation was initially called RPN (Reverse Polish Notation)
named after the Polish scientist Jan Lucasiewicz. It was first used in a
calculator in 1938

==== Rules for Postfix Evaluation
+ Operand -\> Postfix
+ Open Bracket -\> Push to Stack
+ Closed Bracket -\> Pop everything one by one up to and including an
  opening bracket and put in postfix
+ Operator -\> Follow the chart, then push the current operator to stack

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([What to do?], [Precedence], [Associativity],),
    table.hline(),
    [Pop], [tos \> op], [-],
    [Pop], [tos = op], [left -\> right],
    [Push], [tos = op], [right -\> left],
    [Push], [tos \< op], [-],
  )]
  , kind: table
  )

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([Column1], [Column2], [Column3],),
    table.hline(),
    [A], [(empty)], [A],
    [+], [+], [A],
    [(], [+(], [A],
    [B], [+(], [AB],
    [·], [+(·], [AB],
    [C], [+(·], [ABC],
    [-], [+(-], [ABC ·],
    [(], [+(-(], [ABC ·],
    [D], [+(-(], [ABC · D],
    [/], [+(-(/], [ABC · D],
    [E], [+(-(/], [ABC · DE],
    [^], [+(-(/^], [ABC · DE],
    [F], [+(-(/^], [ABC · DEF],
    [)], [+(-], [ABC · DEF ^/],
    [·], [+(-·], [ABC · DEF ^/],
    [G], [+(-·], [ABC · DEF ^/ G],
    [)], [+], [ABC · DEF ^/ G ·-],
    [H], [+], [ABC · DEF ^/ G ·- H],
  )]
  , kind: table
  )

End of expression -\> Pop stack

Final Expression: `ABC · DEF^/G · -H · +`

Another way of doing it is traversing the tree top down and adding an
element only when you encounter it for the last time

==== Puzzle
Q: Convert to Postfix: `(56 + 12) · 3 - 4`

A: `56 12 + 3 · 4 -`

Q: `A^B^C`

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([Character], [Stack], [Postfix],),
    table.hline(),
    [A], [(empty)], [A],
    [^], [^], [A],
    [B], [^], [AB],
    [^], [^^], [AB],
    [C], [^^], [ABC],
  )]
  , kind: table
  )

End of expression -\> Pop stack

A: `ABC ^^`

==== Evaluating Postfix
Postfix Evaluation is done using a stack, scanning the expression left
\-\> right

- Operand -\> Push to Stack
- Operator:
  - Pop the top element (y)
  - Pop next element (x)
  - Calculate z = x operator y
  - Push z to stack

== Queue
First-In-First-Out (FIFO) Data Structure

=== Queue Operations
- Insert (enqueue)
- Delete (dequeue)
