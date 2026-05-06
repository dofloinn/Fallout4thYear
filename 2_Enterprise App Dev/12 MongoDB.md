<mark style="background: #C900FFA6;">Lesson Outline</mark>
- Section 1 - NoSQL Databases  
- Section 2 - MongoDB Overview  
- Section 3 - MongoDB and Node.js  
- Section 4 - Mongoose.js  
- Section 5 - MongoDB Schema Design  
- Section 6 - Beyond MongoDB

### <mark style="background: #C900FFA6;">Summary of lecture</mark> 

<mark style="background: #C900FFA6;">NoSQL databases are characterised by their non-relational</mark>, horizontally scalable, and flexible data modelling nature, often providing optional schemas and simple programming APIs.  

MongoDB, a prominent <mark style="background: #C900FFA6;">NoSQL database, is highlighted for its speed, efficiency, and scalability</mark>. The text contrasts NoSQL databases with relational databases, emphasising NoSQL's suitability for large volumes of diverse data and agile development. It briefly mentions potential drawbacks, such as the absence of a mature ecosystem compared to SQL.

Additionally, it introduces concepts like <mark style="background: #C900FFA6;">NoSQL injection vulnerabilities and the CAP theorem</mark> and proposes a hybrid approach for using different database technologies based on specific storage requirements.

### <mark style="background: #C900FFA6;">Section 1 - NoSQL Databases</mark>

![[Pasted image 20260311110539.png]]

### <mark style="background: #C900FFA6;">AXIOS for retrieving JSON documents</mark>

![[Pasted image 20260311110603.png]]

### <mark style="background: #C900FFA6;">SQL versus NoSQL Datasets</mark>

![[Pasted image 20260311110625.png]]

### <mark style="background: #C900FFA6;">What are NoSQL Databases?</mark>

<mark style="background: #C900FFA6;">Data management systems inherently:</mark>  
- <mark style="background: #C900FFA6;">Non-relational:</mark> These systems allow for <mark style="background: #C900FFA6;">flexible data modelling</mark> without predefined relationships between data. 
- <mark style="background: #C900FFA6;">Distributed - horizontally scalable:</mark> <mark style="background: #C900FFA6;">Designed to scale horizontally</mark> by adding more machines to a cluster for better performance and higher availability.
- <mark style="background: #C900FFA6;">Optional schemas:</mark> Some systems support <mark style="background: #C900FFA6;">optional schema enforcement</mark>, providing more data modelling flexibility. 
- <mark style="background: #C900FFA6;">Simple programming APIs:</mark> These systems provide <mark style="background: #C900FFA6;">easy-to-use APIs for developers</mark> to interact with and manipulate data.
- <mark style="background: #C900FFA6;">Eventually consistent / BASE:</mark> Prioritise availability over consistency, which may cause updates to the database to take time to propagate. 
- <mark style="background: #C900FFA6;">Suitable for "Big Data":</mark> Optimised for handling large volumes of data, high-velocity data streams, and various data formats.
- <mark style="background: #C900FFA6;">Optimised for fast reads:</mark> Typically prioritises read performance overwrite performance.
- <mark style="background: #C900FFA6;">Often open-source:</mark> Many of these systems have vibrant communities of developers contributing to their development and maintenance.

### <mark style="background: #C900FFA6;">Why NoSQL?</mark> 

Relational databases were not designed to cope with the scale and agility challenges that face modern Web Apps, nor were they built to take advantage of the commodity storage and processing power available today.

Relational databases tried to minimise redundancy, but storage prices have dropped dramatically.

<mark style="background: #C900FFA6;">NoSQL databases are faster and more scalable, facilitating:</mark> 
- Large volumes of rapidly changing structured, semi-structured, and unstructured data  
- Agile sprints, quick schema iteration  
- Flexible and easy-to-use object-oriented programming  
- Geographically distributed scale-out architectures, instead of expensive, monolithic architectures

### <mark style="background: #C900FFA6;">Evolution of Memory vs Salaries</mark>

The price of memory is constantly going down whereas the salaries go slightly up. That’s why we need to focus on minimising the time it takes to do the apps, not the memory apps use

![[Pasted image 20260311111731.png]]

### <mark style="background: #C900FFA6;">Why maybe not NoSQL?</mark> 

Relational databases are <mark style="background: #C900FFA6;">supported</mark> by an extensive ecosystem of <mark style="background: #C900FFA6;">tools</mark>, and there is a large pool of <mark style="background: #C900FFA6;">labour</mark> qualified to work with these systems.  

<mark style="background: #C900FFA6;">ACID</mark> transactions are a key capability for business-critical transactional systems, specifically around <mark style="background: #C900FFA6;">e-commerce</mark> processing.  

Other core relational features are joins, normalisation, referential integrity, and strong consistency.

### <mark style="background: #C900FFA6;">MongoDB vs SQL in Scalability</mark>

![[Pasted image 20260311112413.png]]

### <mark style="background: #C900FFA6;">CAP Theorem</mark> 

The <mark style="background: #C900FFA6;">CAP theorem</mark>, also known as Brewer's theorem, was introduced by computer scientist Eric Brewer in 2000.  

<mark style="background: #C900FFA6;">It states that in a distributed database system, only two of the following properties can be guaranteed:</mark> 
- <mark style="background: #C900FFA6;">Consistency:</mark> All nodes in a distributed system have the same data at the same time
- <mark style="background: #C900FFA6;">Availability:</mark> A distributed system must remain operational and accessible to users despite any failures 
- <mark style="background: #C900FFA6;">Partition Tolerance:</mark> A distributed system must continue to operate even when the network is experiencing latency, packet loss, or other communication failures

<mark style="background: #C900FFA6;">C+A (Not possible in a distributed system):</mark> 
- Always available and consistent  
- Single-site databases  

<mark style="background: #C900FFA6;">C+P:</mark>
- Distributed databases  
- The system is unavailable for a while...  

<mark style="background: #C900FFA6;">A+P:</mark>
- Several copies of the data  
- Eventually consistent...

![[Pasted image 20260311112617.png]]

### <mark style="background: #C900FFA6;">Different Approaches</mark>

![[Pasted image 20260311113100.png]]

### <mark style="background: #C900FFA6;">ACID versus BASE</mark> 

<mark style="background: #C900FFA6;">Atomicity:</mark> Each transaction is treated as a single "unit", which either succeeds completely or fails.  

<mark style="background: #C900FFA6;">Consistency:</mark> Must transform the database from one fully consistent state to another.  

<mark style="background: #C900FFA6;">Isolation:</mark> Partial effects of incomplete concurrent transactions should not be visible to other transactions.  

<mark style="background: #C900FFA6;">Durability:</mark> Effects of a committed transaction are permanent and must not be lost because of later failure.  

<mark style="background: #C900FFA6;">Basically Available:</mark> Availability first.  

<mark style="background: #C900FFA6;">Soft state:</mark> Eventually all updates will propagate and all the nodes will be consistent.  

<mark style="background: #C900FFA6;">Eventually Consistent:</mark> Weak consistency, best effort, stale data, and approximate answers are OK.

### <mark style="background: #C900FFA6;">MongoDB</mark>

<mark style="background: #C900FFA6;">MongoDB</mark> is a cross-platform, document-oriented, NoSQL database that uses <mark style="background: #C900FFA6;">JSON</mark>-like documents and on-disk (persistent) storage. By default, it is <mark style="background: #C900FFA6;">schema-less</mark>.  

It allows you to run JavaScript on the server within the "JavaScript everywhere" paradigm.

Download it from: www.mongodb.com/  

Since October 2018, MongoDB has been licensed under the <mark style="background: #C900FFA6;">Server-Side Public License (SSPL)</mark>, requiring those making the software publicly available as part of a "service" to make that service's entire source code available under this license.

### <mark style="background: #C900FFA6;">Editions</mark>  

<mark style="background: #C900FFA6;">MongoDB Community Server:</mark> Free and available for Windows, Linux, and OS X.  

<mark style="background: #C900FFA6;">MongoDB Enterprise Server:</mark> The commercial edition of MongoDB is available as part of the MongoDB Enterprise Advanced subscription.  

<mark style="background: #C900FFA6;">MongoDB Atlas:</mark> On-demand fully managed service. MongoDB Atlas runs on AWS, Microsoft Azure, and Google Cloud Platform.  

<mark style="background: #C900FFA6;">MongoDB Mobile:</mark> The embedded database from MongoDB. Same access patterns - from IoT, iOS, and Android mobile devices to your backend.

### <mark style="background: #C900FFA6;">Why MongoDB?</mark>

<mark style="background: #C900FFA6;">MongoDB</mark> is known for its speed, efficiency, and scalability, and it’s currently the most popular NoSQL database.

It offers advanced data manipulation features, e.g., <mark style="background: #C900FFA6;">map-reduce</mark>, and a vibrant query language.  

Data can be queried based on any combination of fields, with rich secondary indexes providing efficient access.  

MongoDB supports idiomatic drivers in several languages: Java, .NET, Ruby, Node.js, Perl, Python, PHP, C, C++, C#, JavaScript, and Scala.

### <mark style="background: #C900FFA6;">MongoDB Advantages</mark>  

MongoDB provides native horizontal auto-sharding - Data and query load are automatically balanced across servers.  

MongoDB 4.0 and beyond support multi-document ACID transactions.  

<mark style="background: #C900FFA6;">MongoDB supports tunable consistency for reads:</mark>  
- By default, all writers and readers have access to the primary copy.  
- Optionally, read queries can be issued against secondary copies where write operations may have not yet been synchronised.  

MongoDB offers in-memory storage with the Enterprise ed., facilitating higher performance.  

MongoDB offers the $graphLookup aggregation stage for graph processing natively within the database.  

MongoDB offers support for joins in queries.

### <mark style="background: #C900FFA6;">Sharding</mark>

Manual sharding is when an application maintains connections to several independent database servers, stores different data on different servers and queries against the appropriate server.  

In auto-sharding, a “router” keeps a “table of contents” with which shard contains which data.  

Applications can connect to this router and issue requests as if working with a single machine.  

Sharding splits large partitionable tables across the servers, but smaller tables are replicated as complete units to obtain them with the same query.

### <mark style="background: #C900FFA6;">MongoDB vs SQL</mark>

<table>
	<tr>
		<th>Feature</th>
		<th>MongoDB</th>
		<th>SQL</th>
	</tr>
	<tr>  
		<td>Database Type</td>
		<td>NoSQL (document-oriented)</td>
		<td>Relational</td>
	</tr>
	<tr>  
		<td>Data Model</td>
		<td>BSON documents</td>
		<td>Tables & rows</td>
	</tr>
	<tr>  
		<td>Schema</td>
		<td>Dynamic (schema-less)</td>
		<td>Fixed (pre-defined)</td>
	</tr>
	<tr>  
		<td>Query Language</td>
		<td>MongoDB Query Language</td>
		<td>SQL (Structured Query Language)</td>
	</tr>
	<tr>  
		<td>Scalability</td>
		<td>Horizontal (sharding)</td>
		<td>Vertical (scaling up)</td>
	</tr>
	<tr>  
		<td>Transactions</td>
		<td>ACID (since v4.0)</td>
		<td>ACID</td>
	</tr>
	<tr>  
		<td>Joins</td>
		<td>Not supported natively</td>
		<td>Supported</td>
	</tr>
	<tr>  
		<td>Indexing</td>
		<td>Supported</td>
		<td>Supported</td>
	</tr>
	<tr>  
		<td>Consistency</td>
		<td>Tunable (eventual to strong)</td>
		<td>Strong (by default)</td>
	</tr>
	<tr>  
		<td>Ease of Use</td>
		<td>JSON-like syntax</td>
		<td>SQL syntax</td>
	</tr>
</table>


### <mark style="background: #C900FFA6;">Advantages of</mark>  

<mark style="background: #C900FFA6;">MongoDB over SQL:</mark>  
- Flexible schema: Allows for rapid application development and iteration.  
- Horizontal scalability: Enables easy handling of large amounts of data and high traffic loads.  
- High performance: Faster for read-heavy workloads and simple write operations due to its document-based model.  

<mark style="background: #C900FFA6;">SQL over MongoDB:</mark>  
- Strong consistency: Ensures data reliability and accuracy across the database.  
- Mature ecosystem: Established and robust tools, libraries, and support.  
- Advanced querying: Allows for complex joins and transactions, making it suitable for applications with intricate data relationships.

### <mark style="background: #C900FFA6;">When to use</mark>

<table>
	<tr>
		<th>Recommended for SQL databases:</th>
		<th>Not recommended for SQL databases:</th>
	  </tr>
	  <tr>
		<td>Inventory management systems</td>
		<td>Real-time analytics and large-scale data processing</td>
	</tr>
	<tr>  
		<td>Customer relationship management (CRM) Time-series data storage (e.g., IoT sensor data)</td>
		<td>Accounting and financial systems Highly interconnected data (e.g., social networks)</td>
	</tr>
	<tr>  
		<td>Content management systems (CMS)</td>
		<td>High-volume, high-velocity data streams (e.g., log file storage)</td>
	</tr>
	<tr>  
		<td>Human resources management systems</td>
		<td>Large binary data storage (e.g., images, videos, audio files)</td>
	</tr>
	<tr>  
		<td>E-commerce platforms Highly-scalable applications with unpredictable growth</td>
		<td>Online reservation systems Systems requiring flexible schema design and frequent changes</td>
	</tr>
</table>

### <mark style="background: #C900FFA6;">BSON</mark>

<mark style="background: #C900FFA6;">MongoDB stores its data in BSON format:</mark>  

Binary-encoded serialisation of JSON-like documents.  

```json
{  
	"_id": "37010",  
	"city": "ADAMS",  
	"pop": 2660,  
	"state": "TN",  
	"councilman": {  
		"name": "John Smith",  
		"address": "13 Scenic Way"  
	}  
}
```

### <mark style="background: #C900FFA6;">_id field</mark>

<mark style="background: #C900FFA6;">By default, each document contains an _id field:</mark>  
- The value serves as the primary key for the collection  
- The value is <mark style="background: #C900FFA6;">unique</mark> and <mark style="background: #C900FFA6;">immutable</mark>  
- It may be of any non-array data type  
- The default data type for \_id is ``ObjectId``  
	- small  
	- fast to generate  
	- ordered  
- Sorting on an ``ObjectId`` value is roughly equivalent to sorting on creation time.

### <mark style="background: #C900FFA6;">Some BSON Additional Data Types</mark>

<mark style="background: #C900FFA6;">Date:</mark> To store the current date/time in milliseconds since the Unix epoch (Jan 1, 1970). You can specify your own date/time by creating an object Date() and passing day, month, and year into it.  

<mark style="background: #C900FFA6;">Binary data:</mark> To save non-UTF-8 strings to the database.  

<mark style="background: #C900FFA6;">JavaScript:</mark> To store JavaScript code in the document.  

<mark style="background: #C900FFA6;">Regular Expression:</mark> To use regular expressions.

### <mark style="background: #C900FFA6;">MongoDB Structure</mark>

![[Pasted image 20260311133826.png]]

<mark style="background: #C900FFA6;">Document:</mark>

![[Pasted image 20260311133907.png]]
![[Pasted image 20260311133914.png]]

### <mark style="background: #C900FFA6;">MySQL vs MongoDB</mark>

![[Pasted image 20260311133956.png]]

### <mark style="background: #C900FFA6;">Node.js MongoDB</mark>

npm install mongodb

```js
var MongoClient = require('mongodb').MongoClient; // driver  

var url = "mongodb://localhost:27017/"; // your details  

MongoClient.connect(url, function(err, db) {  
	if (err) throw err;  
	var dbo = db.db("mydb"); // create database  
	dbo.createCollection("customers", function(err, res) {  
		if (err) throw err;  
		console.log("Collection created!");  
		db.close();  
	});  
});
```

node mongo_db.js

### <mark style="background: #C900FFA6;">Terminology</mark>

In MongoDB <mark style="background: #C900FFA6;">insertOne</mark> and <mark style="background: #C900FFA6;">insertMany</mark> are like the ``INSERT`` statement in MySQL.  

In MongoDB <mark style="background: #C900FFA6;">find</mark> and <mark style="background: #C900FFA6;">findOne</mark> are like the ``SELECT`` statement in MySQL.  

In MongoDB <mark style="background: #C900FFA6;">updateOne</mark> and <mark style="background: #C900FFA6;">updateMany</mark> are like the ``UPDATE`` statement in MySQL.  

In MongoDB <mark style="background: #C900FFA6;">deleteOne</mark> and <mark style="background: #C900FFA6;">deleteMany</mark> are like the ``DELETE`` statement in MySQL.

### <mark style="background: #C900FFA6;">Node.js MongoDB INSERT</mark> 

```js
MongoClient.connect(url, function(err, db) {  
	if (err) throw err;  
	var dbo = db.db("mydb");  
	var myobj = { name: "Company Inc", address: "Highway 37" };  
	dbo.collection("customers").insertOne(myobj, function(err, res) {  
		if (err) throw err;  
		console.log("1 document inserted");  
		db.close();  
	});  
});

MongoClient.connect(url, function(err, db) {  
	if (err) throw err;  
	var dbo = db.db("mydb");  
	var myobj = [  
		{ name: 'John', address: 'Highway 71'}, 
		{ name: 'Peter', address: 'Lowstreet 4'}  
	];  
	dbo.collection("customers").insertMany(myobj, function(err, res) {  
	if (err) throw err;  
	console.log("Number of documents inserted: " + res.insertedCount);  
	db.close();  
	}); // res also contains insertedIds: [58fdbf5c0ef8a50b4cdd9a84, ...]  
});  
// If you do not specify an _id, MongoDB will assign a unique one per document
```

<mark style="background: #C900FFA6;">Note:</mark> If you try to insert documents in a collection that does not exist, MongoDB will create the collection automatically.

### <mark style="background: #C900FFA6;">Node.js MongoDB FIND</mark> 

The first parameter of the ``findOne()`` method is a query object.  

An empty query object will select all documents in a collection  

The ``findOne()`` method returns the first occurrence in the selection. 

```js
MongoClient.connect(url, function(err, db) {  
	if (err) throw err;  
	var dbo = db.db("mydb");  
	dbo.collection("customers").findOne({}, function(err, result)  
	{  
		if (err) throw err;  
		console.log(result.name);  
		db.close();  
	});  
});
```

### <mark style="background: #C900FFA6;">Node.js MongoDB FIND</mark>  

The ``find()`` method returns all occurrences in the selection.

The first parameter of the ``find()`` method is a query object, to filter the result.  

No parameters in the ``find()`` method give you the same result as SELECT * in MySQL  

```js
dbo.collection("customers").find({}).toArray(function(err, result) {  
// returns a JS array of objects, e.g. result[2].address
```

The second parameter of the find() method is the projection object that describes which fields to include in the result.
- Optional, and if omitted, all fields will be included in the result.  
- If you specify a field with the value 0, all other fields get the value 1, and vice versa  
- Except for \_id, you must only use 1 (includes) or 0 (excludes) per projection

```js
dbo.collection("customers").find({}, { projection: { _id: 0, name: 1, address: 1 } }).toArray(function(err, result) {  
dbo.collection("customers").find({}, { projection: { address: 0 } }).toArray(function(err, result) {
```

<mark style="background: #C900FFA6;">Filtering results:</mark> 
```js
var query = { address: "Park Lane 38" };  
dbo.collection("customers").find(query).toArray(function(err, result) {
```

<mark style="background: #C900FFA6;">Use regular expressions to query strings:</mark>  
```js
var query = { address: /^S/ }; // address start with S  
dbo.collection("customers").find(query).toArray(function(err, result) {
```

### <mark style="background: #C900FFA6;">Node.js MongoDB UPDATE</mark>

```js
var myquery = { address: "Valley 345" };  
var newvalues = { $set: {name: "Mickey", address: "Canyon 123" } };  dbo.collection("customers").updateOne(myquery, newvalues, function(err, res) {  
	var myquery = { address: /^S/ };  
	var newvalues = {$set: {name: "Minnie"} 
};  

dbo.collection("customers").updateMany(myquery, newvalues, function(err, res) { console.log(res.result.nModified);
```

### <mark style="background: #C900FFA6;">Node.js MongoDB DELETE</mark> 

```js
var myquery = { address: 'Mountain 21' };  
dbo.collection("customers").deleteOne(myquery, function(err, obj) {  

// deletes the first match  
var myquery = { address: /^S/ };  
dbo.collection("customers").deleteMany(myquery, function(err, obj) {  

// deletes all with addresses starting with S  

//obj.result.n is the number of documents deleted
```

### <mark style="background: #C900FFA6;">Avoiding NoSQL Injection</mark>  

MongoDB accepts unserialized JSON and JavaScript in several alternative query parameters, like the $where operator.  

This allows an attacker to not only manipulate data but also to run code.  

For example, this un-sanitized user input would cause MongoDB to execute at 100% CPU for 10 seconds (denial of service):  
```js
(function(){var date = new Date(); do{curDate = new Date();}
while(curDate-date<10000); return Math.max();})
```    

https://www.owasp.org/index.php/Testing_for_NoSQL_injection

### <mark style="background: #C900FFA6;">Avoiding NoSQL Injection</mark>  

NoSQL injection vulnerabilities can be prevented by:  
- Additional sanitization for JSON characters  
	- / \ { } : ; ' "  
	- e.g. with https://www.npmjs.com/package/sanitize
- Making assertions about the types and shapes of user-provided arguments, and checks in the code. e.g. with Mongoose  
- By watching for queries that fall outside the set of expected queries, we can prevent NoSQL injection.

### <mark style="background: #C900FFA6;">Mongoose.js</mark>

Mongoose is a data modelling tool for Node.js + MongoDB.  

In Mongoose, a data model consists of a schema, describing the structure of all objects of that type, and includes built-in type casting, validation and query building.  

So besides specifying the fields that are in every document of a collection, it adds MongoDB operations like save and find to the associated objects.

### <mark style="background: #C900FFA6;">Mongoose SAVE</mark>  

```js
mongoose = require("mongoose");  
mongoose.connect("mongodb://localhost:27017/");  
var CardSchema = new mongoose.Schema({  
	rank: 'string',  
	suit: 'string'  
});  

var Card = mongoose.model("Card", CardSchema);  
/* The first argument is the singular name of the collection your model is for. Here, the model card is used for the ‘cards’ collection in the database. */  
var c1 = new Card({rank:"ace", suit:"spades"}); // new document  

c1.save(function (err) { // insert into ‘cards’ collection  
	if (err !== null) console.log(err);  
	else console.log("the object was saved!");  
});
```

### <mark style="background: #C900FFA6;">Mongoose FIND</mark> 

find() is restricted to the types defined by the model:

```js
Card.find({}, function (err, cards) {  
	if (err !== null) {  
		console.log("ERROR: " + err);  
		return;  
	}  
	cards.forEach(function (card) {  
	// This will print all of the cards in the database  
		console.log (card.rank + " of " + card.suit);  
	});  
});
```

### <mark style="background: #C900FFA6;">Mongoose UPDATE</mark>  

```js
Card.find({"suit" : "hearts"}, function (err, cards) {  
	cards.forEach(function (card) {  
		// Update the card to spades  
		card.suit = "spades";  
		card.save(function (err) {  
			if (err) console.log(err);  
		});  
	});  
});
```

### <mark style="background: #C900FFA6;">Mongoose REMOVE</mark> 

```js
Card.remove({rank:"ace", suit:"spades"}, function (err) {  
	if (err !== null) {  
		// object was not successfully removed!  
		console.log(err);  
	}  
});
```

### <mark style="background: #C900FFA6;">Mongoose Validation</mark>

Mongoose validation is middleware.

![[Pasted image 20260311140059.png]]
![[Pasted image 20260311140107.png]]

### <mark style="background: #C900FFA6;">MongoDB Schema Design</mark>

Design your schema according to user requirements - Optimise your schema for the most frequent use cases.  

<mark style="background: #C900FFA6;">Combine objects into one document if you will use them together:</mark>
- Otherwise, you can separate them. 
- But make sure there won’t be a need for joins.  

<mark style="background: #C900FFA6;">The main goal is Read Speed:</mark>  
- Data redundancy is not an issue, because storage is cheap.
- “Join” data on writes, not on reads.

### <mark style="background: #C900FFA6;">One-to-One Relationship - Embedding</mark>

```js 
//zip
{  
	"_id": 35004,  
	"city": "ACMAR",  
	"loc": [-86, 33],  
	"pop": 6065,  
	"state": "AL",  
	"council_person": {  
		"name": "John Doe",  
		"address": "123 Fake  
		St.",  
		"phone": 123456  
	}  
} 

//zip 
{  
	"_id": 35004,  
	"city": "ACMAR",  
	"loc": [-86, 33],  
	"pop": 6065,  
	"state": "AL"  
}  

// council_person
{  
"zip_id": 35004,  
"name": "John Doe",  
"address": "123 Fake  
St.",  
"phone": 123456  
}
```

### <mark style="background: #C900FFA6;">One to Many Relationship - Referencing</mark>

```js
//publisher
{  
	"_id": "oreilly",  
	"name": "O’Reilly Media",  
	"founded": "1980",  
	"location": "CA"  
}  

//book
{  
	"_id": 12345,  
	"title": "MongoDB: The Definitive Guide",  
	"authors": ["Kristina Chodorow", "Mike Dirolf"],  
	"published_date": "2019-04-25T23:00:00.000+00:00",  
	"pages": 216,  
	"language": "English",  
	"publisher_id": "oreilly"  
}
```

### <mark style="background: #C900FFA6;">One-to-Many Relationship - Embedding</mark>

```js
// book
{  
	"_id": 12345,  
	"title": "MongoDB: The Definitive Guide",  
	"authors": ["Kristina Chodorow", "Mike Dirolf"],  
	"published_date": "2019-04-  
	25T23:00:00.000+00:00",  
	"pages": 216,  
	"language": "English",  
	"publisher": {  
		"name": "O’Reilly Media",  
		"founded": "1980",  
		"location": "CA"  
	}  
}
```

### <mark style="background: #C900FFA6;">Example</mark>

<mark style="background: #C900FFA6;">Suppose you need a database for a blog:</mark>
- Every post has a unique id, a title, description and URL.
- Every post can have zero or more tags.  
- Every post has the name of its author and total number of likes.  
- On each post, there can be zero or more comments.  
- Every comment will include the user name, message, date-time and number of likes.

Relational Model

![[Pasted image 20260311140749.png]]

### <mark style="background: #C900FFA6;">Example: MongoDB Schema</mark>

```js
{  
	'_id': POST_ID,  
	'title': TITLE_OF_POST,  
	'description': POST_DESCRIPTION,  
	'url': URL_OF_POST,  
	'likes': TOTAL_LIKES,  
	'post_by': POST_BY,  
	'tags': [TAG1, TAG2, TAG3],  
	'comments': [  
		{  
			'user': COMMENT_BY,  
			'message': TEXT,  
			'dateCreated': DATE_TIME,  
			'likes': LIKES  
		},  
		{  
			'user': COMMENT_BY,  
			'message': TEXT,  
			'dateCreated': DATE_TIME,  
			'likes': LIKES  
		}  
	]
}
```

### <mark style="background: #C900FFA6;">Why maybe not MongoDB?</mark> 

<mark style="background: #C900FFA6;">Key-value</mark> models (e.g. Oracle NoSQL, AWS DynamoDB) can be further optimized due to the simplicity of the data access patterns: query data by a single key.  

<mark style="background: #C900FFA6;">Graph models</mark> (e.g. Neo4j) make it easier to model and navigate relationships between entities (e.g. social networks).  

<mark style="background: #C900FFA6;">In-memory “caching”</mark> DBs (e.g. Redis) may perform considerably better for reads for all sorts of workloads and better for writes as the workloads increase.  

Speedup at the expense of reliability.

### <mark style="background: #C900FFA6;">Hybrid Approach</mark>

Using different DB technologies for different storage requirements:
![[Pasted image 20260311141129.png]]
