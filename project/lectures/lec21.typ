#import "template.typ": BookTemplate

#show: doc => BookTemplate(doc)

= Lecture 21

== Breadth-First Search

```cpp
BreadthFirstSearch(s) {
  put(NULL, s) into queue Q.
  while (Q is non-empty) {
    delete (p, v) from Q
    if (v is not visited)
    {
      visit v;
      parent(v)<-p;
      for (each w s.t (v, w) in E)
           insert (v, w) into Q;
    }
  }
}
```

== Depth-First Search

```cpp
DepthFirstSearch(s) {
  put(NULL, s) into stack S.
  while (S is non-empty) {
    pop (p, v) from S
    if (v is not visited)
    {
      visit v;
      parent(v)<-p;
      for (each w s.t (v, w) in E)
           push (v, w) into S;
    }
  }
}
```

== Directed Graph

- Graph : $G = (V, E)$
- $E subset.eq V times V$
- For every $v in V$, we have $(v,v) in.not V$

/ Cycle: A cycle of length k in a directed graph is a sequence of vertices such that the first and the last vertex are the same, and all other vertices are distinct, and every two consecutive vertices have an edge betweeen them.
