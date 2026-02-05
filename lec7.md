# Lecture 7

<!-- toc -->

- [Queues](#queues)

<!-- tocstop -->

## Queues

FIFO: First In First Out Data Structure

```cpp
queue_insert(q[], front, rear,  max, item) {
  if (front == rear + 1 || front == 0 && rear == max - 1){
    print "Overflow"
  } else {
    if ( front == -1) front = 0, rear = 0;
    else if (rear == max-1) rear = 0;
    else rear = rear + 1;
    q[rear] = item;
  }
}
```

```cpp
queue_delete(q[], front, rear, max) {
  if (front == -1) {
  print "Empty" 
  }
  else {
    item = q[front];
    if (front == rear) {
      front = -1, rear = -1;
    } else if (front == max-1) {
      front = 0;
    } else {front++;}
    return empty;
  }
}
```

Effectively, ```front``` is the pointer to the earliest element inserted into
the queue and ```back``` is the pointer to the latest element inserted.
We do a wraparound when we get to the end and if the pointers cross,
there is an overflow and we need to reallocate the queue.
