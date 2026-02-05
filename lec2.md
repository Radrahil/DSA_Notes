# Insertion sort

| 27  | 26  | 2   | 7   |
| --- | --- | --- | --- |
| 2   | 7   | 26  | 27  |

It works like sorting a deck of cards

```cpp
for (i = 1; i <=n; i++) {
  for (j = i; j > 0 && A[j-1] > A[j]; j--){
    temp = A[j];
    A[j] = A[j-1]
    A[j-1] = temp;
  }
}
```

In essence, after every outer loop, the first `i` numbers are sorted with respect to themselves

27 26 2 7 -> 26 27 2 7 -> 2 26 27 7 -> 2 7 26 27

Think of it as having unsorted cards in your right hand.
You pick a card and insert it into the correct place in your left hand.

But the linear exchange swapping is inefficient. Then why do so?

This is because we >till need to get it there, so binary search won't help.
You still need to have everything in the right place causing you to swap things,
and binary search on a linked list is inefficient.

| Data Structure | Search | Insert | Total |
| ----------- | -------- | ------ | ----- |
| Array | O(log₂n) | O(n) | O(n) |
| Linked list | O(n) | O(1) | O(n) |

## Big O notation

It is used to represent the worst-case growth of time or space for an algorithm.
It depends on the highest degree of the function defining the resource usage of the algorithm (time/space).
For example an algorithm with running time `5n + 7` is `O(n)`

If you have a multi step algorithm its complexity is the complexity of the highest degree ex.
Doing a linear insertion and then a binary search is `O(n) + O(log₂n) = O(n)`.

> [!IMPORTANT]
> If you are nesting algorithms complexity is _multiplicative_.
> If iterating through each element of a list of size n you do a binary search
>for it in a different list of size m, the time complexity is `O(n·log₂m)`

Linear search: O(n)
Binary search: O(log₂n) (Technically it's log n but we use log₂n for clarity;
it divides search area in half per step)
