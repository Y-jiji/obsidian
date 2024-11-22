---
tags: "#𝔑-propositional"
---
# Definition

## Closest Pair Problem

Is is possible to find an $O(n^(2-epsilon) "poly"(d))$ algorithm to compute $i,j in {1, dots, n}$ where $i eq.not j$ that minimizes: 
$$
||v_i - v_j||_2
$$
where ${v_i in RR^d: i in {1, ..., n}}$ and $epsilon > 0$  . 

## Orthogonal Vector Problem

Input: $v_1,v_2,dots,v_n in {0,1}^d$ and $u_1,u_2,dots,u_n in {0,1}^d$ 

Output: If there exists a pair $(i, j)$ s.t. $v_i^T u_j = 0$ . 

**Fact** : there exists $O(n^2 (log n)^(-1) "poly"(d))$ algorithm for this. 

However, we are more interested in if there exists an $O(n^(2-epsilon) "poly"(d))$ algorithm, where $epsilon > 0$ . But for now we don't have such algorithms. This is called OV-conjecture. 

# Properties

## Relation between [[#Closest Pair Problem|CP]] and [[#Orthogonal Vector Problem|OV]]

**Claim**: if there is an $O(n^(2-epsilon) "poly"(d))$ algorithm for [[Closest Pair is Essentially Quadartic#Closest Pair Problem|CP]] , then there exists an $O(n^(2-epsilon) "poly"(d))$ algorithm for [[#Orthogonal Vector Problem|OV]] . 

Use some hypothetical algorithm for [[Closest Pair is Essentially Quadartic#Closest Pair Problem|CP]] as black box to solve [[Closest Pair is Essentially Quadartic#Orthogonal Vector Problem|OV]] . 

First, complement each $v_i$ to 

$$
v'_i=vec(v_i,0,1)\
overline(v)_i=vec(v_i', 0, dots.v,0, bb(1)-v_i')
$$
and $u_i$ to 
$$
u_i' = vec(u_i,1,0)\
overline(u)_i=vec(-u'_i, bb(1)-u_i', 0, dots.v,0)
$$

Then, use the black box algorithm for [[Closest Pair is Essentially Quadartic#Closest Pair Problem|CP]] to get the closest pair. We can argue that the closet pair cannot be within $overline(v)_(dots)$ and $overline(u)_(dots)$ if there truly exists OV. Because
$$
||overline(v)_i - overline(u)_j||_2^2 = ||overline(v)_i||_2^2 + ||overline(u)_j||_2^2 + 2 v_i^T u_j <= (d+1)^2
$$
w.t.f. ???????????????

