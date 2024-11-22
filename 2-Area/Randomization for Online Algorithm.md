---
tags:
  - 𝔉-note
  - 𝔑-informal
  - 𝔗-probability
  - 𝔗-algorithm
---
# Definition (Online Algorithm)

Provide an algorithm of type: 

$$
f: scr(I) -> scr(A) -> scr(A) times scr(T)
$$

where $scr(I)$ is the input domain, $scr(A)$ is the auxiliary output/augment, and $scr(T)$ is the target domain. 

This is not a formal definition, because in some online problems, you have to commit part of the solutions before receiving further input. 

# Definition (Competitive Ratio)

If we are going to evaluate an online algorithm for a minimization problem, which gives non-negative result, we evaluate the given algorithm by compare the ratio between "online solution objective" and "offline solution objective". 

$$
"Competitive Ratio" = max_("inputs") frac("online cost", "offline cost")
$$

# Example (Rent or Purchase)

Think about skiing equipment. You can either rent or purchase it. 

To purchase, you spend $x B$ ; To rent, you spend $x$ for each day. 

The challenge of this problem is how many days in your life you are going to ski. 

**Observation** : You can get $2 - B^(-1)$ by renting for $B-1$ days, on $B^"th"$ day, purchase it. 

**Observation** : You cannot get better than $2 - B^(-1)$ with any deterministic algorithm. 

# Definition (Competitive Ratio, Randomized)

$$
"Competitive Ratio" = max_("inputs") frac(EE["online cost"], "offline cost")
$$

**Idea** : Randomized algorithm can do better than deterministic algorithm, because the adversarial input cannot know the mixture of choices given by algorithms. (The same mixture strategy is better than pure strategy in game theory). 

# Example (Rent or Purchase, Randomized)

We only have one 'purchase' day then a randomized algorithm decides which day to purchase. 

#𝔖-planned 