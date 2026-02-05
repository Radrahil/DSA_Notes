# Lecture 6

## Table of Contents

<!-- toc -->

- [Evaluating Mathematical Expressions](#evaluating-mathematical-expressions)
  * [Evaluation](#evaluation)
  * [Infix Notation](#infix-notation)
  * [Postfix Notation](#postfix-notation)
    + [Advantages of Postfix](#advantages-of-postfix)
    + [Rules for Postfix Evaluation](#rules-for-postfix-evaluation)
    + [Puzzle](#puzzle)
    + [Evaluating Postfix](#evaluating-postfix)
- [Queue](#queue)
  * [Queue Operations](#queue-operations)

<!-- tocstop -->

## Evaluating Mathematical Expressions

### Evaluation

![Decision Tree](lec6_EvalTree.jpg)

### Infix Notation

``` A + ((B · C) - (D/E^F) · G ) · H ```

```(a+b) left subtree · operator · right subtree```

Readable by humans

### Postfix Notation

Readable by computers/calculators. Used in languages like LISP

```(ab+) left subtree · right subtree · operator```

#### Advantages of Postfix

- No parenthesis

- No operator precedence

- No associativity

| Infix | Postfix |
| -------------- | --------------- |
| A + ((B · C) - (D/E^F) · G ) · H | ABC · DEF^/G · -H · + |

Postfix notation was initially called RPN (Reverse Polish Notation) named
after the Polish scientist Jan Lucasiewicz. It was first used in a
calculator in 1938

#### Rules for Postfix Evaluation

1. Operand -> Postfix
2. Open Bracket -> Push to Stack
3. Closed Bracket -> Pop everything one by one up to and including
an opening bracket and put in postfix
4. Operator -> Follow the chart, then push the current operator to stack

| What to do? | Precedence | Associativity |
| --------------- | --------------- | --------------- |
| Pop | tos > op | - |
| Pop | tos = op | left -> right |
| Push | tos = op | right -> left |
| Push | tos < op | - |

| Column1 | Column2 | Column3 |
| --------------- | --------------- | --------------- |
| A | (empty) | A |
| + | + | A |
| ( | +( | A |
| B | +( | AB |
| · | +(· | AB |
| C | +(· | ABC |
| - | +(- | ABC · |
| ( | +(-( | ABC · |
| D | +(-( | ABC · D |
| / | +(-(/ | ABC · D |
| E | +(-(/ | ABC · DE |
| ^ | +(-(/^ | ABC · DE |
| F | +(-(/^ | ABC · DEF |
| ) | +(- | ABC · DEF ^/ |
| · | +(-· | ABC · DEF ^/ |
| G | +(-· | ABC · DEF ^/ G |
| ) | + | ABC · DEF ^/ G ·- |
| H | + | ABC · DEF ^/ G ·- H |

End of expression -> Pop stack

Final Expression: ```ABC · DEF^/G · -H · +```

Another way of doing it is traversing the tree top down and adding an element
only when you encounter it for the last time

#### Puzzle

Q: Convert to Postfix: ``` (56 + 12) · 3 - 4 ```

A: ```56 12 + 3 · 4 -```

Q: ```A^B^C```

| Character | Stack | Postfix |
| --------------- | --------------- | --------------- |
| A | (empty) | A |
| ^ | ^ | A |
| B | ^ | AB |
| ^ | ^^ | AB |
| C | ^^ | ABC |

End of expression -> Pop stack

A: ```ABC ^^```

#### Evaluating Postfix

Postfix Evaluation is done using a stack, scanning the expression left -> right

- Operand -> Push to Stack
- Operator:
  - Pop the top element (y)
  - Pop next element (x)
  - Calculate z = x operator y
  - Push z to stack

## Queue

First-In-First-Out (FIFO) Data Structure

### Queue Operations

- Insert (enqueue)
- Delete (dequeue)
