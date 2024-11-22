---
tags:
  - 𝔗-algorithm
  - 𝔗-network
  - 𝔖-planned
---
# Problem Statement

Given [[LT Code]] with degree distribution $rho(d)$ , we want to exactly compute its failure probability via peeling algorithm. 

The following sections is basically the reading note for [@Paper:LT-Failure-Rate-DP] . 

# Solution (Generating Function)

$$
Omega(x) := sum_(d=1)^k rho(d) dot x^d
$$

where $k$ is the number of input symbols. It is not clear how to use that at the first glance. 

# Solution (State Definition)

To use dynamic programming, we have to describe the state of a decoder, and the number of states should be small enough. 

For a fixed degree distribution $rho$ and a fixed number of received symbols $n$ , it is possible to write the state of the decoder as a tuple $(u,c,r)$: 
- $u$ : the number of input symbols that we haven't yet decoded. 
- $c$ : the number of codewords with degree $>1$
- $r$ : the number of codewords with degree $=1$

We use an array $p_(u,c,r)$ to represent the probability that the decoder transition into state $(u,c,r)$. 

It is very surprising to see that which input symbol hasn't yet been covered doesn't matter in our computation. Intuitively, that is because the original LT code generates codewords using the following process: 
+ Select a degree $d$ with probability $rho(d)$
+ Select uniformly from input symbols, a set of size $d$
+ Xor selected symbols into a codeword

We can see that the set of same size is generated with same probability. Therefore, once we swap two inputs, the probability distribution will not change. Additionally, after peeling known codewords, what is left is independent from what is known. 

# Solution (Transition)

Basically, the paper [@Paper:LT-Failure-Rate-DP] says that by peeling an input symbol with degree $1$ , we arrive at a new degree distribution, and what's left always have the same distribution no matter which input symbol we peel. 

