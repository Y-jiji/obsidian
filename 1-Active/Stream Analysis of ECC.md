---
tags:
  - 𝔉-note
  - 𝔗-algorithm
  - 𝔑-informal
  - 𝔖-planned
---
# Preliminaries

## $epsilon$-erasure-only-channel

A channel is called $epsilon$ erasure only channel iff given a sequence of messages $cal(m)_1, cal(m)_2, dots, cal(m)_n, dots$, it independently drops each message $cal(m)_n$ by $epsilon$ probability or passes the message successfully. But it never introduces other types of errors. 

## XOR Encoding

A common technique of efficiently passing messages through $epsilon$-channels is to use error correction code. In this scheme, instead of directly passing messages through $epsilon$-channels, we pass a sequence of codewords. Each codeword is a bitwise exclusive-or (XOR) of multiple messages. We refer to the number of messages encoded in a codeword as the _degree_ of the codeword. There are many strategies to decide which codeword is an XOR of which messages, but we will have to first understand the decoding process before we examine these strategies. 

## Decode via Peeling

Naturally, for a codeword XOR-ed from $d+1$ messages, if we have already known $d$ messages in it, we can subtract these $d$ messages from the codeword to decode another message. Once we know some new messages, we can further proceed this decode process and iteratively extract more messages. This decoding scheme is named _peeling_. 

With some abuse of notation, we denote by $cal(c)$ the set of messages encoded in a codeword $cal(c)$ in [[#^a35cd5]]. In other part of this article, $cal(c)$ means the index of a codeword. 

```typst
#import "@preview/lovelace:0.3.0": *
#align(center)[
    #pseudocode-list(
        line-numbering: none, 
        hooks: 0.05cm, 
        booktabs: true,
        title: smallcaps[*Algorithm* Peeling],
    )[
        + $cal(M)$ = ${$#smallcaps[
            The Set of Decoded Messages, Initially $emptyset$
        ]$}$
        + $cal(C)$ = $[$#smallcaps[
            The List of CodeWords
        ]$]$
        + #smallcaps[*WHILE* #h(0.1em) $exists cal(c) in cal(C): |cal(c)| = 1$]
            + $Delta cal(M) <- {cal(m): {cal(m)} in cal(C)}$
            + #smallcaps[*FOR* $cal(m)$ *IN* $Delta M$]
                + #smallcaps[*FOR* $cal(c)$ *IN* $cal(C)$]
                    + $cal(c) <- cal(c) backslash {cal(m)}$
            + $cal(M)$ = $Delta cal(M) union cal(M)$
        + #smallcaps[*Return* $cal(M)$]
    ]
]
```
^a35cd5

However, if at some point, all the codewords have degree larger than $2$, and not all messages are decoded, then the decoding process fails. 

## Message-Codeword Graph

A message-codeword graph $G(cal(M), cal(C), E subset.eq cal(M) times cal(C))$ is a bipartite graph. There is an edge $(cal(m), cal(c)) in cal(M) times cal(C)$ in $E$ if and only if $cal(m)$ is encoded in $cal(c)$. 

We notice that the process of decoding naturally adds a direction to each edge in the graph. We write $cal(m) <- cal(c)$ when we decode a message $cal(m)$ from a codeword $cal(c)$, and write $cal(m) -> cal(c)$ when we assign $cal(c) backslash {cal(m)}$ to $cal(c)$. To capture this idea, we introduce the concept of _orientation_ and _$ell$-peelability_ .

An orientation $overline(G)(V, overline(E))$ of a undirected graph $G(V, E)$ is a directed graph obtained by assigning each edge $(u, v)$ a direction $(u -> v)$ or $(u <- v)$ and put it into $overline(E)$ . 

We say a bipartite graph $G(cal(M), cal(C), E)$ is $ell$-peelable if and only if there is an orientation $overline(G)(cal(M), cal(C), overline(E))$ of $G(cal(M), cal(C), E)$ such that: 
+ For each $cal(m) in cal(M)$, there are at least one $cal(c) in cal(C)$ such that $(cal(m) <- cal(c)) in overline(E)$. 
+ For each $cal(c) in cal(C)$, there are at most $ell$ messages $cal(m) in cal(M)$ such that $(cal(m) <- cal(c)) in overline(E)$. 
+ There are no cycles in $overline(E)$ . 

In this paper, we are only interested in $1$-peelability, and therefore we abbreviate _$1$-peelability to peelability_. The [[#^7b73d4|figure below]] shows an orientation that demonstrates $1$-peelability of the graph. 

```typst
#import "@preview/pinit:0.2.2": *
#align(center)[#rect(width: 15cm, height: 3.5cm, stroke: none)[
	#place(dx: -1cm, dy: 0.5cm, [_Messages_])
	#place(dx: -1cm, dy: 3cm - 1em, [_Codewords_])
	#for i in range(2, 10) {
		let x = i * 15cm / 10;
		let ya = 0.5cm;
		let yb = 3cm;
		place(simple-arrow(start: (x, yb - 0.05cm), end: (x, ya + 0.05cm), thickness: 2pt, fill: foreground))
		if i != 2 {
			place(simple-arrow(start: (x, ya + 0.05cm), end: (x - 15cm / 10, yb - 0.05cm), fill: foreground, thickness: 2pt))
		}
	}
	#for i in range(2, 10) {
		let j = i - 1;
		place(dx: i * 15cm / 10 - 0.1cm, dy: 0.5cm - 0.15cm, circle(width: 0.2cm))
		place(dx: i * 15cm / 10 - 0.5em, dy: -0.15cm, [$cal(m)_(#j)$])
		place(dx: i * 15cm / 10 - 0.1cm, dy: 3cm - 0.1cm, circle(width: 0.2cm))
		place(dx: i * 15cm / 10 - 0.5em, dy: 3cm + 0.2cm, [$cal(c)_(#j)$])
	}
]]
```
^7b73d4

# Problem Statement

## Forward Decoding

