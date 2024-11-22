---
tags: "#𝔑-propositional"
---
# Definition (Discrete Form)

The formal description looks like this: 

$$
"cauchy-ineq":&forall {n : NN}:: forall {x_1,x_2,dots,x_n:RR}::forall {y_1,y_2,dots,y_n:RR}:: \
& (x_1 y_1 + x_2 y_2 + dots + x_n y_n)^2 <= (x_1^2+x_2^2 + dots + x_n^2)(y_1^2+y_2^2 + dots + y_n^2)
$$

# Proof (Discrete Form)

$$
&forall {n : NN}:: forall {x_1,x_2,dots,x_n:RR}::forall {y_1,y_2,dots,y_n:RR}:: \
&(x_1^2+x_2^2+dots+x_n^2)(y_1^2+y_2^2+dots+y_n^2)
- (x_1y_1+x_2y_2+dots+x_n y_n)^2 \
&=sum_(i=1)^n sum_(j=1)^n x_i^2 y_j^2 - sum_(i=1)^n sum_(j=1)^n x_i y_i x_j y_j\
&=1/2 sum_(i=1)^n sum_(j=1)^n (x_i y_j - x_j y_i)^2>=0
$$

# Definition (Lebesgue Integral Form)

The formal description looks like this: 

$$
"cauchy-ineq-integral":=&forall{mu: "LeMeasure"(Omega, CC)} :: forall {f,g: "LeIntegrable"(mu,2)} ::\
&|integral_(-infinity)^(+infinity) f(x) overline(g(x)) upright(d) mu{x}|^2
<=
integral_(-infinity)^(+infinity) |f(x)|^2 upright(d) mu{x} integral_(-infinity)^(+infinity) |g(x)|^2 upright(d) mu{x}
$$

where $integral$ is [[Lebesgue Integration]] . 

# Proof (Lebesgue Integral Form)

This can be proved by first introducing an evidence of linearlity of [[Lebesgue Integration]], and then apply the fact that integration of a non-negative function cannot be negative. 

$$
&forall{mu: "LeMeasure"(Omega, CC)} :: forall {f,g: "LeIntegrable"(mu,2)}::\
&integral_(-infinity)^(+infinity) |f(x)|^2 upright(d) mu{x} 
integral_(-infinity)^(+infinity) |g(x)|^2 upright(d) mu{x} 
- 
|integral_(-infinity)^(+infinity) f(x) overline(g(x)) upright(d) mu{x}|^2\
&=1/2 integral_(-infinity)^(+infinity) integral_(-infinity)^(+infinity) 
    |f(x)g(y)|^2 + |overline(f(y)g(x))|^2 upright(d) mu{x} upright(d) mu{y} \
&-
integral_(-infinity)^(+infinity) integral_(-infinity)^(+infinity) 
    f(x) overline(g(x)) overline(f(y)) g(y)  upright(d) mu{x} upright(d) mu{y}\
&=1/2
integral_(-infinity)^(+infinity) integral_(-infinity)^(+infinity) 
    |f(x)g(y) - overline(f(y))overline(g(x))|^2  upright(d) mu{x} upright(d) mu{y} >= 0
$$

# Comments

One can argue that [[Hölder's inequality]] is definitely more general than [[Cauchy's Inequality]] . 
However, Cauchy's inequality has a more explicit geometric interpretation, and can be generally recognized from other structures. 
