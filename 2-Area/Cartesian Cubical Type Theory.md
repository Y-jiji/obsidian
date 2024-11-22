---
tags:
  - 𝔑-informal
  - 𝔗-type-theory
  - 𝔖-planned
---
# Definition

## Interval $II$

Cubical type theory extends dependent type theory with a number of features [@Paper:Normalize-Cubical-TT], constructed around primitive interval $II$ . We deliberately don't use the word **type** here because $II$ is not in the type universe $UU$ . 

The primitive interval has two constructors: 
$$
0:II\
1:II
$$

But conceptually, it is more than $0,1$ , there might be other points on $II$ .  

Using this interval, we can draw lines in type universe $UU$ by creating type families like $A: II -> UU$ . 

## Path Type

There is also a $"Path"$ type that defines mapping from $II$ , where $UU$ is the type universe. 

$$
"Path":{A: II->UU} -> {a_0:A(0)} -> {a_1:A(1)} -> UU
$$

Colloquially, you can think of $"Path"$ as the following: 

$$
"Path"(A, a_0, a_1) approx {i:II} -> A(i)
$$

But there is a subtle difference:
- if $f : "Path"(A, a_0, a_1)$ , then $f$ definitionally follows $f(0)=a_0$ and $f(1)=a_1$ . 

## Kan Operations

Coercion is a function of type: 

$$
"coe":{A:II-> UU}->{r,s:II}->A(r)->A(s)
$$

If $r$ is syntactically equal to $s$ , then $"coe"(A, r, r, a) = a$ follows definitionally. 

# Computation

