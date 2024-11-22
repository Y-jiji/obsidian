---
tags:
  - 𝔉-note
  - 𝔗-algorithm
  - 𝔗-storage
  - 𝔑-informal
---
# Problem Statement

Currently, graph-based vector database are still stored using page model. However, when we have to navigate between pages, the locality will be broken sometimes. 

The research question here is to investigate methods that arrange clusters into pages such that the page swapping can be minimized. 

Non-constraints: 
- It is OK to have multiple copies of a single item. 

# Idea

