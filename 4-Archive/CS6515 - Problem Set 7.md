---
tags:
  - 𝔉-homework
  - 𝔗-algorithm
---
# Regular Expressions

1. Given a vector $v in {0, 1}^d$ , the regular expression $u$ that matches vectors orthogonal to $v$ can be specified as: 
	- $u_i = 0$ iff $v_i = 1$
	- $u_i = (0|1)$ iff $v_i = 0$ (using $u_i=(.)$ is also fine,  but this one seems more natural to me)
2. Use $u_i$ to denote the regular expression that matches vectors orthogonal to $v_i$ , i.e. the regular expression constructed in question 1. The construction will be $accent(u, ->) = mono((2 (0|1)^d)*(2 (u_1|u_2|dots|u_n))(2 (0|1)^d)*)2$ . The constructed regular expression matches if and only if the original string can be divided into 3 parts: 
    1. prefix: matches any vector. 
    2. infix: matches exactly one vector $w_i$ orthogonal to some $v_i$ . 
    3. suffix: matches any vector. 
    where we use $mono((0|1)^d)$ to abbreviate the literal $d$-times repetition of $mono((0|1))$.  
    The construction has $O(n d) = n d + n + 1 + 2d$ characters. 
3. Once we admit OV-conjecture. Then regular expression cannot be polynomial faster than $O(m n)$ because otherwise given the previous construction, there will be some $O((n d)^(2-epsilon))$ algorithm for matching OV. 

***
# APSP and Min-Plus-Products

1. Consider a tri-partite graph of $3 n$ vertices. The three parts are $(V_a, V_b, V_c)$
    - Use $(A)_(a,b)$ to represent the weight on edge $(a, b)$ where $a in V_a$ and $b in V_b$
    - Use $(B)_(b,c)$ to represent the weight on edge $(b, c)$ where $b in V_b$ and $c in V_c$
    By the definition of shortest path, the shortest path between $(a, c) in V_a times V_c$ is: 
    - $min_(1 <= b <= n) ((A)_(a, b) + (B)_(b, c))$ . 
    It means the all pairs shortest path on this tri-partite graph computes $(A star B)_(a, c)$ for every pair of $(a, c)$ . The time complexity is $O(T(n)) = T(3 n)$ for the size of the graph. 
2. Remove Corner Cases: Assume self-loops are positive-weighted, or otherwise the shortest path can be $-infinity$. For positive-valued self-loop edges, there is no reason for a shortest path to contain them. Therefore, we only consider the adjacency matrix $A$ to have zeros on the diagonal without loss of generality. If an edge $(u,v)$ doesn't present in the graph, $(A)_(u,v) = + infinity$ . \
   We argue that $A^(star m)$ represent the shortest path with $<=$ $m$-edges using induction: 
    -  Initially, $(A)_(a,b)$ represent the shortest path between $(a,b)$ with length $1$ or $0$ . 
    - $(A^(star m) star A)_(a,c) = min_(1<= b <= n) ((A^(star m))_(a,b) + (A)_(b, c))$ . Using the associativity to $(+)$ of $min$ operation, we can view $(A^(star m))_(a, b)$ as the min taking over set of paths between $(a,b)$ with number of edges no greater than $m$ , and concat $(A)_(b, c)$ into each path of the set to get all the paths between $(a, c)$ the passes through $b$ . Since all paths with hops $m+1$ must pass through one of the neighbors of $c$ , the union over $1<=b<=n and b eq.not c$ enumerates all paths with hops $m+1$ . Specially, take $b = c$ preserves the set of all paths between $(a,c)$ with hops $m$ . 
    - This closes our induction. 
    Use the fast power algorithm to compute $A^(star 2^(m+1))$ from $A^(star 2^m)$ . Since shortest path has length at most $n$ . It takes $O(log n)$ steps for $2^m$ to exceed $n$ for the first time. Each multiplication takes $T(n)$ . Therefore, the total time complexity is $O(T(n) dot log n)$. 

***
# QR Code Detection

1. There is a triangle if $exists"distinct" i, j, k: A_(i,j)=A_(i,k)=A_(j,k)=1$ for adjacency matrix $A$ . It suffices to assign $A_(i,i) <- 2$ for $i,i$ on the diagonal of adjacency matrix $A$. Then run QR-detection on the modified matrix $A$ . Since all the $2$s are on the diagonal. If QR detection returns true, we can say that $exists i,l,j: A_(i,j) = A_(i,l) = A_(j,l) = 1 and A_(j,j) = 2 and i < j and j < l$ , which means there exists a triangle. Modifying the adjacency matrix takes $O(n)$ time, and run QR-detection takes $T(n)$ time. 
2. If we can solve QR-detection in $O(n^(3-epsilon))$ time, we can solve triangle detection in $O(n^(3-epsilon))$ time. Using triangle detection, we can solve BMM in $O(n^(3 - epsilon / (3+delta)))$ time, where $delta > 0$. Therefore, BMM conjecture will be rejected if we run QR-detection in $O(n^(3-epsilon))$ time. This contradicts our assumption that BMM cannot be done polynomially faster than $O(n^3)$ . 

***