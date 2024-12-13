---
tags:
  - 𝔉-note
  - 𝔑-informal
  - 𝔗-algorithm
  - 𝔗-vector-and-matrix
---
# Problem 

The problem is the classic [[Hub - Nearest Neighbor Search|nearest neighbor search]] problem, on say, for $l_2$ norm. 

# Idea (Gradient)

Using some jargon of physics, we refer to the function that maps position to energy as potential/potential function. We also say 'overlay' for summation of functions. 

The general plan is: 
- Find a potential function
- Argue that the gradient descend is fast
- Decompose the gradient so that each GD step is computationally cheap ^b6d08d

The following is a summation of exponential potentials for each point in a 1D dataset. 
![[Gradient Method for NN Search 1D.png|400]]
**Question** : How to determine the gradient effectively if we have a large and high-dim dataset?  ^d53695
z
If we enlarge this picture a bit, we will find that the dots are not exactly on the peak. Therefore, after converging into a local maximum, we have to find the actual point id as a separate step. 

**Question** : How to find the exact point after our the iteration converges? ^254c58

**Question** : How to effectively gradient descend? The gradient can be super small in some cases. ^87879b

We can see the the gradients can be very hard to compute and can be super small on some positions. 

# Idea ([[#^d53695|Large High Dim Dataset]]) ^83afc0

The purpose of this section is to find a function that is, with some warp, $Theta(||x - q||_2)$ but have an exponential decay and easy to evaluate even for large high dimensional datasets. 

The basic strategy is to find a potential function that can be computed separately on low dimensional structures and sums up, but somehow it also has desirable properties such as the peaks are always near a corresponding point, and there is always a ascending path to the peak point. 

One naive thought is to replace the gradient with $Psi_(x)(q) = -c^(-||x - q||_2)$ for each dimension. The problem of this method is that it is possible for the gradient ascending process to stop somewhere that is not originally a point. The problem is that our **local maxima can also locate near points other than points from the dataset**. 

Here is an example where we sampled 10 points (the black points) from uniformly on $[-10, 10]^2$ , the contour is drawn for $c=10$ . We can see that there are many local maxima that is not the points we sampled (the black points). 

![[Gradient Method - Cross Points.png|400]]

If we draw an analogy between $sum_(x) Psi_(x)(q) >= d$ and the proposition as $c -> infinity$, we can see that it roughly means there exists $d$ pairs of $x$ and $j$ such that $|x_j - q_j| = 0$ but not necessarily from the same $x$ . 

A simple modification is to use $Psi_(x,j)(q):=-c^(-|x_(j)-q_(j)|-|x_((j+1)\%d)-q_((j+1)\%d)|)$ for each dimension $j$ , where $x$ is a data point, and $d$ is the total number of dimensions. We do this because for two dimensional datasets, we can use Voronoi diagram to rule out too-far points efficiently. 

The Voronoi diagram indeed works, but did we actually fix our problem from the naive solution?

With some abuse of notation, we write $Psi_(x)(q) = sum_(j) Psi_(x,j)(q)$ and $Psi(q) = sum_(x) Psi_(x)(q)$ . 

Intuitively, we look into a case where $Psi_(x, j)(q) = -1$ if and only if $(q_(j) = x_(j)) and (q_((j+1) \% d) = x_((j+1) \% d))$ and otherwise $0$ . Basically, if we replace $1000$ with $+infinity$ , we will obtain this function $Psi$ . 

We can see that for this simple overlay, $-Psi_(x)(q) >= d$ if and only if $x = q$ exactly. 

So for any possible 'cross points', there will be a derivative inclining towards some $x$ . 

Now let's verify the monotone property, i.e. is $arg min_(x) - log Psi_(x)(q)$ the same as $arg min_x ||x - q||$ ?

We can show that $- log -Psi_(x)(q)$ is very similar to of $arg min_(x) min_(j) |x_j - q_j| + |x_(j+1) - q_(j+1)|$ if only one $Psi_(x, j)(q)$ is super large. So it is clear that it is $O(||x - q||)$ but not clear why it upper bounds $||x - q||$ . 

# Idea ([[#^254c58|Near -> Exact]])

I was thinking about 'locality hyper-sensitive hashing', but actually, we can just try to slip data points into the nearest local maximum ... I think it will be exactly what we need. 

# Idea ([[#^87879b|Effective Gradient Descend]])

Another consideration is how to make $- log -Psi_(x)(q)$ very similar to $||x - q||$ . From our previous analysis, if we are using some random projection, then we have to find random projections such that the expected minimum is similar to $||x-q||$ . 

It is possible for simple gradient ascend to first get sucked to some $x$ whose two dimensions are extremely close to $q$ and we never comes out of it. The situation is a bit different because we are talking about potential functions, momentum, and acceleration, so it is possible that if we apply a very small fraction, $q$ will eventually fall into our needed point. However, how this converges seems mysterious to me. 

Therefore, we have to do some experiments here. 

First, we verified that standard Adam optimizer is already good enough for this potential function when $Psi_(x)(q) = c^(-||x-q||)$ . The hyper parameter (especially $c$) is already very hard to tweak in this case. 😅

I hope we can exploit the fact that this function is $L$-Lipschitz in the future for faster gradient ascend/descend. 

```python
import torch as pt

D = 64
S = 1000
Q = 1000
C = 10**8
EPS = 0.5
RATE = 0.5 * 1e-3

rg = pt.manual_seed(100)
# dataset
ds = pt.rand(S, D, requires_grad=False, dtype=pt.double, device='cuda:0') * 2
rg = pt.manual_seed(1000)
# query set
qs = pt.rand(Q, D, requires_grad=True, dtype=pt.double, device='cuda:0')
# brutal force nearest neighbor
nn = pt.abs(qs.unsqueeze(-2) - ds).pow(2).sum(-1).argmin(-1)
di = pt.abs(ds[nn] - qs).pow(2).sum(-1).pow(1/2)

# compute gradient
def potential_1(qs, ds):
    # difference
    di = pt.abs(ds - qs.unsqueeze(-2))
    # neg potential function
    po = (C ** (di.pow(2).sum(-1).pow(1/2)).clamp(max=16) - EPS) ** -1 * (1 - EPS)
    # compute gradient
    qs.grad = None
    return po.sum()

# compute gradient
def potential_2(qs, ds):
    # difference
    di = pt.abs(ds - qs.unsqueeze(-2)).pow(2)
    # neg potential function
    po = (C ** (di[:, :, -1] + di[:, :, 0]).pow(1/2).clamp(max=16) - EPS) ** -1 * (1 - EPS)
    po = po.sum() + ((C ** (di[:, :, :-1] + di[:, :, 1:]).pow(1/2).clamp(max=16) - EPS) ** -1 * (1 - EPS)).sum()
    # compute gradient
    qs.grad = None
    return po / D

for i in range(4000):
    # compute acceleration
    po = potential_2(qs, ds)
    (-po).backward()
    with pt.no_grad():
        gd = qs.grad
        gd = gd * gd.pow(2).sum(-1).pow(-1/2-0.05).unsqueeze(-1)
        qs -= RATE * gd
    if i % 100 == 0: print(i, po.item())

# compare with nearest neighbors
print((pt.abs(ds[nn] - qs).pow(2).sum(-1).pow(1/2) < 1e-3).sum() / Q)
```

# Idea ([[#^b6d08d|Direct Evaluation]])

In [[#^83afc0|previous sections]] , we explored cases where we involve only several dimensions in each 'component' of potential function. However, we also found that it is possible for the gradient descending process to stuck somewhere that we don't want exactly. 

By observing how the numbers are mixed, I found **higher-order linear system** may serve our need perfectly. 

$$
Psi_(x)(q) = exp(-1/2||x-q||_2^2)
$$

Can we not evaluate $nabla Psi_x (q_1,q_2,dots,q_d)$ directly or we just construct something without considering the potential function?

