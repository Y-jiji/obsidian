---
tags: "#𝔑-propositional"
---
# Defintion

Fisher information for a probability density function $p(dot;theta)$ is: 

$$
I_(p(dot;dot))(theta):=integral_(x in RR) (partial / (partial theta) ln p(x;theta))^2 p(x;theta) space upright(d) x
$$

This is sometimes called Fisher information of a single observation. 

Sometimes, people are also interested in Fisher information of multiple observations. 

$$
I_(p(dot;dot),n)(theta):=EE_(X_1,dots,X_n limits(tilde)^(i i d) p(dot, theta))[(partial / (partial theta) ln product_(j=1)^n p(X_j;theta))^2]\
= n I_(p(dot;dot))(theta)
$$

The $n I_(p(dot;dot))(theta)$ thing only holds when $EE_(X tilde p(dot;theta))[partial/(partial theta) p(X;theta)] = 0$ (see [[#Variance of Score|later sections]])

By convention, $p(dot;dot)$ is a probability density function parameterized by $theta$ on the second enty $p(dot;theta)$ . 

# Pitfalls

## Too steep for $theta$

Find some counter examples or give a proof without [[Lesbegue's Dominated Convergence Theorem]] for [[#Variance of Score]]

# Properties

## Variance of Score

Fisher information can be interpreted as the variance of Fisher score.  ^47a33d

$$
S_(p(dot;dot))(X,theta) := partial/(partial theta) ln
p(X;theta)
$$

where $X tilde p(dot;theta)$ and $|display(partial/(partial theta) p(x;theta))|$ has is bounded for any given $x$ . 

**Proof** : It suffices to show that 
$$
EE[S_(p(dot;dot))(X,theta)] 
&= integral_(x in RR) partial / (partial theta) ln p(x;theta) dot p(x;theta) space upright(d) x\
&= integral_(x in RR) partial / (partial theta)p(x;theta) dot 1/p(x;theta) space dot p(x;theta) upright(d)x\
&= integral_(x in RR) partial / (partial theta) p(x;theta) upright(d)x\
&= partial / (partial theta) integral_(x in RR) p(x;theta) space upright(d)x=0
$$

The exchange between $partial$ and $integral$ is valid via [[Lesbegue's Dominated Convergence Theorem|Lesbegue's dominated convergence theorem]] . 

## Cramér–Rao Bound

For a given parameterized probability density function $p(dot;theta)$ , the inverse of Fisher information is a lower of bound variance of any unbiased estimator $hat(theta): {n:NN} -> RR^n -> RR$ of $theta$ . 

$$
bb(V a r)_(X_1,dots,X_n limits(tilde)^(i i d) p(dot, theta))[hat(theta)(X_1,dots,X_n)] >= 1/(n I_(p(dot,dot))(theta))
$$
where $|display(partial/(partial theta) p(x;theta))|$ has is bounded for any given $x$ (as in the [[#Variance of Score|last section]])

**Proof :** The trick is to look at the covariance between $hat(theta)(X_1,dots,X_n)$ and [[Fisher Information#^47a33d|Fisher score]] . 

For covariance $rho$, via [[Cauchy's Inequality|Cauchy's inequality]]:

$$
n I_(p(dot,dot)(theta)) dot bb(V a r)_(X_1,dots,X_n limits(tilde)^(i i d) p(dot, theta))[hat(theta)(X_1,dots,X_n)] >= rho^2
$$ 
We can verify that
$$
rho &= bb("Cov")_(X_1,dots,X_n limits(tilde)^(i i d) p(dot, theta))[hat(theta)(X_1,dots,X_n),n I_p(dot,dot) (theta)] \
&= partial/(partial theta) integral_(x_1,dots,x_n in RR) hat(theta)(x_1,dots,x_n) p(x_1,dots,x_n;theta) space upright(d) (x_1,dots,x_n)\
&= partial/(partial theta) EE_(X_1,dots,X_n limits(tilde)^(i i d) p(dot, theta))[hat(theta)(X_1,dots,X_n)]\
&= partial/(partial theta) theta = 1
$$

(some of the calculation is omitted because they are the same as [[#Variance of Score|last section]], and we write $p(x_1,dots,x_n;theta)=product_(i=1)^n p(x_i;theta)$ for convenience)

