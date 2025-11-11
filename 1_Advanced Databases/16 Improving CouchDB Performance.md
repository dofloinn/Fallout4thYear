### <mark style="background: #04FF00A6;">Query Execution Model</mark>

CouchDB has no <mark style="background: #04FF00A6;">cost-based optimiser</mark>  

Queries depend on <mark style="background: #04FF00A6;">prebuilt indexes</mark> (unlike PostgreSQL’s planner)  

No index = full database scan  

<mark style="background: #04FF00A6;">Query performance depends on:</mark> 
- Index freshness  
- Index selectivity  
- Database compaction state

### <mark style="background: #04FF00A6;">Indexing Overview (Primary vs Secondary)</mark>  

<mark style="background: #04FF00A6;">Primary index:</mark> B-tree on _id (document key)  

<mark style="background: #04FF00A6;">Secondary indexes:</mark>  

Created via views (MapReduce) or <mark style="background: #04FF00A6;">JSON indexes</mark> (Mango)  

Store emitted key–value pairs in B-tree structure  

<mark style="background: #04FF00A6;">Important:</mark>
- CouchDB builds one B-tree per view or JSON index  
- Well-chosen keys = fast lookups.

### <mark style="background: #04FF00A6;">Mango Queries and JSON Indexes</mark>

Mango queries provide a declarative, JSON-based syntax for filtering, sorting, and finding documents  

Similar to SQL WHERE clauses.  

<mark style="background: #04FF00A6;">Creating an index:</mark>  
```json
POST /events_d22125081/_index  
{  
"index": { "fields": ["eventType"] },  
"name": "event_type_idx",  
"type": "json"  
}
```  

<mark style="background: #04FF00A6;">How Mango Works:</mark>
- CouchDB executes \_find queries using predefined JSON indexes.
- If no matching index exists, it performs a full database scan (very slow).  

<mark style="background: #04FF00A6;">Using an index:</mark>  
```json
POST /events_d22125081/_find  
{  
"selector": {"eventType": "Wedding"},  
"use_index": "eventtype_idx"  
}
``` 

Fast if a matching JSON index exists  

Full DB scan if not

### <mark style="background: #04FF00A6;">Map Reduce Views</mark>  

Queryability is limited in CouchDB  

Generally, you don’t execute ad hoc queries  

Most come from views you add ahead of time  

<mark style="background: #04FF00A6;">Map Reduce Views:</mark>  
- Predefined functions for aggregation and summarization.  
- The most important part of the view is the emit function  
- emit (key, value)  
- key – a value you provide to describe the documents you want  
- value –the value (JSON object) you want CouchDB to return to you


<mark style="background: #04FF00A6;">Map:</mark>
```js
function (doc) {  
	emit(doc.vendor, doc.cost);  
}
```  

<mark style="background: #04FF00A6;">Optional Reduce:</mark>  
```js
function (keys, values, rereduce) {  
	return sum(values);  
}
```  

Each <mark style="background: #04FF00A6;">design document</mark> can hold multiple views  

Results stored in B-tree and updated incrementally

### <mark style="background: #04FF00A6;">Prefer Mango when</mark>  

You need <mark style="background: #04FF00A6;">simple, ad-hoc querying</mark> without writing JavaScript map/reduce functions.  

Your queries resemble <mark style="background: #04FF00A6;">filtering documents by fields</mark>, like:  
```json
{  
	"selector": {  
		"type": "order",  
		"status": "pending"  
	}  
}
```  

You want to <mark style="background: #04FF00A6;">quickly prototype or perform dynamic searches</mark>.  

You benefit from <mark style="background: #04FF00A6;">automatic index management</mark> (Mango can build and choose indexes for you).  

You don’t need complex data aggregation or transformations - just <mark style="background: #04FF00A6;">filter, sort, and paginate</mark>.  

You want <mark style="background: #04FF00A6;">MongoDB-like</mark> syntax for developers unfamiliar with CouchDB views

You need <mark style="background: #04FF00A6;">custom or complex indexing logic</mark> (e.g., emit multiple keys per doc, composite keys).  

You require <mark style="background: #04FF00A6;">data aggregation</mark> (counting, summing, grouping).  

You want to <mark style="background: #04FF00A6;">optimise performance for a known query pattern</mark> - views are precomputed and persistent.  

You need <mark style="background: #04FF00A6;">range queries</mark> on structured keys (e.g., from "2025-01" to "2025-12").  

You’re <mark style="background: #04FF00A6;">working with large datasets</mark> where you can’t afford to re-scan documents dynamically.


### <mark style="background: #04FF00A6;">Mango v View Comparison</mark>  

<table>
	<tr>
		<th>Feature</th>
		<th>Mango (_find)</th>
		<th>MapReduce View</th>
	  </tr>
	  <tr>
		  <td>Syntax</td>
		  <td>Declarative JSON</td>
		  <td>JS functions</td>
	  </tr>
	  <tr>
		  <td>Best for</td>
		  <td>Filtering, lookup</td>
		  <td>Aggregation, analytics</td>
	  </tr>
	  <tr>
		  <td>Requires Index?</td>
		  <td>JSON index</td>
		  <td>Design doc (view index)</td>
	  </tr>
	  <tr>
		  <td>Update frequency</td>
		  <td>On demand</td>
		  <td>Incremental build</td>
	  </tr>
	  <tr>
		  <td>Example Use</td>
		  <td>Find all bookings by vendor</td>
		  <td>Count bookings per vendor</td>
	  </tr>
</table>


Use <mark style="background: #04FF00A6;">Mango</mark> for convenience and simplicity.  
Use <mark style="background: #04FF00A6;">Views</mark> for power, performance, and complex analytics.  

<table>
	<tr>
		<th>Use Case</th>
		<th>Prefer</th>
	</tr>
	<tr>
		<td>Simple field-based filtering</td>
		<td>Mango</td>
	  </tr>
	  <tr>
		  <td>Ad-hoc or flexible queries</td>
		  <td>Mango</td>
	  </tr>
	  <tr>
		  <td>Precomputed indexes for performance</td>
		  <td>View</td>
	  </tr>
	  <tr>
		  <td>Complex aggregation or transformations</td>
		  <td>View</td>
	  </tr>
	  <tr>
		  <td>Range queries on composite keys</td>
		  <td>View</td>
	  </tr>
</table>

### <mark style="background: #04FF00A6;">What is the view index?</mark>  

<mark style="background: #04FF00A6;">Every view is associated with a view index:</mark>
- This is a data structure used to store and efficiently query the results of map-reduce views.  
- The key-value pairs emitted by the map function are stored in a B-tree-like data structure  
- This B-tree-like structure is the view index.  
- This view index is periodically updated to reflect changes in the database.

![[Pasted image 20251111174647.png]]

### <mark style="background: #04FF00A6;">How is the View index built?</mark>

The B-tree that backs the key-sorted view result is built only once, when you first query a view

All subsequent queries will just read the B-tree instead of executing the map function for all documents again.

### <mark style="background: #04FF00A6;">What happens when you add a new document/delete a document?</mark>
- CouchDB finds the rows in the view result that were created by a specific document.  
- It marks them invalid so that they no longer show up in view results.  
- If the document was deleted, the resulting B-tree reflects the state of the database.  
- If a document got updated, the new document is run through the map function and the resulting new lines are inserted into the B-tree at the correct spots.  
- <mark style="background: #04FF00A6;">Note:</mark> Completely new documents that are added are handled in the same way.

### <mark style="background: #04FF00A6;">Parameters we can use as part of query request</mark>  
- ``key`` – specifies a particular value for emitted key (Find ONE)  
- ``keys`` – specifies an array of values for emitted key (Find MANY)  
- ``ascending``  
- ``descending`` – specifies reverse order of index  
- ``startkey`` – key to start returning documents from (Find MANY)  
- ``endkey`` – key to finish returning documents at (Find MANY)  
- ``limit`` – specifies max number of documents to return  
- ``group`` – tells CouchDB to group by common values of key for reduce operation

### <mark style="background: #04FF00A6;">Performance - Command-Line and API Tools</mark>

<table>
	<tr>
		<th>Tool</th>
		<th>Purpose</th>
		<th>Example</th>
	</tr>
	<tr>
		<td>/_explain</td>
		<td>See which index a Mango query will use</td>
		<td>POST /events/_explain</td>
	  </tr>
	  <tr>
		  <td>?stale=ok</td>
		  <td>Skip index rebuild for faster reads</td>
		  <td>GET /db/_design/view/_view/by_vendor?stale=ok</td>
	  </tr>
	  <tr>
		  <td>/_active_tasks</td>
		  <td>Show ongoing indexing or compaction tasks</td>
		  <td>GET /_active_tasks/</td>
	  </tr>
	  <tr>
		  <td>/_stats</td>
		  <td>Retrieve system metrics like request times, cache hits, and compaction</td>
		  <td>GET /_node/nonode@nohost/_stats</td>
	  </tr>
</table>


### <mark style="background: #04FF00A6;">Understanding /_explain in CouchDB</mark>

``/_explain`` lets you see how CouchDB plans to execute a query, whether it can use an index (Mango) or must scan all documents.  

It’s the CouchDB equivalent of EXPLAIN ANALYZE in PostgreSQL  

<mark style="background: #04FF00A6;">For Mango Queries:</mark> 
- After creating JSON indexes, use ``/_explain`` to confirm that a query actually uses them.  
- <mark style="background: #04FF00A6;">Example:</mark>  

```bash
curl -X POST  
http://admin:pass@127.0.0.1:5984/events_d2212508  
1/_explain \  
-H "Content-Type: application/json" \  
-d '{  
"selector": {"eventType": "Wedding"}  
}’
``` 

<mark style="background: #04FF00A6;">"type": "json"</mark> → uses a Mango JSON index (good performance).  

<mark style="background: #04FF00A6;">"name": "eventtype_idx"</mark> → confirms the correct index  

If the "index" field is "special": "\_all_docs", CouchDB is scanning all documents — meaning no matching index found.  
```json
{  
	"dbname": "events_d22125081",  
	"index": {  
		"ddoc": "_design/eventtype_idx",  
		"name": "eventtype_idx",  
		"type": "json"  
	},  
	"selector": {  
		"eventType": {"$eq": "Wedding"}  
	},  
	"range": {  
		"start_key": ["Wedding"],  
		"end_key": ["Wedding", {}]  
	},  
	"fields": ["_id", "_rev"]  
}
```


### <mark style="background: #04FF00A6;">Understanding / _info in CouchDB</mark>  

<mark style="background: #04FF00A6;">For Map Reduce View:</mark> You can’t use ``_explain``. ``_info`` shows metadata about the view index  

Tells you if the view is built (``updater_running:false``), disk size, last update sequence, etc.

<mark style="background: #04FF00A6;">Example:</mark>
```bash
curl -X GET http://yourusername:yourpassword@127.0.0.1:5984/events_d22125081/_design/vendor/_info  
{  
	"name": "vendor",  
	"view_index": {  
		"updates_pending": {  
			"minimum": 0,  
			"preferred": 0,  
			"total": 0  
		},  
		"waiting_commit": false,  
		"waiting_clients": 0,  
		"updater_running": false,  
		"update_seq": 8,  
		"sizes": {  
			"file": 16672,  
			"external": 114,  
			"active": 336  
		},  
		"signature":  
		"bd796bb0272f14106154f5c419ced9dd",  
		"purge_seq": 0,  
		"language": "javascript",  
		"compact_running": false,  
		"collator_versions": [  
			"153.104"  
		]  
	}  
}
```  

<table>
	<tr>
		<th>Field</th>
		<th>Meaning</th>
		<th>Notes</th>
	</tr>
	<tr>
		<td>updater_running: false</td>
		<td>Index build complete.</td>
		<td>The view index is ready and cached.</td>
	</tr>
	<tr>
		<td>update_seq</td>
		<td>Last database update processed.</td>
		<td>If new docs are added, this increases after the next rebuild.</td>
	</tr>
	<tr>
		<td>updates_pending.total</td>
		<td>Number of documents still waiting to be indexed.</td>
		<td>0 = fully up-to-date.</td>
	</tr>
	<tr>
		<td>waiting_commit: false</td>
		<td>No pending writes waiting to be flushed to disk.</td>
		<td>Normal after index build.</td>
	</tr>
	<tr>
		<td>sizes.file</td>
		<td>Total bytes occupied on disk by the view index file (≈ old disk_size).</td>
		<td>Use this to measure index growth or reduction after compaction.</td>
	</tr>
	<tr>
		<td>sizes.active</td>
		<td>Active portion of the file (≈ old data_size).</td>
		<td> Represents usable data inside the index.</td>
	</tr>
	<tr>
		<td>sizes.external</td>
		<td>Size of the original emitted key/value data from map functions.</td>
		<td>Useful for understanding emitted result volume.</td>
	</tr>
	<tr>
		<td>compact_running: false</td>
		<td>View compaction is not currently active.</td>
		<td>Safe to trigger a compaction job.</td>
	</tr>
	<tr>
		<td>language: "javascript"</td>
		<td>Confirms your view uses JS map/reduce functions.</td>
		<td>Matches your design doc</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">View Optimisation</mark>  

<table>
	<tr>
		<th>Technique</th>
		<th>Description</th>
		<th>Example</th>
		<th>Performance Benefit</th>
		<th>Trade-off</th>
	</tr>
	<tr>
		<td>MapReduce Views</td>
		<td>Custom JavaScript map/reduce functions for aggregation</td>
		<td>Emit vendor → cost</td>
		<td>Reusable index for group queries</td>
		<td>Slow to build initially</td>
	</tr>
	<tr>
		<td>Mango Indexes</td>
		<td>Declarative JSON definition</td>
		<td>{ "fields": ["vendorName"] }</td>
		<td>Easy for ad-hoc queries</td>
		<td>Must be prebuilt</td>
	</tr>
	<tr>
		<td>Text Indexes</td>
		<td>(Lucene – Beyond our scope)</td>
		<td>Full-text search </td>
		<td>"type":"text"</td>
		<td>Enables keyword search</td>
		<td>More storage + CPU use</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Documents and Views</mark>

<mark style="background: #04FF00A6;">Use of Views:</mark>  
- Create views that index the data you query frequently.  
- Design documents contain views that can significantly speed up read operations by allowing CouchDB to use the indexes instead of scanning the entire dataset.  

<mark style="background: #04FF00A6;">Reduce View Complexity:</mark>  
- Keep view functions simple and efficient.  
- Avoid heavy computations within views, as they can slow down index building.  

<mark style="background: #04FF00A6;">Use of emit Wisely:</mark> When emitting data from views, emit only necessary fields to reduce index size and improve performance.

### <mark style="background: #04FF00A6;">Optimise Queries</mark>

<mark style="background: #04FF00A6;">Start and End Keys:</mark> When querying views, utilize ``startkey`` and ``endkey`` parameters to limit the amount of data returned, making queries faster and reducing load.  

<mark style="background: #04FF00A6;">Limit Results:</mark> Use the limit parameter in your queries to restrict the number of returned documents, which can speed up response times.

### <mark style="background: #04FF00A6;">Replication and Sharding</mark>

<mark style="background: #04FF00A6;">Use Replication:</mark>  
- Implement replication to improve read performance and availability.  
- CouchDB supports master-master and master-slave replication, which can distribute the load.  

<mark style="background: #04FF00A6;">Sharding:</mark> In clustered environments, ensure that data is evenly distributed across nodes to prevent hotspots and improve overall performance.

### <mark style="background: #04FF00A6;">Compaction</mark>

<mark style="background: #04FF00A6;">Database Compaction:</mark>  
- Regularly compact databases to reclaim disk space and improve performance.  
- CouchDB stores multiple revisions of documents and deletes that can lead to fragmentation over time.  

```bash
curl -X POST -H "Content-Type: application/json" http://admin:couchdb@127.0.0.1:5984/examresults/_compact
```  

<mark style="background: #04FF00A6;">View Index Compaction:</mark> Optimise storage and load times – via the database compaction

### <mark style="background: #04FF00A6;">Bulk Operations</mark>  

<mark style="background: #04FF00A6;">Bulk Inserts and Updates:</mark>  
- Use bulk operations for inserting or updating multiple documents at once. 
- This reduces the overhead associated with individual HTTP requests and improves throughput.