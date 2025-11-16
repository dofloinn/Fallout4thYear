### <mark style="background: #04FF00A6;">Cassandra Write</mark>

Starts with the immediate logging of a write 

Ending with a write of data to disk  

<mark style="background: #04FF00A6;">Stages:</mark>
- Logging data in the commit log
- Writing data to the memtable
- Flushing data from the memtable
- Storing data on disk in SSTables  

### <mark style="background: #04FF00A6;">Write Operations</mark>  

Every write activity of nodes is captured by the commit logs written in the nodes.  

Data will also be captured and stored in the mem-table.

![[Pasted image 20251116210947.png]]

All writes in Cassandra are <mark style="background: #04FF00A6;">durable</mark>.  

All writes to a replica node are recorded both in memory and in a commit log on disk before they are acknowledged as a success.  

Writes to the commit log survive permanently even if power fails on a node.

Write durability can be controlled when you set up a keyspace.  

You can instruct Cassandra whether to use the commit log. The default is that write durability is set to TRUE.

When the memtable is full, Cassandra writes the data to disk in SSTables. In the memtable-sorted order.  

A partition index is also created on the disk that maps the tokens to a location on disk.  

Data in the commit log is purged after its corresponding data in the memtable is flushed to an SSTable on disk

When the memtable content exceeds the configurable threshold or the commitlog space exceeds its total allocation, the memtable is put in a queue that is flushed to disk.  

If the data to be flushed exceeds a set threshold  

Cassandra blocks writes until the next flush succeeds to ensure not data is lost.

Memtables and SSTables are maintained per table.  

The commit log is shared among tables.  

SSTables are immutable, not written to again after the memtable is flushed.  

A partition is typically stored across multiple SSTable files

### <mark style="background: #04FF00A6;">Write Operations for each SSTable Cassandra creates:</mark>  

<mark style="background: #04FF00A6;">Data:</mark> ``(Data.db)`` The SSTable data  

<mark style="background: #04FF00A6;">Primary Index:</mark> ``(Index.db)`` Index of the row keys with pointers to their positions in the data file  

<mark style="background: #04FF00A6;">Bloom filter:</mark> ``(Filter.db)`` A structure stored in memory that checks if row data exists in the memtable before accessing SSTables on disk  

<mark style="background: #04FF00A6;">SSTable Index Summary:</mark> ``(SUMMARY.db)`` A sample of the partition index stored in memory  

<mark style="background: #04FF00A6;">SSTable Table of Contents</mark> ``(TOC.txt)`` A file that stores the list of all components for the SSTable TOC  

<mark style="background: #04FF00A6;">Secondary Index:</mark> ``(SI_.*.db)`` Built-in secondary index. Multiple SIs may exist per SSTable  

<mark style="background: #04FF00A6;">Compression Information:</mark> ``(CompressionInfo.db)`` A file holding information about uncompressed data length, chunk offsets and other compression information  

<mark style="background: #04FF00A6;">Statistics:</mark> ``(Statistics.db)`` Statistical metadata about the content of the SSTable  

<mark style="background: #04FF00A6;">Digest:</mark> ``(Digest.crc32, Digest.adler32, Digest.sha1)`` A file holding adler32 checksum of the data file – used to verify the integrity of data during transmission  

<mark style="background: #04FF00A6;">CRC:</mark> ``(CRC.db)`` A file holding the CRC32 for chunks in an uncompressed file.

### <mark style="background: #04FF00A6;">SSTables</mark>

Data files are stored in a data directory set up at install  

<mark style="background: #04FF00A6;">For each keyspace, a directory within the data directory stores each table:</mark> 
- E.g. /data/data/ks1/cf1-5be396077b811e3a3ab9dc4b9ac088d/la-1-big-Data.db represents a data file
- ks1 represents the keyspace name to distinguish the keyspace for streaming or bulk loading data.
- A hexadecimal string, 5be396077b811e3a3ab9dc4b9ac088d, is appended to table names to represent unique table IDs.

### <mark style="background: #04FF00A6;">Read</mark>  

Cassandra must combine results from the active memtable and potentially multiple SSTables.  

<mark style="background: #04FF00A6;">Process starts with memtables and ends with SSTables:</mark>  
- Check the memtable
- Check row cache, if enabled
- Check Bloom filter  
- Check partition key cache, if enabled
- If a partition key is found in the partition key cache - Goes directly to the compression offset map
- If not checks the partition summary - The partition index is accessed
- Data on disk is located using the compression offset map
- Data is fetched from the SSTable on disk

<mark style="background: #04FF00A6;">Partition Key Cache:</mark>
- Stores a cache of the partition index in off-heap memory.  
- Uses a small, configurable amount of memory, and each "hit" saves one seek during the read operation.  
- If a partition key is found in the key cache can go directly to the compression offset map to find the compressed block on disk that has the data.  

<mark style="background: #04FF00A6;">Partition Summary:</mark>
- Stores a sampling of the partition index.
- A partition index contains all partition keys, whereas a partition summary samples every X keys, and maps the location of every Xth key's location in the index file.
- After finding the range of possible partition key values, the partition index is searched

<mark style="background: #04FF00A6;">Partition Index Cache:</mark>
- Stores an index of all partition keys mapped to their offset
- If the partition summary has been checked for a range of partition keys, the search passes to the partition index to seek the location of the desired partition key.
- A single seek and sequential read of the columns over the passed-in range is performed. 
- Using the information found, the partition index now goes to the compression offset map to find the compressed block on disk that has the data.  

<mark style="background: #04FF00A6;">Compression Offset Map:</mark>
- Stores pointers to the exact location on disk that the desired partition data will be found
- The desired compressed partition data is fetched from the correct SSTable(s) once the compression offset map identifies the disk location

If the memtable has the desired partition data, then the data is read and then merged with the data from the SSTables.  

Reads are fastest when the most in-demand data fits into memory.

![[Pasted image 20251116212445.png]]

<mark style="background: #04FF00A6;">Row Cache:</mark> can provide some improvement for very read-intensive operations, where read operations are 95% of the load.  

Stores a subset of the partition data stored on disk in the SSTables in memory

![[Pasted image 20251116212508.png]]

Bloom Filter

Cassandra checks the Bloom filter to discover which SSTables are likely to have the request partition data.  

<mark style="background: #04FF00A6;">Each SSTable has a Bloom filter associated with it:</mark>
- Can establish that a SSTable does not contain certain partition data.
- Can also find the likelihood that partition data is stored in a SSTable.
- Speeds up the process of partition key lookup by narrowing the pool of keys.  

<mark style="background: #04FF00A6;">Because the Bloom filter is a probabilistic function, it can result in false positives:</mark> 
- Not all SSTables identified by the Bloom filter will have data
- If the Bloom filter does not rule out an SSTable, Cassandra checks the partition key cache

### <mark style="background: #04FF00A6;">Read Operations – Direct Request</mark>

The coordinator sends direct request to one of the replicas.  

After that, the coordinator sends the digest request to the number of replicas specified by the consistency level and checks if the returned data is an updated data.  

After that, the coordinator sends digest requests to all the remaining replicas.  

If any node gives out of date value, a background read repair request will update that data.  

This process is called read <mark style="background: #04FF00A6;">repair</mark> mechanism.

![[Pasted image 20251116212718.png]]

The coordinator first contacts the replicas specified by the consistency level.  

The coordinator sends these requests to the replicas that currently respond the fastest.

The contacted nodes respond with a digest of the requested data; if multiple nodes are contacted, the rows from each replica are compared in memory for consistency.  

If they are not consistent, the replica having the most recent data (based on the timestamp) is used by the coordinator to forward the result back to the client.  

To ensure that all replicas have the most recent version of the data, read repair is carried out to update out-of-date replicas.

Process of repairing replicas during the read process. Happens in background.  

Read repair requests ensure that the requested row is made consistent on all replicas involved in a read query.

### <mark style="background: #04FF00A6;">How the Bloom Filter Works</mark>

<mark style="background: #04FF00A6;">During reads:</mark>  
- When Cassandra receives a read request, it checks the Bloom filters of all SSTables to see which might contain the requested key.
- If the Bloom filter says “definitely not present”, Cassandra skips that SSTable entirely (no disk I/O).
- If it says “might be present”, Cassandra then checks that SSTable's index to confirm.  

<mark style="background: #04FF00A6;">During writes:</mark>  
- When Cassandra writes data to an SSTable, it also updates a Bloom filter for that SSTable.
- Each row key is passed through multiple hash functions, and the resulting bit positions are set to 1 in a fixed-size bit array.

### <mark style="background: #04FF00A6;">How the Bloom Filter Works</mark>

Cassandra uses Bloom filters to <mark style="background: #04FF00A6;">minimise disk lookups during reads</mark> by quickly ruling out SSTables that definitely don't contain a requested key.  

<mark style="background: #04FF00A6;">Efficiency and trade-offs:</mark>  
- Bloom filters are fast and memory-efficient, reducing unnecessary disk reads.
- They can have false positives (say a key might exist when it doesn't), but never false negatives (never miss an existing key).

### <mark style="background: #04FF00A6;">Cassandra Data Types</mark>

<table>
	<tr>
		<td>ascii:</td>
		<td>strings,</td>
		<td>US-ASCII character string.</td>
	</tr>
	<tr>
		<td>bigint:</td>
		<td>integers</td>
		<td>64-bit signed long.</td>
	</tr>
	<tr>
		<td>blob:</td>
		<td>blobs,</td>
		<td>contains arbitrary bytes (no validation) and expressed as hexadecimal.</td>
	</tr>
	<tr>
		<td>boolean:</td>
		<td>booleans,</td>
		<td>either true or false.</td>
	</tr>
	<tr>
		<td>decimal:</td>
		<td>integers and floats,</td>
		<td>variable-precision decimal.</td>
	</tr>
	<tr>
		<td>double:</td>
		<td>double,</td>
		<td>64-bit IEEE-754 floating-point.</td>
	</tr>
	<tr>
		<td>float:</td>
		<td>integers and floats,</td>
		<td>32-bit IEEE-754 floating-point.</td>
	</tr>
	<tr>
		<td>inet:</td>
		<td>strings</td>
		<td>but an IP address string in IPv4 or IPv6 format.</td>
	</tr>
	<tr>
		<td>int:</td>
		<td>integers ,</td>
		<td>a32-bit signed integer</td>
	</tr>
	<tr>
		<td>text:</td>
		<td>text,</td>
		<td>string.</td>
	</tr>
	<tr>
		<td>timestamp:</td>
		<td>integers and strings,</td>
		<td>includes as a date plus time and is encoded as 8 bytes since epoch.</td>
	</tr>
	<tr>
		<td>uuid:</td>
		<td>uuids,</td>
		<td>a UUID in standard UUID format.</td>
	</tr>
	<tr>
		<td>timeuuid:</td>
		<td>timeuuid,</td>
		<td>a type 1 UUID only (CQL 3).</td>
	</tr>
	<tr>
		<td>varchar:</td>
		<td>varchar,</td>
		<td>encoded string.</td>
	</tr>
	<tr>
		<td>varint:</td>
		<td>variant,</td>
		<td>an arbitrary-precision integer.</td>
	</tr>
	<tr>
		<td>counter:</td>
		<td>integers,</td>
		<td>a distributed counter value (64-bit long)</td>
	</tr>
</table>

A special column used to store a number that this changed increments.  

<mark style="background: #04FF00A6;">Restriction on the counter column:</mark>
- Counter column cannot index, delete or re-add a counter column.
- All non-counter columns in the table must be defined as a part of the primary key.
- To load data in a counter column or to increase or decrease the value of the counter, use the update command.

### <mark style="background: #04FF00A6;">Cassandra Collections</mark>

When a user has multiple values against one field in a relational database, it's common to store them in a separate table.  

E.g. if a user has numerous orders, contact information, or postal addresses in an online retail situation we need to apply joins between two tables to retrieve all the data in this case.  

Joins are not allowed in Cassandra but Cassandra provides a way to group and store data together in a column using collection types.

<mark style="background: #04FF00A6;">Map:</mark> A sorted set of key-value pairs, where keys are unique, and the map is sorted by its keys.  

<mark style="background: #04FF00A6;">Sets:</mark> A sorted collection of unique values.  

<mark style="background: #04FF00A6;">Lists:</mark> A sorted collection of non-unique values where elements are ordered by their position in the list

There is one rule for the list data type: The order of the elements cannot be changed.  

After storing the values in the list, the elements get a particular index. 

The values can be retrieved through these indexes.

```cql
CREATE TABLE <table name>(  
column1 PRIMARY KEY,  
column2 list <data type>,  
column3 list <data type>,.....);  
INSERT INTO <table name>(column1, column2,  
column3,....)  
VALUES('R1value1',['R1value1','R1value2','R1va  
lue3'...]['R1value11','R1value12','R1value13'.  
..]...);
```

### <mark style="background: #04FF00A6;">Cassandra Collections - List</mark>

```cql
CREATE TABLE college_student(  
	Snumber int,  
	NAME text,  
	PRIMARY KEY(Snumber),  
	EMAIL LIST<text>  
);  
INSERT INTO college_student (Snumber, NAME,  
EMAIL) 
VALUES(001,'Ayush',['ayush@gmail.com', 'AY@mail.com']);  

INSERT INTO college_student (Snumber, NAME, EMAIL)  
VALUES(002,'Aarav',['aarav@ymail.com',  
'AR@mail.com']);  

INSERT INTO college_student (Snumber, NAME, EMAIL)  
VALUES(003,'Kabir',p'kabir@hotmail.com']);  

Update college_student set email = email + ['data science'] where Name='Ayush';
```

### <mark style="background: #04FF00A6;">Cassandra Collections - Set</mark>

The elements in the set returns in a sorted order after execution.  

```cql
CREATE TABLE<table name> (  
column1 PRIMARY KEY,  
column2 set <data type>,  
column3 set <data type>.....);  
INSERT INTO <table name>(column1, column2, column3...)  
VALUES('R1value',{'R1value1', 'R1value2',..},{ 'R1value11',  
'R1value12',..}....);
```

```cql
CREATE TABLE college_student(  
	SNum int,  
	NAME text,  
	BRANCH SET<text>,  
	PRIMARY KEY(ID)
);  

INSERT INTO college_student (SNum, NAME, BRANCH)  
VALUES(001,'Ayush',{'electrical engineering',  
'computer science'});  

INSERT INTO college_student (SNum, NAME, BRANCH)  
VALUES(002,'Aarav',{'Computer engineering'});  

INSERT INTO college_student (SNum, NAME, BRANCH)  
VALUES(003,'Kabir',{'Applied Physics'});  

Update college_student set branch = branch +  
{'computer science'} where Name='Aarav';
```

### <mark style="background: #04FF00A6;">Cassandra Collections - Map</mark>

Stores a Key+Value Pair  

```cql
CREATE TABLE<table name> (  
column1 PRIMARY KEY,  
column2 map <type, data type>,  
column3 map <type, data type>.....);  
INSERT INTO <table name>(column1, column2, column3...)  
VALUES('R1value',{'R1value1':'R1value1' ,R1value2:'R1value01',..},{  
'R1value11':'R1value011','R1value12':'R1value012',..}....);
```

```cql
CREATE TABLE college_student(  
	Snumber int,  
	SUBJECT MAP<text,text>,  
	PRIMARY KEY(Snumber)
);  

INSERT INTO college_student(Snumber, SUBJECT)  
VALUES(001,{'physics':'mathematics', 'operating  
system': 'linux'})  

INSERT INTO college_student(Snumber, SUBJECT)  
VALUES(002,{'operating system':'windows'})  

INSERT INTO college_student(Snumber, SUBJECT)  
VALUES(003,{'power system':'machines'})  

Update college_student set subject['power  
system'] = 'devices' where Snumber=003;  

Update college_student set subject= system +  
{'pyhsics:mathematics'} where Snumber=003;
```

### <mark style="background: #04FF00A6;">Write Latency</mark>  

The time Cassandra takes to accept and replicate a write request (e.g., an INSERT or UPDATE).  

<mark style="background: #04FF00A6;">Includes:</mark>  
- Writing to the <mark style="background: #04FF00A6;">commit log</mark> (for durability)
- Updating the <mark style="background: #04FF00A6;">memtable</mark> in memory
- Optional replication to other nodes based on the <mark style="background: #04FF00A6;">consistency level</mark>  

<mark style="background: #04FF00A6;">Measured in:</mark> milliseconds (avg or percentile)  

<mark style="background: #04FF00A6;">High write latency can indicate:</mark>  
- Disk I/O bottlenecks
- Slow commit log writes
- Network replication delays

### <mark style="background: #04FF00A6;">Read Latency</mark>

The time Cassandra takes to retrieve data for a read request.  

<mark style="background: #04FF00A6;">Includes:</mark>  
- Looking up data in <mark style="background: #04FF00A6;">memtables</mark> and <mark style="background: #04FF00A6;">SSTables</mark>
- Performing <mark style="background: #04FF00A6;">Bloom filter</mark> and <mark style="background: #04FF00A6;">index lookups</mark>
- Fetching from <mark style="background: #04FF00A6;">replicas</mark> (may contact multiple nodes)
- <mark style="background: #04FF00A6;">Merging results</mark> and returning to the client  

<mark style="background: #04FF00A6;">High read latency can mean:</mark>  
- Too many SSTables (needs compaction)
- Poor data model or inefficient partition keys
- Cache misses or slow disks
- Network delays between replicas

### <mark style="background: #04FF00A6;">Query Latency</mark>

The end-to-end response time of a CQL query as seen by the client.  

<mark style="background: #04FF00A6;">Includes:</mark>  
- Coordinator node processing
- Network round trips to replicas
- Read/write operations on those replicas  

<mark style="background: #04FF00A6;">Measured via:</mark>  
- nodetool proxyhistograms (coordinator latency)
- TRACING ON in CQL (detailed step-by-step timing)

### <mark style="background: #04FF00A6;">Latency Historgrams</mark>  

<mark style="background: #04FF00A6;">Show distributions:</mark>  
- P50, P95, P99 (percentile latencies) for reads and writes.
- Help identify outlier queries or uneven node performance.

### <mark style="background: #04FF00A6;">Cassandra Indexes</mark>
 
Suppose we have the following table:  

```cql
CREATE TABLE employee (  
emp_id int,  
name text ,  
city text,  
PRIMARY KEY ((emp_id), name)  
);
```

<table>
	<tr>
		<th>Component</th>
		<th>Type</th>
		<th>Purpose</th>
	</tr>
	<tr>
		<td>(emp_id)</td>
		<td>Partition Key</td>
		<td>Determines which node in the cluster stores this row. All rows with the same emp_id go to the same partition (same physical location on disk).</td>
	</tr>
	<tr>
		<td>name</td>
		<td>Clustering Key</td>
		<td>Defines the ordering of rows within that partition. Multiple rows with the same emp_id will be sorted by name</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Querying on a non-primary key</mark> 

We cannot query a column that's not part of the primary key.  

Unless we use the ALLOW FILTERING clause.

![[Pasted image 20251116220848.png]]

Even if we technically can, we should not use it in production because ALLOW FILTERING is expensive and time-consuming.  

This is because, in the background, it starts full-table scans across all nodes in the cluster to fetch the results, which has a negative impact on performance.  

<mark style="background: #04FF00A6;">An acceptable use case is when we need to do a lot of filtering on a single partition:</mark>
- In this case, Cassandra still performs a table scan, but we can limit it to a single node
- E.g. ``Select * from employee where name='Mimi' ALLOW FILTERING;``
- Because name is a clustering column it can be used as a condition
- Cassandra uses it to identify the node that holds all the company data. 
- Consequently, it performs a table scan just on the table data on that specific node

### <mark style="background: #04FF00A6;">Cassandra Secondary Indexing</mark> 

Provides a means to access data in Cassandra using attributes other than the partition key.  

Improves speed and efficiency of data lookup when matching a given condition.  

The index indexes column values in a separate, hidden table from the one that contains the values being indexed.  

Indexes can be used for collections, collection columns, and any other columns except counter columns and static columns.

### <mark style="background: #04FF00A6;">Regular Secondary Index</mark> 

Most basic index that can be defined for executing queries on non-primary key columns.  

```cql
CREATE INDEX IF NOT EXISTS ON employee (city);
```  

A query using city can now run without any errors or need to use allow filtering:  

```cql
SELECT * FROM employee WHERE city='Cork';
```

![[Pasted image 20251116221138.png]]

Cassandra creates a hidden table for storing the index data in the background.  

Cassandra doesn't distribute the hidden index table using the cluster-wide partitioner.  

The index data is co-located with the source data on the same nodes.  

<mark style="background: #04FF00A6;">Why?</mark> 
- Reduces latency
- Plus the index is updated locally avoids losing updates due to connectivity

When executing a search query using the secondary index, Cassandra reads the indexed data from every node and collects all the results.  

If our cluster has many nodes, this can lead to increased data transfer and high latency.

When data is written to (insert into) a table with a secondary index attached:  
- Cassandra writes to both the index and the base Memtable.
- Both are flushed to the SSTables simultaneously.
- The index data will have a separate lifecycle than the source data.  

<mark style="background: #04FF00A6;">When data is read based on the secondary index (select from):</mark>  
- Cassandra first retrieves the primary keys for all matching rows in the index. 
- It then uses them to fetch all the data from the source table.

### <mark style="background: #04FF00A6;">Using Tracing to Monitor Performance</mark>  

```cql
-- Enable tracing and run a query  
TRACING ON;  
SELECT * FROM employee WHERE city='Cork';  
TRACING OFF;  
-- Retrieve trace summary  
SELECT session_id, duration, coordinator, request,  
started_at  
FROM system_traces.sessions  
WHERE session_id = <your trace id>;  
-- Retrieve detailed event breakdown  
SELECT activity, source_elapsed, thread  
FROM system_traces.events  
WHERE session_id = <trace_id>;
```

<table>
	<tr>
		<th>Column</th>
		<th>Meaning</th>
		<th>Interpretation</th>
	</tr>
	<tr>
		<th>duration</th>
		<td>The total time (in microseconds) the query took to complete.</td>
		<td>86103 μs ≈ 86 milliseconds – that’s how long the coordinator node took from start to finish processing your CQL query (including replica reads/writes and response).</td>
	</tr>
	<tr>
		<th>coordinator</th>
		<td>The IP address of the coordinator node handling the query.</td>
		<td>172.28.0.4 — this is the internal IP of the Cassandra node inside your Docker network that coordinated the query.</td>
	</tr>
	<tr>
		<th>request</th>
		<td>The type of operation being traced.</td>
		<td>Execute CQL3 query — means you executed a normal CQL statement (e.g., a SELECT, INSERT, etc.).</td>
	</tr>
	<tr>
		<th>started_at</th>
		<td>The timestamp when the traced query began, including timezone.</td>
		<td>2025-11-11 13:13:45.535000+0000 — UTC time the query started.</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Using Tracing to Monitor Performance</mark>

```cql
-- With index  
CREATE INDEX IF NOT EXISTS ON employee (city);  
TRACING ON;  
SELECT * FROM employee WHERE city='Cork' ALLOW FILTERING;  
TRACING OFF;  
-- Retrieve trace summary  
SELECT session_id, duration, coordinator, request, started_at  
FROM system_traces.sessions  
WHERE session_id = <your trace id>;  
-- Retrieve detailed event breakdown  
SELECT activity, source_elapsed, thread  
FROM system_traces.events  
WHERE session_id = <trace_id>;
```

### <mark style="background: #04FF00A6;">Prepared Statements</mark>

A statement that has been 'prepared' by the Cassandra database.  

A ‘parameterised’ query.  

Has been pre-parsed and validated by the database.  

Can be executed once concrete values have been provided for the bind variables (to make a bound statement).  

Also allows you to define default values for properties such as the Consistency level or tracing.  

These default values are used in any bound statement created from the prepared statement.  

<mark style="background: #04FF00A6;">Note:</mark> Can’t do this directly in ``CQLSh`` you need to use a driver and usually do this programmatically

![[Pasted image 20251116221957.png]]

### <mark style="background: #04FF00A6;">Prepared Statements Benefits</mark>

Remove compilation overhead when the query is executed -compiled once not every time.  

<mark style="background: #04FF00A6;">Reduces Network Traffic:</mark>
- Reduces the amount of data that needs to be sent
- You only need to send the query parameters along with a small identifier for the prepared statement to the server.
- More efficient than sending the query string.  

<mark style="background: #04FF00A6;">Caching:</mark>  
- Cassandra maintains a query plan cache for prepared statements.
- When a prepared statement is executed, the query plan is cached on the server side.
- Subsequent executions of the same prepared statement reuse the cached query plan, avoiding the need to generate a new plan. 
- This further improves performance by eliminating the need to recalculate the execution plan for frequently executed queries.

### <mark style="background: #04FF00A6;">Prepared Statements Benefits</mark>

<mark style="background: #04FF00A6;">Improves security:</mark>  
- Help prevent SQL injection attacks by separating the query structure from the user input.
- Parameters are treated as data not as executable parts of the query reducing the risk of injection attack.

<mark style="background: #04FF00A6;">Consistency in Query Execution:</mark>  
- The use of parameterized queries helps in standardizing the structure of queries
- Reduces the likelihood of syntax errors and ensuring that queries are executed in a consistent manner.

### <mark style="background: #04FF00A6;">Nodetool</mark>

How to execute e.g. 

``docker exec -it cassandra nodetool status``

<table>
	<tr>
		<th>Command</th>
		<th>Description</th>
	<tr>
	<tr>
		<td>nodetool status</td>
		<td>Shows cluster and node health, datacenter, and load.</td>
	</tr>
	<tr>
		<td>nodetool tablestats</td>
		<td>Displays statistics for all tables (row count, disk usage, SSTables, etc.).</td>
	</tr>
	<tr>
		<td>nodetool tablestats advanceddb.factmarks</td>
		<td>Focuses on a single table’s metrics (read/write latency, SSTables).</td>
	</tr>
	<tr>
		<td>nodetool tablehistograms</td>
		<td>Shows per-table read/write latency histograms. </td>
	</tr>
	<tr>
		<td>nodetool tablehistograms advanceddb.factmarks</td>
		<td>Focuses on a single table’s histograms.</td>
	</tr>
</table>

<table>
	<tr>
		<th>Metric</th>
		<th>What It Measures</th>
		<th>Typical Source</th>
		<th>Indicates Problems Like</th>
	</tr>
	<tr>
		<th>Write Latency Time</th>
		<td>to persist a write nodetool tablestats Disk I/O, replication delay</td>
		<td>Read Latency Time to retrieve data nodetool tablestats Too many SSTables, cache misses</td>
	</tr>
	<tr>
		<th>Query Latency</th>
		<td>Full query round-trip time</td>
		<td>TRACING ON, nodetool proxyhistograms</td>
		<td>Slow replicas, bad data model</td>
	</tr>
	<tr>
		<th>Histogram Percentiles</th>
		<td>Distribution of latencies</td>
		<td>nodetool tablehistograms</td>
		<td>Outlier or inconsistent nodes</td>
	</tr>
</table>
