---
tags: "#𝔑-propositional"
---
# Preliminaries

## Location Tracking Systems

**GPS/GNSS** doesn't work indoors, so using wifi for fingerprinting. 

First, add a grid of points in database. Then, find the best match of signals. 

## Qubits

Qubits can be represented as complex numbers, i.e. $a + b i$ , where $a^2 + b^2 = 1$ . 

The probability of getting $0$ is $a^2$ ; the probability of getting $1$ is $b^2$ . 

You can measure a qubits, but after you measure it, it is consumed. 

## Quantum Gates

**Example ("Convert" Gate)** : $a + b i -> b + a i$ . 

**Example ("Hadamard" Gate)** : $a + b i -> (1/sqrt(2) + 1/sqrt(2) i)(a + b i)$ 

**Example ("CNOT" Gate)** : conditioning on the first qubit is $1$, negate the second qubit. 

**Example ("CSWAP" Gate)** : conditioning on the first qubit is $1$, swap the second and third qubit. 

# Quantum Localization

## Prepare State

Given the signal strength $alpha_({1,dots, n})$ from different sensors, construct $log n$ q-bits whose joint distribution will have amplitudes $alpha_({1,dots, n})$ padded by a bunch of zeros. 

## Quantum Fingerprinting

Using state preparation before, denote the location as $phi$ and the matching point as  $psi$. 

How to do cosine similarity matching using quantum computers?

Initially, the states are $(1,phi, psi)$ , then apply sequentially hadmard (on first gate), cswap, hardmard (on first gate), the probability of getting $1$ on the first position is the cosine similarity of $phi$ and $psi$ . 

