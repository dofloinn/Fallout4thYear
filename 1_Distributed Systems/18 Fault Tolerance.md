### <mark style="background: #FFF503A6;">Fault Tolerance</mark> 

<mark style="background: #FFF503A6;">Distributed systems - the notion of partial failure</mark>
- part of the system is failing while the remaining part continues to operate
- seemingly correctly

### <mark style="background: #FFF503A6;">Types of failures</mark>

<table>
	<tr>
		<th>Type</th>
		<th>Description of server’s behaviour</th>
	</tr>
	<tr>
		<td>Crash failure</td>
		<td>Halts, but is working correctly until it halts</td>
	</tr>
	<tr>
		<td>Omission failure, Receive omission, Send omission</td>
		<td>Fails to respond to incoming requests, Fails to receive incoming messages, Fails to send messages</td>
	</tr>
	<tr>
		<td>Timing failure</td>
		<td>Response lies outside a specified time interval</td>
	</tr>
	<tr>
		<td>Response failure, Value failure, State-transition failure</td>
		<td>Response is incorrect, The value of the response is wrong, Deviates from the correct flow of control</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Simple reliable group communication</mark> 

<mark style="background: #FFF503A6;">Intuition:</mark>
- A message sent to a process group G should be delivered to each member of G.
- Important: make distinction between receiving and delivering messages.

![[Pasted image 20251120091331.png]]

### <mark style="background: #FFF503A6;">Less simple reliable group communication</mark>  

<mark style="background: #FFF503A6;">Reliable communication in the presence of faulty processes:</mark> Group communication is reliable when it can be guaranteed that a message is received and subsequently delivered by all non-faulty group members.  

<mark style="background: #FFF503A6;">Tricky part:</mark> Agreement is needed on what the group actually looks like before a received message can be delivered.

### <mark style="background: #FFF503A6;">Simple reliable group communication</mark>

<mark style="background: #FFF503A6;">Reliable communication:</mark> assume non faulty processes  

<mark style="background: #FFF503A6;">Reliable group communication:</mark> boils down to reliable multicasting: is a message received and delivered to each recipient, as intended by the sender.

![[Pasted image 20251120091501.png]]

### <mark style="background: #FFF503A6;">Atomic multicast</mark>  

<mark style="background: #FFF503A6;">Problem:</mark> How to achieve reliable multicasting in the presence of process failures.  

<mark style="background: #FFF503A6;">In particular – often needed in a distributed system:</mark>  
- The guarantee that a message is delivered to either all group members or to none at all.
- This is also known as the atomic multicast problem.  

The atomic multicasting problem is an example of a more general problem, known as <mark style="background: #FFF503A6;">distributed commit</mark>.

### <mark style="background: #FFF503A6;">Distributed Commit Problem</mark>

How to have an operation being performed by each member of a process group, or none at all.  

<mark style="background: #FFF503A6;">In the case of reliable multicasting:</mark> the operation is the delivery of a message.  

<mark style="background: #FFF503A6;">With distributed transactions:</mark> the operation may be the commit of a transaction at a single site that takes part in the transaction.  

<mark style="background: #FFF503A6;">Transaction:</mark> An operation composed of a number of discrete steps.

### <mark style="background: #FFF503A6;">Distributed commit protocols Problem</mark>  

Have an operation being performed by each member of a process group, or none at all.  

<mark style="background: #FFF503A6;">Reliable multicasting:</mark> A message is to be delivered to all recipients.  

<mark style="background: #FFF503A6;">Distributed transaction:</mark> Each local transaction must succeed.

### <mark style="background: #FFF503A6;">Failure model for the commit protocols</mark>

Commit protocols are designed to work in an asynchronous system in which:
- servers may crash
- messages may be lost  

It is assumed that an underlying request-reply protocol removes corrupt and duplicated messages.  

There are no Byzantine faults – servers either crash or obey the messages they are sent

### <mark style="background: #FFF503A6;">Atomic commit protocols:</mark>

One coordinator and multiple participants  

<mark style="background: #FFF503A6;">Protocols for atomic distributed commit:</mark> 

<mark style="background: #FFF503A6;">One-phase:</mark> the coordinator to communicate the commit or abort request to all of the participants in the transaction and to keep on repeating the request until all of them have acknowledged that they have carried it out.  

<mark style="background: #FFF503A6;">Two-phase:</mark>
- designed to allow any participant to abort its part of a transaction
- can result in extensive delays for participants in the uncertain state.  

<mark style="background: #FFF503A6;">Three-phase:</mark>
- designed to alleviate delays due to participants in the uncertain state.
- more expensive in terms of the number of messages and the number of rounds 
- required for the normal (failure-free) case.

### <mark style="background: #FFF503A6;">The two-phase commit protocol</mark>

During the progress of a transaction, the only communication between coordinator and participant is the join request  

<mark style="background: #FFF503A6;">The client request to commit or abort goes to the coordinator</mark>  
- if client or participant request abort, the coordinator informs the participants immediately  
- if the client asks to commit, the 2PC comes into use  

<mark style="background: #FFF503A6;">2PC</mark>  
- <mark style="background: #FFF503A6;">voting phase:</mark> coordinator asks all participants if they can commit. If yes, participant records updates in permanent storage and then votes
- <mark style="background: #FFF503A6;">completion phase:</mark> coordinator tells all participants to commit or abort
- the next slide shows the operations used in carrying out the protocol

### <mark style="background: #FFF503A6;">Operations for two-phase commit protocol</mark>

<mark style="background: #FFF503A6;">canCommit?(trans)-> Yes / No:</mark> Call from coordinator to participant to ask whether it can commit a transaction. Participant replies with its vote.  

<mark style="background: #FFF503A6;">doCommit(trans):</mark> Call from coordinator to participant to tell participant to commit its part of a transaction.  

<mark style="background: #FFF503A6;">doAbort(trans):</mark> Call from coordinator to participant to tell participant to abort its part of a transaction.  

<mark style="background: #FFF503A6;">haveCommitted(trans, participant):</mark> Call from participant to coordinator to confirm that it has committed the transaction.  

<mark style="background: #FFF503A6;">getDecision(trans) -> Yes / No:</mark> Call from participant to coordinator to ask for the decision on a transaction after it has voted Yes but has still had no reply after some delay. Used to recover from server crash or delayed messages.

<mark style="background: #FFF503A6;">participant interface:</mark> canCommit?, doCommit, doAbort  

<mark style="background: #FFF503A6;">coordinator interface:</mark> haveCommitted, getDecision  


<mark style="background: #FFF503A6;">Phase 1 (voting phase):</mark> 
1. The coordinator sends a canCommit? request to each of the participants in the transaction.  
2. When a participant receives a canCommit? request it replies with its vote (Yes or No) to the coordinator. Before voting Yes, it prepares to commit by saving objects in permanent storage. If the vote is No the participant aborts immediately. 

<mark style="background: #FFF503A6;">Phase 2 (completion according to outcome of vote):</mark>  
3. The coordinator collects the votes (including its own).  
	- If there are no failures and all the votes are Yes the coordinator decides to commit the transaction and sends a ``doCommit`` request to each of the participants.
	- Otherwise the coordinator decides to abort the transaction and sends ``doAbort`` requests to all participants that voted Yes.  
4. Participants that voted Yes are waiting for a ``doCommit`` or ``doAbort`` request from the coordinator. When a participant receives one of these messages it acts accordingly and in the case of commit, makes a ``haveCommitted`` call as confirmation to the coordinator

### <mark style="background: #FFF503A6;">The Voting Rules</mark>  

1. Each participant has one vote which can be either 'commit‘ or 'abort’;  
2. Having voted, a participant cannot change its vote;  
3. If a participant votes 'abort' then it is free to abort the transaction immediately; any site is in fact free to abort a transaction at any time up until it records a 'commit' vote. Such a transaction abort is known as a unilateral abort.  
4. If a participant votes ‘commit’, then it must wait for the co-ordinator to broadcast either the 'global-commit' or 'global-abort' message;  
5. If all participants vote 'commit' then the global decision by the co-ordinator must be 'commit';  
6. The global decision must be adopted by all participants.

### <mark style="background: #FFF503A6;">Communication in two-phase commit protocol</mark>

![[Pasted image 20251120092459.png]]

<mark style="background: #FFF503A6;">Time-out actions in the 2PC:</mark> 
- to avoid blocking forever when a process crashes or a message is lost
- uncertain participant (step 2) has voted yes. it can’t decide on its own
- it uses getDecision method to ask coordinator about outcome 
- participant has carried out client requests, but has not had a Commit? from the coordinator. It can abort unilaterally 
- coordinator delayed in waiting for votes (step 1). It can abort and send ``doAbort`` to participants.

### <mark style="background: #FFF503A6;">Communication in two-phase commit protocol</mark>

<mark style="background: #FFF503A6;">A participant may be delayed:</mark> 
- Carried out all its client requests, but has not yet received a ``canCommit``? Call from the coordinator.
- As the client sends the ``closeTransaction`` to the Coordinator, a participant can only detect such a situation if it notices that it has not had a request in a particular transaction for a long time, e.g. By a timeout period on a lock.
- As no decision has been made at this stage, the participant can decide to abort unilaterally after some period of time.

<mark style="background: #FFF503A6;">The coordinator may be delayed:</mark>
- When it is waiting for votes from the participants.
- As it has not yet decided the fate of the transaction, it may decide to abort the transaction after some period of time.
- It must then announce ``doAbort`` to the participants who have already sent their votes.
- Some participant may try to vote Yes after this, but their votes will be ignored and they will enter the uncertain state.

### <mark style="background: #FFF503A6;">Performance of the two-phase commit protocol</mark> 
<mark style="background: #FFF503A6;">If there are no failures, the 2PC involving N participants requires:</mark>  
- N canCommit? messages and replies, followed by N doCommit messages.
- The cost in messages is proportional to 3N, and the cost in time is three rounds of messages.  
- The haveCommitted messages are not counted  

There may be arbitrarily many server and communication failures  

<mark style="background: #FFF503A6;">2PC is guaranteed to complete eventually</mark>, but it is not possible to specify a time limit within which it will be complete  
- delays to participants in uncertain state
- some 3PCs designed to alleviate such delays  
- they require more messages and more rounds for the normal case

### <mark style="background: #FFF503A6;">Three-phase commit (3PC) protocol:</mark>  

<mark style="background: #FFF503A6;">Phase 1: Voting phase</mark>  
- The coordinator sends a ``canCommit``? request to each of the participants in the transaction. <mark style="background: #FFF503A6;">Purpose:</mark> Find out if everyone agrees to commit 
- If the coordinator gets a ``timeout`` from any participant, or any NO replies are received. Send an ``abort`` to all participants
- If a participant times out waiting for a request from the coordinator, it ``aborts`` itself (assume coordinator crashed)  
- Else continue to phase 2
 
<mark style="background: #FFF503A6;">Phase 2: Prepare to commit phase:</mark>
- The coordinator collects the votes and makes a decision.
- If it is No, it aborts and informs participants that voted Yes 
- if the decision is Yes, it sends a preCommit request to all the participants. 
- Participants that voted Yes wait for a ``preCommit`` or ``doAbort`` request. They acknowledge ``preCommit`` requests and carry out ``doAbort`` requests.

<mark style="background: #FFF503A6;">Phase 3: Finalise phase</mark>  
- The coordinator collects the acknowledgements.
- When all are received, it commits and sends ``doCommit`` requests to the participants.
- Participants wait for a ``doCommit`` request. 
- When it arrives, they commit.

### <mark style="background: #FFF503A6;">Commit protocols: delays handling</mark> 

<mark style="background: #FFF503A6;">Assumptions:</mark> communication does not fail  

<mark style="background: #FFF503A6;">Two-phase commit protocol:</mark>
- the ‘uncertain/delay’ period occurs because a participant has voted yes but has not yet been told the outcome. 
- It can no longer abort unilaterally  

<mark style="background: #FFF503A6;">Three-phase commit protocol:</mark>
- The participants ‘uncertain’ period lasts from when the participant votes yes until it receives the ``preCommit`` request.
- At this stage, no other participant can have committed. Therefore if a group of participants discover that they are all 'uncertain' and the coordinator cannot be contacted, they can decide unilaterally to abort.

### <mark style="background: #FFF503A6;">3PC Weaknesses</mark> 

It may result in inconsistent state when a crashed coordinator recovers  

It is not resilient against network partitions  

Consensus based protocols are designed to be resilient against network partitions  

Raft, Paxos

### <mark style="background: #FFF503A6;">Failure: network partitions</mark> 

Network connectivity is split between group members – a member in a group cannot communicate with members in other groups  

Serious failure  

<mark style="background: #FFF503A6;">Network partition example:</mark> 
- The failure of a router between two networks
- May mean that a collection of four processes is split into two pairs
- Intra-pair communication is possible over their respective networks
- Inter-pair communication is not possible while the router has failed.

![[Pasted image 20251120093553.png]]

### <mark style="background: #FFF503A6;">Consensus</mark>

<mark style="background: #FFF503A6;">Consensus - distributed agreement:</mark> – recurring problem in distributed systems design.  

How to achieve reliability in presence of faulty processes – requires processes to agree on data value needed for computation

### <mark style="background: #FFF503A6;">Consensus problem</mark> 

How can any collection of processes agree on some value, no matter what the domain of the values in question?  

Value can be sequence number of a message, key=value, operation etc...  

<mark style="background: #FFF503A6;">A fundamental result in the theory of distributed systems:</mark>  
- under certain conditions (including quite benign failure conditions) it is impossible to guarantee that processes will reach consensus.
- nonetheless, systems regularly do reach agreement in asynchronous systems

### <mark style="background: #FFF503A6;">Consensus - usage</mark>

<mark style="background: #FFF503A6;">Decide if to commit a transaction:</mark> agree everyone is done with a set of operations  

Agree on identity of a leader  

Distributed locks  

<mark style="background: #FFF503A6;">Group membership:</mark> everyone agree on the set of group members  

<mark style="background: #FFF503A6;">Mutual exclusion:</mark> all processes agree on who has exclusive access to a resource  

<mark style="background: #FFF503A6;">Leader election:</mark> a group of processes has to decide which of them is in charge.  

Replication

<mark style="background: #FFF503A6;">Distributed Consensus Algorithms:</mark>
- Paxos
- Raft

### <mark style="background: #FFF503A6;">Paxos: High Overview</mark> 

Paxos is a family of protocols providing distributed consensus – lets nodes agree on same value in spite of node failures, network failures, delays  

<mark style="background: #FFF503A6;">Goal:</mark> Agree on a single value even if multiple systems propose  
different values concurrently  

<mark style="background: #FFF503A6;">Common use:</mark> provide a consistent ordering of events from  
multiple clients  
- All machines running the algorithm agree on a proposed value from a client
- The value will be associated with an event or action
- Paxos ensures that no other machine associates the value with another event

### <mark style="background: #FFF503A6;">Raft Distributed Consensus: High Overview</mark>  

Developed in reaction to the inherent intricacies of Paxos – easier to understand  

Uses a fairly straightforward leader- election algorithm  

The current leader operates during the current term.

### <mark style="background: #FFF503A6;">Raft</mark>  
- Typically, this will be a small number of systems, such as 3, 5, or 7.
- One of the servers is elected to be the leader.
- Other servers function as followers.
- Clients send requests only to the leader.
- The leader forwards them to followers.
- Each of the servers stores receiver requests in a log.

### <mark style="background: #FFF503A6;">Raft</mark>
- Every server (typically, five) keeps a log of operations, some of which have been committed.
- A consensus module on a server runs Raft and receives commands from clients
- It propagates the commands to consensus modules on other systems to get everyone to agree on the next log entry
- The leader decides which pending operation is to be committed next – a primary-backup approach.

### <mark style="background: #FFF503A6;">Consistency, availability, and partitioning (CAP) theorem</mark>  

In 2000, Eric Brewer posed an important theorem which was later proven to be correct CAP theorem  

<mark style="background: #FFF503A6;">Any networked system providing shared data can provide only two of the following three properties:</mark>  
- C: consistency, by which a shared and replicated data item appears as a single, up-to-date copy
- A: availability, by which updates will always be eventually executed 
- P: Tolerant to the partitioning of process group.  

<mark style="background: #FFF503A6;">Conclusion:</mark> In a network subject to communication failures, it is impossible to realise an atomic read/write shared memory that guarantees a response to every request.

### <mark style="background: #FFF503A6;">CAP theorem intuition</mark>  

<mark style="background: #FFF503A6;">Simple situation: two interacting processes</mark>  
- P and Q can no longer communicate:
- Allow P and Q to go ahead ⇒ no consistency
- Allow only one of P, Q to go ahead ⇒ no availability
- P and Q have to be assumed to continue communication ⇒ no partitioning allowed.

### <mark style="background: #FFF503A6;">System choices</mark>

<mark style="background: #FFF503A6;">Give up: consistency</mark>  
- Available and can handle partitioning
- Use expirations or leases, queued messages for updates
- E.g. DNS, web caching  

<mark style="background: #FFF503A6;">Give up: availability</mark>  
- Consistent and can handle partitioning
- ACID distributed databases  
- Problem: Response time
- However, with distributed systems, we expect partitions to occur  

<mark style="background: #FFF503A6;">How to achieve availability and consistency?</mark>  
- <mark style="background: #FFF503A6;">Availability:</mark> using replication
- <mark style="background: #FFF503A6;">Consistency:</mark> use with atomic updates
- Lock all copies before an update 
- Propagate updates
- Unlock

<mark style="background: #FFF503A6;">CAP Theorem:</mark> Essentially, when it seems that partitioning is taking place, the preferred option is to proceed  
- tolerating partitions in favor of either consistency or availability
- while simultaneously starting a recovery procedure that can mitigate the effects of potential inconsistencies.

### <mark style="background: #FFF503A6;">CAP Theorem Practical Ramification</mark> 

The CAP theorem is all about reaching a trade-off between safety and liveness, based on the observation that obtaining both in an inherently unreliable system cannot be achieved. Practical distributed systems are inherently unreliable.  

One can argue that the CAP theorem moves designers of distributed systems from theoretical solutions to engineering solutions.  

In practical distributed systems, one simply has to make a choice to proceed despite the fact that another process cannot be reached.  
- In other words, we need to do something when a partition manifests itself through high latency
- Exactly deciding on how to proceed is application dependent

### <mark style="background: #FFF503A6;">Summary</mark>

Fault tolerance is defined as the characteristic by which a system can mask the occurrence and recovery from failures.  

In other words, a system is fault tolerant if it can continue to operate in the presence of failures.

### <mark style="background: #FFF503A6;">References</mark> 

Chapter 17: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, 5thEd.  

Chapter 8: Maarten van Steen, Andrew S. Tanenbaum, Distributed Systems, 4th edition (2023)