---
tags:
  - 𝔗-algorithm
  - 𝔗-vector-and-matrix
  - 𝔖-planned
---
# Problem Statement

Given a finite dataset of vectors $cal(D) subset RR^(d) times RR^d$ and $epsilon in RR^+$, give a function $f_(cal(D))(A: RR^(d times d))$ such that

$$
||f_cal(D)(A) - limits("argmin")_((x,y) in cal(D)) (x^T A y)|| <= epsilon dot ||limits("argmin")_((x,y) in cal(D)) (x^T A y)||
$$

and make $f$ computationally efficient. 

# Application (Linear Regression via SGD)

For a linear regression model like: 

$$
w_((*))=limits("argmin")_(w in RR^d) sum_((x,y) in cal(D)) (x^T w - y)^2
$$

Solving it through SGD, we select $(x,y) tilde "Unif"(cal(D))$ , where $"Unif"(cal(D))$ is the uniform distribution on $cal(D)$ . 

$$
limits("argmin")_(w in RR^d) space EE_((x,y) tilde "Unif"(cal(D))) (x^T w- y)^2
$$

For each SGD step with learning rate $eta$ , the weight $w_((t))$ is updated by uniformly randomly selected sample $(x, y)$ . 

$$
w_((t+1)) <- w_((t)) - 2eta dot (x^T w_((t)) - y) dot x
$$

However, sometimes we don't want to uniformly randomly select samples, instead we select samples via some heuristics. 

Suppose we know the optimal $w_((*))$ . (I think this assumption is total bullshit, but [@Paper:Iterative-Machine-Teaching] and [@Paper:Locality-Sensitie-Teaching] gets published anyway.). One heuristic for selecting optimal training item is to make $w_((t+1))$ close to $w_((*))$ as much as possible. 

$$
limits("argmin")_((x,y) in cal(D)) ||w_((t)) - w_((*)) - 2eta dot (x^T w_((t)) - y) dot x||_2^2
$$

This can be easily rewritten as: 

$$
& limits("argmin")_((x,y) in cal(D)) (4 eta^2 (x^T w_((t)) - y)^2 x^T x - 4eta dot (x^T w_((t)) - y) dot (w_((t)) - w_((*)))^T x)
$$

with some dirty math work, we can rewrite it again into a bilinear form search problem using the following [[Kronecker Product|facts]] : 

$$
forall {x,y:RR^d} :: forall {z,w:RR^(d')} :: (x^T y) dot (z^T w) = (x times.circle z)^T (y times.circle w)\
forall {x,y,w:RR^d} :: x^T w - y = vec(x, y)^T vec(w, -1)
$$

Using rewrite strategy, the following will be valid: 

$$
"objective"
&=4 eta  (x^T w_((t)) - y) (vec(x^T x dot x, x^T x dot y)^T vec(eta dot w_((t)), -eta) + x^T (w_((*)) - w_((t))))\
&=4 eta vec(x, y)^T vec(w_((t)), -1) vec(x^T x dot x, x^T x dot y, x)^T vec(eta dot w_((t)),-eta,w_((*)) - w_((t)))\
&=4 eta (vec(x, y) times.circle vec(x^T x dot x, x^T x dot y, x))^T (vec(w_((t)), -1) times.circle vec(eta dot w_((t)),-eta,w_((*)) - w_((t))))
$$

This reduces the problem of selecting optimal data item to search for a bilinear form, since we also know that: 
$$
forall {x,y:RR^d} :: forall {z,w:RR^(d')} :: (x times.circle z)^T (y times.circle w) = x^T (y w^T) z\
$$

# Application (Quadratic Assignment Problem)

To my surprise, ChatGPT seems really good at this. (coining motivation ...)

# Application (Linear Regression Optimal Attacking)

This makes much more sense, because the attacker knows what kind of model to pursue. 

# Solution (Locality Sensitive Hashing)

Reduce to locality sensitive hashing

# Solution (HNSW)

Reduce to graph-based indexing

