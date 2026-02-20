= Data Structures and Algorithms Lecture 1
- #link(<data-structures-and-algorithms-lecture-1>)[Data Structures and Algorithms Lecture 1]
  - #link(<sorting>)[Sorting]
  - #link(<examplesapplications>)[Examples/Applications]
  - #link(<aim>)[Aim] - #link(<brute-force>)[Brute Force] -
    #link(<bubble-sort>)[Bubble sort] - #link(<puzzle>)[Puzzle]

== Sorting
Arrange (or order) a list of numbers in ascending or descending order.

== Examples/Applications
- Sorting students by marks
- Sorting colleges/companies by their rankings
- Sorting videos by their relevance
- Sorting flights by their ticket price.
- Arranging students by their name or roll numbers
- Sorting patients by their weight or height or age

Input: A

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([0], [1], [2], [3],),
    table.hline(),
    [27], [36], [2], [7],
  )]
  , kind: table
  )

Output: A

#figure(
  align(center)[#table(
    columns: 4,
    align: (auto,auto,auto,auto,),
    table.header([0], [1], [2], [3],),
    table.hline(),
    [2], [7], [27], [36],
  )]
  , kind: table
  )

== Aim
To devise a good algorithm to sort these numbers in ascending order

=== Brute Force
All possible arrangements There are `n!` possible orderings.

#block[
#block[
Note

]
Given an array of size `n` only `n-1` comparisons are needed to verify
sorting `A[i-1] <= A[i]` ∀ integers `1 <= i <=n`

]
=== Bubble sort
```cpp
swapped = 1;
while (swapped == 1) {
  swapped = 0;
  for(i = 1; i < n; i++) {
    if (A[i-1] > A [i]) {
      swap(A[i-1], A[i]);
      swapped = 1;
    }
  }
  // n-- for better efficiency
}
```

Bubbles an element to the top of the array. Guaranteed to sort it in
`n-1` runs of the inner loop. Time complexity is `O(n²)` As the last n
elements are guaranteed to be sorted after n runs of the for loop, we
can introduce an `n--` term after the for loop as there is no more need
to check it. Running time without the efficiency improvement is
`(n-1)*n` and with it is `(n-1)n/2`

==== Puzzle
#quote(block: true)[
A number in a series is considered a rabbit if it moves forward in
position after being sorted and a tortoise if it moves back. Find a way
to make an arrangement of 8 non-equal numbers such that there are 7
rabbits A: sort in ascending order and then send first element to the
end.
]

#quote(block: true)[
Find a way to make an arrangement such that there are 0 rabbits and non
zero tortoises
]

A: This is impossible, because for the last element it can only be in
its place to not be a rabbit, and from there by induction it is
impossible to have a tortoise without having a rabbit.

#block[
#block[
Important

]
Does the number of rabbits and tortoises decrease after each iteration
of the outer loop of the bubble sort algorithm?

]
A: Rabbits may increase (5 2 3 4 1) but tortoises will always stay the
same or decrease because an element in a single iteration may jump ahead
multiple places but can only jump back one step.

If the number of tortoises has increased, then an element in its correct
position has jumped ahead, meaning that the element ahead of it is
smaller than it, and all elements before it are smaller, which is
impossible.
