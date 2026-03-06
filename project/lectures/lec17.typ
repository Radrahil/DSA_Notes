#import "template.typ": BookTemplate

#show: doc => BookTemplate(doc)

= Lecture 17
== Binary Search Trees


Insert : O(H)
Delete : O(H)

Height = max node depth
Depth = Number of edges from that node to the root

$ ceil(log₂n) <= H <= n-1 $

If the entries of a BST are coming in at random then its expected height is O(log₂n)

== Self-balancing BSTs

- During each insert/Delete operation, _adjust_ the tree in such a way that it remains balanced.
- Adjusting should be done in an _efficient_ manner

=== AVL Trees

- Adelson-Velsky-Landis
- Self-balancing BST
- Performs self-balancing (or adjusting) after each insert/delete operation is carried out as in a standard BST
- For every node x in an AVL tree, $ |"bf"(x)| <= 1 $ $ "bf"(x) in {-1,0,1} $

Balance factor ($"bf"$): For a node x in a bst , $ "bf"(x) = "lht"(x) - "rht"(x) $
where

lht: Height of tree ignoring right subtree
rht: Height of tree ignoring left subtree

#figure(
  image("AVL-tree.svg", width: 70%),
  caption: [
    Graphical Representation of AVL Tree
  ],
)

==== Rotate

#figure(
  image("rotate.png", width: 70%),
  caption: [
    Graphical Representation of AVL Tree
  ],
)

#underline[*Theorem*] If $T_1$ is a valid BST, then $T_2$ is a valid BST

Proof: $ A < P < B < Q < C $

If $"bf"$ < 0, rotate right, and vice versa

For Insert 1, 3, 2, if we rotate left, it will no longer be a BST.

We observe that $"sign of bf"(1) != "sign of bf"(3)$

If balance factors have opposite signs, then a  _double rotate_ is required.

We first rotate right 3, so that both 1 and the node below have the same sign. Then, we rotate left at 1.

When we insert a node, we balance it bottom up, that is, we rotate from the bottom unbalanced.

- A local insert might result in a global imbalance
- A global imbalance can be fixed with a local adjustment
