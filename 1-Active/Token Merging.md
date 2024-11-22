---
tags:
  - 𝔗-vector-and-matrix
  - 𝔗-algorithm
  - 𝔖-planned
---
# Problem Statement

Consider softmax attention: 

$$
f(q_alpha,k,v) = frac(
display(sum_(beta=1)^(alpha-1) exp(k_beta^T q) v_beta), display(sum_(beta=1)^(alpha-1) exp(k_beta^T q)))
$$

Given matrices $q in RR^(NN times d),k in RR^(NN times d),v in RR^(NN times d)$ , 

The computational problem can be written as: 

$$
x_(alpha)=f(q_(alpha+1),k_({1,dots,alpha}),v_({1,dots,alpha}))
$$

It maintains a structure of prefix sum, is it possible to compute it in $O(n^(2-epsilon) d)$ the following: 

$$
limits((x_alpha))_(alpha in {1,dots,n})
$$

# Idea (Scale Classification)

The numerator and denominator can be rewritten as follows: 

$$
g(q_(alpha+1), k, v)_gamma = 
cases(
display(sum_(beta=1)^alpha exp(-frac(||k_beta - q_alpha||^2, 2)) dot exp(frac(||k_beta||^2,2)) dot v_(beta,gamma)) &"where" gamma >= 1,
display(sum_(beta=1)^alpha exp(-frac(||k_beta - q_alpha||^2, 2)) dot exp(frac(||k_beta||^2,2))) &"where" gamma = 0
)
$$

The idea is divide the terms in each $g(q_alpha, k, v)_gamma$ into several groups, and hopefully we can control the relative error within each group. 

Consider split $v_(beta,gamma)$ to $v_(beta,gamma,+) - v_(beta,gamma,-)$

$$
v_(beta,gamma,+) = (|v_(beta,gamma)|+v_(beta,gamma))/2\
v_(beta,gamma,-) = (|v_(beta,gamma)|-v_(beta,gamma))/2
$$

One way is to classify the terms by the value of

$$
exp(frac(||k_beta||^2,2)) dot v_(beta,gamma,plus.minus)
$$

Make sure all the terms in the same group have the same sign $plus.minus$ . 

We hope the terms will still look like

$$
rho dot exp(-frac(||(dots.c)-q_alpha||^2,2))
$$

A naive thought is to take the average over the terms on $k_beta$ , let's see if it works: 

$$
frac(
	display(rho_x dot exp(x dot q) + rho_y dot exp(y dot q)),
	display((rho_x + rho_y)exp(z dot q))
)
$$

**Question** : What kind of $z$ makes it close to $1$ for many $q$ ? What kind of constraints on $q,x,y$ make it possible to find such $z$ ? 

**Observation** : If we are just merging (w/o normalizing $z$), then everything will get closer and closer to the origin. 

**Observation** : 
$$
exp(x dot q) = 1 + (x dot q) + (x dot q)^2/2 + (x dot q)^3/6 + dots.c 
$$

The problem is $|x dot q|$ is not small enough, and thus it doesn't converge quickly. 

# Idea (Eikonal equation)

During Praneeth's visit, he mentioned we can approximate $f(q)$ with Eikonal equation. 

