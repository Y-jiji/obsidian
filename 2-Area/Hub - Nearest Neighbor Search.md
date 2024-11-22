---
tags:
  - "#𝔗-vector-and-matrix"
  - 𝔗-algorithm
  - 𝔖-planned
---
# Overview

Nearest neighbor search is the problem of finding nearest neighbors in a finite set of vectors. 
The definition of "nearest" is usually defined by the distance under $ell_2$ norm. 

$$
f_(v)(q)=limits("argmin")_(i in [1,dots,n]) ||v(i) - q||_2^2
$$

There are several mainstream algorithms for nearest neighbor search: 
1. Locality Sensitive Hashing [@Paper:DET-LSH]  [@Paper:DB-LSH]
2. Vector Quantization
3. Graph Index [@Paper:NNS-Navigating-Spread-Out-Graph]

In general, only the LSH class provides theoretical guarantee. However, it doesn't work well in real world. 

# Solution (Locality Sensitive Hashing)

Typically, LSH use the following function to generate bins. 

$$
h_(a,b)(x) = floor((a^T x + b)/r)
$$

where $a tilde.op frak(N)(0, I)$ and $b tilde.op frak(U n i f)(0, r)$, and $r$ is a pre-defined number in $RR^+$. 

The problem of this scheme is that if the distance between two vectors can be both very large and very small, then you are forced to divide bins using the smaller ones. ^near-points

LSH is used as a fallback for heuristic search, like in [@Paper:DET-LSH], LSH is used as a fallback for DET tree index. 

# Solution (Graph Index, HNSW)

HNSW, or hierachical navigatable small world, is a graph based index inspired by skip list index for ordered data. 

For each vector, HNSW first greedily searches the highest level index, and then going down one level lower and iteratively performs greedy search. 

# Solution (Graph Index, NSG)

This is described in [@Paper:NNS-Navigating-Spread-Out-Graph] . So this is a big TODO for me. 
