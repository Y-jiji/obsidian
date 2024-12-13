---
tags:
---
# Problem (NN Search)

The problem is the classic [[Hub - Nearest Neighbor Search|nearest neighbor search]] problem, say, for $l_2$ norm. 

# Idea (Space Filling Curves)

Normally, for nearest neighbor search, we use random projections as hash functions. 

Consider using Gaussian hashing as the method for nearest neighbor, the problem of this method is somewhat like this: 

$$
f(q)=limits("argmin")_x ||x - q||_2=limits("argmin")_x max_(w) (w^T x - w^T q)
$$

We want to find the $x$ , but somehow the $w$ is on the inner side. Therefore, we cannot simply conclude that the neighbor on the projection space, i.e. the nearest $w^T x$ to $w^T q$ means $x$ is also the nearest neighbor, since there are other dimensions other than $w$ that may provide a bigger number. 

However, it is also true that $min_x max_w |w^T x - w^T q| = max_w min_x |w^T x - w^T q|$ . 

**Question**: Is there a case where we can find function $g: RR^r -> RR$ other than a linear projection such that the following holds: 

$$
f(q) = limits("argmin")_x ||x-q||_2 = limits("argmin")_x min_g (g(x) -g(q))
$$

I think any possible candidates $g$ can only be space filling curves. Because only space filling curves consider all the dimensions and strictly increase when $x$ moves more distant from $q$ in any direction. 

# Definition (Z-Index)

The (properly scaled) Z-index is defined by nearest neighbor on the lines: 

$$
mono("z-index"):= forall {d}::{(x_1,x_2,dots,x_d):RR^d} -> sum_(k=-infinity)^(+infinity) sum_(j=1)^d 2^(-d k+j)floor(2^(k+1)x_j-2floor(2^(k)x_j))\
$$

# Property (Z-Index Locality)

The distance between ${x,y : RR^d}$ is bounded by $|mono("z-index")(x)-mono("z-index")(y)|$ , but it is exponential to $d$ . 

I have an impression that what the exponential we take is something different from $2$ , then we can possibly get better bounds. 

# Definition (Generalized Z-Index)

