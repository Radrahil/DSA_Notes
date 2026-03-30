#import "template.typ": BookTemplate

#show: doc => BookTemplate(doc)

= Lecture 22

== Directed Acyclic Graph (DAG)

A Directed Graph without any cycles is called a DAG

=== Topological Sorting

A drawing of the graph in which the vertices are arranged as points on a straight horizontal line such that all edges go from left to right

#figure(
  image("lec_22_topological_sort.png", width: 70%),
  caption: [
    Visual Depiction of Topological Sort
  ],
)


If a directed graph can be topologically sorted it is a DAG and vice versa.

A directed graph on $n$ vertices can have $n!$ different ordering on a straight horizontal line

/ in-degree(v): Number of incoming edges to v
/ out-degree(v): Number of outgoing edges from v
/ degree(v): in-deg(v) + out-deg(v)

Every DAG has AT LEAST ONE vertex v whose in-degree is 0

#underline[Proof By Contradiction :]

Suppose every vertex has non-zero in-degree (at least one incoming edge) and that there are $n$ vertices

Now, let us connect the second vertex to the first to satisfy this condition.
After doing this $n-1$ times there are no new vertices in the graph.
However if we do it for the last, it must have incoming edge from an existing vertice, making a cycle.

Hence, the DAG has a cycle. Contradiction!

```cpp
TopologicalSort(G) {
  initialize in-deg array;
  initialize empty stack S;
  initialize answer vector;

  push all vertices of in-deg=0 into S
  count = 0;
  while (S is non-empty) {
    v <-pop(S);
    answer.push(v);
    count++;
    for (each w such that w in A[v]) {
      in-deg[w]--;
      if (in-deg[w] == 0) {
        push w on stack;
      }
    }
  }
  if (count < n) there is a cycle;
}
```

== Strongly Connected Component (SCC)

Two vertices u and v are said to be from the same SCC if u is reachable from v and vice versa

In case this happens, u and v are assigned the same color
