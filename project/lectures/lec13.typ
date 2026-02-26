= Lecture 13

- Finding min/max -\> O(n) unsorted, O(1) sorted
- Maintaining min/max
  - Inserts are happening -\> O(1) per element
  - Deletes are happening -\> O(n) per element

== Heaps
- Unlike BSTs, Heaps are binary trees that have both children \> node
  (min-heap).
- This means all ancestors \< their descendants. Doesn\'t apply to other
  descendants.
- Complete (or left justified) binary tree.

=== Left-justified (or Complete) binary tree
All nodes are inserted from top to bottom, and left to right.

For height h, 2^h \<= no. of nodes \<= 2^(h+1) - 1

\-\> h \<= log₂(n)

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([n], [h],),
    table.hline(),
    [1], [0],
    [2], [1],
    [4], [2],
    [8], [3],
    [16], [4],
  )]
  , kind: table
  )

The minimum element of a min-heap is always the root node.

=== Insertion into Heap
We insert into the appropriate position at bottom, such that it
maintains left-justified property.

Then, if inserted \< parent, swap them. Repeat until node \< parent or
parent = NULL

Number of swaps performed \<= h \<= log₂(n)

Insertion time \<= O(log₂(n))

=== Deletion from Heap
Take element and swap it with latest element. Delete that element, and
fix the tree.

If it is the problem with children, swap it with the lesser one.

Number of swaps performed \<= h \<= log₂(n)

Deletion time \<= O(log₂(n))

#figure(
  align(center)[#table(
    columns: 3,
    align: (auto,auto,auto,),
    table.header([Data Structure], [Insertion], [Deletion],),
    table.hline(),
    [Array], [O(1)], [O(n)],
    [Heap], [O(log₂(n))], [O(log₂(n))],
  )]
  , kind: table
  )

This is better than just a sorted array as for each operation you need
O(n) swaps.

=== Heap as an Array
Let array be A. Root is `A[0]`

For any node with index i, its children are `A[2 * i + 1]` and
`A[2 * i + 2]`

Similarly, for a node, its parent is `(i - (2 - (i % 2))/2` or
`(i-1)/2)`

#block[
#block[
Important

]
A sorted array (ascending order) is a valid representation of a
min-heap.

]
Thus, as construction from a random array is O(nlog₂(n)), sorting the
array is a viable way to start.
