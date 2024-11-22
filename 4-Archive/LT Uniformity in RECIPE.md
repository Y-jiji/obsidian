---
tags:
  - 𝔗-algorithm
  - 𝔗-probability
  - 𝔖-archived
---
# Problem Statement

In in-band network telemetry, or distributed LT code, imposes the uniformity condition, i.e. sets of the same size must have the same probability. 

Here we want to prove this uniformity condition actually gives optimal encoding scheme whenever each packet is independent. 

# Prior Work

There is a more general approach to compute LT failure probability [@Paper:LT-Failure-Rate-DP] . However, that article generally requires uniformity to work properly. Here we are comparing non-uniform cases to uniform cases. 

# Proof (Failure Analysis)

We try to do induction on the length of path $L$ . 

We use $p_(N,R),p_(N,S),p_(N,A)$ for the probability of replace, skip and add on $N$-th switch. 

We use $q_N (x)$ to represent the probability of successful decoding when we truncate the path length to $N$ with $x$ packets received. 

One observation is that once we have one replacement packet at the last position, then everything just works out as if we don't have the last switch. 

Another observation is that the ordering of set probabilities are fixed in previous steps, i.e. the actions of after switches don't change the relative ordering of previous set probabilities. 

