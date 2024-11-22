---
tags:
  - 𝔗-algorithm
  - 𝔗-probability
---

# Problem Statement

Currently (year 2024), [@Paper:Raft] and [@Paper:Paxos] are two mainstream consensus algorithms for distributed systems. For [@Paper:Raft] and some variants of [@Paper:Paxos] , it works by maintaining a consistent log between multiple replications, and using these logged actions to arrive at the same state. 

We focus on Raft for its simplicity. 

# Idea

In Raft [@Paper:Raft] , the leader have to force the followers to follow its state. 

From my current understanding of [[Raft Consensus Algorithm|Raft]] , log replication code is only useful when a new leader steps up or another server comes back to the network. When the leader functions normally, other servers only needs the latest log entry, and they must reply to the leader for it to **commit** the log into its state. 

One competitor of our method is batched log sending. The leader can send a batch of contiguious log items. However, in our method, we have to introduce extra computation. 

# Idea (Skiplist)

If we restrict our class of codewords to segments of log items, therefore, we can extend prefix sum mechanism in our scheme to accelerate decoding and keep almost everything in cache. 

