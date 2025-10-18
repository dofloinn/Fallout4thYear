# <mark style="background: #04FF00A6;">Couch DB Replication</mark>

changed David Hansen to David Lynch in examresults db.

![[Pasted image 20251013202608.png]]
be924baec5499a240dee1b3d5000362e

Replica.
![[Pasted image 20251013202937.png]]

Changed to David Corcoran

![[Pasted image 20251013203028.png]]

Not replicated:
![[Pasted image 20251013203215.png]]

Added Ashley in replica (after making it  a leader)

![[Pasted image 20251013203940.png]]

Changed Ashley's grade from B to A in examresults
![[Pasted image 20251013204206.png]]

Visible in replica:
![[Pasted image 20251013204245.png]]

# <mark style="background: #04FF00A6;">Cassandra</mark>

Apache Cassandra is a <mark style="background: #04FF00A6;">NoSQL distributed database</mark> designed for <mark style="background: #04FF00A6;">high availability</mark>, <mark style="background: #04FF00A6;">scalability</mark>, and <mark style="background: #04FF00A6;">fault tolerance</mark>.  

It’s widely used by companies like Netflix, Apple, and Instagram for managing large, constantly changing datasets across multiple servers or even data centres.  

Before launching Cassandra, it’s important to understand its <mark style="background: #04FF00A6;">building blocks</mark>:  
1. <mark style="background: #04FF00A6;">Cluster:</mark> a collection of connected servers (called nodes) that work together to store and replicate data - the entire Cassandra database.  
2. <mark style="background: #04FF00A6;">Node:</mark> a single instance of Cassandra (a container, VM, or physical server). Each node holds a portion of the data. There is no single leader — all nodes are peers.  
3. <mark style="background: #04FF00A6;">Keyspace:</mark> like a database schema in SQL — it’s the top-level namespace for tables. When you create a keyspace, you define how data should be replicated across the cluster.  
4. <mark style="background: #04FF00A6;">Replication Factor:</mark> controls how many copies of your data exist in the cluster. For example:  
	- <mark style="background: #04FF00A6;">Replication factor = 1:</mark> One copy of each piece of data (no redundancy) 
	- <mark style="background: #04FF00A6;">Replication factor = 2:</mark> Two copies stored on different nodes  
5. <mark style="background: #04FF00A6;">Partitioning:</mark> Cassandra uses consistent hashing to distribute rows across nodes. Each node owns a range of “tokens,” representing part of the overall hash space. This ensures even data distribution and easy scalability.  

Cassandra provides a SQL-like query language called <mark style="background: #04FF00A6;">Cassandra Query Language (CQL)</mark> which you use as you would SQL to interact with the database.  

It also provides <mark style="background: #04FF00A6;">cqlsh - a command-line shell</mark> for running CQL commands.  
- It connects to a Cassandra cluster and allows you to execute CQL statements interactively or from script files.  
- You can think of it as Cassandra’s equivalent of PostgreSQL’s psql or of MongoDB's MongoDB Shell (mongosh).  

<mark style="background: #04FF00A6;">In this lab you are going to:</mark>
- Create a small Cassandra cluster using docker containers.  
- Working with cqlsh (CQL Shell) use CQL:  
	- Create a keyspace.  
	- Create a table.  
	- Insert some data.  
	- Query this data.

You will see that as part of the service configuration you set the ``MAX_HEAP_SIZE`` and ``HEAP_NEWSIZE`` parameters.  

These control the Java Virtual Machine (JVM) memory allocation for Cassandra, which is written in Java. These parameters help optimize memory usage and performance.  

The heap is the portion of memory where Java objects are allocated.  

``MAX_HEAP_SIZE`` - sets the maximum amount of memory (heap size) that the JVM will allocate for the Cassandra process. By setting ``MAX_HEAP_SIZE`` to 512M, you are limiting Cassandra to use no more than 512 MB of memory for storing objects, such as data structures, buffers, etc  

``HEAP_NEWSIZE`` - sets the size of the "young generation" or "new generation" heap space ( where short-lived objects are stored (e.g., temporary objects)) within the total heap space.

### <mark style="background: #04FF00A6;">Node Status Indicators:</mark>

<mark style="background: #04FF00A6;">Each node is represented with two key indicators:</mark>
- <mark style="background: #04FF00A6;">Status:</mark> This shows whether the node is currently up or down.   
- <mark style="background: #04FF00A6;">State:</mark> This shows whether the node is part of the cluster or not.

<mark style="background: #04FF00A6;">Status:</mark>
- <mark style="background: #04FF00A6;">U:</mark> The node is Up and running.
- <mark style="background: #04FF00A6;">D:</mark> The node is Down, meaning it is not reachable or functioning.    

<mark style="background: #04FF00A6;">State:</mark>
- <mark style="background: #04FF00A6;">N:</mark> The node is Normal, meaning it is a functioning member of the cluster and holding data.  
- <mark style="background: #04FF00A6;">L:</mark> The node is Leaving the cluster (it is in the process of decommissioning or being removed).  
- <mark style="background: #04FF00A6;">J:</mark> The node is Joining the cluster (it is in the process of starting up and joining the cluster for the first time). 
- <mark style="background: #04FF00A6;">M:</mark> The node is Moving data, meaning it's either moving data to or from another node in the cluster (usually due to a rebalancing or a topology change).  

<mark style="background: #04FF00A6;">Tokens</mark> represent the range of the hash space (data partition space) that a node is responsible for in the cluster.  
- Cassandra uses consistent hashing to distribute data across multiple nodes.  
- Each node is assigned one or more tokens, which define the portion of the data that node is responsible for.  

The Owns column shows the <mark style="background: #04FF00A6;">percentage of the token space</mark> that the node is responsible for.  
- Represents the effective ownership of the data based on the token ranges assigned to the node.  
- It indicates how much of the total data (key space) in the cluster that particular node owns.

This will provide statistics about the employee table. Details of what the output provides is detailed here: https://docs.datastax.com/en/cassandra-oss/3.x/cassandra/tools/toolsTablestats.html  

<mark style="background: #04FF00A6;">Memtable data size:</mark>
- Memtable is an in-memory write cache.  
- The data size is the amount of data currently stored in memory (RAM) for a specific table before being flushed to disk as an SSTable.  
- An SSTable is an immutable file on disk that stores Cassandra’s actual table data. It’s the final, persistent form of data that was first written to memory (the memtable).  

<mark style="background: #04FF00A6;">Local read latency:</mark> time (in milliseconds) it takes for Cassandra to complete the most recent read request on that table from the local node.  
- Lower latency = faster reads.  
- High latency may indicate disk I/O bottlenecks or heavy compaction.  

<mark style="background: #04FF00A6;">Local write latency:</mark> time (in milliseconds) it takes for Cassandra to complete the most recent read request on that table from the local node.  
- Lower latency = faster reads.  
- High latency may indicate disk I/O bottlenecks or heavy compaction.  

<mark style="background: #04FF00A6;">Index summary off heap memory used:</mark> amount of off heap memory used to store indexes for this table  

These summaries speed up lookups in SSTables without consuming heap memory.  

Off-heap use improves performance by reducing garbage collection pressure.  

<mark style="background: #04FF00A6;">Bloom filter space used:</mark> how much space is used to store the Bloom filter data. A Bloom filter is a probabilistic data structure that helps Cassandra quickly check if a row might exist in an SSTable (to avoid unnecessary disk reads).  

<mark style="background: #04FF00A6;">Bloom filter false positives ratio:</mark> fraction of all bloom filter checks resulting in a false positive from the most recent read.  
- Lower is better - fewer unnecessary disk lookups.  
- A high value suggests Bloom filters are too small or SSTables are too fragmented.