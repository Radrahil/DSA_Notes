= Lecture 5
== Table of contents

== Sort 4 elements using 4 comparisons
It is impossible to guarantee that you can sort 4 numbers using 4
comparisons.

Four elements: `a b c d` -\> 4! = 24 possible combinations for final
order The optimal comparison will split the possibilities into 2

24 possibilities -\> 12 -\> 6 -\> 3 -\> 1.5 (1 or 2)

So, in the worst case you will need 5 comparisons

2^k \>= n! -\> k \>= log₂(n!) -\> k \>= (1/4) n log₂(n)

```text
2^k >= n x (n-1) x (n-2)x ... (n/2 - 1) ... 3 x 2 x 1
-> 2^k >= (n/2)^(n/2) x 2^(n/2)
k >= (n/2)log(n/2) + (n/2)log 2 >= (n/4)(log(n/2) + log 2) >= (n/4)log(n/2)
```

#block[
#block[
Important

]
Every comparison-based sorting algorithm makes at least (1/4) n log₂(n)
comparisons in the worst case

]
== Stacks
FILO (First-In Last-Out) Data Structure

=== Basic Stack Operations
```c
int isEmpty(int top) {
  if (top == -1) {
    return 1;
  }
  return 0;
}

int isFull(int top, int max) {
  if (top == max-1) {
    return 1;
  }
  return 0;
}
```

- Push

```c
void push(stack[], top, max, item) {
  if (top == max - 1) {
    printf("Stack overflow");
    return;
  } else {
    stack[++top] = item;
  }
}
```

- Pop

```c
int pop(stack[], top) {
  if (isEmpty) {
    printf("Empty");
    return -1;
  }
  return stack[top--];
}
```

== Checking For Balanced Parentheses
(a + b)(c + d) - (2a(3c -4b) + 6c) -\> Good 1 12 2 3 4 4 3 (2c + 43))
\-\> Wrong

=== Rules For Balanced Parentheses
- Every open parenthesis is associated with exactly one closed
  parenthesis.
- At every step while scanning the expression from left to right, the
  number of open parentheses \>= closed parentheses.

=== Algorithm
The algorithm for doing this with a stack is as follows:

For each open parenthesis we push onto the stack and pop it for each
closed.

If you ever try to pop an empty stack or if the stack isn\'t empty at
the end, the parentheses aren\'t balanced
