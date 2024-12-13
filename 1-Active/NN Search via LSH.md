---
tags:
  - 𝔉-note
---
# Idea (Build Graph via LSH)

I think current locality sensitive hashing scheme is already good enough for nearest neighbor search. The problem lies in the search method that doesn't sufficiently exploit the index structure. 

**Question:** What happens if we actively prune the neighbors after projection and form a very sparse graph? Isn't that graph good enough as a graph-based index?

