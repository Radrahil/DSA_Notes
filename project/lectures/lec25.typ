= Lecture 25

== Johnson's Algorithm

- New vertex q is added with 0-weight edges to all other vertices.

- Run Bellman-ford once with q as source.

- Change edge weights

$"newwt"((u,v))$ = $"wt"((u, v)) + "dist"[u] - "dist"[v]$

- Run Repeated Dijkstra


== Minimum Spanning Tree (MST)
