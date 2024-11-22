---
tags: "#𝔑-propositional"
---
# Preliminaries

## Hypothesis Testing

Independence testing is a special type of hypothesis testing. 

First, let's do quick recap on hypothesis testing. In the testing problem, we have a hypothesis $cal(H)$ .

We also have some data $cal(D)$ . The job of statistical testing is to reject $cal(H)$ if $cal(D)$ strongly deviates from $cal(H)$, i.e. $cal(D)$ has very low probability under hypothesis $cal(H)$. 

If $not cal(H)$ is considered significant if $cal(D)$ deviates $cal(H)$ with high probability. 

## Distance Correlation

This test is for random vectors $X(dot) in RR^(p)$ and $Y(dot) in RR^q$ , where $(dot)$ is the place spared for the element in random space. 

Given [[Characteristic Function#Definition|characteristic functions]] $phi_(X, Y)$ , $phi_X$ and $phi_Y$ , using [[Characteristic Function#^b58da2|property for independent variables]], we can intuitively think the distance between $phi_(X, Y)(z, w)$ and $phi_X (z) dot phi_Y (w)$ characterizes the difference between the join distribution of $X$ and $Y$ and the join distribution supposing $X$ and $Y$ are independent. 

We define the distance covariance of two random variables as: 
$$
cal(V)^2(X, Y) = integral_((z,w) in RR^(p+q)) (|phi_(X, Y)(z, w) - phi_X (z) phi_Y (w)|^2)/(c(p) dot c(q) dot ||z||_2^(p+1) dot ||w||_2^(q+1)) space upright(d) (z,w)
$$
where
$$
c(p) = pi^((p+1)"/"2)/(Gamma ((p+1)"/"2))
$$

The distance correlation, however, is defined as what is expected for correlation: 

$$
cal(R)^2(X, Y) = (cal(V)^2(X, X)) / (sqrt(cal(V)^2 (X, Y)) sqrt(cal(V^2)(Y, Y)))
$$

## Estimate Distance Correlation

Given $n$ samples $(x_1, y_1), dots, (x_n, y_n)$ (these samples are independently sampled), a way to estimate everything is to use
$$
phi_(hat(X))(z) = EE_(hat(X) tilde cal("Unif"){x_1,x_2,dots, x_n})[exp(i z hat(X))]
$$

which is the use discrete distribution instead of the original distribution. 

We formulate $phi_(hat(X))$ and $phi_(hat(X),hat(Y))$ in the same way, mind that $(hat(X),hat(Y)) tilde cal("Unif"){(x_1, y_1), dots, (x_n, y_n)}$

## W/O Characteristic Function

Use $X'$ to denote an independent and identically distributed copy of $X$. [@Paper:Distance-Cov]

Here $X',Y'$ copies the joint distribution of $X, Y$ . 

$$
cal(V)^2(X, Y) = EE[d_(X,X')(X,X')dot d_(Y,Y')(Y,Y')]
$$

where
$$
d_(X,X')(x, x') = ||x-x'||_2 - EE||X-x'||_2-EE||X'-x||_2 + EE||X-X'||_2
$$

the $d_((dot), (dot))$ is called "double centered distance"

**Proof** : Let's leave this detail for now and look at the computational part. 

## Unbiased Estimator (Scalar Case + Algorithm)

For the computational implication, estimating $cal(V)^2(X, Y)$ by replacing both $X$ and $X'$ with the sample distribution will results in $O(n^2)$ computational cost, where $n$ is the size of samples. 

Formally, an unbiased estimator of $cal(V)^2(X, Y)$ given by [@Paper:Partial-Distance-Correlation] is: 

$$
Omega_n (accent(x, ->), accent(y, ->)) = 1/(n (n-3)) sum_(i eq.not j) a_(i j) b_(i j) - frac(2, n(n-2)(n-3)) sum_(i) a_(i dot) b_(i dot) + frac(a_(dot dot) b_(dot dot), n (n-1) (n-2) (n-3)) 
$$

where
$$
a_(i j) = |x_i - x_j| #h(40pt) b_(i j) = |y_i - y_j|\
a_(i dot) = sum_(l) a_(i l) #h(40pt) b_(i dot) = sum_(l) b_(i l)\
a_(dot dot) = sum_(l) a_(l dot) #h(40pt) b_(dot dot) = sum_(l) b_(l dot)
$$

There is an $O(n log n)$ time algorithm for computing $Omega_n (accent(x, ->), accent(y, ->))$ given in [@Paper:Distance-Cov-Fast] -- an embarrassingly simple 3-step algorithm (only for the first $a_(i j) b_(i j)$): 
1. Sort the data
2. Compute Many Partial Sums
3. Compute a 2-d Partial Sum

## Unbiased Estimator (Vector Case)

TODO
## Computing Vector Case

The basic observation for the vector case is: you cannot really sort the vectors, so the later approach will not work. To solve this problem, Huo [@Paper:Distance-Cov-Fast-Vector] introduced random projections. 

