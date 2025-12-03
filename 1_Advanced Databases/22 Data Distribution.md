### <mark style="background: #04FF00A6;">CAP Theorem</mark>  

About the trade -offs inherent in designing a distributed solution for storing data.

<mark style="background: #04FF00A6;">Consistency:</mark>
- Sequential consistency (a data item behaves as if there is one copy) – similar to the A in ACID
- All clients connected to a data store see the same data.

<mark style="background: #04FF00A6;">Availability:</mark>  
Node failures do not prevent survivors from continuing to operate. 

Clients are able to access and update data rapidly.

<mark style="background: #04FF00A6;">Partition-tolerance:</mark>  
- Partition=Break
- The system continues to operate even if a network partition causes communication interruption between nodes. 
- The data store is able to operate even when the network fails in some way.

“A distributed system can satisfy any two of these guarantees at the same time but not all three”

![[Pasted image 20251121130158.png]]

### <mark style="background: #04FF00A6;">Misconception:</mark>

"For a distributed application/data store you have to pick two of the three"

Each of these properties exists on a continuum.  

Attempting to increase one requires decreasing another to a certain degree

### <mark style="background: #04FF00A6;">Example:</mark>

![[Pasted image 20251121130816.png]]

Suppose we have a server S that contains some files named X, Y, and Z.  

The server is accessible via a network to clients A, B, and C.  

The clients occasionally wish to modify those files, so they can send messages like “read X” or “write Y” to change those files.  

As the server receives these requests, it sends as response message back to the client, indicating that the change is complete. 

The client waits for the response to come back before attempting another request.

The network imposes some minimum latency (let’s say 1ms) on each message  

```
latency=time to save and retrieve data
```

Reading and writing a large amount of data from this file server is going to be very slow as a result  

Much slower than accessing a local disk.

The network makes message delivery unreliable.  

A request/response could be delayed arbitrarily, or completely dropped.  

If for example a network cable is out of action, there will be no communication along that link  

If a client doesn’t receive a response to a message, then it has no choice but to wait and try the request again. It could wait a very long time.

<mark style="background: #04FF00A6;">For this example:</mark>
- <mark style="background: #04FF00A6;">Consistency:</mark> Every operation is applied in a known order, and all clients have an unfiltered view of the central server. (HIGH)
- <mark style="background: #04FF00A6;">Availability:</mark> Every single read or write requires a network operation, making this system much slower than accessing a local file system. (LOW)
- <mark style="background: #04FF00A6;">Partitionability:</mark> If a single client is partitioned from the file server, it cannot perform many operations. However, all other connected clients are able to continue. (MEDIUM)

### <mark style="background: #04FF00A6;">Modified Example</mark>

If we add a cache to each of the clients (with a finite capacity):

Simple logic for managing these caches locally at each client:

<mark style="background: #04FF00A6;">Read:</mark>
- When a client attempts to read a file, it first looks in its cache to see if that file's data is already present.  
- If it finds it, the read is satisfied from that data.  
- If not, the client issues a read request to the server, waits for the response, and replaces the Least Recently Used (LRU) item in the cache.

<mark style="background: #04FF00A6;">Write:</mark>
- When a client attempts to write a file, it first issues a write command to the server and waits for a response.  
- If an older version of the file exists in the client's cache, it is updated to the new value.  
- If not, the client replaces the LRU item in the cache with the newly written value.

<mark style="background: #04FF00A6;">For this example:</mark>
- <mark style="background: #04FF00A6;">Consistency:</mark> (Write Through Cache) is less consistent than the direct access example because a client may fail to see writes made by other clients, when a value is available within its own cache. (MEDIUM)
- <mark style="background: #04FF00A6;">Availability:</mark> Will see better read performance than the direct access example, because reads can be satisfied directly from cache without consulting the central server. However, writes are no faster because they always result in a network operation. (MEDIUM)
- <mark style="background: #04FF00A6;">Partitionability:</mark> A client might be able to continue operating even when the network is down, if it is only performing reads on cached data. However, any write operation must block until the network results.

<mark style="background: #04FF00A6;">Dealing with the P is central to distributed computing:</mark> 
- when we cannot communicate, should we optimistically try to make progress, or pessimistically wait, in order to achieve consistency?  
- Different applications will require different solutions

There are a variety of <mark style="background: #04FF00A6;">Consistency models</mark> that can be implemented. They adjust how and when caches are updated, and whether clients can continue to operate during a partition.

Consistency 
<mark style="background: #04FF00A6;">Strong Consistency:</mark> Once an update is complete, all clients will see that new value.  

<mark style="background: #04FF00A6;">Causal Consistency:</mark> If process A tells B that it has updated X, then B will see the latest value of X.  

<mark style="background: #04FF00A6;">Read-Your-Writes:</mark> If process A updates X, then A will never see an older value of X.  

<mark style="background: #04FF00A6;">Monotonic Reads:</mark> If process A reads a value from X, then it will never read back an older value.  

<mark style="background: #04FF00A6;">Monotonic Writes:</mark> All writes by process A are applied in the order they are given.  

<mark style="background: #04FF00A6;">Eventual Consistency:</mark> All updates will become visible to everyone, if you wait long enough.

<mark style="background: #04FF00A6;">Availability</mark> is probably the easiest to work out.  
- For a given system, one could measure every attempt to read or write a value, and then compute a statistic like the mean, median, or 99th percentile of latency for various operations.  
- A system that provides a lower mean is providing “more” availability.

<mark style="background: #04FF00A6;">Replication:</mark>
- Provides insurance against storage failures, but also provide a high degree of availability for commonly used data. 
- How does it impact consistency?

<mark style="background: #04FF00A6;">Eventual Consistency:</mark> 
- All updates will become visible to everyone, if you wait long enough. 
- Weakest kind.  
- No guarantees on order of writes applied to different replicas  
- No guarantees on what intermediate states a reader may observe.  
- Just guarantees that “eventually ” replicas will converge.

<mark style="background: #04FF00A6;">Causal Consistency:</mark> 
- If process A tells B that it has updated X, then B will see the latest value of X 
- Operations to the datastore applied in causal order. e.g. A comments on B’s post and then Bob replies to A’s comment. On all replicas, A’s comment written before B’s comment. This also means that it should be impossible to read B’s comment before reading A’s. 
- No guarantees for concurrent writes. e.g. if two people comment on two unrelated posts then it is okay to apply the two writes in different orders on different replicas

### <mark style="background: #04FF00A6;">According to Vogel:</mark>

Suppose you have a system with N replicated storage units.  

To update an item, a client must write W of the replicas upfront. (The remainder will get updated eventually in the background.)  

To read an item, a client must read R of the replicas, in order to decide whether the most recent value has been read. (If the values differ, assume you can tell which one is the newest.)

Suppose we have two replicas which are networkpartitioned (unable to communicate due to a network failure)  

If we allow writes on either replica we will end up with inconsistent data  

If we force the replicas to wait to synchronise we lose availability  

If we never have a network failure then we lose partition tolerance

N=2, W=2, R=1 is a strongly consistent system: a writer must update both replicas, and a reader can read either one of them.  

N=2, W=1, R=2 is also a strongly consistent system: a writer can update either replica, and a reader must read both to obtain the latest.  

N=2, W=1, R=1 is an eventually consistent system: the writer can update either replica, and the reader can read either replica, so you may not see consistent results

(W + R) > N is strongly consistent  

(W+R) <= N is weakly consistent.  

W < (N+1)/2 means write conflicts can occur

### <mark style="background: #04FF00A6;">Modern architectures:</mark>

General belief is that for wide -area systems you can’t forfeit P or partitions.  

You can’t choose to not have partitions .  

Therefore, you must balance consistency and availability.  

This is the case for NoSQL Distributed Data.

### <mark style="background: #04FF00A6;">ACID V BASE:</mark>

<mark style="background: #04FF00A6;">ACID:</mark> highly consistent system

<mark style="background: #04FF00A6;">BASE:</mark> highly available system

ACID good fit for businesses which deal with online transaction processing (e.g., finance institutions) or online analytical processing (e.g., data warehousing).

BASE more flexible and fluid.  

Organisations where growth, expansion, change in data structures is likely should favour BASE.

### <mark style="background: #04FF00A6;">SQL V NoSQL</mark>

SQL primarily vertically scalable – NoSQL horizontally scalable  

SQL table based, schema required –  NoSQL column, row, key -value based, flexible schema  

SQL better fit for heavy transaction loads and complex queries 

NoSQL preferred for unstructured data where growth and change are envisioned and availability is preferred over consistency

### <mark style="background: #04FF00A6;">PACELC</mark>

In addition to Consistency, Availability, and Partition Tolerance it also includes Latency as one of the desired properties of a Distributed System.  

<mark style="background: #04FF00A6;">The acronym PACELC stands for:</mark>
- Partitioned, 
- Availability, 
- Consistency
- Else Latency, 
- Consistency

In the case of Network Partition '<mark style="background: #04FF00A6;">P</mark>', a distributed system can have trade-offs between Availability '<mark style="background: #04FF00A6;">A</mark>' and Consistency '<mark style="background: #04FF00A6;">C</mark>'.

Else '<mark style="background: #04FF00A6;">E</mark>', if there is no Network Partition, then a distributed system can have trade-offs between Latency '<mark style="background: #04FF00A6;">L</mark>' and Consistency '<mark style="background: #04FF00A6;">C</mark>'.

Latency - performance

![[Pasted image 20251121153246.png]]

<mark style="background: #04FF00A6;">Partition:</mark> two nodes are not able to communicate with each other.

### <mark style="background: #04FF00A6;">Example:</mark>

Imagine you are working on a real -time analytics application that tracks stock market prices and updates client portfolios in real time.

This system uses a distributed database to store and process data across multiple nodes to handle large amounts of data and provide fast response times to users.

<mark style="background: #04FF00A6;">During a network partition, the system needs to choose between Availability (A) and Consistency (C):</mark>
- If the application values availability over consistency (PA), it can still serve data to clients, but this data may not be fully up -to-date across all nodes.  
- If consistency is prioritized (PC), it might restrict access until the partition resolves, ensuring that all clients get accurate and consistent data

<mark style="background: #04FF00A6;">When the system is not partitioned, there is a trade-off between Latency (L) and Consistency (C):</mark>  
- If the database prioritises low latency (EL), users get rapid responses with potentially slight inconsistencies in recent stock prices.  
- If it prioritizes consistency (EC), it might increase response time, ensuring the displayed portfolio is fully synchronised with the latest transactions across all nodes.

### <mark style="background: #04FF00A6;">How CAP Applies to Our Databases</mark>

<mark style="background: #04FF00A6;">Cassandra:</mark> AP system → partition tolerant + highly available (eventual consistency; tunable consistency with R/W).  

<mark style="background: #04FF00A6;">CouchDB:</mark> AP system → multi -master replication, eventual consistency.  

<mark style="background: #04FF00A6;">PostgreSQL (single node):</mark> CA system → strong consistency and availability, but not partition tolerant.

### <mark style="background: #04FF00A6;">PACELC Mapping</mark>

<mark style="background: #04FF00A6;">Cassandra → PA / EL:</mark>
- <mark style="background: #04FF00A6;">During partition:</mark> prioritises Availability (A) over Consistency (C) 
- <mark style="background: #04FF00A6;">Else (no partition):</mark> prioritises Latency (L) over Consistency (C)
- Tuneable consistency, but fundamentally AP

<mark style="background: #04FF00A6;">CouchDB → PA / EL:</mark>
- Multi-master replication
- Eventual consistency
- Prioritises availability and low latency; resolves conflicts later

<mark style="background: #04FF00A6;">PostgreSQL (Single-node) - PC / EC (strictly speaking):</mark>
- During partition (P): PostgreSQL cannot continue if the database node is isolated → it prioritizes Consistency over Availability.
- Else (no partition): prioritizes Consistency over Latency.
- PostgreSQL is always consistent-first. Latency is never traded to relax consistency.

<mark style="background: #04FF00A6;">PostgreSQL (Synchronous replication enabled) - Still PC / EC, but even more clearly:</mark>
- If the standby cannot acknowledge writes → the primary blocks writes (preserves consistency over availability).
- Latency increases because synchronous replication must wait → consistency over latency.

<mark style="background: #04FF00A6;">PostgreSQL (Asynchronous replication) - Still effectively PC / EC, but with a slight nuance:</mark>
- Allows writes even if standby lags (higher availability), but:
- Reads from replicas may be stale → but PostgreSQL itself remains consistent at the primary.
- It never sacrifices consistency for latency inside a single node.