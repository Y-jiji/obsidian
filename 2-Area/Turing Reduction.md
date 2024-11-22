---
tags: "#𝔑-propositional"
---
# Defintion

Problem $A$ reduces to Problem $B$ if we can use an algorithm for $B$ to solve $A$ . 

An algorithm for $A$ that uses algorithm for $B$ (for a constant number of times) is called a reduction. 

We say a reduction is $T$-time reduction, if the time complexity used to construct a solution for $B$ to a solution for $A$ . 

# Examples

## 3-Sum

Given the input $A,B,C subset.eq ZZ$ and constraints $|A|,|B|,|C| <= n$ 
(there is only bound on set size)
**Conjecture** : it is impossible to check if there exists $a in A and b in C and c in C$ such that $a + b = c$ in $O(n^(2-epsilon))$ time. 

## APSP

Given weighted graph $G=(V, E)$ 
**Conjecture** : no $O(n^(3-epsilon))$ algorithm for all pairs shortes path. 

## Boolean MatMul

Input: $A, B in {0, 1}^(n times n)$ 
**Conjecture** : there is no $O(n^(3-epsilon))$ algorithm for $C = A times B$ (we only need to know where non-zero entries are) 
**Remark** : this statement is wrong because of Strassen's algorithm. 

