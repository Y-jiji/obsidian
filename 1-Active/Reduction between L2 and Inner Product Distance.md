---
tags:
  - 𝔑-informal
  - 𝔗-vector-and-matrix
---
# Definition (Inner Product for L2)

To use an algorithm for inner product distance to solve L2, we use the following transformation: 

$$
&accent(q, dot) = (-2 dot q^T, 1, ||q||_2^2)^T &&"(the query)"\
&accent(k, dot) = (k^T, ||k||_2^2, 1)^T &&"(for each key in database)"
$$

We can see that the inner product between $accent(q, dot)$ and $accent(k, dot)$ is just the L2 distance between $q$ and $k$ . 

# Definition (L2 for Inner Product)

To use an algorithm for L2 to solve inner product distance, we use the following transformation: 

$$
&accent(q, dot) = (-q^T,0,sqrt(M - ||q||_2^2))^T\
&accent(k, dot) = (k^T,sqrt(M - ||k||_2^2),0)^T
$$
