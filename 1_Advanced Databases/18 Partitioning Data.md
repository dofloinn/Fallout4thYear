### <mark style="background: #04FF00A6;">Data Scalability</mark>

Ability of to handle increasing amounts of data, numbers of users, and types of requests without sacrificing performance or availability.  

A scalable data solution tackles adapts to growing demands by either adding resources such as hardware or software, by optimising its design and configuration, or by undertaking some combined strategy.  

<mark style="background: #04FF00A6;">Vertical scalability:</mark> Adding more processing power and memory to a single server.  

<mark style="background: #04FF00A6;">Horizontal database:</mark> Adding more servers (i.e., database nodes) to distribute the workload

![[Pasted image 20251121102950.png]]

### <mark style="background: #04FF00A6;">What is Data Partitioning?</mark>  

<mark style="background: #04FF00A6;">Data partitioning</mark> is the process of splitting a large dataset into <mark style="background: #04FF00A6;">smaller, more manageable</mark> segments (partitions) that can be stored and processed independently.  
- Each partition contains a subset of the data
- Partitions may be stored on different servers or nodes  
- Improves <mark style="background: #04FF00A6;">scalability, performance, and availability</mark>

### <mark style="background: #04FF00A6;">Partitioning v Distribution</mark>  

<mark style="background: #04FF00A6;">Partitioning:</mark> How the data is split.  
<mark style="background: #04FF00A6;">Distribution:</mark> Where the data is placed.  

Partitioning <mark style="background: #04FF00A6;">does not</mark> require multiple machines. 

Distribution <mark style="background: #04FF00A6;">does</mark>.

### <mark style="background: #04FF00A6;">Vertical v Horizontal Partitioning</mark>  

Vertical Partitioning stores tables and/or columns in a separate database or tables.  

Horizontal Partitioning stores rows of a table in multiple database clusters.  

<mark style="background: #04FF00A6;">When do we decide physical Design? It depends on:</mark>  
- Expected access patterns  
- Data volume and growth rate  
- Hotspot avoidance  
- Hardware distribution  
- Availability requirements

<table>
	<tr>
		<th>Type</th>
		<th>Description</th>
		<th>Example</th>
	</tr>
	<tr>
		<th>Horizontal Partitioning (Sharding)</th>
		<td>Split by rows</td>
		<td>Users A–M on Node1, N–Z on Node2</td>
	</tr> 
	<tr> 
		<th>Vertical Partitioning</th>
		<td>Split by columns</td>
		<td>Personal info vs financial info stored separately</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Vertical Partitioning</mark>

Splits a table by <mark style="background: #04FF00A6;">columns</mark>, storing different groups of attributes in separate tables or storage units.  

Useful when different sets of columns are accessed at different times or have different performance needs.  

<mark style="background: #04FF00A6;">The fields are divided according to their pattern of use:</mark> For example, frequently accessed fields might be placed in one vertical partition and less frequently accessed fields in another

![[Pasted image 20251121103838.png]]
![[Pasted image 20251121103854.png]]

### <mark style="background: #04FF00A6;">Horizontal Partitioning</mark>  

Splits a table by <mark style="background: #04FF00A6;">rows</mark>, distributing subsets of rows across multiple partitions or nodes.  

Used to scale out large datasets, distribute load, and improve parallelism.  

Each partition is a separate data store, but all partitions have the same schema.  

Each partition holds a specific subset of the data, such as all the orders for a specific set of customers.  

Tables, indexes and materialized views to be partitioned into disjoint sets of rows that are physically stored and accessed separately.

![[Pasted image 20251121103939.png]]

![[Pasted image 20251121103950.png]]

### <mark style="background: #04FF00A6;">Vertical v Horizontal Partitioning</mark> 

<mark style="background: #04FF00A6;">Can be done together:</mark>
- You might divide data into horizontally  
- And Then use vertical partitioning to further subdivide the data in each shard

![[Pasted image 20251121104547.png]]

### <mark style="background: #04FF00A6;">What is Sharding?</mark> 

<mark style="background: #04FF00A6;">Sharding is a specific form of horizontal partitioning where:</mark>
- Rows (documents/records) are distributed across <mark style="background: #04FF00A6;">multiple machines</mark>  
- Each shard holds a distinct subset of data  
- All shards together form the full dataset  
- Used heavily in distributed systems (Cassandra, MongoDB, CouchDB clusters).  

All sharding is partitioning, but not all partitioning is sharding.

### <mark style="background: #04FF00A6;">When do we decide?</mark>

<mark style="background: #04FF00A6;">Partitioning choices are made during Physical Database Design, based on:</mark>  
- Query access patterns  
- Data distribution needs  
- Scalability and performance requirements  
- Avoiding hotspots and skew  
- Availability and fault-tolerance goals

### <mark style="background: #04FF00A6;">Why partition data?</mark> 

<mark style="background: #04FF00A6;">Improve scalability:</mark> 
- When you scale up a single database system, it will eventually reach a physical hardware limit
- If you divide data across multiple partitions, each hosted on a separate server, you can scale out the system almost indefinitely.  

<mark style="background: #04FF00A6;">Improve performance:</mark>
- Data access operations on each partition take place over a smaller volume of data.  
- Partitioning can make your system more efficient.  
- Operations that affect more than one partition can run in parallel.  

<mark style="background: #04FF00A6;">Improve security:</mark>
- In some cases, you can separate sensitive and non-sensitive data into different partitions and apply different security controls to the sensitive data.

### <mark style="background: #04FF00A6;">Why partition?</mark>

<mark style="background: #04FF00A6;">Provide operational flexibility:</mark> You can define different strategies for management, monitoring, backup and restore, and other administrative tasks based on the importance of the data in each partition.  

<mark style="background: #04FF00A6;">Improve availability:</mark>
- Separating data across multiple servers avoids a single point of failure.  
- If one instance fails, only the data in that partition is unavailable operations on other partitions can continue

### <mark style="background: #04FF00A6;">Data Latency</mark>  

<mark style="background: #04FF00A6;">Data is distributed across nodes:</mark> These may be on different machines in different geo locations  

It takes time to retrieve the data  

<mark style="background: #04FF00A6;">Creates latency:</mark> Time lag between us (or, more often, our applications and databases making that request) asking for data and when we’re actually able to get it.  

This is something we need to work on to try to improve performance

### <mark style="background: #04FF00A6;">Hotspot:</mark> 

Occurs when one partition, one key, or one node receives a <mark style="background: #04FF00A6;">disproportionately high amount of traffic</mark> (reads, writes, or both).  

<mark style="background: #04FF00A6;">This creates an imbalance in load, causing:</mark>  
- slower queries  
- increased latency  
- uneven resource usage  
- potential node overload  
- reduced overall throughput  

Arise when <mark style="background: #04FF00A6;">partitioning is uneven</mark> - that is, when some partitions get far more data or queries than others

<mark style="background: #04FF00A6;">Problems caused by Hotspots</mark>
- Overloaded nodes
- Poor query performance 
- High latency
- Reduced availability
- Unbalanced scaling (adding nodes doesn’t fix it)  

Hotspots <mark style="background: #04FF00A6;">negate</mark> the benefits of distributed databases

<mark style="background: #04FF00A6;">Common Causes:</mark>
- <mark style="background: #04FF00A6;">1. Skewed data distribution:</mark> Some keys naturally appear more often (e.g., country=US).  
- <mark style="background: #04FF00A6;">2. Time-based writes:</mark> All current data goes into one partition (e.g., today’s or this hour’s logs).  
- <mark style="background: #04FF00A6;">3. Bad partition key choice:</mark> If the partition key does not spread data evenly, one node handles most of the workload.  
- <mark style="background: #04FF00A6;">4. High-read workloads for one key:</mark> Even if data is distributed evenly, one key may get 90% of the queries.

### <mark style="background: #04FF00A6;">Hotspot Examples</mark>

<mark style="background: #04FF00A6;">Cassandra:</mark> 
- A partition key like ``server_id`` when one server generates most logs → one partition grows unbounded.
- Time-series using only date as partition key → all writes go to “today’s” partition.  

<mark style="background: #04FF00A6;">CouchDB:</mark> Partition prefix IE: has 10× more documents than other prefixes → the IE shard is overloaded.  

<mark style="background: #04FF00A6;">PostgreSQL:</mark> Range partitioning by month → the “current month” partition receives all writes.

### <mark style="background: #04FF00A6;">How to Avoid Hotspots</mark> 

<mark style="background: #04FF00A6;">Use composite partition keys:</mark> Add a second key to break up heavy partitions: e.g., (device_id, date_hour) instead of (device_id). 

<mark style="background: #04FF00A6;">Use hashing:</mark>
- Hash a high-cardinality key to spread load
- Cassandra uses hashing automatically
- CouchDB can hash partition prefixes manually  

<mark style="background: #04FF00A6;">Use bucketing:</mark> Split large partitions into fixed “buckets”: e.g., ``user_id % 16``  

<mark style="background: #04FF00A6;">Avoid unbounded partitions:</mark> Especially in time-series scenarios.  

<mark style="background: #04FF00A6;">Monitor partition sizes use:</mark>  
- ``nodetool tablestats in Cassandra``  
- ``_partition/{key} stats in CouchDB``  
- ``pg_partition_tree in PostgreSQL``

### <mark style="background: #04FF00A6;">Important!</mark>

Partitioning is successful only if the partition key matches the query access pattern.  

<mark style="background: #04FF00A6;">Cassandra:</mark>  
- <mark style="background: #04FF00A6;">Good:</mark> ``WHERE device_id = ? AND timestamp > ?`` 
- <mark style="background: #04FF00A6;">Bad:</mark> ``WHERE timestamp = ?``  

<mark style="background: #04FF00A6;">CouchDB:</mark>
- Good: ``/_partition/TU857/_all_docs``
- Bad: ``/_all_docs``  

<mark style="background: #04FF00A6;">Postgres:</mark>  
- Good: ``WHERE sale_date BETWEEN ...`` 
- Bad: ``Query without partition``

### <mark style="background: #04FF00A6;">Partition Skew</mark> 

<mark style="background: #04FF00A6;">Partition Skew: Definition & Problems:</mark>  
- Uneven distribution of data across nodes  
- Causes hotspots → slow writes/reads  
- Causes uneven storage  

<mark style="background: #04FF00A6;">How to detect skew:</mark>
- <mark style="background: #04FF00A6;">Cassandra:</mark> ``nodetool tablestats``, ``nodetool status``, partition size histograms  
- <mark style="background: #04FF00A6;">CouchDB:</mark> check ``_partition/{key} statistics; view performance``  

<mark style="background: #04FF00A6;">How to prevent skew:</mark>  
- Use composite partition keys  
- Use hashing (CouchDB)  
- Use bucketing (Cassandra)

### <mark style="background: #04FF00A6;">Impact on Secondary Indexes</mark>

<mark style="background: #04FF00A6;">CouchDB:</mark>
- Views inside a partition are fast.
- Global views scan all shards → expensive.  

<mark style="background: #04FF00A6;">Cassandra:</mark>
- Secondary indexes do not work well across large partitions.
- Cassandra encourages query-based ``modelling``, not indexing.  

<mark style="background: #04FF00A6;">PostgreSQL:</mark> Each partition has its own index if partitioned.

### <mark style="background: #04FF00A6;">Do’s and Don’ts NoSQL</mark> 

<mark style="background: #04FF00A6;">Cassandra DOs:</mark>
- DO use time bucketing (e.g. day or hour) for time-series.  
- DO use composite keys to avoid unbounded partitions.  
- DON’T rely on secondary indexes for large datasets.  
- DON’T expect range scans without partition key.  

<mark style="background: #04FF00A6;">CouchDB DOs:</mark>  
- DO use partitioned databases for efficient queries.  
- DO choose a partition key that reflects query patterns.  
- DO use hashed partition keys to avoid skew.  
- DON’T run global views unless necessary.

### <mark style="background: #04FF00A6;">Choosing a partition key:</mark>
- Uniform distribution
- Bounded growth
- Reflects query patterns
- Avoid global scans
- Supports replication strategy
- Avoid hotspots

### <mark style="background: #04FF00A6;">Partitioning and Replication</mark>

<mark style="background: #04FF00A6;">Combining partitioning and replication is common pattern:</mark>
- Splitting the data into separate partitions and then creating multiple replicas for each partition.  
- The replicas for each partition coordinate with each other  

Improves fault tolerance  

Improves scalability  

Improves availability

<table>
	<tr>
		<th>&nbsp;</th>
		<th>Partitioning + Replication Behaviour</th>
	</tr>
	<tr>
		<th>Cassandra</th>
		<td>Each partition is replicated RF times → consistency levels matter.</td>
	</tr>
	<tr>
		<th>CouchDB</th>
		<td>Each shard has replicas; _replicator database spreads partitions across nodes.</td>
	</tr>
	<tr>
		<th>PostgreSQL</th>
		<td>Replication independent of partitioning; physical/logical replication.</td>
	</tr>
</table>

<table>
	<tr>
		<th>Concept</th>
		<th>PostgreSQL</th>
		<th>CouchDB</th>
		<th>Cassandra</th>
	</tr>
	<tr>
		<td>Range</td>
		<td>Native</td>
		<td>By prefix </td>
		<td>Only inside partition</td>
	<tr>
	<tr>
		<td>List</td>
		<td>Native</td>
		<td>Natural by prefix</td>
		<td>Logical only</td>
	<tr>
	<tr>
		<td>Hash</td>
		<td>Native</td>
		<td>Developer-defined</td>
		<td>Always physical hashing</td>
	<tr>
	<tr>
		<td>Hotspot risk</td>
		<td>Moderate</td>
		<td>High with skewed prefixes</td>
		<td>High with bad partition key</td>
	<tr>
	<tr>
		<td>Good use case</td>
		<td>Time-series</td>
		<td>Partitioned indexing</td>
		<td>High-write distributed apps</td>
	<tr>
	<tr>
		<td>Cross-partition range queries</td>
		<td>Possible with global view (slow across shards)</td>
		<td>Not supported (requires scanning all partitions manually)</td>
		<td>Fully supported — planner prunes partitions automatically</td>
	<tr>
	<tr>
		<td>Secondary indexes</td>
		<td>Partition-local indexes are fast; global slow</td>
		<td>Secondary indexes weak for wide partitions</td>
		<td>Each partition has its own index; global indexes also supported</td>
	<tr>
	<tr>
		<td>Partition key flexibility</td>
		<td>Must be encoded into _id</td>
		<td>Must match access pattern; fixed after table creation</td>
		<td>Very flexible; can change or add partitions</td>
	<tr>
	<tr>
		<td>Automatic partition pruning</td>
		<td>No (manual via prefix/query)</td>
		<td> Pruned only by partition key equality </td>
		<td>Yes—planner prunes partitions for range/list/hash</td>
	<tr>
	<tr>
		<td>Distributed across nodes?</td>
		<td>Only in CouchDB clusters with sharding</td>
		<td>Always distributed (token ring)</td>
		<td> Only with extensions (e.g., Citus)—native PG is single-node
	</tr>
</table>

