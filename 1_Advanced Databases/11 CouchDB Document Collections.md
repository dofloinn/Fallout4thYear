<mark style="background: #04FF00A6;">Aggregate in the context of NoSQL:</mark>
- A collection of documents that operate as a unit.
- An <mark style="background: #04FF00A6;">aggregation pipeline</mark> consists of one or more stages to process documents.  
- In CouchDB this is done using map/reduce.

### <mark style="background: #04FF00A6;">Single document collection</mark>  

All documents are grouped together in a single collection.  

<mark style="background: #04FF00A6;">Ideally should share a similar structure:</mark>
- No pre-defined schema.  
- Documents can have different field.  
- Documents can evolve independently of each other.  
- Good for horizontal scalability.  

<mark style="background: #04FF00A6;">In CouchDB:</mark> 
- Include a field ‘type’  
- All documents in a collection are a single type.

### <mark style="background: #04FF00A6;">Separate document collections:</mark>

Documents are organised into separate collections.  

Facilitates logical grouping of documents.  

<mark style="background: #04FF00A6;">Each collection could have a different structure:</mark>
- Ideally documents in a collection would have a similar structure.  
- No pre-defined schema.  
- Documents can have different field.  
- Documents can evolve independently of each other.  

Relationships can be simulated through links or embedded documents.  

<mark style="background: #04FF00A6;">Facilitates separation of concerns:</mark>
- Good for horizontal scalability.  
- Good for partitioning.  

<mark style="background: #04FF00A6;">In CouchDB:</mark>
- Include a field ‘type’  
- Documents in different collections are differentiated by type.

### <mark style="background: #04FF00A6;">Single vs Separate document collections - How do you decide?</mark>

<mark style="background: #04FF00A6;">Consider the Query patterns and Performance requirements:</mark>  
- <mark style="background: #04FF00A6;">Single document collections:</mark> Suit read-heavy workloads with simple query patterns.
- <mark style="background: #04FF00A6;">Separate document collections:</mark> Make sense if your application requires complex queries or aggregations which allow you to optimise for different requirements.

<mark style="background: #04FF00A6;">Consider Data size and growth/scalability:</mark> 
- How much data is involved? 
- How much growth is expected?  

<mark style="background: #04FF00A6;">Separate document collections:</mark> Can provide better scalability and distribution options such as sharding or partitioning collections based on access patterns.  

<mark style="background: #04FF00A6;">Single document collections:</mark> Will face challenges when partitioning and sharding if there are varying access patterns and data volume

<mark style="background: #04FF00A6;">Consider security and access control:</mark> 
- <mark style="background: #04FF00A6;">Single document collection:</mark> Requires access control and security measures to be applied consistently across all data which is challenging if implementing fine-grained access control.  
- <mark style="background: #04FF00A6;">Separate document collections:</mark> Allow you define access control at a more granular level, providing better control over who can access and modify specific data entities

<mark style="background: #04FF00A6;">Consider data consistency and transactional requirements:</mark>  
- NoSQL databases generally offer weaker transactional support than SQL compliant and generally offer eventual consistency.  
- <mark style="background: #04FF00A6;">Separate document collections:</mark> Challenging if your application requires a high degree of consistency.  
- <mark style="background: #04FF00A6;">Single document collection:</mark> Can provide better transactional consistency, as all the data is stored within a single document and is updated atomically.

### <mark style="background: #04FF00A6;">Linked Documents:</mark>

If we want to represent students attending college undertaking different degree programmes and degrees are composed of modules.  

You want to record the results of exams undertaken in a range of modules.  

<mark style="background: #04FF00A6;">Can create two types of document:</mark>
- <mark style="background: #04FF00A6;">Student document:</mark> Containing details of the student and degree  
- <mark style="background: #04FF00A6;">Result document:</mark> Containing the module details and the result. One for each module for which a student sat an exam

### <mark style="background: #04FF00A6;">Separate Document Collections in CouchDB:</mark> 

<mark style="background: #04FF00A6;">Approach 1:</mark> Embed the id of the associated fact into each result document.

![[Pasted image 20251017161659.png]]

<mark style="background: #04FF00A6;">Approach 2:</mark> Embed the ids of all associated results into each fact document.

![[Pasted image 20251017161738.png]]

### <mark style="background: #04FF00A6;">View Collation in CouchDB:</mark>

<mark style="background: #04FF00A6;">Collation:</mark>
- Assembling.  
- The way in which keys are ordered in the index of a view.  

<mark style="background: #04FF00A6;">View functions:</mark>
- Specify a key and a value to be returned for each row.  
- CouchDB collates the view rows by this key  

CouchDB uses a specific collation algorithm for ordering keys. The collation order is determined by comparing the individual components of the key.

CouchDB uses Unicode collation for sorting keys.  

Keys are sorted according to the Unicode code points of their characters. The sorting order is case-sensitive and follows the Unicode code point order for characters.  

Keys in CouchDB can have multiple components. A key could be an array of values.  

<mark style="background: #04FF00A6;">The collation order compares the components of keys in order:</mark>  
- If the first component is different, the comparison stops;  
- Otherwise, it proceeds to the next component

CouchDB allows complex keys. Arrays containing a mix of strings, numbers, and other arrays.  

The collation algorithm is designed to handle complex keys in a way that preserves the desired sorting order.  

When querying views, you can use various parameters to control the range of keys returned.  

E.g. you can specify start and end keys to retrieve a subset of the view.

### <mark style="background: #04FF00A6;">Complex Keys in CouchDB</mark>

```js
function(doc) {  
	if (doc.type === “student") {  
		emit([doc._id, 0], null);  
	} else if (doc.type === “result") {  
		emit([doc.grade, 1], null);  
	}  
}
```  

This map function handles both “student” and “result” documents.  

Both types of document end up as rows in the same view.  

The key in this view is not just a simple string, but an array.  

The first element in that array is always the ID of the fact, regardless of whether we’re processing an actual fact document, or a result associated with a fact.  

The second element is 0 for fact documents, and 1 for result documents.

<mark style="background: #04FF00A6;">If the type is student:</mark>  
- <mark style="background: #04FF00A6;">Key:</mark> An array with the document's ID (``doc._id``) and 0.  
- 0 is being used as a sorting token  
- <mark style="background: #04FF00A6;">Value:</mark> null.  

<mark style="background: #04FF00A6;">If the type is result:</mark>
- Key: An array with the grade field (``doc.grade``) and 1.  
- Value: null.  
- 1 is being used as a sorting token  

Because the sorting token for facts is lower than the token for orders, the student document will come before the associated results.  

The values 0 and 1 for the sorting token are arbitrary.

### <mark style="background: #04FF00A6;">Map/Reduce</mark>

CouchDB doesn’t use SQL joins or stored procedures.  

<mark style="background: #04FF00A6;">Instead, it uses MapReduce — a functional model where:</mark> 
- <mark style="background: #04FF00A6;">Map:</mark> emits key–value pairs for indexing.  
- <mark style="background: #04FF00A6;">Reduce</mark>: aggregates or summarizes those pairs.  

This is defined in <mark style="background: #04FF00A6;">design documents</mark> using JavaScript functions.

### <mark style="background: #04FF00A6;">Map</mark>  

Runs <mark style="background: #04FF00A6;">once</mark> per document in the database.  

Decides which documents to index and what key/value pairs to emit.  

```js
function (doc) {  
	if (doc.type === "exam_result") {  
		emit(doc.student.$ref, doc.score);  
	}  
}
```

<table>
	<tr>
		<th>What is Allowed</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<th>Read fields</th>
		<td> Access any properties in the doc JSON.</td> 
	</tr>
	<tr>
		<th>Conditional logic</th>
		<td> if, switch, etc., to decide what to emit.</td> 
	</tr>
	<tr>
		<th> Transform data </th>
		<td>Calculate or format values before emitting (e.g., ``parseInt()``, ``toUpperCase()``).  </td> 
	</tr>
	<tr>
		<th>Emit multiple rows </th>
		<td>Call emit() multiple times per document. </td> 
	</tr> 
	<tr>
		<th>Use arrays/objects as keys </th>
		<td>e.g. emit([doc.student.$ref, doc.subject], doc.score); for compound keys.</td> 
	</tr>
	</table>

<table>
	<tr>
		<th>What is NOT Allowed</th> 
		<th>Reason</th>
	</tr>  
	<tr>
		<th>Emit nothing dynamic (outside doc) </th>
		<td>No external DB calls, no access to other documents.</td> 
	</tr>  
	<tr>
		<th>Modify documents</th>
		<td>Map functions are read-only.</td> 
	</tr>
	<tr>
		<th>Use randomness or side effects</th>
		<td>Functions must be deterministic.</td> 
	</tr>  
	<tr>
		<th>Access current date/time</th>
		<td>Would break reproducibility of indexes.</td> 
	</tr>
	<tr>
		<th>Use external libraries</th>
		<td>Only standard JS syntax supported</td> 
	</tr>
</table>

### <mark style="background: #04FF00A6;">Reduce</mark>

Summarises or aggregates all values <mark style="background: #04FF00A6;">emitted by the map</mark>.  

Runs incrementally (CouchDB uses it to keep reduced results up to date efficiently).  

```js
function (keys, values, rereduce) {  
	var sum = 0;  
	for (var i = 0; i < values.length; i++) {  
		sum += (rereduce ? values[i].sum : values[i]); 
	}  
	return sum;  
}
```

<mark style="background: #04FF00A6;">Reduce</mark> is pure JavaScript.  

Runs inside CouchDB’s built-in JavaScript engine (<mark style="background: #04FF00A6;">SpiderMonkey</mark>)  

Has access only to its input parameters — keys, values, and ``rereduce``.  

Cannot access the database, external files, or global state.  

So, it’s a <mark style="background: #04FF00A6;">sandboxed</mark> JavaScript environment designed for <mark style="background: #04FF00A6;">deterministic aggregation</mark>.

<table>
	<tr>
		<th>What is Allowed</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<th>Aggregate values</th>
		<td>Sum, count, average, min, max, etc.</td> 
	</tr>
	<tr>
		<th>Use rereduce logic</th>
		<td> Handle both initial and recursive reductions.</td> 
	</tr>
	<tr>
		<th>Return numbers or small objects</th>
		<td>Keep results small for performance.</td> 
	</tr>
	<tr>
		<th>Compute derived summaries</th>
		<td>E.g. average, ratio, or statistical measures.</td> 
	</tr> 
</table>

<table>
	<tr>
		<th>What is NOT Allowed</th> 
		<th>Reason</th>
	</tr>  
	<tr>
		<th>Access documents</th>
		<td>Reduce only sees keys and values from the map.</td> 
	</tr>  
	<tr>
		<th>Emit data</th>
		<td>Only returns one aggregated result (or one per group).</td> 
	</tr>
	<tr>
		<th>Perform complex logic</th>
		<td>Should remain simple and associative/commutative.</td> 
	</tr>  
	<tr>
		<th>Return large structures</th>
		<td>Results must be compact; CouchDB may truncate large ones.</td> 
	</tr>
</table>

### <mark style="background: #04FF00A6;">JavaScript for Reduce</mark>

<table>
	<tr>
		<th>Category</th>
		<th>Examples</th>
	  </tr>
	  <tr>
		  <th>Basic syntax</th>
		  <td> if, else, for, while, switch, try/catch </td>
	  </tr>
	  <tr>
		  <th>Math operators</th>
		  <td>  +, -, *, /, %  </td>
	  </tr>
	  <tr>
		  <th>Logic</th>
		  <td> &&, ` </td>
	  </tr>
	  <tr>
		  <th>Objects & arrays</th>
		  <td>Create {} and [], loop over them, access fields</td>
	  </tr>
	  <tr>
		  <th>Built-ins</th>
		  <td>Math (e.g. Math.max, Math.pow, Math.round)</td>
	  </tr>
	  <tr>
		  <th>String methods </th>
		  <td>.toString(), .indexOf(), .split(), .substring()</td>
	  </tr>
	  <tr>
		  <th>Array methods</th>
		  <td>.push(), .length, .concat(), .join() </td>
	  </tr>
	  <tr>
		  <th>Functions Define </th>
		  <td>helper functions inside the reduce</td>
	  </tr>
	  <tr>
		  <th>Return object or scalar </th>
		  <td>You can return {sum: ..., avg: ...} or a single number</td>
	  </tr>
</table>

### <mark style="background: #04FF00A6;">ReReduce</mark>

<mark style="background: #04FF00A6;">Phase 1: Reduce</mark>  
- Runs on raw map output.  
- ``rereduce === false``  
- You get the actual values your map function emitted.  

<mark style="background: #04FF00A6;">Example:</mark>

```js
// Map emitted:  
emit("student_101", {score: 80, count: 1});  
emit("student_101", {score: 90, count: 1});  

//Reduce sees  
keys = [["student_101"], ["student_101"]];  
values = [{score: 80, count: 1}, {score: 90, count: 1}];  
rereduce = false;  

//Returns  
return {total: 170, numexams: 2};
```

<mark style="background: #04FF00A6;">Phase 2: reReduce</mark>
- Happens when CouchDB has to combine partial reduce results.  
- ``rereduce === true``  
- Works with values that are reduce results  
- Not the raw map values anymore.

<mark style="background: #04FF00A6;">Example:</mark>

```js
// First stage reductions:  
[{total: 170, numexams: 2}, {total: 260, numexams:3}]  
rereduce = true  

//Returns  
return {  
	total: 430,  
	numexams: 5  
};
```

### <mark style="background: #04FF00A6;">Reduce/ReReduce</mark>

<table>
	<tr>
		<th>Phase</th> 
		<th>rereduce</th> 
		<th>value's input type</th> 
		<th>Example</th>
	</tr> 
	<tr>
		<td>First reduce</td>
		<td>false</td>
		<td>raw {score, count} objects</td>
		<td> [ {score:80,count:1}, {score:90,count:1} ]</td>
	</tr>
	<tr>
		<td>Re-reduce</td>
		<td>true</td>
		<td>partial summaries {total, count}</td>
		<td>[ {total:170,count:2}, {total:260,count:3} ]</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Practical Guidance for Map/Reduce</mark>

<table>
	<tr>
		<th>Concept</th> 
		<th>Best Practice</th>
	</tr>
	<tr>
		<th>Map</th>
		<td>Think of it like SELECT ... FROM — pick and shape the data you care about.</td>
	</tr>
	<tr>
		<th>Reduce</th>
		<td>Think of it like GROUP BY — summarize or aggregate that data.</td>
	</tr>
	<tr>
		<th>rereduce</th>
		<td>Handle recursive aggregation — always make sure the function is associative</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Example</mark>

<mark style="background: #04FF00A6;">Map:</mark>
```js
function (doc) {  
	if (doc.type === "exam_result" && doc.student && doc.score) {  
		emit(doc.student.$ref, {  
			score: doc.score,  
			count: 1  
		});  
	}  
}
```  

``doc.type === "exam_result"`` → ensures only  
result documents are processed.  

``&&doc.student && doc.score`` → ensures both fields exist.  

``emit(doc.student.$ref, {...})`` → emits one row per result, keyed by the referenced student document ID.  

<mark style="background: #04FF00A6;">The emitted value includes:</mark>
- <mark style="background: #04FF00A6;">score:</mark> the result’s numeric score.  
- <mark style="background: #04FF00A6;">count:</mark> set to 1 so you can later use a reduce function to compute totals or averages.

### <mark style="background: #04FF00A6;">Example:</mark>  

<mark style="background: #04FF00A6;">Reduce:</mark>
```js
function (keys, values, rereduce) {  
	var total = 0,  
	numexams = 0;  
	for (var i = 0; i < values.length; i++) {  
	if (rereduce) {  
		total += values[i].total;  
		numexams += values[i].numexams;  
	} else {  
		total += values[i].score;  
		numexams += values[i].count;  
	}  
	}  
	return {  
		numexams: numexams,  
		examavg: total / numexams,  
		total: total  
	};  
}
```

<mark style="background: #04FF00A6;">Initial Reduce:</mark> (rereduce = false) Summarises raw emitted values {score, count} from the map stage.  

<mark style="background: #04FF00A6;">Re-reduce:</mark> (rereduce = true) Aggregates partial reduce outputs ``{total, numexams}`` into a final combined result.  

<mark style="background: #04FF00A6;">Output Fields</mark> ``numexams`` → number of exam results; total → total score; ``examavg`` → computed average score.