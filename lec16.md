# Lecture 16

## Why Binary Search Trees?

> What is the height of a BST with n nodes?

Height varies from $\lfloor \log_{2} n\rfloor \, \text{to}\, n-1$

Time complexity of Insert and Delete is O(H) so the lower bound of H is the best case scenario.

| best case | ⌊log₂n⌋ |
| -------------- | --------------- |
| avg case | $\frac{n}{2}$ |
| worst case | $n-1$ |

## Proof of log₂n on avg

For n elements there exist ```n!``` ways of constructing said binary tree
All elements are coming in random order

> [!NOTE]
> The Inorder traversal of all n! BSTs is the same (Ascending order)

Assumption: A corner element does not occur 3 consecutive times, or
every 3 consecutive elements include at least one middle element.

The middle 98% is middle elements, and the left and right 1% are the corner elements.

Let us assume the first element is a middle element, with L subtree bigger than R subtree.

Let us assume the next two elements are corner elements, i.e don't have two subtrees.

After 3 steps, the remaining nodes are at most $\frac{99}{100}n$

After 3k steps, the remaining nodes are at most $(\frac{99}{100}^k)n$

$k = \log_{n} \left( \frac{100}{99} \right)$

### Issues with this proof

- Assumption does not cover all cases
- Abuse of the Big O notation.
In most practical cases the constant is bigger than the function itself
- Grains of rice proof

$$
X_{i,j} =
\begin{cases}
1 & \text{if node } i \text{ is an ancestor of node } j, \\
0 & \text{otherwise.}
\end{cases}
$$

> In how many of the 10! BSTs of 1-10 is node 7 an ancestor of node 6?

Relationship of all other nodes with 6 and 7 is identical.

Thus, for all permutations where 6 appears before 7, 6 is an ancestor of 7
($X_{6,7} = 1$) and vice versa.

Thus, $Pr[X_{7,6}=1]$ = $\frac{1}{2}$ because for all permutations where 6 is before 7, there exists a permutation where the 6 and 7 are swapped and 7 comes before 6

$Pr[X_{8,6}=1]$ ?

Out of 3! permutations ```867``` and ```876``` are valid orders for ancestry

So, $Pr[X_{8,6}=1] = \frac{1}{2}$

$Pr[X_{9,6}=1]$ ?

If from 678 any occur before, 9 and 6 are split apart into different subtrees from that element.
Thus probability is 1/4

> What is the expected depth of node 6?

$\frac{2+3+4+2+4+...}{10!}$

$D_{j} : \text{Depth of node }j$

Expected depth = Number of ancestors

$D_{6} = X_{1,6} + X_{2,6} + ... + X_{10,6}$

$$
\mathbb{E}[D_{6}]
=
\mathbb{E}[X_{1,6} + \cdots + X_{10,6}]
$$

$$
=
\mathbb{E}[X_{1,6}] + \mathbb{E}[X_{2,6}] + \cdots + \mathbb{E}[X_{10,6}]
$$

$$
=
\Pr[X_{1,6} = 1] + \Pr[X_{2,6} = 1] + \cdots + \Pr[X_{10,6} = 1]
$$

$$
=
\left(\frac{1}{6} + \frac{1}{5} + \frac{1}{4} + \frac{1}{3} + \frac{1}{2}\right)
 + \left(\frac{1}{2} + \frac{1}{3} + \frac{1}{4} + \frac{1}{5}\right)
$$

Harmonic Sum ($H_{n}$) = $log_{e}n + \gamma$ = $log_{e}n + 0.5772$

$$
\text{Average depth}
\le 2\left( \frac{1}{2} + \frac{1}{3} + \cdots + \frac{1}{n/2} \right)
$$

$$
\le 2\ln\left(\frac{n}{2}\right) + 1.15
$$

$$
\le 2.88\left(\log_{2} n - \log_{2} 2\right)
$$

$$
\le 2.88\,\log_{2} n
$$
