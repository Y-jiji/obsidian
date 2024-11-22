---
tags: "#𝔑-propositional"
---
# Definition

Characteristic function for a random variable $X$ :
$$
phi_X (z) = EE[exp(i z X)]
$$

Characteristic function for a random vector $X$: 
$$
phi_X (z) = EE[exp(i z^T X)]
$$

# Properties

## Independence

When two random variables $X,Y$ are independent: 
$$
phi_X (z) dot phi_Y (z) = phi_(X + Y) (z)
$$

If and only if $X, Y$ are independent: (see characteristic function for random vector) ^b58da2
$$
phi_(X,Y)(z,w) = phi_X (z) dot phi_Y (w)
$$

Note that when $X$ and $Y$ both random vectors, then $phi_(X, Y)$ just means the concatencation of these two random vectors. 

May Update: Geometric Interpretation?
