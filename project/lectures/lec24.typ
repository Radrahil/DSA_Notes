= Lecture 24

== Single-Source Shortest Path (SSSP)

Find the shortest path (or quickest route) from s to t

#figure(
  image("lec_24_1.jpg", width: 70%),
  caption: [
    Weighted Graph
  ],
)


Find the shortest path (or quickest route) from $s$ to $t$.

It happens to be $s -> i -> h -> g -> d -> a -> e -> f -> c -> b -> t$

Total Path Weight = 63

== Triangle Inequality

$W(u,w) = 4$

$W(s,u) = 3$

$W(s,w) = 9$

```cpp
if (dist[u] + W(u,w) < dist[w])
  dist[w] = dist[u] + W(u, w);
```

You can treat a path as an edge.

$ "dist"[s] = 0 $
$ "dist"[d] = 73 $
$ "dist"[e] = 140 $
$ "dist"[g] = 52 $
$ "dist"[h] = 265 $
$ "dist"[f] = 361 $
$ "dist"[c] = 369 $
$ "dist"[b] = 387 $
$ "dist"[t] = 281 $
$ "dist"[t] = "dist"[c] + W(c,t) $

Using the Triangle Inequality update these.

/ Stopping Condition: For ALL edges $(u, w)$ $ "dist"[w] <= "dist"[u] + W(u, w) $

#show table.cell.where(y: 0): set text(weight: "bold")

#figure(
  table(
    columns: 3,
    stroke: none,

    table.header[Problem][Algorithm][Time Complexity],
    [SSSP on unweighted directed graphs], [BFS], [$O(V+E)$],
    [SSSP on weighted DAG], [Topological Sort], [$O(V+E)$],
    [SSSP on weighted directed graphs], [Bellman-Ford], [$O(V E)$],
    [SSSP on positively weighted directed graphs],
    [Djikstra's],
    [O($V + E log_2 E$)],
  ),
)

For the Topological Sort, we consider $s$ as the root node, as any nodes that have outgoing nodes to $s$ cannot be reached (DAG)

This uses the logic that every graph contains at least one source (No incoming Edges).

Compute dist for the ones directly connected to source and then delete it, and pick a new source. Repeat until entire graph is done.

The running time of this algorithm is the same as Topological Sort, $O(V+E)$

It can also be used to find longest path by multiplying weights by -1.
