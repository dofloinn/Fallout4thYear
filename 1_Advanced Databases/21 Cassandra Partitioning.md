### <mark style="background: #04FF00A6;">Apache Cassandra</mark>

<mark style="background: #04FF00A6;">Distributed</mark> NoSQL database management system  

Data model is based around optimising for queries

Stores data across a cluster of nodes  

CQL (Cassandra Query Language)

### <mark style="background: #04FF00A6;">Wide Column Store</mark>

<mark style="background: #04FF00A6;">Table:</mark> Column family. Table is a collection of similar rows (not necessarily identical)

<mark style="background: #04FF00A6;">Row is a collection of columns:</mark> 
- Should encompass a group of data that is accessed together 
- Associated with a unique row key

<mark style="background: #04FF00A6;">Column:</mark>
- Column consists of a column name and column value (and possibly other metadata records)
- Scalar values, but also flat sets, lists or maps may be allowed

### <mark style="background: #04FF00A6;">BASE</mark>

<mark style="background: #04FF00A6;">Basically Available:</mark> Rather than enforcing immediate consistency, BASE-modelled NoSQL databases will ensure availability of data by spreading and replicating it across the nodes of the database cluster.  

<mark style="background: #04FF00A6;">Soft State:</mark> 
- Due to the lack of immediate consistency, data values may change over time.  
- The BASE model breaks off with the concept of a database which enforces its own consistency, delegating that responsibility to developers.  

<mark style="background: #04FF00A6;">Eventually Consistent:</mark> 
- The fact that BASE does not enforce immediate consistency does not mean that it never achieves it.  
- However, until it does, data reads are still possible (even though they might not reflect the reality).

### <mark style="background: #04FF00A6;">Cassandra Architecture</mark> 

Cassandra offers linear scalability and performance directly proportional to the number of nodes available.

![[Pasted image 20251121123552.png]]

<mark style="background: #04FF00A6;">Partitioning</mark>
- Stores data with tunable consistency in partitions across a cluster
- Each partition represents a set of rows
- The partitioning algorithm is set at cluster level
- Partition key is set at table level

### <mark style="background: #04FF00A6;">Consistency Levels</mark>

Consistency indicates how recent and in-sync all replicas of a row of data are.  

With the replication of data across the distributed system, achieving data consistency is a very complicated task.  

Cassandra prefers availability over consistency.  

It doesn't optimize for consistency.  

Instead, it provides the flexibility to tune the consistency depending on your use case.  

In most use cases, Cassandra relies on eventual consistency.

### <mark style="background: #04FF00A6;">Consistency Levels - Write</mark>

The consistency level specifies how many replica nodes must acknowledge back before the coordinator successfully reports back to the client.  

Can be set to a particular number, LOCAL or QUORUM  

<mark style="background: #04FF00A6;">Example:</mark>
- Consistency level ONE means it needs acknowledgment from only one replica node. 
- The consistency level of LOCAL or QUORUM means it needs acknowledgment from 51% or a majority of replica nodes across all datacentres.

The number of nodes that acknowledge (for a given consistency level) and the number of nodes storing replicas (for a given RF) are mostly different.  

For example, with the consistency level ONE and RF = 3, even though only one replica node acknowledges back for a successful write operation, Cassandra asynchronously replicates the data to 2 other nodes in the background

### <mark style="background: #04FF00A6;">Consistency Levels - Read</mark>

Specifies how many replica nodes must respond with the latest consistent data before the coordinator successfully sends the data back to the client.  

<mark style="background: #04FF00A6;">Example:</mark>
- The consistency level ONE means only one replica node returns the data.  
- The consistency level ALL or QUORUM  
- Means 51% or a majority of replica nodes across all datacenters responds.  
- Then the coordinator returns the data to the client.  
- In the case of multiple data centres, the latency of inter-data centre communication results in a slow read

### <mark style="background: #04FF00A6;">Eventual Consistency V Strong Consistency</mark>

<mark style="background: #04FF00A6;">Cassandra defaults to Eventual consistency:</mark> the value for a specific data item will, given enough time without updates, be consistent across all nodes  

<mark style="background: #04FF00A6;">Cassandra can achieve Strong Consistency:</mark>  
- If W + R > RF, where R – read CL replica count, W – write CL replica count, RF – replication factor.  
- Example  
- If RF = 3, W = QUORUM or LOCAL_QUORUM, R = QUORUM or LOCAL_QUORUM, then W (2) + R (2) > RF (3)  
- The write operation makes sure two replicas have the latest data.  
- Then the read operation also makes sure it receives the data successfully only if at least two replicas respond with consistent latest data.

### <mark style="background: #04FF00A6;">Partitioning</mark>

![[Pasted image 20251121124147.png]]

A primary key represents a unique data partition and data arrangement within a partition.  

The optional clustering columns handle the data arrangement  
part.  

A unique partition key represents a set of rows in a table  which are managed within a server (including all servers managing its replicas).  

```
Primary Key = Partition Key + [Clustering Columns]
```

### <mark style="background: #04FF00A6;">Partitioning Cassandraexample.cql</mark> 

```cql
CREATE TABLE guest_interactions (  
	log_hour timestamp,  
	location text,  
	guest_id text,  
	interaction_type text,  
	message text,  
	PRIMARY KEY ((log_hour, location), guest_id, interaction_type)) WITH CLUSTERING ORDER BY (guest_id ASC, interaction_type DESC);
```  

<mark style="background: #04FF00A6;">Partition Key:</mark> ``log_hour`` and location is the partition key, meaning data will be ``storedin`` partitions determined by the timestamp and location.  

<mark style="background: #04FF00A6;">Clustering Columns:</mark> ``guest_id`` and ``interaction_type`` are the clustering columns. This means data within each partition will be organised by these columns.  

<mark style="background: #04FF00A6;">Clustering Order:</mark>  
- <mark style="background: #04FF00A6;">guest_id ASC:</mark> This specifies that the records will be sorted in ascending order by ``guest_id`` within each partition.  
- <mark style="background: #04FF00A6;">interaction_type DESC:</mark> This specifies that within the same ``guest_id``, records will be sorted in descending order by ``interaction_type``.

```bash
nodetool tablestats keyspace_name.table_name 
# e.g 
docker –exec –it cassandra1 nodetool tablestats hotel.guest_interactions
``` 

This will allow you to check the number of  
partitions that exist.

Read and write operations are performed using a partition  
key on a table.  

Cassandra uses ‘tokens’ (a long value out of range -2^63 to +2^63 -1) for data distribution and indexing.  

The tokens are mapped to the partition keys using a ‘partitioner’.  

Cassandra uses a partition key to determine which node store data on and where to find data when it’s needed

### <mark style="background: #04FF00A6;">Partitioner</mark>

The partitioner applies a partitioning function to convert any given partition key to a token.  

Each node in a Cassandra cluster owns a set of data partitions using this token mechanism.  

The data is then indexed on each node with the help of the partition key

![[Pasted image 20251121124727.png]]

 A partition key for a table should be designed to satisfy its access pattern and with the ideal amount of data to fit into partitions.  

<mark style="background: #04FF00A6;">A partition key should not allow ‘unbounded partitions’:</mark>
- An unbounded partition grows indefinitely in size as time passes.  
- In the server_logs table example, if the server column is used as a partition key it will create unbounded partitions as logs for a server will increase with time.  
- The time attribute of ``log_hour`` puts a bound on each partition to accommodate an hour worth of data

<mark style="background: #04FF00A6;">A partition key should not create partition skew, in order to avoid uneven partitions and hotspots.</mark>
- A partition skew is a condition in which there is more data assigned to a partition as compared to other partitions and the partition grows indefinitely over time.  
- In the ``server_logs`` table example, if the partition key is server and if one server generates way more logs than other servers, it will create a skew.  
- Can be avoided by introducing some other attribute from the table in the partition key so that all partitions get even data.  
- If you can’t use a real attribute to remove skew create a dummy column and include in to the partition key.  
- This dummy column will then distinguish partitions and it can be controlled from an application without disturbing the data semantics

### <mark style="background: #04FF00A6;">Example</mark>

The company table is split into partitions using the partition key company_name and distributed across the nodes.  

Notice that Cassandra groups the rows with the same ``company_name`` value and stores them on the same physical partition on the disk.  

Therefore, we can read all the data for a given company with minimal I/O cost.

![[Pasted image 20251121124936.png]]

![[Pasted image 20251121124946.png]]

### <mark style="background: #04FF00A6;">Hash Partitioning</mark>

Cassandra uses a <mark style="background: #04FF00A6;">Partitioner</mark> (default: <mark style="background: #04FF00A6;">Murmur3Partitioner</mark>) to hash the partition key into a token. This determines <mark style="background: #04FF00A6;">which node</mark> stores the data.  

<mark style="background: #04FF00A6;">You cannot disable hashing</mark>. All partitioning in Cassandra is ultimately <mark style="background: #04FF00A6;">hash-based</mark>.  

<mark style="background: #04FF00A6;">Implications:</mark>  
- Prevents hotspots  
- Enforces uniform distribution  
- But makes true range scans across partitions <mark style="background: #04FF00A6;">impossible</mark> (must scan all partitions)

### <mark style="background: #04FF00A6;">List Style Partitioning</mark>

Although Cassandra physically hashes the key, you can <mark style="background: #04FF00A6;">logically partition</mark> data using enumerated values:  

<mark style="background: #04FF00A6;">Example table:</mark>  
- PRIMARY KEY ((programme), student_id)  
- Examples of logical partitions:  
- programme = 'TU856'  
- programme = 'TU857'  
- programme = 'TU858'  

<mark style="background: #04FF00A6;">Characteristics:</mark>
- The partition key groups data into <mark style="background: #04FF00A6;">logical units</mark> like “one per department” or “one per region”.  
- Reads are fast <mark style="background: #04FF00A6;">within the partition</mark>, but Cassandra <mark style="background: #04FF00A6;">does not maintain category ordering across partitions</mark>.  

<mark style="background: #04FF00A6;">Risks:</mark> If some values dominate (“TU857 has 100× more students”), partition becomes a <mark style="background: #04FF00A6;">hot partition</mark>.

### <mark style="background: #04FF00A6;">Range Style Partitioning</mark>  

Cassandra can<mark style="background: #04FF00A6;">not perform range scans across partitions</mark>, but you can use clustering columns to get:  
- Range queries <mark style="background: #04FF00A6;">within a single partition</mark>  
- Sorted storage by clustering key  

```cql
PRIMARY KEY ((device_id), timestamp)  
SELECT * FROM sensor_data  
WHERE device_id = 'D100'  
AND timestamp >= '2025-01-01'  
AND timestamp <= '2025-01-02’;
```  

<mark style="background: #04FF00A6;">Use case:</mark> 
- Time-series per entity  
- Logs per user/device/session

Range queries must include the <mark style="background: #04FF00A6;">partition key</mark>.  

<mark style="background: #04FF00A6;">Cannot execute:</mark>  
```cql
SELECT * FROM sensor_data WHERE timestamp > '2025-01-01';
```