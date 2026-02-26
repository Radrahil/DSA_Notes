= Lecture 16
== Why Binary Search Trees?
#quote(block: true)[
What is the height of a BST with n nodes?
]

Height varies from $⌊ log_2 n ⌋ thin upright("to") thin n - 1$

Time complexity of Insert and Delete is O(H) so the lower bound of H is
the best case scenario.

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([best case], [⌊log₂n⌋],),
    table.hline(),
    [avg case], [$n / 2$],
    [worst case], [$n - 1$],
  )]
  , kind: table
  )

== Proof of log₂n on avg
For n elements there exist `n!` ways of constructing said binary tree
All elements are coming in random order

#block[
#block[
Note

]
The Inorder traversal of all n! BSTs is the same (Ascending order)

]
Assumption: A corner element does not occur 3 consecutive times, or
every 3 consecutive elements include at least one middle element.

The middle 98% is middle elements, and the left and right 1% are the
corner elements.

Let us assume the first element is a middle element, with L subtree
bigger than R subtree.

Let us assume the next two elements are corner elements, i.e don\'t have
two subtrees.

After 3 steps, the remaining nodes are at most $99 / 100 n$

After 3k steps, the remaining nodes are at most $(99 / 100^k) n$

$k = log_n (100 / 99)$

=== Issues with this proof
- Assumption does not cover all cases
- Abuse of the Big O notation. In most practical cases the constant is
  bigger than the function itself
- Grains of rice proof

$ X_(i , j) = cases(delim: "{", 1 & upright("if node ") i upright(" is an ancestor of node ") j ,, 0 & upright("otherwise.")) $

#quote(block: true)[
In how many of the 10! BSTs of 1-10 is node 7 an ancestor of node 6?
]

Relationship of all other nodes with 6 and 7 is identical.

Thus, for all permutations where 6 appears before 7, 6 is an ancestor of
7 ($X_(6 , 7) = 1$) and vice versa.

Thus, $P r [X_(7 , 6) = 1]$ = $1 / 2$ because for all permutations where
6 is before 7, there exists a permutation where the 6 and 7 are swapped
and 7 comes before 6

$P r [X_(8 , 6) = 1]$ ?

Out of 3! permutations `867` and `876` are valid orders for ancestry

So, $P r [X_(8 , 6) = 1] = 1 / 2$

$P r [X_(9 , 6) = 1]$ ?

If from 678 any occur before, 9 and 6 are split apart into different
subtrees from that element. Thus probability is 1/4

#quote(block: true)[
What is the expected depth of node 6?
]

$frac(2 + 3 + 4 + 2 + 4 + . . ., 10 !)$

$D_j : upright("Depth of node ") j$

Expected depth = Number of ancestors

$D_6 = X_(1 , 6) + X_(2 , 6) + . . . + X_(10 , 6)$

\$\$ \\begin{aligned} \\mathbb{E}\[D\_{6}\] &= \\mathbb{E}\[X\_{1,6} +
X\_{2,6} + \\cdots + X\_{10,6}\] \\ &= \\mathbb{E}\[X\_{1,6}\] +
\\mathbb{E}\[X\_{2,6}\] + \\cdots + \\mathbb{E}\[X\_{10,6}\] \\ &=
\\Pr\[X\_{1,6} = 1\] + \\Pr\[X\_{2,6} = 1\] + \\cdots + \\Pr\[X\_{10,6}
\= 1\] \\ &= \\left(\\frac{1}{6} + \\frac{1}{5} + \\frac{1}{4} +
\\frac{1}{3} + \\frac{1}{2}\\right)

- \\left(\\frac{1}{2} + \\frac{1}{3} + \\frac{1}{4} +
  \\frac{1}{5}\\right) \\end{aligned} \$\$

Harmonic Sum ($H_n$) = $l o g_e n + gamma$ = $l o g_e n + 0.5772$

$ upright("Average depth") & lt.eq 2 (1 / 2 + 1 / 3 + dots.h.c + frac(1, n \/ 2))\
 & lt.eq 2 ln #h(-1em) (n / 2) + 1.15\
 & lt.eq 2.88 (log_2 n - log_2 2)\
 & lt.eq 2.88 thin log_2 n $
