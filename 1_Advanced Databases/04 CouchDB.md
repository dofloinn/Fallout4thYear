### <mark style="background: #04FF00A6;">What is Apache CouchDB?</mark>

An open source document based key-value storage NoSQL database

Uses JSON to store data

CouchDB was written in Erlang programming language (https://www.erlang.org/)

It was started by Damien Katz in 2005. 

Became an Apache project in 2008.

JavaScript as its query language

Provides a RESTful API

REST (REpresentational State Transfer) paradigm

Provides standards which streamline communication between web components

Separate concerns of the client and the server

A RESTful web application exposes information about itself in the form of information about its resources

It also enables the client to take actions on those resources, such as create new resources (i.e. create a new user) or change existing resources (i.e. edit a post).

![[Pasted image 20250925162235.png]]Stateless

<mark style="background: #04FF00A6;">Stateless:</mark>
- The server does not need to know anything about what state the client is in and vice versa
- A request from the client to the server must contain all information the server needs to understand and complete the request
- Client must keep the state if needed

### <mark style="background: #04FF00A6;">How is data stored in CouchDB:</mark>

<mark style="background: #04FF00A6;">Primary unit of data is a document:</mark>
- Can consist of any number of fields and attachments
- Also include metadata maintained by the database system

Each database is a collection of documents

An application may access multiple databases on different servers

![[Pasted image 20250925162526.png]]
### <mark style="background: #04FF00A6;">Interacting with CouchDB:</mark>

Use HTTP request headers

<mark style="background: #04FF00A6;">Through these requests:</mark>
- Can retrieve data/databases
- Store data/databases
- View data/databases
- Configure data/databases

![[Pasted image 20250925162539.png]]

<mark style="background: #04FF00A6;">GET − Used to get a specific item:</mark>
- Different items require different URL patterns.
- GET request can be used to retrieve static items e.g. database documents and configuration, statistical information
- Will be in JSON format (mostly)

<mark style="background: #04FF00A6;">POST − Used to upload data:</mark> Can be used to set values, upload documents, set document values, and can also start certain administration commands.

<mark style="background: #04FF00A6;">PUT:</mark> Create new objects, databases, documents, views and design documents.

<mark style="background: #04FF00A6;">DELETE:</mark> Delete documents, views, and design documents.

<mark style="background: #04FF00A6;">COPY:</mark> Using COPY method, you can copy documents and objects.

### <mark style="background: #04FF00A6;">CouchDB Architecture:</mark>

![[Pasted image 20250925162842.png]]

### <mark style="background: #04FF00A6;">cURL (Client URL Utility):</mark>

A command line utility used to transfer data

Using Curl (Client URL) you exchange data between a client and a server

Working on your own machine – launch a command window (or Git Bash)

```bash
curl -X GET http://admin:couchdb@127.0.0.1:5984
curl -X GET http://admin:couchdb@127.0.0.1:5984/_all_dbs
```

<mark style="background: #04FF00A6;">The API can be subdivided into the following sections:</mark>
- Server
- Databases
- Documents
- Replication

### <mark style="background: #04FF00A6;">Server:</mark>

```bash
curl -X GET
http://adminusername:adminpassword@serveraddress:port#
curl -X GET http://admin:couchdb@127.0.0.1:5984
```

### <mark style="background: #04FF00A6;">Databases:</mark>

```bash
curl -X GET http://admin:CouchDB@127.0.0.1:5984/_all_dbs
```

### <mark style="background: #04FF00A6;">Create a Database:</mark>

```bash
curl -X PUT
http://admin:couchdb@127.0.0.1:5984/dbdemo
```

### <mark style="background: #04FF00A6;">Delete a database:</mark>

```bash
curl -X DELETE
http://admin:couchdb@127.0.0.1:5984/dbdemo1
```

### <mark style="background: #04FF00A6;">All Documents:</mark>

```bash
curl -X GET
http://admin:couchdb@127.0.0.1:5984/examresults/_all_docs
```

### <mark style="background: #04FF00A6;">Get a document:</mark>

```
curl -X GET http://admin:couchdb@127.0.0.1:5984/examresults/ddaac67cbfc0cd252b93a072500004ac
```

You need to provide the id.
Results in the document:
```
`{"_id":"ddaac67cbfc0cd252b93a072500004ac","_rev":"5- 5b7375dbfc4f0b730c17d7cd9ff540db","studentid":69,"firs tname":"Peter smith","lastname":"Mcclain","examid":37,"examdate":"20 19-12-01","score":60.15,"grade":"C"}`
```

### <mark style="background: #04FF00A6;">Documents:</mark>

Each document in CouchDB has an ID.

This ID is unique per database.

You are free to choose any string to be the ID, but for best results use a UUID (or GUID),
- i.e., a Universally (or Globally) Unique Identifier
- Random numbers (you should allow the DB to allocate) that have such a low collision probability that everybody can make thousands of UUIDs a minute for millions of years without ever creating a duplicate.

Ensure two independent people cannot create two different documents with the same ID. Collision

### <mark style="background: #04FF00A6;">Insert a Document:</mark>

Assigning id: S12345-databases

```bash
curl -X PUT http://admin:couchdb@127.0.0.1:5984/examresults/S12345-databases \
	-H "Content-Type: application/json" \
	-d '{
		"student_id": "S12345",
		"course": "Databases",
		"score": 82
	}’
```

Letting Couch Assign the ID

```bash
curl -X POST http://admin:couchdb@127.0.0.1:5984/examresults \
	-H "Content-Type: application/json" \
	-d '{
		"student_id": "S12345",
		"course": "Databases",
		"score": 82
	}'
```

### <mark style="background: #04FF00A6;">Documents:</mark>

The central data structure.

JSON format.

Can have attachments.

### <mark style="background: #04FF00A6;">Revisions:</mark>

<mark style="background: #04FF00A6;">If you want to change a document in CouchDB</mark>
- The full document is loaded out of CouchDB
- Changes are made to the JSON structure (or object, when you are doing actual programming)
- The document is saved as a <mark style="background: #04FF00A6;">new revision</mark> he entire of that document back into CouchDB
- A revision identified is part of the metadata
- Each revision is identified by a new <mark style="background: #04FF00A6;">_rev</mark> value

If you want to update or delete a document, then CouchDB expects you to include the \_rev field of the revision you wish to change.

When CouchDB accepts the change, it will generate a new revision number.
- This ensures that, if somebody else made a change before you got to request the document update, CouchDB will not accept your update because you are likely to overwrite data you didn’t know existed.
- Simple language: whoever saves a change to a document first, wins.

### <mark style="background: #04FF00A6;">Bulk Loading Data:</mark>

Suppose we want to create a database that has information about student achievements on different courses

Rather than create documents one by one we can bulk load the data

<mark style="background: #04FF00A6;">First create the database:</mark>
```bash
curl -X PUT
http://admin:couchdb@127.0.0.1:5984/students
```

<mark style="background: #04FF00A6;">Then load the data:</mark>
```bash
curl -X POST
http://admin:couchdb@127.0.0.1:5984/students/_bulk_docs -H
"Content-type: application/json" -d @setupstudentdata.json
```

<mark style="background: #04FF00A6;">Verify the data:</mark>
```bash
curl http://admin:couchdb@127.0.0.1:5984/students/_all_docs
```

### <mark style="background: #04FF00A6;">Fauxton</mark>

![[Pasted image 20250925164519.png]]

### <mark style="background: #04FF00A6;">Design Document</mark>

A special type of document within a CouchDB database.

You can use design document to build indexes, validate document updates, format query results, and filter replications.

Contain application code (javascript)

Like normal documents except prefixed by \_design (this is the
id)

CouchDB looks for views and other application functions in the design documents

### <mark style="background: #04FF00A6;">Design Documents:</mark>

CouchDB delegates computation of design documents functions to <mark style="background: #04FF00A6;">query servers</mark>
- A Query server is an external process that communicates with CouchDB by JSON protocol
- Communicates through stdio interface
- Processes all design functions calls, such as JavaScript views.

### <mark style="background: #04FF00A6;">CouchDB Architecture:</mark>

By default, CouchDB has a built-in Javascript query server

We can define JavaScript functions to pull back documents/parts of documents we want to query

We can also configure other engines if we wish to

### <mark style="background: #04FF00A6;">Mango Query Server</mark>

CouchDB also has a built-in Mango query server for us to query documents.

Mango is a MongoDB inspired query language interface

Designed to be simple to implement on the client side

Providing users a more natural conversion to Apache CouchDB than using the standard RESTful HTTP interface

![[Pasted image 20250925171505.png]]

Mango provides a single HTTP API endpoint that accepts JSON bodies via ``HTTP POST``.

These bodies provide a set of instructions that will be handled with the results being returned to the client in the same order as they were specified.

### <mark style="background: #04FF00A6;">View</mark>

Views are the primary tool used for querying and reporting on CouchDB documents

<mark style="background: #04FF00A6;">Used for:</mark>
- Filtering documents to find those relevant to a particular process
- Extracting data from documents and presenting it in a specific order.
- Building efficient indexes to find documents by any value or structure that resides in them.
- Use these indexes to represent relationships among documents.
- Make calculations on the data in your documents.

CouchDB’s MapReduce queries are stored in the views field of design documents.

### <mark style="background: #04FF00A6;">MapReduce</mark>

Invented by Google

No Join between documents

<mark style="background: #04FF00A6;">Map function:</mark> builds a list of key/value pairs

<mark style="background: #04FF00A6;">Reduce function:</mark> Reduces this down to a single result

![[Pasted image 20250925171825.png]]

### <mark style="background: #04FF00A6;">View</mark>

Suppose we have three documents.

We want to filter based on date and title.

We create a Javascript function 

```js
function(doc) {
	if(doc.date && doc.title) {
		emit(doc.date, doc.title);
	}
}
```

<mark style="background: #04FF00A6;">This is a MAP function</mark>

We can create this view function as a string stored inside the views field of a design document.

<mark style="background: #04FF00A6;">emit() function:</mark>
- Always takes two arguments: the first is <mark style="background: #04FF00A6;">key</mark>, and the second is <mark style="background: #04FF00A6;">value</mark>.
- Creates an entry in our view result.
- Can be called multiple times in the map function to create multiple entries in the view results from a single document.

```json
{
	"_id": "_design/students",
	"views": {
	"by_course": {
		"map": "function(doc) { if (doc.course_name) {
		emit(doc.course_name, doc); } }"
	},
	"by_degree": {
	"map": "function(doc) { if (doc.degree_name) {
	emit(doc.degree_name, doc); } }"
	}
	}
}
```

### <mark style="background: #04FF00A6;">View - Filter:</mark>

Suppose we want to query our Students data by course and by
degree

<mark style="background: #04FF00A6;">To create this view you can use this command:</mark>

```bash
curl -X PUT http://admin:couchdb@127.0.0.1:5984/students/_design/students \
	-H "Content-Type: application/json" \
	-d '{
		"_id": "_design/students",
		"views": {
			"by_course": {
				"map": "function(doc) { if (doc.course_name) { emit(doc.course_name, doc); } }"
			},
			"by_degree": {
				"map": "function(doc) { if (doc.degree_name) { emit(doc.degree_name, doc); } }"
			}
		}
	}'
```

``<Curl Command> <server>/db/_design/nameofdesigndoc –d {view : map function}``

We then query the view, CouchDB takes the source code and runs it for you on every document in the database your view was defined in. You query your view to retrieve the view result using the following command:

``curl -X GET "http://admin:couchdb@127.0.0.1:5984/students/_design/students/_view/by_course"``

### <mark style="background: #04FF00A6;">Map Functions</mark>

<mark style="background: #04FF00A6;">All map functions have a single parameter doc:</mark>
- This is a single document in the database.
- In our example the map function checks whether our document has a `course_name` attribute
- It then calls the built-in emit() function with that attribute as an argument
- `emit()` takes 2 arguments
- The first is key, the second is value
- This creates an entry in our View Result
- It can be called multiple times in a map function to create multiple entries in the view result from a single document

CouchDB uses a B-tree storage engine.

<mark style="background: #04FF00A6;">B-tree:</mark> a sorted data structure that allows for searches, insertions, and deletions in logarithmic time

![[Pasted image 20250930104016.png]]

### <mark style="background: #04FF00A6;">How does it work?</mark>

When you query your view, CouchDB takes the source code and runs it for you on every document in the database.

<mark style="background: #04FF00A6;">If you have a lot of documents, that takes quite a bit of time:</mark>
- CouchDB is designed to avoid any extra costs: it only runs through all documents once, when you first query your view.
- If a document is changed, the map function is only run once, to recompute the keys and values for that single document.

<mark style="background: #04FF00A6;">The view result is stored in a B-tree, just like the structure that is responsible for holding your documents:</mark>
- View B-trees are stored in their own file.
- The B-tree provides very fast lookups of rows by key, as well as efficient streaming of rows in a key range. In our example, a single view can answer all questions that involve time: “Give me all the blog posts from last week” or “last month” or “this year.”

### <mark style="background: #04FF00A6;">MapReduce</mark>

<mark style="background: #04FF00A6;">Reduce</mark> function operates on rows emitted from the map function

Suppose for our course data we wanted to count how many students were taking a course

We create a design document ``coursematch``

<mark style="background: #04FF00A6;">We define a map function to emit course names:</mark>
```JS
if (doc.course_name) {
	emit(doc.course_name, 1);
}
```

<mark style="background: #04FF00A6;">We define a reduce function:</mark>

```JS
sum(values)
// we use _sum
```

<mark style="background: #04FF00A6;">To create the design document we need to ensure that CouchDB knows it is a view:</mark>

```json
{ 
	"_id": "_design/course_counts",
	"views": { 
		"course_count": { 
			"map": "function(doc) { if (doc.course_name) { emit(doc.course_name, 1); } }",
			"reduce": "_sum" 
		} 
	}
}
```

<mark style="background: #04FF00A6;">We can execute the view in a Browser:</mark>
http://admin:couchdb@127.0.0.1:5984/students/_design/course_counts/_view/course_count

<mark style="background: #04FF00A6;">Showing the groupings per course:</mark>
http://admin:couchdb@127.0.0.1:5984/students/_design/course_counts/_view/course_count?group=true

### <mark style="background: #04FF00A6;">Consistency</mark>

The CouchDB file layout and commitment system features all <mark style="background: #04FF00A6;">Atomic Consistent Isolated Durable (ACID) properties</mark>.

On-disk, CouchDB never overwrites committed data or associated structures, ensuring the database file is always in a consistent state.

Single document updates (add, edit, delete) are all or nothing, either succeeding entirely or failing completely.

The database never contains partially saved or edited documents

<mark style="background: #04FF00A6;">The CouchDB document update model is lockless and optimistic:</mark>
- Document edits are made by client applications loading documents, applying changes, and saving them back to the database.
- If another client editing the same document saves their changes first, the client gets an edit conflict error on save.
- To resolve the update conflict the latest document version can be opened, the edits reapplied and the update tried again.