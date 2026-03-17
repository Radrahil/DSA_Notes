#import "template.typ": BookTemplate

#show: doc => BookTemplate(doc)

= Lecture 18
== Insertion into an AVL tree

If a node is inserted, the only balance factors that change are its ancestors'

During an insertion if the bf of a node becomes +2 or -2, then

#figure(
  image("AVL_Tree_Insert.jpg", width: 70%),
  caption: [
    Graphical Representation of AVL Tree insertion
  ],
)

== Deletions in a BST

+ 0 Children: trivial
+ 1 Child: shift up
+ 2 Children: Exchange with successor, delete successor.

FACT: Successor of a node with 2 Children always has at most 1 child.

#figure(
  image("AVL_TREE_DELETION.jpg", width: 70%),
  caption: [
    Graphical Representation of AVL Tree Deletion
  ],
)
$ floor(log_2 n)<= H <= 1.44 log_2 n $

H: Binary Tree, $1.44 log_2 n$ : AVL Tree

A(h) : The minimum possible number of nodes in an AVL tree of height h.

$
  A(0) = 1 A(1) = 2 A(2) = 4 A(3) = 7 \
  A(h) = A(h-1) + A(h-2) + 1 \
  A(h) = F(h+3) - 1 \
$

$ n >= F(h+3) - 1 $
$ n >= phi^(h+3)/root(, 5) - 1 - 1 $
$ n + 2 >= phi^(h+3) / root(, 5) $

$ phi approx 0.618 $

Take $log_phi$ on both sides

Facts : hth Fibonacci number is the integer closest to $phi^h/root(, 5)$

For all $n >= 3$,
$ log_phi (n + 2) <= log_phi (n) + 1.07 $

$ h + 3 <= log_phi root(, 5) + log_phi (n + 2) $
$ h + 3 <= 1.67 + log_phi (n) + 1.07 $
$ h <= log_phi (n) $

$ h <= 1.44 log_2 n $
