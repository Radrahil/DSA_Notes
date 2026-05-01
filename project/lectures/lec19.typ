#import "template.typ": BookTemplate

#show: doc => BookTemplate(doc)

= Lecture 19

/ Theorem: For every positive integer $n$, the height of every AVL tree on n nodes is at most 1.44 $log_2 n$

Proof: For $n=1$,
$ h = log_2 n <= 1.44 log_2 n $

For $n=2$,
$ h = log_2 n <= 1.44 log_2 n $

To prove: For all $n >= 3$,

$ h <= log_2 n $
$ n >= 3 $
$ 1/n <= 1/3 $
$ 1 + 2/n <= 2/3 + 1 $

$ (n + 2) / n <= 5/3 $

Taking logarithms (base $phi$) on both sides, wher $phi approx 1.618$ is the golden ratio,

$ log_phi (n+2) <= log_phi n + 1.07 $

If $A(h)$ is the maximum number of nodes in an avl tree of height h then

$ A(h) = F(h+3) - 1 $

#underline[FACT] For all $i >= 3$, F(i) is the closest integer to $(phi^i)/root(, 5)$.
Therefore, $ F(i) >= (phi^i)/root(, 5) $

$ => n >= (phi^i)/root(, 5) -1 - 1 $
$ n >= (phi^i)/root(, 5) - 2 $
$ n + 2 >= (phi^i)/root(, 5) $

$ log_phi (n+2) >= log_phi (phi^(h+3)) - log_phi root(, 5) $
$ log_phi (n+2) >= h+3 - 1.672 $
$ h <= log_phi (n + 2) - 3 + 1.672 $
$ h <= log_phi n + 1.07 - 3 + 1.672 $
$ h <= log_phi n - 0.25 $
$ h <= log_phi n $
$ h <= (log_phi n) / (log_phi 2) $
$ h <= 1.44log_phi n $

== Graph Theory

=== What is a Graph?

Undirected Graphs :
Graph $G = (V, E)$

$V = "Set of Vertices" (|V| = n)$
$E = "Set of Edges" (|E| = m)$

+ $E subset.eq V times V$
+ For every $v in V$, we have $(v, v) in.not E$
+ Let V = {1, 2, 3, ... , n}
For every edge $(i,j) in E$, we have $i<j$
$ |V| = n = 9 $
$ |E| = m = 12 $

$ V = {1, 2, 3, 4, 5, 6, 7, 8, 9} $
$ E = {(1,2), (1,3), (2,3), (2,4), (2,5), (3,4), (3,6), (4,5), (4,6), (5,6), (5,8), (7,8)} $

=== Adjacency Matrix: $O(n^2)$

- $n times n "matrix"$
- Whenever $(i, j) in E$, then $A[i][j] = A[j][i] = 1$
Otherwise, $A[i][j] = A[j][i] = 0$
- $A[i][i] = 0$

=== Incidence matrix: $O(m n)$ Storage

- $m times n$ matrix I
- Each edge is labelled by a number from 1 to $m$
- Each row is labelled by an edge
- Each column is labelled by a vertex
- $I[i][j]$ = 1 if j#super[th] vector is part of i#super[th] edge

$
  mat(
    1, 1, 0, 0, 0, 0;
    1, 0, 0, 0, 1, 0;
    0, 1, 1, 0, 0, 0;
    0, 0, 0, 0, 1, 1;
  )
$

=== Adjacency list: $O(m + n)$ Storage

- Single array of size $n$
- For each $A[i]$, its corresponding linked list contains all the vertices j such that $(i, j) in E$ or $(j,i) in E$
$
  1->2->5 \
  2->1->3 \
  3->2 \
  4 \
  5->1->6 \
  6->5 \
$
