# Lecture 12

```c
DELETE_NONFULL(root, node, child) {
  if (node->parent == NULL)
    root = child;
  else
    if (node == node->parent->left)
      node->parent->left = child;
    else
      node->parent->right = child;
  if (child != NULL) {
    child->parent = node->parent;
  }
  free(parent);
}
```

```c
DELETE_FULL(root, node) {
  y = BST_SUCCESSOR(node);
  swap(node->data,y->data);
  if (y->right == NULL)
    child = y->right;
  else child = y->right;
  DELETE_NONFULL(root, y, child);
}
```
