---
tags:
  - 𝔉-note
  - 𝔗-algorithm
  - 𝔑-informal
  - 𝔖-planned
---
# Definition (Approximate Algorithm)

For an maximization problem $f: A -> RR^+$ , an algorithm is called $c$-approx if the algorithm generates a solution $f(x)$ of at least $c^(-1) dot f(x^*)$ , where $f(x^*)$ is the optimal solution. 

For an minimization problem $f: A -> RR^+$ , an algorithm is called $c$-approx if the algorithm generates a solution $f(x)$ of at most $c dot f(x^*)$ , where $f(x^*)$ is the optimal solution. 

# Idea (LP Rounding)

Take minimization problem as an example: 
1. Relaxation: Solve a relaxation of the original problem using LP. 
2. Rounding: Take the LP solution, construct a solution of the original problem. 

# Example (Set Cover)

**Problem** : Given $m$ subsets $frak(s): {1 dots m} -> {1 dots n} -> {0, 1}$ , find an minimum number of subsets such that their union is ${1 dots n}$. If the problem doesn't have a solution, then returning anything suffices. 

$$
&forall {m: NN^*} :: forall {n: NN^*} :: forall{frak(s): {1 dots m} -> {1 dots n} -> {0, 1}} :: \
&limits("argmin")_(x : {1 dots m} -> {0,1}) sum_(i:{1 dots m}) x_(i)\
&s.t. space forall {j}:: sum_(i:{1 dots m}) x_(i) dot frak(s)_(i,j) >= 1
$$

**Claim** : $forall {epsilon : RR^+} ::$ this problem is NP-Hard to get $(log n)^(1-epsilon)$-approximation. 

**LP Relaxation** : Instead of restraining the solution $x$ to type ${1 dots m} -> {0, 1}$ , use a continuous type ${1 dots m}->[0, 1]$  instead. 

$$
&forall {m: NN^*} :: forall {n: NN^*} :: forall{frak(s): {1 dots m} -> {1 dots n} -> {0, 1}} :: \
&limits("argmin")_(x : {1 dots m} -> [0,1]) sum_(i:{1 dots m}) x_(i)\
&s.t. space forall {j}:: sum_(i:{1 dots m}) x_(i) dot frak(s)_(i,j) >= 1
$$

**LP Rounding** : Let $x^* : {1 dots m} -> [0, 1]$ be the solution of LP relaxation. Set $x^(**)_(k)$ to be $1$ with probability $min {1, c dot x^(*)_(k) dot log n}$ . 

The expectation of the solution is upper-bounded by $sum_(k) c x_(k)^* log n <= c dot log n dot sum_(k) x_(k)^*$ . 

With probability $1-n^(1-c)$ , the solution after rounding is feasible.  

The probability of an element $j: {1 dots n}$ is **not** covered by a selected subset is: 

$$
product_({k : frak(s)_(k,j) = 1}) (1 - c log n x_(k)^*) <= exp(- c log n) = 1/n^(c)
$$

Applying union bound gives the probability of at least one element is not covered is $n^(1-c)$ . 

Therefore, the probability that the rounded solution is feasible is $1-n^(1-c)$ . 

