= Lecture 3
== Comparing Sorting Algorithms
=== Bubble Sort
#figure(
  align(center)[#table(
    columns: 9,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([27], [26], [7], [2], [37], [39], [32], [3], [14],),
    table.hline(),
    [2], [3], [7], [14], [26], [27], [32], [37], [39],
  )]
  , kind: table
  )

26 7 2 27 37 32 3 14 39 -\> 7 2 26 27 32 3 14 37 39 Last 1 elements
sorted -\> Last 2 elements sorted These are sorted according to the
final output

For the worst case `6 5 4 3 2 1 -> 1 2 3 4 5 6`

The number of swaps = number of pairs of elements = `nC2`

=== Insertion Sort
#figure(
  align(center)[#table(
    columns: 9,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([27], [26], [7], [2], [37], [39], [32], [3], [14],),
    table.hline(),
    [2], [3], [7], [14], [26], [27], [32], [37], [39],
  )]
  , kind: table
  )

26 27 7 2 37 39 32 3 14 -\> 7 26 27 2 37 39 3 14 First 2 elements sorted
\-\> First 3 elements sorted These are sorted according to themselves.

For the worst case `6 5 4 3 2 1 -> 1 2 3 4 5 6`

The number of swaps = number of pairs of elements = `nC2`

The advantage of Insertion Sort is that it is an #emph[online]
algorithm, as in it can easily sort data coming in one by one

=== Selection Sort
#figure(
  align(center)[#table(
    columns: 9,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([27], [26], [7], [2], [37], [39], [32], [3], [14],),
    table.hline(),
    [2], [3], [7], [14], [26], [27], [32], [37], [39],
  )]
  , kind: table
  )

Works by picking the minimum element and moving it to the left.

`2 27 26 7 37 39 32 3 14` -\> `2 3 27 26 7 37 39 32 3 14`

```cpp
for (int i = 0; i <= n-2; i++) {
  min = A[i], pos = i;
  for (int j = i + 1; j <= n - 1; j++) {
    if (A[j] < min) {
      min = A[j], pos = j;
    }
  }
 swap(A[i], A[pos]);
}
```

For the worst case, the number of swaps = `n-1`

We see that Bubble Sort has no advantages over the other algorithms.

== Combining Two Sorted Lists
#figure(
  align(center)[#table(
    columns: 8,
    align: (auto,auto,auto,auto,auto,auto,auto,auto,),
    table.header([2], [3], [4], [7], [11], [12], [15], [16],),
    table.hline(),
    [1], [3], [7], [14], [26], [27], [32], [37],
  )]
  , kind: table
  )

We use a 2 pointer approach. Each pointer initially points to the first
element of each list. We compare both elements and add the appropriate
element to the final list, and increment the pointer of that list.

We continue to do so until we get to the end of one of the lists. At
that point the remaining portion of the other list can be appended to
the end

A is of size m, B is of size n. `i: O->m, j: O->n` Running time = k(m+n)
\= O(m+n)

== Merge Sort
We divide the list to the point that it is trivial to sort (1 or two
elements) and then merge it together

`4 2 3 1 -> (4 2) (3 1) -> (2 4) -> (1 3) -> 1 2 3 4`

Number of comparisons: `∑ (2^k - 1) * n/2^k; 1 <= k; n >= 2^k`

```cpp
int* merge(int A[], int B[], int m, int n) {
  int C[m + n];
  int i = 0, j = 0;
  for (int k = 0; k < m + n; k++) {
    if (i > m - 1) {
      C[k] = B[j]; j++;
    } else if (j > n-1) {
      C[k] = A[i]; i++;
    } else if (A[i] < B[j]) {
      C[k] = A[i]; i++;
    } else {
      C[k] = B[j]; j++;
    }
  }
  return C;
}

void mergeSort(int X[], int n) {
  if (n <= 1) return;
  p = n/2;

  mergeSort(X, p);
  mergeSort(X + p, n - p);

  int* temp = merge(X, X + p, p, n - p);

  for (int i = 0; i < n; i++) X[i] = temp[i];

  free(temp);
}
```

This algorithm has a time complexity of `O(nlog₂n)`
