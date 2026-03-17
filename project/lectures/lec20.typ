#import "template.typ": BookTemplate

#show: doc => BookTemplate(doc)

= Lecture 20

\

/ Undirected Graph: G = (V, E);
/ $V$: Set of Vertices ($|V| = n$)
/ $E$: Set of Edges ($|V| = n$)


Compare n and m

$ n = 4 $ $ V = {1, 2, 3, 4} $

$
  V times V =
  {(1,1),(1,2),(1,3),(1,4),
    (2,1),(2,2),(2,3),(2,4),
    (3,1),(3,2),(3,3),(3,4),
    (4,1),(4,2),(4,3),(4,4)}
$

However, $n$ of these are invalid (type $(v,v)$) and half of the remaining are invalid ($i > j$)

Thus, for $n$ Vertices, maximum Edges are $(n^2 - n) / 2$ = $n(n-1)/2$

Such Graphs always exist for any n. These are called *Complete Graphs*.

$0 <= |E| <= n(n-1)/2$

/ Neighbourhood: The Neighbourhood of a vertex $i$ is the set of all vertices $j$ such that either $(i,j) "or" (j,i) in E$

Effectively, it's the set of all those vertices that the vertex has an edge to.

/ Degree: The size of the Neighbourhood of the graph

/ Puzzle 1: Draw a graph on 6 vertices where degree of each vertex is 3

#figure(
  image("lec20_puzzle1.png", width: 70%),
  caption: [
    Solution to Puzzle 1
  ],
)

/ Puzzle 2: Draw a graph on 6 vertices where degree of each vertex is 3

This is *IMPOSSIBLE*

This is because total degree must be even as each edge adds 2 to total degree, thus this is impossible.
$ D = 2m $

/ Fact: The total degree is always even.

/ Handshaking Lemma: If each person at a party shakes hands with certain others, then the total number of people with an odd number of handshakes is an even number

If two people with even number of handshakes shake hands both become odd, number of odd incremented by 2, and vice versa for two odd.

If person with odd and person with even shake hands, even becomes odd and odd becomes even, no change.

Initially, with no handshakes, number of odd = 0.

Alternatively, since total degree $D$ is even, and sum of total even degrees is necessarily even, there are always an even number of odd degrees.

== Graph Algorithms

=== Breadth-First Search

- "Exploring" the graph
- Start from one vertex
- "See" or "visit" every vertex
- "See" or "visit" every edge

#underline[*BFS Idea*]

- Start from a vector
- Look at all its neighbours
- Look at all neighbours of neighbours' neighbours
- Terminate once everything has been seen

```cpp
BreadthFirstSearch(s) {
  put(phi, s) into queue Q.
  while (Q is non-empty) {
    delete (p, v) from Q
    if (v is not visited)
    {
      visit v;
      parent(v)<-p; // For Seeing which layer of depth something is in
      for (each w s.t (v, w) in E)
           insert (v, w) into Q;
    }
  }
}
```
