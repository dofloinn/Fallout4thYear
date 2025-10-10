Apache Cassandra is a wide-column NOSQL Database

<mark style="background: #04FF00A6;">What happens when your relational database can’t keep up?</mark>
- Billions of users
- Always-on availability
- Geo-distributed data

![[Pasted image 20251010103450.png]]

### <mark style="background: #04FF00A6;">Apache Cassandra At A Glance</mark>

<mark style="background: #04FF00A6;">Distributed:</mark> Cassandra can run on multiple machines (nodes) while appearing to users as a unified whole.  

<mark style="background: #04FF00A6;">Cluster:</mark> Multiple nodes can be organized logically into a cluster, or "ring".  

<mark style="background: #04FF00A6;">Node:</mark> A node represents a single instance of Cassandra.

![[Pasted image 20251010103540.png]]

<mark style="background: #04FF00A6;">Replication:</mark>
- Cassandra has a <mark style="background: #04FF00A6;">leaderless</mark> architecture  
- Any node in the database can provide the exact same functionality as any other node  
- This contributes to Cassandra’s robustness and resilience.  
- These nodes communicate with one another through a protocol called <mark style="background: #04FF00A6;">gossip</mark> - a process of computer peer-to-peer communication.

<mark style="background: #04FF00A6;">Wide column store:</mark>
- Stores data in tables with rows and columns  
- Stores data across a <mark style="background: #04FF00A6;">cluster</mark> of nodes  
- <mark style="background: #04FF00A6;">High write throughput</mark>  
- <mark style="background: #04FF00A6;">Tuneable consistency:</mark> You can choose how consistent your reads and writes are  
- You balance speed, availability, and accuracy to fit your application’s needs.  
- You decide how many replicas (copies of your data) must acknowledge a read or write before it’s considered successful

<mark style="background: #04FF00A6;">Cassandra query language shell (cqlsh):</mark> Facilitates users to communicate with it.  

<mark style="background: #04FF00A6;">CQL (Cassandra Query Language):</mark> Used to query the data stored in tables

### <mark style="background: #04FF00A6;">Query Driven Modelling:</mark>

<mark style="background: #04FF00A6;">Concept:</mark> 
- Design for your needs not for your writes  
- Design tables based on queries, not on normalisation.  
- Data access patterns and application queries determine the structure and organization of data -> design of the tables  
- Each query is backed by a table

<mark style="background: #04FF00A6;">Example:</mark>
- Relational: student + subject + enrollment (joins)  
- Cassandra: ``student_subject_results`` (all in one row)  

### <mark style="background: #04FF00A6;">Normalisation Driven Modelling:</mark>

Design tables based on avoiding data duplication.  

<mark style="background: #04FF00A6;">Example:</mark>  
- Relational: student + subject + enrollment (joins)  
- To find a student’s results:  

```sql
SELECT s.name, sub.subject_name, e.grade  
FROM student s  
JOIN enrollment e ON s.student_id = e.student_id  
JOIN subject sub ON e.subject_id = sub.subject_id;
```

![[Pasted image 20251010104130.png]]

### <mark style="background: #04FF00A6;">Query Driven Modelling:</mark> 

Design tables based on queries/data access needed, not on normalisation (duplication is ok).  

Example:  
- Cassandra: student_subject_results (all in one row)  
- To find a student’s results:  

```sql
SELECT * FROM  
student_subject_results WHERE  
student_id = 1;
```

![[Pasted image 20251010104240.png]]

### <mark style="background: #04FF00A6;">Query Driven Modelling v Normalisation Driven Modelling</mark>  

<mark style="background: #04FF00A6;">Query Driven:</mark> More writes (denormalization) → fewer joins or lookups during reads → faster reads.  

<mark style="background: #04FF00A6;">Normalisation Driven:</mark> Fewer writes (normalized schema) → more complex reads → slower performance

### <mark style="background: #04FF00A6;">Cassandra Query Driven Modelling</mark>  

<mark style="background: #04FF00A6;">Joins are not supported:</mark> All required fields (columns) must be grouped together in a single table  

<mark style="background: #04FF00A6;">Data is duplicated across multiple tables using denormalisation:</mark> Duplication plus a high write throughput are used to achieve a high read performance

### <mark style="background: #04FF00A6;">Cassandra Data model</mark>

Cassandra data model consists of <mark style="background: #04FF00A6;">Keyspaces</mark> at the highest level.  

<mark style="background: #04FF00A6;">Keyspaces are the containers of data:</mark> Similar in concept to the schema or database in a relational database.  

Typically, keyspaces contain many tables.

![[Pasted image 20251010104646.png]]


<mark style="background: #04FF00A6;">Columns</mark> define the structure of data in a table.  

Each column has an associated type - E.g. integer, text, double, and Boolean.

<mark style="background: #04FF00A6;">The tables are defined within the keyspaces:</mark> Table used to be known as a column family  

<mark style="background: #04FF00A6;">Tables contain:</mark>
- a set of <mark style="background: #04FF00A6;">columns</mark>  
- and a <mark style="background: #04FF00A6;">primary key</mark>  
- and they store data in a set of <mark style="background: #04FF00A6;">rows</mark>.

### <mark style="background: #04FF00A6;">Cassandra Data Model Primary Key</mark>

Consists of one or more PARTITION keys PLUS zero or more CLUSTERING KEY components  

<mark style="background: #04FF00A6;">Partition key:</mark>
- Goal of a partition key is to distribute the data evenly across a cluster and query the data efficiently  
- A partition key determines where to place the data and uniquely identifies the data  
- It is always the first value in the primary key definition.  

<mark style="background: #04FF00A6;">Clustering column:</mark> Orders the data within a partition

### <mark style="background: #04FF00A6;">Cassandra Data Model - Goals</mark>

Spread Data Evenly Around the Cluster  

You want an equal amount of data on each node of Cassandra Cluster.  

Data is spread to different nodes based on partition keys that is the first part of the primary key: Try to choose integers as a primary key for spreading data evenly around the cluster.

![[Pasted image 20251010104936.png]]

### <mark style="background: #04FF00A6;">Partitions:</mark>

Cassandra is a distributed database that stores data across a cluster of nodes.  

Cassandra <mark style="background: #04FF00A6;">partitions</mark> (divides) data over the storage nodes using a variant of consistent hashing for data distribution  
- Hashing is a technique used to map data  
- Given a key, a hash function generates a hash value (or simply a hash) that is stored in a hash table.

![[Pasted image 20251010114300.png]]

<mark style="background: #04FF00A6;">A partition key is used to partition data among the nodes:</mark>
- A <mark style="background: #04FF00A6;">partition key</mark> is generated from the <mark style="background: #04FF00A6;">first field of a primary key</mark>.  
- This facilitates a faster lookup.  
- The fewer partitions used for a query faster is the response time for the query.

### <mark style="background: #04FF00A6;">Cassandra Data Model – Simple Example </mark>

Cassandra will use a consistent hashing technique to generate the hash value of the partition key (``app_name``) and assign the row data to a partition range inside a node.

![[Pasted image 20251010115451.png]]
![[Pasted image 20251010114540.png]]

<mark style="background: #04FF00A6;">Possible arrangement:</mark>
- The hash values of app1, app2, and app3 resulted in each row being stored in three different nodes  
- Node1, Node2, and Node3, respectively

![[Pasted image 20251010114739.png]]


### <mark style="background: #04FF00A6;">Cassandra Data model – Retrieval</mark>  

With a partition key in where clause, Cassandra uses the consistent hashing technique to identify the exact node and the exact partition range within a node in the cluster.  

As a result, the fetch data query is fast and efficient:  

```sql
select * from application_logs 
where app_name = 'app1';
```

### <mark style="background: #04FF00A6;">Cassandra Data Model – Simple Example:</mark> 

<mark style="background: #04FF00A6;">Composite Primary Key:</mark>
- Note in this definition the inner parenthesis around ``app_name`` and env primary key definition. 
- This inner parenthesis specifies that ``app_name`` and env are part of a partition key and are not clustering keys  
- If you just have a single parenthesis then ``app_name`` will be the partition key and env will be the clustering column

![[Pasted image 20251010115821.png]]

![[Pasted image 20251010115916.png]]

This scenario shows how the hash value of app1:prod, app1:dev, app1:qa resulted in these three rows being stored in three separate nodes — Node1, Node2, and Node3, respectively.  
- App1 logs from the prod environment go to Node1  
- App1 logs from the dev environment go to Node2  
- App1 logs from the qa environment go to Node3.

To efficiently retrieve data, the where clause in fetch query must contain all the composite partition keys in the same order as specified in the primary key definition:  

```sql
select * from application_logs where app_name = 'app1' and env = 'prod';
```

### <mark style="background: #04FF00A6;">Cassandra Data Model – Clustering Key:</mark>

Clustering is a storage engine process of sorting the data within a partition and is based on the columns defined as the clustering keys.  

All the data within a partition is stored in continuous storage, sorted by clustering key columns.  

As a result, the retrieval of the desired sorted data is very efficient.  

Identification of the clustering key columns needs to be done upfront  

The selection of clustering key columns depends on how we want to use the data in our application.

![[Pasted image 20251010120134.png]]

### <mark style="background: #04FF00A6;">Cassandra Data Model – Clustering Key Simple Example:</mark>

![[Pasted image 20251010120226.png]]#

The hostname and the ``log_datetime`` are included as clustering key columns.  

Assuming all the logs from app1 and prod environment are stored in Node1 the Cassandra storage engine lexically sorts those logs by the hostname and the ``log_datetime`` within the partition.

![[Pasted image 20251010120310.png]]

By default, the Cassandra storage engine sorts the data in ascending order of clustering key columns  

But we can control the clustering columns' sort order by using WITH CLUSTERING ORDER BY clause in the table definition  

Based on this definition the Cassandra storage engine will store all logs in the lexical ascending order of hostname, but in <mark style="background: #04FF00A6;">descending</mark> order of ``log_datetime`` within each hostname group.

![[Pasted image 20251010120628.png]]

```sql
select * from application_logs  
where app_name = 'app1' and env = 'prod' and hostname = 'host1' and log_datetime > '2021-08-13T00:00:00';
```  

The <mark style="background: #04FF00A6;">where</mark> clause should contain the columns in the same order as defined in the primary key clause.

### <mark style="background: #04FF00A6;">Cassandra Data Model - Rules</mark> 

Writes are not expensive  

Joins are not supported  

Group by, OR clause, aggregations are not supported  

You need to store your data in such a way that it should be completely retrievable.

### <mark style="background: #04FF00A6;">Cassandra Data Model - Rules:</mark>

Keep the rules in mind when modelling your data  

Maximise the number of writes for better read performance and data availability.  

Store data in the way you expect to read it — even if that means writing it multiple times in different tables.  

<mark style="background: #04FF00A6;">There is a tradeoff between data write and data read:</mark>
- Writes are cheap  
- Data is first written to an in-memory structure (the memtable) and an append-only commit log, so inserts and updates are very fast.  
- Reads can be expensive if data is spread across many partitions or tables.  
- Optimize your data read performance by maximizing the number of data writes.  

<mark style="background: #04FF00A6;">Summary:</mark>  
- To make reads fast, you design your tables for each query pattern 
- Even if it means writing the same data in several places.

Keep the rules in mind when modelling your data.  

<mark style="background: #04FF00A6;">Maximise data duplication:</mark>
- Data denormalization and data duplication are defacto of Cassandra.  
- Disk space is not more expensive than memory, CPU processing and IOs operation.  
- Cassandra is a distributed database, so data duplication provides instant data availability and no single point of failure.

### <mark style="background: #04FF00A6;">Example:</mark>

<mark style="background: #04FF00A6;">Let’s say you need to query::</mark>
- All orders by customer  
- All orders by product  

<mark style="background: #04FF00A6;">In a relational database, you’d have:</mark>
- one orders table and a customer table and a product table 
- Orders by customer: SELECT query using joins (with indexes).  
- Orders by product: SELECT query using joins (with indexes).  

<mark style="background: #04FF00A6;">In Cassandra, you’d create two tables:</mark>  
- orders_by_customer  
- orders_by_product  

Each stores the same data but organized differently. When you query, Cassandra reads from exactly one partition -very fast.

### <mark style="background: #04FF00A6;">Cassandra Data Model – Summary</mark>

Uses a partition key or a composite partition key to determine the placement of the data in a cluster.  

The clustering key provides the sort order of the data stored within a partition.  

All of these keys also uniquely identify the data

### <mark style="background: #04FF00A6;">Creating a Keyspace:</mark>

Keyspace is an object that is used to hold column families, user defined types.  

A keyspace is like RDBMS database which contains column families, indexes, user defined types, data centre awareness, strategy used in keyspace, replication factor, etc  

```sql
CREATE KEYSPACE <identifier> WITH <properties>  

Create keyspace KeyspaceName with replicat on={'class':strategy name, 'replication_factor': No of replications on different nodes}
```

### <mark style="background: #04FF00A6;">Keyspace:</mark>

<mark style="background: #04FF00A6;">Replication Factor:</mark>
- The number of replicas of data placed on different nodes.  
- A replication factor more 2 is good to attain no single point of failure.  
- 3 is good replication factor  

```sql
CREATE KEYSPACE example  
WITH replication = {'class':'SimpleStrateg  
y', 'replication_factor' : 3};
```

<mark style="background: #04FF00A6;">Strategy:</mark>
- There are two types of strategy declaration in Cassandra syntax:  
- <mark style="background: #04FF00A6;">Simple Strategy:</mark> Used in the case of one data centre. In this strategy, the first replica is placed on the selected node and the remaining nodes are placed in clockwise direction in the ring without considering rack or node location.  
- <mark style="background: #04FF00A6;">Network Topology Strategy:</mark> Used in the case of more than one data centres. In this strategy, you have to provide replication factor for each data centre separately.

To use a keyspace you have to use the USE command.  
```cql
USE <identifier>
```

```CQL
CREATE TABLE tablename(  
column1 name datatype PRIMARYKEY,  
column2 name data type,  
column3 name data type.  
)
```

<mark style="background: #04FF00A6;">Declaring primary keys:</mark> 
- Primary key (ColumnName)  
- Primary key(ColumnName1,ColumnName2 . . .)

### <mark style="background: #04FF00A6;">Creating Data</mark>

```CQL
INSERT INTO <tablename> (<column1 name>, <column2 name>....)  
VALUES (<value1>, <value2>....)  
USING <option>  

Example:  

INSERT INTO student (student_id, student_fees, student_name)  
VALUES(1,5000, 'Ajeet');  
INSERT INTO student (student_id, student_fees, student_name)  
VALUES(2,3000, 'Kanchan');  
INSERT INTO student (student_id, student_fees, student_name)  
VALUES(3, 2000, 'Shivani');
```

### <mark style="background: #04FF00A6;">Reading Data</mark>

```CQL
SELECT FROM <tablename>  
Example:  
SELECT student_id, student_name FROM  
student;  
SELECT * FROM student WHERE student_id=2;
```


### <mark style="background: #04FF00A6;">Updating Data</mark>

```CQL
UPDATE <tablename>  
SET <column name> = <new value>  
<column name> = <value>....  
WHERE <condition>  

Update KeyspaceName.TableName  
Set ColumnName1=new Column1Value,  
	ColumnName2=new Column2Value,  
	ColumnName3=new Column3Value,

Example:  
UPDATE student SET  
student_fees=10000,student_name='Rahul'  
WHERE student_id=2;
```

### <mark style="background: #04FF00A6;">Deleting Data</mark>

```CQL
DELETE FROM <identifier> WHERE <condition>;  

Example:  
DELETE FROM student 
WHERE student_id=3;
```

### <mark style="background: #04FF00A6;">Cassandra Architecture</mark>

![[Pasted image 20251010122512.png]]

<mark style="background: #04FF00A6;">Node:</mark> A Cassandra node is a place where data is stored.  

<mark style="background: #04FF00A6;">Data centre:</mark> Data centre is a collection of related nodes.  

<mark style="background: #04FF00A6;">Cluster:</mark> A cluster is a component which contains one or more data centres.  

<mark style="background: #04FF00A6;">Commit log:</mark>
- The commit log is a crash-recovery mechanism.  
- Every write operation is written to the commit log.

<mark style="background: #04FF00A6;">Mem-table:</mark> 
- A mem-table is a memory-resident data structure.  
- After commit log, the data will be written to the mem-table.
- Sometimes, for a single-column family, there will be multiple mem-tables.  

<mark style="background: #04FF00A6;">SSTable:</mark> A disk file to which the data is flushed from the mem-table when its contents reach a threshold value.

<mark style="background: #04FF00A6;">Bloom Filter:</mark>
- Cassandra merges data on disk (in SSTables) with data in RAM (in memtables).  
- To avoid checking every SSTable data file for the partition being requested, Cassandra employs a data structure known as a Bloom filter.

<mark style="background: #04FF00A6;">Bloom Filter:</mark>
- A probabilistic data structure that allows Cassandra to determine one of two possible states: - 
- The data definitely does not exist in the given file, or  
- The data probably exists in the given file.

### <mark style="background: #04FF00A6;">NoSQL Landscape</mark>

![[Pasted image 20251010122742.png]]
![[Pasted image 20251010122756.png]]
