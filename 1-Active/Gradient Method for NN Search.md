---
tags:
  - 𝔉-note
---
# Problem 

The problem is the classic [[Hub - Nearest Neighbor Search|nearest neighbor search]] problem, on say, for $l_2$ norm. 

# Idea (Gradient)

Using some jargon of physics, we refer to the function that maps position to energy as potential/potential function. We also say 'overlay' for summation of functions. 

The following is a summation of exponential potentials for each point in a 1D dataset. 
![[Gradient Method for NN Search 1D.png|400]]
However, we can see the the gradients can be very hard to compute and can be super small on some positions. 

**Question** : How to determine the gradient effectively if we have a large and high-dim dataset?  ^d53695

If we enlarge this picture a bit, we will find that the dots are not exactly on the peak. Therefore, after converging into a local maximum, we have to find the actual point id as a separate step. 

**Question** : How to find the exact point after our the iteration converges? ^254c58

**Question** : How to effectively gradient descend? The gradient can be super small in some cases. <- This is a question that ST raised to me.  ^87879b

# Idea ([[#^d53695|High Dim Dataset]])

One naive thought is to replace the gradient with $frac(1, 1000^x)$ for each dimension. The problem of this method is that it is possible for the gradient descend process to stop somewhere that is not a point. The problem is that our **local maxima can also locate near points other than points from the dataset**. 

A possible solution is to use $Phi_(x,j)(q):=1000^(-|x_(j)-q_(j)|-|x_((j+1)\%d)-q_((j+1)\%d)|)$ for each dimension $j$ , where $x$ is a data point, and $d$ is the total number of dimensions. We do this because for two dimensional datasets, we can use Voronoi diagram to rule out too-far points efficiently. 

The Voronoi diagram indeed works, but can there be any local maxima that is far away from data points?

With some abuse of notation, we write $Phi_(x)(q) = sum_(j) Phi_(x,j)(q)$ and $Phi(q) = sum_(x) Phi_(x)(q)$ . 

Intuitively, we look into a case where $Phi_(x, j)(q) = 1$ if and only if $(q_(j) = x_(j)) and (q_((j+1) \% d) = x_((j+1) \% d))$ and otherwise $0$ . Basically, if we replace $1000$ with $+infinity$ , we will obtain this function $Phi$ . 

We can see that for this simple overlay, $Phi_(x)(q) >= d$ if and only if $x = q$ exactly. 

So for any possible 'cross points', there will be a derivative inclining towards some $x$ . 

# Idea ([[#^254c58|Near -> Exact]])

I was thinking about 'locality hyper-sensitive hashing', but actually, we can just try to slip data points into the nearest local maximum ... I think it will be exactly what we need. 

# Idea ([[#^87879b|Diminished Gradient?]])

It is possible for our gradient to disappear since we are looking at the power of a super small number. 😅

Currently the basic ideas are to go with the $k$-largest gradients or sample the direction proportional to the magnitude of the gradient. 

For this, we have to test a few things out in our experiments ... 
