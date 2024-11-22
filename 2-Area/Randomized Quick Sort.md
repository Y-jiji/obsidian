---
tags: "#𝔑-propositional"
---
# Problem Statement

For given following randomized quick sort algorithm, analyze its expected running time. 

```typst
#import "@preview/lovelace:0.3.0": *
#align(center)[
    #pseudocode-list(
        line-numbering: none, 
        hooks: 0.05cm, 
        booktabs: true,
        title: smallcaps[*Algorithm* Randomized-Quick-Sort ($l$, $r$, $a$)],
    )[
        + $p tilde "Uniform"([l, r))$
        + $x <- a[p]$
        + $a[l dots r] <- a[l dots r]."filter"(y :: y <= x) + a[l dots r]."filter"(y :: y > x)$
        + $p <- $ the position where we put $x$
        + #smallcaps[Randomized-Quick-Sort] ($l$, $p$, $a$)
        + #smallcaps[Randomized-Quick-Sort] ($p$, $r$, $a$)
        + #smallcaps[*return*] $a$
    ]
]
```

Assume the rearranging line take $c dot (r-l)$ for given $l$ and $r$ , where $c$ is a globally chosen constant. 

# Solution (Expectation)

This is a solution given by [@Book:Introduction-to-Algorithms] . 

We observe that we can all elements distinct by replacing $a[i]$ with $(a[i], i)$ before we run the algorithm. Without loss of generality, we suppose all the elements are distinct. 

Consider two sequences of random variables: 
- $X_(i k)$ : binary r.v., $i$-th smallest element is selected as a pivot in $k$-th recursion layer
- $Y_(i j k)$ : binary r.v., if $i$-th smallest element and $j$-th smallest element is compared ($i < j$) in $k$-th recursion layer

First, we notice that the time complexity is determined by the number of comparisons, i.e. 

$$
"Time Complexity"=O(sum_(k = 1)^n sum_(i=1)^(n) sum_(j=i+1)^n Y_(i j k) )
$$

Second, we notice that $Y_(i j k) = 1$ if and only if
+ Either $X_(i k) = 1$ or $X_(j k) = 1$
+ In recursion layers before $k$ , no element between $i$ and $j$ is selected as a pivot, or else $i$ and $j$ will be partitioned to different places, and never have the chance to get compared. Formally, $forall {l: [1, dots, n]} :: forall {k' : NN^+} :: forall{bullet: i < l < j} :: forall {bullet: k' <= k} :: X_(l k) = 0$

This gives us two extra observations: 
+ $Y_(i j k)$ is independent from $X_(l k)$ if $l < i$ or $l > j$ 
+ $Y_(i j k)$ is determined by the smallest $k$ such that $X_(l k) = 1$ and $i <= l <= j$ 

With some abuse of notation, we write the sum of $Y_(i j k)$ over $k$ as $Y_(i j bullet)$ . 

We further summarize this into the following description: 
+ $Y_(i j bullet) = 1$ if and only if and only if for the first pivot selected within $i <= bullet <= j$ is either $i$ or $j$ . 

Therefore, we conclude that
$$
PP(Y_(i j bullet) = 1) = frac(2, j - i + 1)
$$

Using [[Expectation|linearity of expectation]] , we compute the expected time complexity: 
$$
EE(sum_(i=1)^(n) sum_(j=i+1)^n Y_(i j bullet)) = O(n log n)
$$
