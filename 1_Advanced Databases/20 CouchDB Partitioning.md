### <mark style="background: #04FF00A6;">Basics</mark>

<mark style="background: #04FF00A6;">Partitioned Database:</mark> Indicated on creation  

Form documents into logical partitions by using a partition key  

<mark style="background: #04FF00A6;">All documents are assigned to a partition:</mark>
- Many documents are typically given the same partition key.  
- Every document in a partitioned database (except ``_design`` and ``_local documents``) must have the format ``“partitionid:docid”``.  

Secondary indexes can be significantly more efficient when locating matching documents since their entries are contained within their partition. Means a secondary index read will only scan a single partition range instead of having to read from a copy of every shard.

### <mark style="background: #04FF00A6;">Working with partitions</mark>

To create a partitioned database we simply set the parameter when we create the database  

```bash
curl -X PUT  
http://admin:couchdb@127.0.0.1:5984/new_part_db?partitioned=true  
curl http://admin:couchdb@127.0.0.1:5984/new_part_db
```

Information Provided by ``curl http://admin:couchdb@127.0.0.1:5984/new_part_db``:
![[Pasted image 20251121121203.png]]

Information Provided by ``curl http://admin:couchdb@127.0.0.1:5984/new_part_db``
![[Pasted image 20251121121224.png]]

### <mark style="background: #04FF00A6;">Adding a document</mark>  

```json

{ 
	"_id": "TU857:70e3b0f3b6ff1d88d5a0bdb9c9000a7b",  
	"_rev": "1-a8948418cbecc46bcafaa3a385b0fa25",  
	"name": "Fred",  
	"address": { 
		"street": "123 Main St", "city": "City100" 
	},  
	"programme": "TU857",  
	"grade": 23  
}  
PartitionID=TU857
```

### <mark style="background: #04FF00A6;">Retrieving documents from a partition</mark>

<mark style="background: #04FF00A6;">Find out about the partition:</mark> 

http://127.0.0.1:5984/new_part_db/_partition/TU857  
http://127.0.0.1:5984/new_part_db/_partition/TU858  

<mark style="background: #04FF00A6;">List all documents in a partition:</mark>  
http://127.0.0.1:5984/new_part_db/_partition/TU857/_all_docs  
http://127.0.0.1:5984/new_part_db/_partition/TU858/_all_docs/?include_docs=true  

<mark style="background: #04FF00A6;">List and include the documents:</mark>  
http://127.0.0.1:5984/new_part_db/_partition/TU857/_all_docs/?include_docs=true  
http://127.0.0.1:5984/new_part_db/_partition/TU858/_all_docs/?include_docs=true  

(Make sure you have logged into Fauxton first, otherwise you need to add your username:password to the link and cut and paste it into a browser)

### <mark style="background: #04FF00A6;">Partitioned Design documents</mark>

The default for partitioned database  

Require a partition id as a parameter  

We are creating a design document with a map function to return the id and name of a document  

Will only look at documents in that partition given as parameter  

```json
{
	"_id": "_design/partdocs",  
	"views": {  
		"partquery": {  
			"map": "function(doc) {\r\n emit(doc._id, doc.name)\r\n}"  
			}  
		},  
	"language": "javascript",  
	"options": {  
		"partitioned": true  
	}  
}
```

<mark style="background: #04FF00A6;">Executing the view on the query</mark>

http://127.0.0.1:5984/new_part_db/_partition/TU857/_design/partdocs/_view/partquery?include_docs=true  

http://127.0.0.1:5984/new_part_db/_partition/TU858/_design/partdocs/_view/partquery

### <mark style="background: #04FF00A6;">Creating a global query (works across all partitions)</mark>  

```json
{  
	"_id": "_design/globaldocs",  
	"language": "javascript",  
	"options": {  
		"partitioned": false  
	},  
	"views": {  
		"globalview": {  
			"map": "function (doc) {\n emit(doc._id, doc.name);\n}"  
		}  
	}  
}
```

<mark style="background: #04FF00A6;">Executing the view on the query:</mark>
http://127.0.0.1:5984/new_part_db/_design/globaldocs/_view/globalview


### <mark style="background: #04FF00A6;">Range/List/Hash partitioning in CouchDB</mark>  

CouchDB does not explicitly support “range/list/hash partitioning” in the same way as relational systems,  

But the behaviour can be understood in these terms because the <mark style="background: #04FF00A6;">partition key is chosen by the application</mark>  

CouchDB treats each partition as an independent unit of indexing and querying.

### <mark style="background: #04FF00A6;">List Style Partitioning in CouchDB</mark> 

<mark style="background: #04FF00A6;">Equivalent concept:</mark> A fixed set of categories mapped to partitions, each category represented by a partition key.  

<mark style="background: #04FF00A6;">Examples:</mark>
- Partition by country: IE:doc, FR:doc, DE:doc  
- Partition by programme: TU856:doc, TU857:doc, etc.  

<mark style="background: #04FF00A6;">When useful:</mark>  
- When the data naturally falls into <mark style="background: #04FF00A6;">distinct, enumerated groups</mark>  
- When workloads are uneven and some groups need different replication/monitoring  

<mark style="background: #04FF00A6;">Pros:</mark>  
- Very fast scans: views only read that partition’s index  
- Simple to reason about  

<mark style="background: #04FF00A6;">Risk:</mark> Hot partitions if certain categories receive far more reads/writes (e.g., IE: has far more doc updates than CY:)

### <mark style="background: #04FF00A6;">Range Style Partitioning in CouchDB</mark>

Achieved by using <mark style="background: #04FF00A6;">time-based partition keys</mark>

<mark style="background: #04FF00A6;">Examples:</mark>
- Partition per day: 2025-11-18:doc  
- Partition per hour: 2025-11-18T15:doc  

<mark style="background: #04FF00A6;">When useful:</mark>
- Time-series data  
- Query patterns operate on recent windows (e.g., last hour/day)  

<mark style="background: #04FF00A6;">Pros:</mark>  
- Enforces bounded partitions  
- Improves indexing speed for large datasets  

<mark style="background: #04FF00A6;">Risk:</mark> If all writes go to the “current” partition, the current partition becomes a hot partition.

### <mark style="background: #04FF00A6;">Hash Partitioning</mark>

Data is divided into partitions based on the hash value of a specified column.  

Uses a hash function to distribute data uniformly across partitions.  

Useful when you want to evenly distribute data across partitions to achieve load balancing.  

<mark style="background: #04FF00A6;">Note:</mark> When you partition a table in PostgreSQL, the primary key (or any unique constraint) must include all the columns that are part of the partitioning key

### <mark style="background: #04FF00A6;">Hash Partitioning in CouchDB</mark>

CouchDB does not hash documents by itself, but you can hash the partition key in your ID scheme:  

<mark style="background: #04FF00A6;">Example:</mark>  
- hash(user_id)%16:doc  
- Creates 16 evenly distributed partitions.  

<mark style="background: #04FF00A6;">When useful:</mark>  
- When natural keys (country, type, date) produce skew  
- To prevent uneven load and hotspots  

<mark style="background: #04FF00A6;">Pros:</mark>  
- Excellent balanced distribution  
- Avoids skew and oversized partitions  
- Good for high-write workloads  

<mark style="background: #04FF00A6;">Risk:</mark> Harder to run partition-level analytics (e.g., “all users from Ireland” are now spread across 16 hashed partitions)