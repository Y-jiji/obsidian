---
tags:
  - 𝔗-network
  - 𝔗-algorithm
  - 𝔗-probability
  - 𝔑-informal
---
# Problem Statement

In the network, we are trying to implement network telemery, i.e. each switch along the path try to encode their own message into a packet, and the destination server of that packet will try to decode these messages. 

When encoding static messages, each switch is trying to encode the same information whenever that packet reaches that switch. 

# Suspension

There is a very bad thing: you cannot know what is updated, the updated messages should have new index. 