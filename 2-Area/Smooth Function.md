---
tags: "#𝔑-propositional"
---
# Definition

A function $f: RR^n -> RR$ is $L$-smooth if 
$$
forall {x,y: RR^n}->||nabla f(x) - nabla f(y)|| <= L dot ||x - y||
$$

# Properties
## First Order Approximation

$$
f(y) - f(x) - nabla f(x)^T (y-x) <= L/2 ||x-y||_2^2
$$

**Proof** : We know that by rewriting $f(y)$ as intergration from $x$ to $y$

$$
f(y)-f(x)=integral_0^1 nabla f(z y + (1-z) x)^T (y-x) upright(d)z
$$

Merge the terms. Using [[Cauchy's Inequality]] , we know that

$$
&integral_0^1 (nabla f(z y + (1-z) x)-nabla f(x))^T (y-x) upright(d)z\
&=integral_0^1 ||nabla f(z y + (1-z) x)-nabla f(x)||dot||x-y||upright(d)z\
&<=L integral_0^1 ||z y + (1-z) x - x||dot||x-y||upright(d)z\
&= L integral_0^1 z||y - x||dot||x-y||upright(d)z <=L/2 ||x-y||_2^2
$$

## Gradient Descent

If $f$ is $L$-smooth and convex, and we use step size $eta <= L^(-1)$ , define
$$
x^((t+1)) = x^((t)) - eta dot nabla f(x^((t)))
$$
then
$$
f(x^((t))) - f(x^((*))) <= frac(||x^((0)) - x^((*))||^2, 2 eta t)
$$
where $x^((*))$ is the value that minimizes $f$ . 

This bounds the number of iterations we need to get $f(x^((t))) - f(x^((*))) <= epsilon$ by 
$$
O((2 eta epsilon)^(-1)||x^(0)-x^(*)||^2)
$$ 
