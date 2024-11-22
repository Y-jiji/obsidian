---
tags:
  - "#𝔑-propositional"
  - 𝔖-planned
---
# Definition

For a randomized algorithm $cal(A)$ to be $(epsilon, delta)$-differentially private if and only if: for databases $s$ and $s'$ differing in only 1 entry, and for any subset $T$ of possible outputs of $cal(A)$ : 

$$
PP [cal(A)(s) in T] <= exp(epsilon) dot PP[cal(A)(s') in T] + delta
$$

The point of differential privacy is that even if you know algorithm $cal(A)$'s output is withing $T$ , you cannot guess $s$ out of $T$ efficiently. Because for all $s'$ such that $|s' Delta s| = 1$, their probability of producing $T$ is sufficiently high. According to [[People - Praneeth Vepekomma|Praneeth]] , it is sort of like discrete version of [[Lipschitz Continuity]] . At the same time, $cal(A)$ gives a result very similar to non-privatized result. 
