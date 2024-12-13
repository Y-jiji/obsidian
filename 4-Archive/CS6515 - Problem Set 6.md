---
tags:
  - 𝔉-homework
  - 𝔗-algorithm
---

# Finding a Step Size

**Problem** : Let $f$ be an $L$-smooth convex funtion, find a method to select gradient descent step size $eta_t$ without refering to $L$ such that the algorithm have 

$$
f(x^(t+1)) <= f(x^t) - frac(1, 4 L) ||nabla f(x^t)||^2
$$ 
where $forall t: x^(t+1) = x^(t) - eta^t dot nabla f (x^t)$ . 

**Solution** : Since $f$ is convex, $g(eta) := f(x^(t) - eta dot nabla f (x^t))$ is also a convex function of $eta$ . 

Initially, pick any $eta > 0$ . Repeat assigning $eta <- 2 eta$ until $f(x^t - eta dot nabla f (x^t)) > f(x^t) - eta ||nabla f(x^t)||^2$ . In this case $eta > 1/L$ because in the lemma taught in class is exactly the contrapositive. 

Then repeat assigning $eta <- frac(1,2) eta$ until $f(x^t - eta dot nabla f (x^t)) <= f(x^t) - eta/2 ||nabla f(x^t)||^2$. 
The first $eta$ that satisfies this condition will satisfy $eta > 1/(2L)$ because last $eta > 1/L$ . 
On the other hand, if $eta > 1/L$ but $f(x^t - eta dot nabla f (x^t)) <= f(x^t) - eta/2 ||nabla f(x^t)||^2$ , we still have  $f(x^t - eta dot nabla f (x^t)) <= f(x^t) - eta/2 ||nabla f(x^t)||^2 <= f(x^t)  - frac(1, 4 L) ||nabla f(x^t)||^2$

**Comment** : we have to suppose $f(x)$ cannot goes to negative infinity, or it is possible that $f(x^t - eta dot nabla f (x^t)) > f(x^t) - eta ||nabla f(x^t)||^2$ doesn't hold for arbitrary $eta$ . 

# Non-Convex Function

**Question 1** : We examine function $f$'s directional derivative on direction $-nabla f(x^t)$ at $f(x^(t+1))$
$$
f(x^t - eta dot nabla f(x^t)) = -integral_(0)^eta nabla f(x^t-z dot nabla f(x^t)) dot nabla f(x^t) space upright(d) z + f(x^t)
$$

It suffices to show that when $eta <= 1/L$:
$$
integral_(0)^eta nabla f(x^t-z dot nabla f(x^t)) dot nabla f(x^t) space upright(d) z >= eta/2 ||nabla f(x^t)||^2 \
= 1/2 integral_(0)^(eta) ||nabla f(x^t)||^2 upright(d) z
$$

This indeed holds because take $eta = 0$ the both size gives $0$ . It suffices to show at when $eta$ grows, the left hand side actually grows faster for every given $eta$ . 

Therefore, it suffices to show: 
$$
forall z in [0, eta]: nabla f(x^t-z dot nabla f(x^t)) dot nabla f(x^t) >= 1/2 ||nabla f(x^t - z dot nabla f(x^t))||^2
$$

Using the $L$-smooth property :
$$
&||nabla f(x^t - z dot nabla f(x^t)) - nabla f(x^t)|| \
&<= L dot ||z dot nabla f(x^t)|| <= ||nabla f(x^t)||
$$

From last inequality, take square on both sides, expand left hand side and cancel out the right hand side closes the proof. 
$$
nabla f(x^t - z dot nabla f(x^t)) dot nabla f(x^t) >= 1/2||nabla f(x^t -  z dot nabla f(x^t))||^2
$$

We proved: 
$$
eta/2 ||nabla f(x^t)||^2 <= f(x^t) - f(x^(t+1))
$$

**Question 2** : Take the sum over what we have: 

$$
sum_(k=0)^t ||nabla f(x^k)||^2 <= sum_(k=1)^t 2/eta (f(x^(k-1))-f(x^k)) = 2/eta (f(x^0) - f(x^t))
$$

Since we have $f(x^*) <= f(x^t)$ , and therefore: 
$$
sum_(k=0)^t ||nabla f(x^k)||^2 <= 2/eta (f(x^0)-f(x^*))
$$

**Question 3** : Note that if we divide what we have in the last question by $t+1$ , we are actually doing an average on the left side. In common sense, the minimum of many numbers is smaller than the average of many numbers, therefore: 

$$
min_(k in {0,dots,t}) ||nabla f(x^k)||^2 &<= 1/(t+1)sum_(k=0)^t ||nabla f(x^k)||^2 \
&<= 1/t sum_(k=0)^t ||nabla f(x^k)||^2\
&<= 2/(eta dot t) (f(x^0)-f(x^*))
$$

Taking square roots on both sides (square root is a monotonic function)

$$
min_(k in {0,dots,t}) ||nabla f(x^k)|| <= sqrt(2/(eta dot t) (f(x^0)-f(x^*)))
$$

# Strongly Convex Functions

**Question 1** : Using the definition of $L_2$ distance: 

$$
&||x^(t+1) - x^*||^2 = ||x^(t)- eta nabla f(x^t) - x^*||^2 \
&= ||x^t-x^*||^2- 2 eta nabla f(x^t)^T (x^t - x^*) + ||eta nabla f(x^t)||^2 \
&= ||x^t-x^*||^2- 2 eta nabla f(x^t)^T (x^t - x^*) + eta^2 ||nabla f(x^t)||^2
$$

**Question 2** : Replace $x=x^t$ and $delta = x^* - x^t$ in the definition of $mu$-strongly convex: 

$$
f(x^*) >= f(x^t) + nabla f(x^t)^T (x^* - x^t) + mu/2 ||x^* - x^t||^2
$$

Move the terms around

$$
nabla f(x^t)^T (x^t - x^*) >= f(x^t) - f(x^*) + mu/2 ||x^* - x^t||^2
$$

**Question 3** : Replace $x=x^t$ and $delta=-eta nabla f(x^t)$ in the definition of $L$-smooth

$$
f(x^t-eta nabla f(x^t)) <= f(x^t) - eta ||nabla f(x^t)||^2 + (L eta^2)/2||nabla f(x^t)||^2
$$

Take $eta = 1/L$ and move some terms: 

$$
||nabla f(x^t)||^2 <= 2 L dot (f(x^t) - f(x^t - eta nabla f(x^t))) <= 2L dot (f(x^t) - f(x^*))
$$

**Quesiton 4** : Add the equation in $1$ and $eta$ times the equation in $2$ 

$$
||x^(t+1) - x^*||^2 &limits(=)^("question 1") ||x^t-x^*||^2- 2 eta nabla f(x^t)^T (x^t - x^*) + eta^2 ||nabla f(x^t)||^2\
&limits(<=)^("question 2") ||x^t-x^*||^2 - 2 eta (f(x^t)-f(x^*)) + eta^2 ||nabla f(x^t)||^2 - mu eta ||x^t-x^*||^2\
&limits(<=)^(eta <= L^(-1)) (1- mu eta) ||x^t - x^*||^2 + eta^2 (||nabla f(x^t)||^2 - 2 L (f(x^t) - f(x^*)))\
&limits(<=)^("question 3") ||x^t-x^*||^2(1-mu eta)
$$

**Question 5** : Multiply what we have in last question from $0$ to $t-1$

$$
||x^(t) - x^*||^2 &<= (1-mu eta)^(t-1) ||x^0 - x^*||\
&<= ((1-mu eta)^(1/(mu eta)))^(mu eta t - mu eta) ||x^0 - x^*||\
&<= exp(mu eta - mu eta t) ||x^0-x^*||\
&<= epsilon ||x^0-x^*||
$$

Therefore, we have the time complexity: 

$$
t=O(log(1 slash epsilon)/(mu eta))
$$

