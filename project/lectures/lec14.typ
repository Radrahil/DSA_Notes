= Lecture 14

== Notation
n: number of nodes N: Next power of two

== Operations on a heap
- insert -\> O(log₂n)
- delete-min and delete-max -\> O(log₂n)
- heapify -\> O(n)
- heap sort -\> O(nlog₂n)

== Heapify
Given an array, convert it to a min-heap

=== Sorting
Simply sort the array. O(nlog₂n)

=== Heapify top-down
- Start from the top and go downwards
- Ensure everything above current node is a valid heap.
- Once you reach bottom, everything is valid.

#quote(block: true)[
Time Complexity
]

Since heap is a complete binary tree, depth of a node is at most
⌈log₂n⌉. Each Node moves upwards at most log₂n times, and there are n
nodes Complexity is thus \<= nlog₂n -\> O(nlog₂n)

Each left node undergoes log₂n exchanges.

Total time = ½ N log₂n \>= ½ n log₂n

½ N log₂n \>= ½ n log₂n

=== Heapify bottom-up
- Start from bottom and go upwards.
- Ensure that everything below current node satisfies heap property.
- Once you reach top heap is created.

#quote(block: true)[
Time Complexity
]

Since heap is a complete binary tree, depth of a node is at most
⌈log₂n⌉. Each Node moves downwards at most log₂n times, and there are n
nodes Complexity is thus \<= nlog₂n

Each parent of leaf (P(leaf)) undergoes at most one exchange in a step

P(P(leaf)) undergoes at most two exchanges in a step, and so forth

Leaf nodes = N/2 (0 exchanges)

P(Leaf) = N/4 (1 exchanges)

P(P(Leaf)) = N/8 (2 exchanges)

P(P(P(Leaf))) = N/16 (3 exchanges)

`X = N/2 · 0 + N/4 · 1 + N/8 · 2 + N/16 · 3 + ...`

`2X = N/2 · 1 + N/4 · 2 + N/8 · 3 + N/16 · 4 + ...`

`2X-X = X = N/2 + N/4 + N/8 + N/16 + N/32 ...`

`X <= N`

Thus complexity is O(N)

== Heap Sort
Keep performing delete-max until there is nothing left to delete.

We delete max element and insert it into end of sorted array.

In an actual heap, we swap it to the end of the array, reduce the size,
and heapify.

This heapify will take log₂n steps at worst. Thus total time complexity
is

log₂(n) + log₂(n-1) + log₂(n-2) + log₂(n-3) ... + log₂(2) = log(n!) \<=
O(nlog₂n)

Heap sort \<= (n + 1) + c(n log₂n) ↓ ↓ Heapify Extraction
