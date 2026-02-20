= Quick Sort
- #link(<idea>)[Idea]
- #link(<example>)[Example]
- #link(<partitioning>)[Partitioning]
  - #link(<lomuto-partition-scheme>)[Lomuto Partition Scheme]
- #link(<algorithm>)[Algorithm]
- #link(<properties>)[Properties]
- #link(<time-complexity>)[Time Complexity]
  - #link(<worst-case-explanation>)[Worst Case Explanation]
- #link(<number-of-comparisons>)[Number of Comparisons]
- #link(<improving-performance>)[Improving Performance]
  - #link(<randomized-quick-sort>)[Randomized Quick Sort]
- #link(<comparison-with-other-sorting-algorithms>)[Comparison with Other Sorting Algorithms]
- #link(<key-observations>)[Key Observations]
- #link(<when-to-use-quick-sort>)[When to Use Quick Sort]

== Idea
Quick Sort is a #strong[divide-and-conquer] sorting algorithm.

Instead of dividing the array into equal halves (like Merge Sort), it:

+ Chooses a #strong[pivot element]
+ Partitions the array such that:
  - Elements #strong[less than or equal to the pivot] are on the left
  - Elements #strong[greater than the pivot] are on the right
+ Recursively applies the same process on the left and right subarrays

After partitioning, the pivot is in its #strong[final sorted position];.

== Example
Input:

#figure(
  align(center)[#table(
    columns: 9,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([27], [26], [7], [2], [37], [39], [32], [3], [14],),
    table.hline(),
    [7], [2], [3], [#strong[14];], [27], [26], [37], [39], [32],
  )]
  , kind: table
  )

Choose pivot = #strong[14]

Recursive calls:

- Left subarray: `7 2 3`
- Right subarray: `27 26 37 39 32`

Final Output:

#figure(
  align(center)[#table(
    columns: 9,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([2], [3], [7], [14], [26], [27], [32], [37], [39],),
    table.hline(),
  )]
  , kind: table
  )

== Partitioning
Partitioning is the core operation of Quick Sort.

A pivot element is chosen and the array is rearranged so that all
elements smaller than or equal to the pivot appear before it and all
greater elements appear after it.

=== Lomuto Partition Scheme
Pivot is chosen as the #strong[last element];.

```cpp
int partition(int A[], int low, int high) {
  int pivot = A[high];
  int i = low - 1;

  for (int j = low; j < high; j++) {
    if (A[j] <= pivot) {
      i++;
      swap(A[i], A[j]);
    }
  }
  swap(A[i + 1], A[high]);
  return i + 1;
}
```

After partitioning:

- `A[p]` is in its #strong[correct sorted position]
- Elements to the left of `p` are ≤ pivot
- Elements to the right of `p` are \> pivot

== Algorithm
```cpp
void quickSort(int A[], int low, int high) {
  if (low < high) {
    int p = partition(A, low, high);
    quickSort(A, low, p - 1);
    quickSort(A, p + 1, high);
  }
}
```

== Properties
- In-place sorting algorithm
- Not stable
- Recursive
- Based on divide-and-conquer paradigm

== Time Complexity
#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([Case], [Time Complexity],),
    table.hline(),
    [Best case], [`O(nlog₂n)`],
    [Average case], [`O(nlog₂n)`],
    [Worst case], [`O(n²)`],
  )]
  , kind: table
  )

=== Worst Case Explanation
Worst case occurs when the pivot chosen is always the #strong[smallest]
or #strong[largest] element.

Example:

`1 2 3 4 5 6` This produces subproblems of sizes `n-1` and `0`.

Recurrence relation:

`T(n) = T(n-1) + O(n)`

Which results in:

`T(n) = O(n²)`

== Number of Comparisons
- Best and average case: `O(nlog₂n)`
- Worst case: `nC2` comparisons

== Improving Performance
=== Randomized Quick Sort
Randomly choosing the pivot reduces the probability of worst-case
behavior.

```cpp
int randomPartition(int A[], int low, int high) {
  int r = low + rand() % (high - low + 1);
  swap(A[r], A[high]);
  return partition(A, low, high);
}
```

== Comparison with Other Sorting Algorithms
#figure(
  align(center)[#table(
    columns: 6,
    align: (auto,auto,auto,auto,auto,auto,),
    table.header([Algorithm], [Best], [Average], [Worst], [Extra
      Space], [Stable],),
    table.hline(),
    [Bubble Sort], [O(n)], [O(n²)], [O(n²)], [O(1)], [Yes],
    [Insertion Sort], [O(n)], [O(n²)], [O(n²)], [O(1)], [Yes],
    [Selection Sort], [O(n²)], [O(n²)], [O(n²)], [O(1)], [No],
    [Merge Sort], [O(nlog₂n)], [O(nlog₂n)], [O(nlog₂n)], [O(n)], [Yes],
    [Quick Sort], [O(nlog₂n)], [O(nlog₂n)], [O(n²)], [O(log₂n)], [No],
  )]
  , kind: table
  )

== Key Observations
#block[
#block[
Important

]
Quick Sort is usually faster in practice than Merge Sort despite having
the same average time complexity.

]
Reasons:

- Better cache locality
- No extra memory allocation
- Smaller constant factors

== When to Use Quick Sort
- When in-place sorting is required
- When average-case performance is more important than worst-case
  guarantee
- Widely used in real-world libraries and systems
