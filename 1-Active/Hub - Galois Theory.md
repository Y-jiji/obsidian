---
tags:
  - 𝔉-hub
  - 𝔑-informal
  - 𝔗-algebra
---
# Idea (Higher Order Eqn :: Intro) ^9cca58

Historically, to analyze the solutions to higher order equations with rational coefficients, Galois chose a rather abstract approach, diverging significantly from previous works on constructing solutions. For simplicity, we pick an order-5 equation as an example: 

$$
x^5 + alpha_4 x^4 + alpha_3 x^3 + alpha_2 x^2 + alpha_1 x + alpha_0 = 0
$$

He first analyzed symmetry of the roots $xi_1, xi_2, xi_3, xi_4, xi_5$ of the above equation. 

Using Vieta's Theorem, we can derive five equations about $xi_1,xi_2,xi_3,xi_4,xi_5$ . ^f6a6ff

$$
product_(j=1)^5 (x - xi_j) = x^5 + alpha_4 x^4 + alpha_3 x^3 + alpha_2 x^2 + alpha_1 x + alpha_0\
forall {k : {1...5}}::sum_(S subset.eq {1...5} and k=|S|) product_(j : S) xi_j = (-1)^(k)alpha_(5-k)
$$

An important observation is that for arbitrary permutation $sigma$ and arbitrary $k$ , permuting subscript using $sigma$ will not change the output of the expression. 

$$
&forall {k : {1...5}}::\
&forall {sigma:{1 dots 5}->{1 dots 5}}::\
&sum_(S subset.eq {1...5} and k=|S|) product_(j : S) xi_j =sum_(S subset.eq {1...5} and k=|S|) product_(j : S) xi_(sigma(j))
$$

Galois proved that when we constraint $xi_{1 dots 5}$ to be distinct and $alpha_{0 dots 4}$ are rational, then there is no algebraic representation of $xi_{1 dots 5}$ . 

# Idea (Higher Order Eqn :: Field Extension)

We continue to use the notations from [[#^9cca58|last section]] . 

A new notation $QQ angle.l xi_1,xi_2,xi_3,xi_4,xi_5 angle.r$ is invented to facilitate Galois' prove. 

Colloquially, it denotes a new field whose elements are multi-variate polynomials $p(dot,dot,dot,dot,dot)$
$$
p(xi_1,xi_2,xi_3,xi_4,xi_5) = sum_(k = 0)^(infinity) sum_(S subset.eq NN and k=|S|) gamma_(S) product_(j : S) xi_j
$$
where $xi_1,xi_2,xi_3,xi_4,xi_5$ are variables. 

The multiplication and addition over this field are induced by polynomials. 

However, for $xi_{1 dots 5}$, we have [[#^f6a6ff|some additional constraints]] :

$$
forall {k : {1...5}}::sum_(S subset.eq {1...5} and k=|S|) product_(j : S) xi_j = (-1)^(k)alpha_(5-k)
$$

To determine if two 'polynomials' are equivalent, we have to somehow define a normal form based on our constraints. 

$$

$$