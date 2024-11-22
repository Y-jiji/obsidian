---
tags: "#𝔑-propositional"
---
# Problem Statement

Instead of working on a one-shot consensus protocol, like [@Paper:Paxos] , Raft directly works on multi-command settings [@Paper:Raft] . 

In the paper, Raft created a notion of consensus module. The consensus module handles all client instructions, and controls when the server can execute these instructions. Once an instruction is executed, it is guaranteed by the system that its action is persisted, even if some of the server crashes. This property is called **safety** by the Raft paper [@Paper:Raft] . 

Another property that the Raft consensus try to provide is **availability** , which means the server cluster will still be there to serve client requests, even if some of the servers in the cluster crashes. 

# Solution

To handle the consensus problem, Raft created the concept of roles in this system:
- Leader: take instructions from clients; reply to clients; replicate states to followers;
- Follower: take states from the leader; 
- Candidate: when a follower thinks a leader is not available, a follower will become a candidate and try to become a leader. 

For Raft to ensure safety, the newly elected leader must not overwrite previously commited log entries, or else it may cause inconsistent state. A follower must also know when to commit its entries. 

A very first question is that for each server, when will it **commit** a log item and actually modify its state?
- Leader: when it learned from follower's reply that the log item is replicated to a majority of servers, and the leader's term at the time of replication matches the term of the log entry. 
- Follower: when it learned from leader's append-entries message that the server has already commited a given log, and up to the commited log item, the follower's log is the same as the leader's log. 

Another thing about the client is that, when a leader steps down, the client will not receive any notice about **uncommited** log items. Therefore, the client have to use some retry policy to learn its log item is finally committed or overwritten. 

