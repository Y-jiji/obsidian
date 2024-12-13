---
tags:
  - 𝔉-note
  - 𝔗-algorithm
---
# Idea (Min-Max)

$$
limits("argmin")_(x in cal(X)) ||q-x||_2 = limits("argmin")_(x in X) max_(||w||_2=1) w^T (q-x)
$$

This makes me curious about what happens when we take $max_(w)$ outside. 

What will be the $x$ taking inside?

$$
max_(||w||_2=1) min_(x in cal(X)) w^T (q-x)
$$

By geometric intuition, we can find that $x$ must be one of the vectors that spans the nearest hyperplane to $q$ . 

This is not very useful in normal dataset, yet if we look into angular distance, where all the datasets are normalized, we can immediately find that $d$-NN ($cal(X) subset RR^d$) is just all the vectors that spans the plane. 

If we can find a method to optimize $w$ and $x$ simultaneously, we can solve $d$-NN problem using iteration method. 

