### <mark style="background: #FFF503A6;">Synchronisation and coordination</mark>

Closely related

<mark style="background: #FFF503A6;">Synchronisation:</mark>
- Make sure that one process waits for another to complete its operation
- The problem is to ensure that two sets of <mark style="background: #FFF503A6;">data</mark> are the same.

<mark style="background: #FFF503A6;">Coordination:</mark>
- The goal is to manage the interactions and dependencies between <mark style="background: #FFF503A6;">activities</mark> in a distributed system
- Encapsulates synchronisation

### <mark style="background: #FFF503A6;">Clock synchronisation</mark>  

In a centralised system, time is unambiguous.  

When a process wants to know the time, it simply makes a call to the operating system.  

If process A asks for the time, and then a little later process B asks for the time, the value that B gets will be higher than (or possibly equal to) the value A got – It will not be lower.  

In a distributed system, achieving agreement on time is not trivial.

Strongly related to communication between processes is the issue of how processes in distributed systems synchronise.  

Synchronisation is all about doing the right thing at the right time.  
A problem in distributed systems, and computer networks in general, is that there is no notion of a globally shared clock  

Processes on different machines have their own idea of what time it is.

<mark style="background: #FFF503A6;">Physical clocks:</mark>
- Keep time of day  
- Consistent across systems, but tend not to be in perfect agreement  
- Clock drift, which means that they count time at different rates, and so diverge.  

<mark style="background: #FFF503A6;">Logical clocks:</mark> Keeps track of event ordering

### <mark style="background: #FFF503A6;">Physical clocks:</mark>  

<mark style="background: #FFF503A6;">Problem:</mark>
- Sometimes we simply need the exact time, not just an ordering 
- E.g. file compilation using ``make``  
- If the source file ``input.c`` has time 2151 and the corresponding object file ``input.o`` has time 2150, ``make`` knows that ``input.c`` has been changed since ``input.o`` was created, and thus ``input.c`` must be recompiled.  
- If ``output.c`` has time 2144 and ``output.o`` has time 2145, no compilation is needed  

<mark style="background: #FFF503A6;">Solution:</mark>
- Universal Coordinated Time (UTC)  
- Based on the number of transitions per second of the cesium 133 atom  
- At present, the real time is taken as the average of some 50 cesium clocks around the world.  

<mark style="background: #FFF503A6;">UTC is broadcast through short-wave radio and satellite:</mark>
- Satellites can give an accuracy of about +/- 0:5 ms  
- Satellite sources include the Global Positioning System (GPS)

### <mark style="background: #FFF503A6;">Clock synchronisation</mark>

<mark style="background: #FFF503A6;">Precision:</mark> The goal is to keep the deviation between two clocks on any two machines within a specified bound, known as the precision  

<mark style="background: #FFF503A6;">Accuracy:</mark> considering an external reference point, like UTC, aiming to keep it bound to a specific value  

<mark style="background: #FFF503A6;">Internal synchronisation:</mark> Keep clocks <mark style="background: #FFF503A6;">precise</mark>  

<mark style="background: #FFF503A6;">External synchronisation:</mark> Keep clocks <mark style="background: #FFF503A6;">accurate</mark>

### <mark style="background: #FFF503A6;">Clock drift</mark>

All clocks are based on some harmonic oscillator – an object that resonates at a certain <mark style="background: #FFF503A6;">frequency</mark> and from which we can subsequently derive time.  

Because their frequency is not perfect and affected by external sources such as temperature, clocks on different machines will gradually start showing different values for time.  

<mark style="background: #FFF503A6;">Clock drift rate:</mark> The difference per unit of time from a perfect  
reference clock.

### <mark style="background: #FFF503A6;">Clock synchronization algorithms: Cristian’s algorithm</mark>

<mark style="background: #FFF503A6;">Cristian’s Algorithm:</mark>
- Suggested the use of a time server, connected to a device that receives signals from a source of UTC, to synchronise computers externally.  
- Upon request, the server process S supplies the time according to its clock,  
- Attempts to remove delays of accessing a time service by assuming that delays to the server and back are the same.  
- Compensate for delays

![[Pasted image 20251016102054.png]]

### <mark style="background: #FFF503A6;">Clock synchronisation algorithms: NTP</mark>

<mark style="background: #FFF503A6;">Network Time Protocol (NTP):</mark>
- Provide a service enabling clients across the Internet to be synchronized accurately to UTC  
- NTP employs statistical techniques for the filtering of timing data and it discriminates between the quality of timing data from different servers  
- To offset delays encountered in Internet communication  
- Based on originally proposed algorithm by Cristian

### <mark style="background: #FFF503A6;">NTP:</mark>

Internet Standard  

<mark style="background: #FFF503A6;">Reliable:</mark>
- Against lengthy losses of connectivity  
- Provides redundant paths, redundant servers  

<mark style="background: #FFF503A6;">Scalable:</mark>
- Large numbers of clients can synchronize frequently  
- Offsets effects of clock drift  

<mark style="background: #FFF503A6;">Authenticates source of data:</mark> Providing protection against interference

### <mark style="background: #FFF503A6;">NTP servers</mark>

NTP servers are connected in a logical hierarchy called a <mark style="background: #FFF503A6;">synchronisation subnet</mark> whose levels are called <mark style="background: #FFF503A6;">strata</mark>.  

<mark style="background: #FFF503A6;">Stratum-1 server:</mark> a server with a reference clock such as a UTC receiver or an atomic clock,  
- A the clock itself is said to operate at Stratum 0  
- Stratum 1- they are at the root systems - connected directly to accurate time source  

<mark style="background: #FFF503A6;">Stratum-2 servers:</mark> secondary servers that are synchronised directly with the primary servers - systems synchronised from 1st stratum systems  

<mark style="background: #FFF503A6;">Stratum-3 servers:</mark> synchronised with Stratum-2 servers, and so on...  

The lowest-level (leaf) servers execute in users’ workstations, e.g.  - Stratum-10: systems synchronised from 9th stratum systems

![[Pasted image 20251016102412.png]]

<mark style="background: #FFF503A6;">Note:</mark> Arrows denote synchronization control, numbers denote strata

### <mark style="background: #FFF503A6;">Logical clocks</mark>

What usually matters is not that all processes agree on exactly what time it is, but – that they agree on the order in which events occur  

Requires a notion of ordering

A logical clock measures the passing of time in terms of logical operations, not the physical time

<mark style="background: #FFF503A6;">Assign sequence numbers to messages:</mark> All cooperating processes agree on order of events  

<mark style="background: #FFF503A6;">Assumptions:</mark>
- No central time source  
- Each system maintains its own local clock  
- No total ordering of events 
- Multiple processes, each one of them has unique IDs and has its own incrementing counter

<mark style="background: #FFF503A6;">Main types</mark>
- Lamport’s logical clocks  
- Vector clocks

### <mark style="background: #FFF503A6;">Lamport’s logical clocks</mark>

<mark style="background: #FFF503A6;">Lamport – in his seminal paper in 1978:</mark>
- Showed that although clock synchronisation is possible, it need not be absolute.  
- If two processes do not interact, it is not necessary that their clocks be synchronised because the lack of synchronisation would not be observable and thus could not cause problems.  
- What usually matters is not that all processes agree on exactly  what time it is, but rather that they agree on the order in which events occur.  

E.g. In the compilation example, what counts is whether ``input.c`` is older or newer than ``input.o``, not their respective absolute creation times.

<mark style="background: #FFF503A6;">Lamport clocks:</mark>
- Allow processes to assign sequence numbers, so called Lamport timestamps, to messages and other events  
- all cooperating processes can agree on the order of related events.  

<mark style="background: #FFF503A6;">A monotonically increasing software counter:</mark> Whose value does not have particular relationship to any physical clock.

To synchronise logical clocks, Lamport defined a relation called <mark style="background: #FFF503A6;">happens-before</mark>.  

<mark style="background: #FFF503A6;">The happened-before relation (denoted by ->):</mark> 
1. If ``a`` and ``b`` are two events in the same process, and ``a`` comes before ``b``, then ``a->b``.  
2. If ``a`` is the sending of ``a`` message, and ``b`` is the receipt of that message, then ``a->b``  
3. If ``a->b`` and ``b->c``, then ``a->c``  

This introduces a <mark style="background: #FFF503A6;">partial ordering</mark> of events in a system with concurrently operating processes.

### <mark style="background: #FFF503A6;">Lamport Timestamps</mark>

Each process has its own clock, i.e. ``sequence #`` – Lamport timestamps need a monotonically increasing software counter  

Clock is incremented before each event  

Each message carries a timestamp of the sender’s clock  

<mark style="background: #FFF503A6;">When a message arrives:</mark> 
- if receiver’s clock ≤ ``message_timestamp``, then set system clock to (``message_timestamp`` + 1)  
- set event timestamp to the system's clock  

<mark style="background: #FFF503A6;">Partial ordering:</mark> Lamport timestamps allow to maintain time ordering among related events

### <mark style="background: #FFF503A6;">Happened-before: Events occurring at three processes</mark>

![[Pasted image 20251016103516.png]]

``a->b``, since the events occur in this order at process ``p1 (a->b)``, and similarly ``c->d``.  

``b->c``, since these events are the sending and reception of message ``m1`` , and similarly ``d->f``.  

Combining these relations, we may say that, for example, ``a->f``.  

<mark style="background: #FFF503A6;">Happened-before:</mark> relation captures a flow of data intervening between two events.  

Not all events are related by the relation, e.g. ``a`` and ``e`` , since they occur at different processes, and there is no chain of messages intervening between them. We say that events such as ``a`` and ``e`` that are not ordered by ``->`` , are concurrent and write this as ``a || e``.

### <mark style="background: #FFF503A6;">Lamport timestamps for the events shown in previous figure</mark>

![[Pasted image 20251016103548.png]]

Each of the processes ``p1`` , ``p2`` and ``p3`` has its logical clock initialised to 0.  

The clock values given are those immediately after the event to which they are adjacent.  

Note that, for example, ``L(b)>L(e)`` but ``b||e``.

### <mark style="background: #FFF503A6;">Event counting example: bad ordering</mark>

![[Pasted image 20251016103752.png]]

<mark style="background: #FFF503A6;">Bad ordering – for logical clocks:</mark>
- ``e->h`` but ``5>=2``  
- ``f->k`` but ``6>=2``

### <mark style="background: #FFF503A6;">Applying Lamport stamps: Event counting example</mark>

![[Pasted image 20251016103833.png]]

<mark style="background: #FFF503A6;">Good ordering – for logical clocks:</mark>
- ``e->h`` but ``5 < 6``  
- ``f -> k`` but ``6 < 7``

### <mark style="background: #FFF503A6;">Lamport’s logical clock example: Banking example</mark>

A database has been replicated across several sites.  

For example, to improve query performance, a bank may place copies of an account database in two different cities, say New York and San Francisco.  

A query is always forwarded to the nearest copy.  

The price for a fast response to a query is partly paid in higher update costs because each update operation must be carried out at each replica.  

Assume a customer in San Francisco wants to add $100 to her account, which currently contains $1,000.  

At the same time, a bank employee in New York initiates an update by which the customer’s account is to be increased with 1 percent interest.  

Both updates should be carried out at both copies of the database.  

However, due to communication delays in the underlying network, the updates may arrive in the order as shown in in the next slide.

### <mark style="background: #FFF503A6;">Banking Example</mark>

Concurrent updates on a replicated database are seen in the same order everywhere  
- P1 adds $100 to an account (initial value: $1000)  
- P2 increments account by 1%  
- There are two replicas  

<mark style="background: #FFF503A6;">Result:</mark>
- In absence of proper synchronization:  
- replica #1 ← $1111, while replica #2 ← $1110  

Situations such as these require a <mark style="background: #FFF503A6;">totally ordered multicast</mark>

![[Pasted image 20251016104058.png]]

### <mark style="background: #FFF503A6;">Totally ordered multicast</mark>

<mark style="background: #FFF503A6;">Totally ordered multicast:</mark> A multicast operation by which all messages are delivered in the same order to each receiver.  

Lamport’s logical clocks can be used to implement totally ordered multicasts in a completely distributed fashion.  

<mark style="background: #FFF503A6;">Consider a group of processes multicasting messages to each other:</mark>
- Each message is always timestamped with the current (logical) time of its sender.  
- When a message is multicasted, it is conceptually also sent to the sender.  
- In addition, we assume that messages from the same sender are received in the order they were sent, and that no messages are lost.

### <mark style="background: #FFF503A6;">Totally ordered multicast:</mark>

Process P<sub>i</sub> sends timestamped message mi to all others (multicast). The message itself is put in a local queue queue<sub>i</sub> .  

<mark style="background: #FFF503A6;">Any incoming message at P<sub>j</sub> is queued in queue<sub>j</sub> :</mark>  
- Ordered according to timestamp,  
- Acknowledged to every other process  

<mark style="background: #FFF503A6;">P<sub>j</sub> passes a message m<sub>i</sub> to its application if:</mark>
1. m<sub>i</sub> is at the head of queue<sub>j</sub> and has been acknowledged by each other process.  
2. for each process P<sub>k</sub> , there is a message m<sub>k</sub> in queue<sub>j</sub> with a larger timestamp.  

At that point, the message is removed from the queue and handed over to the application; the associated acknowledgments can simply be removed.  

Because each process has the same copy of the queue, all messages are delivered in the same order everywhere.

### <mark style="background: #FFF503A6;">Lamport clocks usage</mark>

<mark style="background: #FFF503A6;">Replicated services:</mark> where the replicas are kept consistent by letting them execute the same operations in the same order everywhere.  

<mark style="background: #FFF503A6;">Mutual exclusion:</mark> 
- Mutual exclusion is about agreeing in which order processes are allowed to enter a critical region - a section of code that can be executed by at most one process at a time  
- Algorithm similar for totally ordered multicasting can be used to establish access to a critical region.  
- Analogy with totally ordered multicast - With totally ordered multicast, all processes build identical queues, delivering messages in the same order

### <mark style="background: #FFF503A6;">Lamport’s logical clocks</mark>

<mark style="background: #FFF503A6;">Problem:</mark> How do we maintain a global view on the system’s behaviour that is consistent with the happened-before relation?  

<mark style="background: #FFF503A6;">Attach a timestamp C(e) to each event e, satisfying the following properties:</mark>
- <mark style="background: #FFF503A6;">P1:</mark> If ``a`` and ``b`` are two events in the same process, and ``a->b``, then we demand that ``C(a) < C(b)``.  
- <mark style="background: #FFF503A6;">P2:</mark> If a corresponds to sending a message m, and b to the receipt of that message, then also ``C(a) < C(b)``.  

<mark style="background: #FFF503A6;">Problem:</mark> How to attach a timestamp to an event when there’s no global clock) maintain a consistent set of logical clocks, one per process.

### <mark style="background: #FFF503A6;">Vector clocks</mark>

Lamport’s clocks do not guarantee that if ``C(a)< C(b)`` that a causally preceded b.  

<mark style="background: #FFF503A6;">Vector clocks:</mark> Developed to overcome the shortcoming of Lamport’s clocks  

A vector clock for a system of N processes is an array of N integers. Each process keeps its own vector clock, V<sub>i</sub> , which it uses to timestamp local events.  

Processes piggyback vector timestamps on the messages they send to one another

<mark style="background: #FFF503A6;">A vector is a logical clock that guarantees that:</mark> If two operations can be ordered by their logical timestamps, then one must have happened before the other.  

Implemented with an array of counters, one for each process in the system.

A way of identifying which events are causally related:  

Guaranteed to get the sequencing correct  

<mark style="background: #FFF503A6;">The problem:</mark>
- The size of the vector increases with more actors  
- The entire vector must be stored with the data  
- Comparison takes more time than comparing two numbers  
- If messages are concurrent - application will have to decide how to handle conflicts

### <mark style="background: #FFF503A6;">Summary</mark>

There are various way to synchronise clocks in a distributed system  

All methods are essentially based on exchanging clock values, while taking into account the time it takes to send and receive messages.  

Variations in communication delays and the way those variations are dealt with, largely determine the accuracy of clock synchronisation algorithms.  

In many cases, knowing the absolute time is not necessary.  

What counts is that related events at different processes happen in the correct order.

The happened-before relation is a partial order on events that reflects a flow of information between them  

Within a process, or via messages between processes.  

Lamport clocks are counters that are updated in accordance with the happened-before relationship between events.  

Each event ``e``, such as sending or receiving a message, is assigned a globally unique logical ``timestamp C(e)`` such that when event ``a`` happened before ``b``, ``C(a) < C(b)``.  

Vector clocks are an improvement/extension on Lamport clocks. If ``C(a) < C(b)``, we even know that event ``a`` causally preceded ``b``.

### <mark style="background: #FFF503A6;">References:</mark> 

Chapter 14: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, 5thEd.  

Chapter 6: Maarten van Steen, Andrew S. Tanenbaum Distributed Systems, 3rd edition (2017)  

Understanding Distributed Systems: What every developer should know about large distributed applications by Roberto Vitillo, February 2021  

Paul Krzyzanowski, Logical Clocks, 2021