# Quick Sort

<!-- toc -->

- [Idea](#idea)
- [Example](#example)
- [Partitioning](#partitioning)
  * [Lomuto Partition Scheme](#lomuto-partition-scheme)
- [Algorithm](#algorithm)
- [Properties](#properties)
- [Time Complexity](#time-complexity)
  * [Worst Case Explanation](#worst-case-explanation)
- [Number of Comparisons](#number-of-comparisons)
- [Improving Performance](#improving-performance)
  * [Randomized Quick Sort](#randomized-quick-sort)
- [Comparison with Other Sorting Algorithms](#comparison-with-other-sorting-algorithms)
- [Key Observations](#key-observations)
- [When to Use Quick Sort](#when-to-use-quick-sort)

<!-- tocstop -->

## Idea

Quick Sort is a **divide-and-conquer** sorting algorithm.

Instead of dividing the array into equal halves (like Merge Sort), it:

1. Chooses a **pivot element**
2. Partitions the array such that:
   * Elements **less than or equal to the pivot** are on the left
   * Elements **greater than the pivot** are on the right
3. Recursively applies the same process on the left and right subarrays

After partitioning, the pivot is in its **final sorted position**.

## Example

Input:

| 27 | 26 | 7 | 2 | 37 | 39 | 32 | 3 | 14 |
| -- | -- | - | - | -- | -- | -- | - | -- |
| 7 | 2 | 3 | **14** | 27 | 26 | 37 | 39 | 32 |

Choose pivot = **14**

Recursive calls:

* Left subarray: `7 2 3`
* Right subarray: `27 26 37 39 32`

Final Output:

| 2 | 3 | 7 | 14 | 26 | 27 | 32 | 37 | 39 |
| - | - | - | -- | -- | -- | -- | -- | -- |

## Partitioning

Partitioning is the core operation of Quick Sort.

A pivot element is chosen and the array is rearranged so that all elements
smaller than or equal to the pivot appear before it and all greater elements
appear after it.

### Lomuto Partition Scheme

Pivot is chosen as the **last element**.

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

* `A[p]` is in its **correct sorted position**
* Elements to the left of `p` are ≤ pivot
* Elements to the right of `p` are > pivot

## Algorithm

```cpp
void quickSort(int A[], int low, int high) {
  if (low < high) {
    int p = partition(A, low, high);
    quickSort(A, low, p - 1);
    quickSort(A, p + 1, high);
  }
}
```

## Properties

* In-place sorting algorithm
* Not stable
* Recursive
* Based on divide-and-conquer paradigm

## Time Complexity

| Case         | Time Complexity |
| ------------ | --------------- |
| Best case    | `O(nlog₂n)`     |
| Average case | `O(nlog₂n)`     |
| Worst case   | `O(n²)`         |

### Worst Case Explanation

Worst case occurs when the pivot chosen is always the **smallest** or
**largest** element.

Example:

```1 2 3 4 5 6```
This produces subproblems of sizes `n-1` and `0`.

Recurrence relation:

```T(n) = T(n-1) + O(n)```

Which results in:

```T(n) = O(n²)```

## Number of Comparisons

* Best and average case: `O(nlog₂n)`
* Worst case: `nC2` comparisons

## Improving Performance

### Randomized Quick Sort

Randomly choosing the pivot reduces the probability of worst-case behavior.

```cpp
int randomPartition(int A[], int low, int high) {
  int r = low + rand() % (high - low + 1);
  swap(A[r], A[high]);
  return partition(A, low, high);
}
```

## Comparison with Other Sorting Algorithms

| Algorithm      | Best      | Average   | Worst     | Extra Space | Stable |
| -------------- | --------- | --------- | --------- | ----------- | ------ |
| Bubble Sort    | O(n)      | O(n²)     | O(n²)     | O(1)        | Yes    |
| Insertion Sort | O(n)      | O(n²)     | O(n²)     | O(1)        | Yes    |
| Selection Sort | O(n²)     | O(n²)     | O(n²)     | O(1)        | No     |
| Merge Sort     | O(nlog₂n) | O(nlog₂n) | O(nlog₂n) | O(n)        | Yes    |
| Quick Sort     | O(nlog₂n) | O(nlog₂n) | O(n²)     | O(log₂n)    | No     |

## Key Observations

> [!IMPORTANT]
> Quick Sort is usually faster in practice than Merge Sort despite having
> the same average time complexity.

Reasons:

* Better cache locality
* No extra memory allocation
* Smaller constant factors

## When to Use Quick Sort

* When in-place sorting is required
* When average-case performance is more important than worst-case guarantee
* Widely used in real-world libraries and systems
