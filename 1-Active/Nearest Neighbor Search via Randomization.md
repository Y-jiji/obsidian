---
tags:
  - 𝔉-note
  - 𝔗-algorithm
  - 𝔑-propositional
---

# Idea (Diffusion)

Consider [[Interior Point Method|interior point method]] for linear programming (in general, convex optimization). 

On a very high level, this method iterates on both objectives ${f^((l))}$ and solutions ${x^((l))}$ , while keeping three invariant: 
1. When $x^((l))$ is near-optimal for $f^((l+1))$, then $x^((l+1))$ is near-optimal for $f^((l+1))$ ^116b2d
2. $x^((l+1))$ is a better solution for $f^((l+1))$ then $x^((l))$, and it is easy to obtain from $x^((l))$ ^599736
3. The optimal solution of $f^((l+1))$ is a better solution for original problem then $f^((l))$.  ^63d2b9

If the computation for each iteration is cheap, and the iteration doesn't take too many steps, then we can solve the original problem effectively. 

If we can tweak objectives for nearest neighbor search, can that make our solution more efficient?

Maybe we can use diffusion process to implement [[#Co-iterate the Objective|this idea]]. 

The sequence of objectives are just $||v_i^((l)) - q||$ , where $v_i^((l))$ is a reverse of diffusion process, i.e. $v_i^((l-1))$ is obtained by adding random Gaussian noise to $v_i^((l))$. 

It is easy to maintain [[#^116b2d |invariant 1]] with very high probability, since we can diffusion process control the variant of Gaussian noise effectively. However, it seems unclear how to maintain [[#^599736|invariant 2]] at this moment and [[#^63d2b9|invariant 3]] seems dependent on the dataset ${v_i: i in cal(I)}$. 

Maybe we should not limit the data structure we use on each layer to NSW, LSH, or IVF. 

Another consideration is multiplying the size will be too extravagant. So maybe we use one pseudo random number generator with a fixed seed to generate the randomization noise. We may also need Jinfan's Range Sum. 

# Idea (Line Projection)

**Positive Evidence** : We know that $f(x) = ||q-x||$ is convex. Therefore, moving along any direction, if $x$ gets closer to $q$ on the projected space, than $f(x)$ decreases. In our problem, this method may not be applicable, as many projected points may be very far from the line. So, simply order points along the line may not work. 

I would like to know the probability of really decrease the distance between $k_i$ and $q$ given that $||k_i - q||$ decreases by switching $i$ along direction $w$ such that $w^T k_i$ goes nearer to $w^T q$ . ($w$ :  a randomly generated direction) . 

# Idea (Stick to Grid)

With probability $p$ , decide to round each entry $v_(i j)$ or not. Round each entry $v_(i j)$ in a point $v_i$ to $floor(v_(i j)/2^n) dot 2^n$ with probability $v_(i j)/2^n - floor(v_(i j)/2^n)$ round to $ceil(v_(i j)/2^n)$ otherwise. 

Now locally the graph will be low dimensional, which is suitable for NSW graph. 
