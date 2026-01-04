# <mark style="background: #04FF00A6;">01 Introduction</mark>

### <mark style="background: #04FF00A6;">Problem?</mark>

Data (and the ability to use manage and use it) is the main focus of modern computer systems

Volumes of data are growing rapidly

And so is the variation in the type of questions analysis organisations want to conduct using this data, which increasingly requires multiple types of data suited to data models other than relational

### <mark style="background: #04FF00A6;">Big Data 5 Vs:</mark>

![[images/Pasted image 20250924110913.png]]

<mark style="background: #04FF00A6;">Big Data 5 Vs:</mark>
- <mark style="background: #04FF00A6;">Volume:</mark> the size of the data
- <mark style="background: #04FF00A6;">Velocity:</mark> The speed data appears and disappears
- <mark style="background: #04FF00A6;">Veracity:</mark> The reliability of the data
- <mark style="background: #04FF00A6;">Value:</mark> The relevance of the data
- <mark style="background: #04FF00A6;">Variety:</mark> The types of data

### <mark style="background: #04FF00A6;">Big Data:</mark>

![[images/Pasted image 20250924111013.png]]
![[images/Pasted image 20250924111023.png]]

### <mark style="background: #04FF00A6;">Problem?</mark>

Organisations have lots and lots and lots of data that is not necessarily nicely structured and organised

They are constantly collecting more data

### <mark style="background: #04FF00A6;">What is the module about?</mark>

<mark style="background: #04FF00A6;">Making Databases work and implementing:</mark>
- Database design
- Data storage
- Management
- Retrieval
- and Architectures

Databases needed to support contemporary enterprise applications

### <mark style="background: #04FF00A6;">Learning Outcomes:</mark>

<mark style="background: #04FF00A6;">Discuss:</mark> 
- Challenges of, and discriminate between approaches to, database modelling – conceptual, logical, and physical design;
- Database considerations for data integrity, integration, security, query optimisation, performance tuning and concurrency control in contemporary enterprise applications;

<mark style="background: #04FF00A6;">Apply:</mark> Techniques for data integrity, security, data optimisation, performance tuning and concurrency control;

<mark style="background: #04FF00A6;">Understand and apply:</mark> 
- Different approaches to data integration, both semantic and physical;
- Data modelling techniques for logical and physical design to support contemporary enterprise applications;

<mark style="background: #04FF00A6;">Design, create, and query:</mark> 
- A data warehouse;
- A distributed database;
- A document-oriented database

<mark style="background: #04FF00A6;">Critically compare:</mark> The strengths and limitations of different database technologies used in contemporary enterprise applications;

<mark style="background: #04FF00A6;">Discuss:</mark> Recent developments and emerging trends in database technologies and their use in contemporary enterprise applications

### <mark style="background: #04FF00A6;">Module Content:</mark>

<mark style="background: #04FF00A6;">Relational database design:</mark> 
- reviewing and distinguishing between conceptual and logical design
- addressing considerations and implications of implementing physical design from logical design.

<mark style="background: #04FF00A6;">Data warehouses:</mark> 
- definitions, rationale, architectures, design, implementation, and manipulation; 
- dimensional modelling techniques: design of star and snowflakes schemas, types of fact tables, conversion of relational model into dimensional model.

<mark style="background: #04FF00A6;">Distributed databases:</mark> 
- definitions, rationale, architectures, design, implementation, and manipulation; 
- approaches to fragmentation and replication (synchronous and asynchronous); the CAP theorem.

<mark style="background: #04FF00A6;">Document-oriented data stores:</mark> 
- definitions, rationale, architectures, design, implementation, and manipulation; 
- differentiating between document-oriented, key-value pairs, column-oriented and graph types; 
- designing schema-less data structures;.

<mark style="background: #04FF00A6;">Data and database integration:</mark> 
- process, challenges, benefits;
- ETL process for different database types; 
- standards for interoperability and integration including JSON and Web services.

<mark style="background: #04FF00A6;">Optimisation and performance tuning:</mark> 
- understanding the reasons for and the implications of poorly performing queries; 
- identifying poorly performing queries and structures; 
- examining how queries are executed in various database technologies; 
- using constraints and indexes; 
- choosing between alternative execution plans; 
- amending queries to perform more appropriately.

<mark style="background: #04FF00A6;">Security and integrity:</mark> 
- requirements, e.g. confidentiality, integrity, reliability, storage, and availability; 
- security preserving approaches, integrity preserving approaches; 
- polyglot persistence; 
- transactions, concurrency control; 
- the BASE model vs. the ACID model for transactions management.;

Emerging database technologies and application areas.

### <mark style="background: #04FF00A6;">Planned Technologies:</mark>

![[images/Pasted image 20250924112925.png]]

<mark style="background: #04FF00A6;">PostgreSQL:</mark> Relational Database

<mark style="background: #04FF00A6;">CouchDB:</mark> Open-source document-oriented NoSQL database, implemented in Erlang.

<mark style="background: #04FF00A6;">Cassandra:</mark> Open source, distributed and decentralised/distributed storage system (database)

<mark style="background: #04FF00A6;">Redis:</mark> Open-source, in-memory data structure store used as a database, cache, and message broker

<mark style="background: #04FF00A6;">Docker:</mark> You can use Docker on your own local machine to create containers for each database type.

<mark style="background: #04FF00A6;">GitHub codespaces:</mark> You can use GitHub codespaces which will provide you with a cloud-based development environment where you can create containers for each database type.

### <mark style="background: #04FF00A6;">What will we do in the labs?</mark>

<mark style="background: #04FF00A6;">Setup:</mark>
- a relational database (PostgreSQL)
- a document store (CouchDB)
- a column-oriented store (Cassandra)
- an in memory store (Redis)

<mark style="background: #04FF00A6;">Implementing:</mark>
- optimisation
- replication
- partitioning

Porting data between different data models

### <mark style="background: #04FF00A6;">What will the CA require?</mark>

<mark style="background: #04FF00A6;">Design and implement</mark> a polyglot system that integrates both a data warehouse and a production database environment.

<mark style="background: #04FF00A6;">Develop ETL processes</mark> to transfer and transform data between the different data stores. 

<mark style="background: #04FF00A6;">Formulate and execute queries</mark> across the system to address analytical and operational needs.

<mark style="background: #04FF00A6;">Evaluate and apply optimisation strategies</mark>, making informed choices for query performance and system efficiency.

<mark style="background: #04FF00A6;">Implement replication and partitioning</mark> mechanisms to support scalability, fault tolerance, and availability.

<mark style="background: #04FF00A6;">Provide evidence and justification</mark> for all key design and implementation decisions.

<mark style="background: #04FF00A6;">Critically reflect</mark> on the effectiveness of your decisions, considering trade-offs and possible alternatives.

# <mark style="background: #04FF00A6;">02 Data Models</mark>

### <mark style="background: #04FF00A6;">Why are there different types?</mark>

<mark style="background: #04FF00A6;">Nature of applications and user demands has changed over time:</mark>
- Relational databases dominated for decades
- Data integrity and consistency valued over speed of retrieval
- Evolution of web applications, big data and real-time analytics led to alternatives being developed
- Speed of retrieval became more highly valued
- e.g. document, key-value stores, and graph database

<mark style="background: #04FF00A6;">Different models:</mark>
- Suit different application types
- Offer different: Optimisation strategies, Scalability options, Flexibility options, Consistency and Availability options

### <mark style="background: #04FF00A6;">How To Choose a Data Model:</mark>

<mark style="background: #04FF00A6;">Nature of the data:</mark> Structured, semi-structured, unstructured

<mark style="background: #04FF00A6;">Access patterns:</mark> queries, transactions, analytics

Scalability and distribution needs

<mark style="background: #04FF00A6;">Consistency vs availability trade-offs:</mark> CAP theorem and PACELC extension

Integration and interoperability with existing systems

### <mark style="background: #04FF00A6;">Relational Model</mark>

![[images/Pasted image 20250925160445.png]]

<mark style="background: #04FF00A6;">Relational Data Model:</mark>
- Database is a collection of relations
- Relations (Tables) are two dimensional
- Each row represents an entity
- Each column an attribute of that entity

![[images/Pasted image 20250925160605.png]]

### <mark style="background: #04FF00A6;">Relational Data Model:</mark>

Structure

<mark style="background: #04FF00A6;">Schemata:</mark>
- Named, non-empty, typed, and unordered sets of attributes
- Example: Person(ID, Surname, Name, Address)

<mark style="background: #04FF00A6;">Instances:</mark>
- Sets of records, i.e., functions that assign values to attributes
- Example: 12345,’Lawless’,`Deirdre´,’TU Dublin, Central Quad’)

<mark style="background: #04FF00A6;">Constraints:</mark> Integrity constraints: data types, keys, foreign-keys, …

<mark style="background: #04FF00A6;">Operations:</mark>
- Relational algebra (and relational calculus)
- Usually implemented as Structured Query Language (SQL)

### <mark style="background: #04FF00A6;">Strengths of Relational Model:</mark>

<mark style="background: #04FF00A6;">Mature and Standardised:</mark>
- SQL is a well-established, standardised query language (ANSI SQL).
- Decades of research, vendor competition, and industry adoption
- Large ecosystem of tools, tutorials, and community support.

<mark style="background: #04FF00A6;">Proven Fit for Enterprise Systems:</mark>
- Banking, finance, HR, supply chain, ERP — domains requiring accuracy and consistency rely on RDBMS.
- Good track record for mission-critical systems

<mark style="background: #04FF00A6;">Optimised for Structured Data:</mark>
- Well-suited for highly structured, tabular data with clear schema.
- Efficient storage and indexing mechanisms.
- Relational model is mathematically grounded (set theory, relational algebra).

<mark style="background: #04FF00A6;">Data Integrity and Consistency:</mark>
- ACID (Atomicity, Consistency, Isolation, and Durability) Transactions
- Strong constraints (primary keys, foreign keys, unique, check)
- Referential integrity ensures data is not orphaned or inconsistent.

<mark style="background: #04FF00A6;">Expressive Querying:</mark>
- SQL supports complex joins, filtering, aggregation, grouping.
- Optimisers rewrite queries into efficient execution plans.
- <mark style="background: #04FF00A6;">Declarative style:</mark> “what you want” rather than “how to get it.”

<mark style="background: #04FF00A6;">Security and Access Control:</mark>
- Fine-grained access control (roles, grants, views).
- Mature audit, backup, and recovery systems.
- Built-in mechanisms for concurrency control.

### <mark style="background: #04FF00A6;">Weakness of Relational Model</mark>

<mark style="background: #04FF00A6;">Schema Rigidity:</mark>
- Schema changes are global → adding one new attribute means altering the entire table (and often app code).
- Poor fit for semi-structured or fast-evolving data (e.g., user preferences, IoT data).

<mark style="background: #04FF00A6;">Object–Relational Impedance Mismatch:</mark>
- Objects in code (nested structures, pointers, lists) don’t map neatly onto flat relational tables.
- Requires ORM frameworks (Hibernate, ActiveRecord), which add complexity and overhead.
- Leads to performance issues and “leaky abstractions.”

<mark style="background: #04FF00A6;">Scalability and Distribution:</mark>
- Designed for vertical scaling (bigger server), not horizontal (more servers).
- Harder to partition/shard relational data across clusters.
- Replication exists, but eventual consistency models (BASE) are better supported in NoSQL.

<mark style="background: #04FF00A6;">Performance Trade-offs:</mark>
- Great at joins, but joins across huge datasets (billions of rows) can be slow.
- Not ideal for analytical workloads → need separate designs
- <mark style="background: #04FF00A6;">OLTP vs OLAP tension:</mark> same schema isn’t good for both.

<mark style="background: #04FF00A6;">Handling Complex/Unstructured Data:</mark>
- Text, JSON, XML, video, sensor logs
- Relational databases can store them (as BLOBs), but:
- Querying/searching is inefficient.
- Often pushed to external systems (Elasticsearch, S3, NoSQL).

<mark style="background: #04FF00A6;">Flexibility & Developer Experience:</mark>
- In fast-moving projects, relational schema design can slow prototyping.
- NoSQL/document models give developers more freedom to evolve schema alongside the app.

### <mark style="background: #04FF00A6;">SQL</mark>

<mark style="background: #04FF00A6;">SQL</mark> is an example of a declarative query language

<mark style="background: #04FF00A6;">You specify the result of a query and not how it should be obtained:</mark>
- Easier to understand
- Transparently optimisable
- Implementation independent

<mark style="background: #04FF00A6;">STRUCTURE:</mark>
```SQL
SELECT <attribute list> 
FROM <relation list> 
WHERE <conditions>
GROUP BY <grouping attributes>
HAVING <grouping conditions>
ORDER BY <attribute list>;
```

<mark style="background: #04FF00A6;">Additional Keywords:</mark>
```SQL
DISTINCT,
AS,
JOIN,
OR,
MIN,
MAX,
AVG,
SUM,
COUNT,
NOT,
IN,
LIKE,
ANY,
ALL,
EXISTS,
UNION,
EXCEPT,
INTERSECT
```

### <mark style="background: #04FF00A6;">Example:</mark>

<mark style="background: #04FF00A6;">Schema:</mark>
- Product(maker, model, type)
- PC(model, speed, ram, hd, rd)
- Laptop(model, speed, ram, hd, screen)

![[images/Pasted image 20250928212856.png]]

![[images/Pasted image 20250928212919.png]]

![[images/Pasted image 20250928212945.png]]

### <mark style="background: #04FF00A6;">PostgreSQL</mark>

 Open-source, object-relational database management system (ORDBMS). 
 
<mark style="background: #04FF00A6;">Key features include:</mark>
- <mark style="background: #04FF00A6;">ACID compliance</mark> for reliable transactions. 
- <mark style="background: #04FF00A6;">Advanced SQL support</mark>, including joins, sub-queries, window functions, and triggers.
- <mark style="background: #04FF00A6;">Extensibility</mark>, allowing users to define custom data types, functions, and operators.
- <mark style="background: #04FF00A6;">Support for JSON and XML</mark>, enabling hybrid relational and document-based data handling.
- <mark style="background: #04FF00A6;">Scalability and concurrency</mark>, with strong performance for large datasets and many users.
- <mark style="background: #04FF00A6;">Cross-platform compatibility</mark> (Linux, macOS, Windows).

### <mark style="background: #04FF00A6;">Guidelines for choosing the Relational Model</mark> 

<mark style="background: #04FF00A6;">Data Looks Structured:</mark>
- The data has clear entities e.g. customers, orders, products.
- The relationships are predictable and repeat across records.
- A relational model makes sense because tables and foreign keys map naturally to this structure.

<mark style="background: #04FF00A6;">Schema Isn’t Changing:</mark>
- Looking at the data, the columns and attributes are unlikely to change - e.g. always need name, price, quantity, etc.
- A fixed relational schema makes sense when the data structure is stable.

<mark style="background: #04FF00A6;">Need Integrity and Validation:</mark>
- I need to ensure data is valid. e.g. product IDs always need to match existing products, and orders must link to customers.
- Relational databases enforce these constraints automatically, so I don’t have to handle them all in application code.

<mark style="background: #04FF00A6;">Consistency is Critical:</mark>
- If two customers check out at the same time, I can’t risk selling the same item twice.
- ACID transactions guarantee that either the full order is stored or none of it is, ensuring correctness.

<mark style="background: #04FF00A6;">Need to Run Complex Queries:</mark>
- The business wants large scale reports like “total sales per customer by region, broken down by product category.” involving large numbers of tables with analytics.
- SQL in a relational database can handle multi-table joins, grouping, and aggregation efficiently.

<mark style="background: #04FF00A6;">Need Mature Tooling:</mark>
- Need tools like dashboards, ORMs, and BI tools to work out of the box.
- Relational databases integrate smoothly with existing developer tools, making them less effort to maintain.

<mark style="background: #04FF00A6;">Compliance and Auditing are required:</mark>
- The data looks sensitive —e.g. financial or healthcare-related.
- Relational databases offer strong support for auditing, logging, and traceability

### <mark style="background: #04FF00A6;">Non-Relational Model:</mark>

![[Pasted image 20250928215508.png]]

### <mark style="background: #04FF00A6;">Document Data model - Natural Document Data:</mark>

![[Pasted image 20250928215553.png]]

### <mark style="background: #04FF00A6;">Document Oriented Stores</mark>

![[Pasted image 20250928215755.png]]

### <mark style="background: #04FF00A6;">Document Data Model:</mark>

<mark style="background: #04FF00A6;">Structure:</mark>
- Hash map: (large, distributed) key-value data structure
- Values are documents or collections of documents that (usually) contain hierarchical data
- XML, JSON, RDF, HTML, …

<mark style="background: #04FF00A6;">Constraints:</mark> Each value/document is associated with a unique key 

<mark style="background: #04FF00A6;">Operations:</mark>
- Store key-value pair
- Retrieve value by key
- Remove key-value mapping

<mark style="background: #04FF00A6;">Note:</mark> Document stores are often considered to be schemaless, but since the applications usually assume some kind of structure they are rather schema-on-read in contrast to schema-on-write.

![[images/Pasted image 20250928220509.png]]

### <mark style="background: #04FF00A6;">JSON:</mark>

<mark style="background: #04FF00A6;">JSON:</mark>
- **J**ava**S**cript **O**bject **N**otation
- Lightweight data interchange format
- Text format
- Semi-structured data
- JSON objects are written within {curly} braces.
- Each item is a key-value pair.
- The keys and string type values are written within double quotes.
- Other data types—like Integer and Boolean—don’t need to be written in quotes.
- Each item is separated from the next one using a comma (,). There is no comma after the last item.
- Arrays inside JSON strings are written within [square] brackets
- Objects and arrays can be embedded within an object

```SQL
{ 
	"studentDetails": 
	{
		"name" : "Joe",
		"age" : 16,
		"dept" : "computers",
		"hobbies" : ["dance", "books", "public speaking",
		"golf"],
		"isClassLeader" : false
	}
}
```

### <mark style="background: #04FF00A6;">BSON</mark>

<mark style="background: #04FF00A6;">BSON:</mark> Binary JSON. It’s a binary-encoded serialisation format that extends JSON with additional data types and faster encoding/decoding.

<mark style="background: #04FF00A6;">Binary format:</mark>
- More compact and faster to parse than plain text JSON.
- Rich data types. 
- Supports everything JSON does (strings, numbers, arrays, objects) plus extra types like:``int32`` and ``int64`` (different integer sizes), double (floating point), Boolean, date and timestamp, binary data (raw bytes, good for images/files)
- ``ObjectId`` (unique document identifiers in MongoDB)null and regex
- <mark style="background: #04FF00A6;">Traversable</mark> → Designed for fast in-memory traversal, which helps databases like MongoDB efficiently query nested fields.

```JSON
{
	"name": "Joe",
	"age": 16,
	"hobbies": ["dance", "books"]
}
```

```BSON
\x16\x00\x00\x00 // total document size
\x02 name \x00 Joe\x00 // string
\x10 age \x00 16 // 32-bit integer
\x04 hobbies \x00 ... // array
\x00 // end of document
```

### <mark style="background: #04FF00A6;">Document Data Model Example:</mark>

![[Pasted image 20250928221223.png]]![[Pasted image 20250928221235.png]]
![[Pasted image 20250928221251.png]]

### <mark style="background: #04FF00A6;">CouchDB:</mark>

```JSON
{
	"_id": "student_joe_001",
	"studentDetails": {
		"name": "Joe",
		"age": 16,
		"dept": "computers",
		"hobbies": [
			"dance",
			"books",
			"public speaking",
			"golf"
		],
		"isClassLeader": false
	}
}
```

### <mark style="background: #04FF00A6;">CouchDB:</mark>

<mark style="background: #04FF00A6;">_id: Required field in CouchDB:</mark>
- You can provide your own meaningful string (e.g., "student_joe_001")
- Or let CouchDB auto-generate one (if you omit it).

<mark style="background: #04FF00A6;">_rev:</mark> Will be added automatically by CouchDB after the first save and updated on every modification.

### <mark style="background: #04FF00A6;">Strengths of Document Model</mark>

<mark style="background: #04FF00A6;">Flexible Schema:</mark>
- Can handle records with different fields without needing a fixed schema.
- New attributes can be added without database migrations.

<mark style="background: #04FF00A6;">Natural Representation:</mark>
- JSON/BSON documents map neatly to objects in code (less ORM overhead).
- Hierarchical/nested data fits well (e.g., blog post with comments, product with variations).

<mark style="background: #04FF00A6;">Efficient for Whole-Object Access:</mark>
- Fetching a full record is fast — no joins needed for nested data.
- Ideal when the application usually needs the whole document.

<mark style="background: #04FF00A6;">High Scalability and Distribution:</mark>
- Designed to scale horizontally via partitioning (sharding).
- Can be easily replicated for fault tolerance and load balancing.

<mark style="background: #04FF00A6;">Good Fit for Web and APIs:</mark> Works natively with JSON, which is common in REST and GraphQL APIs. 

<mark style="background: #04FF00A6;">High Insert and Read Performance:</mark>
- Writes are efficient since documents are stored as blobs.
- Reads are fast when fetching by ID or simple query.

### <mark style="background: #04FF00A6;">Weakness of Document Model</mark>

<mark style="background: #04FF00A6;">Poor at Complex Relationships:</mark>
- No (or very limited) joins across collections.
- If relationships exist (e.g., users → orders → products), you may duplicate data or handle joins in the application.

<mark style="background: #04FF00A6;">Aggregation Limitations:</mark>
- Some aggregations and analytics are harder or less efficient than in relational DBs.
- Developers often need to use pipelines or external processing.

<mark style="background: #04FF00A6;">Update Costs:</mark>
- Updating a large document may require rewriting the whole object.
- If document size changes a lot, storage fragmentation can occur.

<mark style="background: #04FF00A6;">Inconsistent Schema Enforcement:</mark>
- Flexibility can become a problem if documents drift apart in structure.
- Application code must enforce consistency.

<mark style="background: #04FF00A6;">Distribution Requires Planning:</mark>
- Developers must carefully design partition keys/shards.
- Poor choices can cause hotspots and uneven load.

<mark style="background: #04FF00A6;">Indexing Trade-offs:</mark>
- Indexes improve performance but come at high storage and update costs.
- Multi-field indexes are less flexible than SQL query optimisers.

### <mark style="background: #04FF00A6;">Guidelines for Choosing the Document Model</mark>

<mark style="background: #04FF00A6;">Data Looks Semi-Structured:</mark>
- A rigid schema doesn’t fit — a flexible document model (JSON) is more natural.
- E.g. looking at product catalogues where each item has different attributes- books have authors, electronics have warranty info, clothing has sizes.

<mark style="background: #04FF00A6;">Schema Changes Frequently:</mark>
- e.g. today, need to store `deliveryInstructions`; tomorrow might need `giftWrapOption`.
- With documents, can add new fields without changing the whole database schema.

<mark style="background: #04FF00A6;">Records Are Hierarchical or Nested:</mark>
- e.g. a blog post has comments, tags, likes, and embedded user details.
- All this can live inside a single JSON document instead of spreading across multiple tables.

<mark style="background: #04FF00A6;">Data Will Be Accessed as Whole Objects:</mark>
- e.g. the app often fetches an entire user profile or order with all details at once.
- A single document read is faster than joining multiple relational tables

# <mark style="background: #04FF00A6;">03 JSONB in PostgreSQL</mark>

### <mark style="background: #04FF00A6;">JSON vs JSONB</mark>

<mark style="background: #04FF00A6;">JSON:</mark>
- Textual
- Preserves whitespace/key order
- Duplicates remain (in text)

<mark style="background: #04FF00A6;">JSONB:</mark>
- Binary
- Canonical order
- Removes duplicates (last wins)

<mark style="background: #04FF00A6;">JSONB supports indexing and most operators</mark> Default choice

### <mark style="background: #04FF00A6;">Why JSONB?</mark>

Offers flexibility for semi-structured data - E.g. preferences, events, attributes.

Provides rich operators and JSONPath.

<mark style="background: #04FF00A6;">GIN</mark> is the abbreviation for <mark style="background: #04FF00A6;">Generalised Inverted Index</mark> in PostgreSQL. GIN indexes search operations on various data structures that contain elements, such as arrays, JSONB, and full-text search data.

Allows use of GIN indexing for nested keys - Prefer columns when shape is stable and heavily queried.

### <mark style="background: #04FF00A6;">Core operators you’ll use</mark>

```sql
-- Access
profile->'prefs' -- JSON
profile->>'name' -- text
profile#>'{addr,city}' -- JSON at path
profile#>>'{addr,city}' -- text at path
-- Existence / containment
profile ? 'verified' -- key exists
profile @> '{"addr":{"country":"IE"}}'::JSONB
-- Arrays
JSONB_array_elements(profile#>'{prefs,langs}') -- SRF
-- Merge & delete
profile || '{"verified": true}'::JSONB
profile - 'age'
profile #- '{addr,city}'
```

### <mark style="background: #04FF00A6;">JSONPath:</mark>

```sql
CREATE TABLE orders (
	id serial primary key,
	customer text,
	props JSONB
);
-- Suppose in props we have:
{
	"items": [
		{ "name": "Apple", "qty": 3, "price": 0.5 },
		{ "name": "Banana", "qty": 1, "price": 0.2 },
		{ "name": "Orange", "qty": 5, "price": 0.4 }
	]
}
-- Any item with quantity >=2
JSONB_path_exists(props, '$.items[*] ? (@.qty >= 2)’)
-- All item names
JSONB_path_query(props, '$.items[*].name’)
-- All prices
JSONB_path_query(props, '$.items[*].price')
```

### <mark style="background: #04FF00A6;">Indexing strategies</mark>

Use GIN on JSONB for containment/exists filters

Generated columns + B-Tree for hot fields and sorting: A <mark style="background: #04FF00A6;">hot field</mark> is simply a field in your JSON (or a regular column) that you <mark style="background: #04FF00A6;">query or sort on very often</mark>.

<mark style="background: #04FF00A6;">Use Partial indexes to keep size under control:</mark>
- Sorting on JSON?
- Use a generated column and index it.

### <mark style="background: #04FF00A6;">Indexing examples</mark>

```sql
-- General GIN indexes
CREATE INDEX enrollments_grades_gin ON enrollments USING GIN
(grades);
CREATE INDEX students_profile_gin ON students USING GIN
(profile);
-- Promote a hot field
ALTER TABLE enrollments
ADD COLUMN final_mark int GENERATED ALWAYS AS ((grades-
>>'final')::int) STORED;
CREATE INDEX enrollments_final_idx ON enrollments(final_mark);
-- Partial index example
CREATE INDEX enrollments_has_final ON enrollments USING GIN
(grades)
WHERE grades ? 'final';
```

### <mark style="background: #04FF00A6;">Data quality and constraints</mark>

```sql
ALTER TABLE enrollments
	ADD CONSTRAINT grades_is_object
	CHECK (JSONB_typeof(grades) = 'object');
	
ALTER TABLE enrollments
	ADD CONSTRAINT final_0_100 CHECK (
	(grades ? 'final') IS NOT TRUE
	OR ((grades->>'final')::int BETWEEN 0 AND 100)
);
```

### <mark style="background: #04FF00A6;">Modelling patterns:</mark>

<mark style="background: #04FF00A6;">Hybrid:</mark> If you have stable IDs and frequently filtered fields as columns with a long-tail in JSONB

<mark style="background: #04FF00A6;">Event log:</mark> props JSONB per event; index name + common keys

<mark style="background: #04FF00A6;">Attribute bag:</mark> keep in JSONB; promote stable keys to columns later

### <mark style="background: #04FF00A6;">Performance and Gotchas</mark>

<mark style="background: #04FF00A6;">Cast explicitly:</mark> JSON numbers → ``::int/::numeric``

<mark style="background: #04FF00A6;">Missing vs null:</mark> JSON null ≠ SQL NULL; use ? to test presence

<mark style="background: #04FF00A6;">Duplicate keys:</mark> JSONB keeps only the last; avoid duplicates

<mark style="background: #04FF00A6;">GIN indexes can be large</mark> → consider partial indexes / generated columns

<mark style="background: #04FF00A6;">Use LATERAL carefully:</mark> Explode arrays only when needed

### <mark style="background: #04FF00A6;">Rules of Thumb</mark>

Start flexible with JSONB while requirements churn

As fields stabilise and become critical - promote to columns based on usage patterns

Index what you filter/sort on

Keep indexes lean

# <mark style="background: #04FF00A6;">04 CouchDB</mark>

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

![[Pasted image 20250925162235.png]]

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

<mark style="background: #04FF00A6;">Server:</mark>
```bash
curl -X GET
http://adminusername:adminpassword@serveraddress:port#
curl -X GET http://admin:couchdb@127.0.0.1:5984
```

<mark style="background: #04FF00A6;">Databases:</mark>
```bash
curl -X GET http://admin:CouchDB@127.0.0.1:5984/_all_dbs
```

<mark style="background: #04FF00A6;">Create a Database:</mark>
```bash
curl -X PUT
http://admin:couchdb@127.0.0.1:5984/dbdemo
```

<mark style="background: #04FF00A6;">Delete a database:</mark>
```bash
curl -X DELETE
http://admin:couchdb@127.0.0.1:5984/dbdemo1
```

<mark style="background: #04FF00A6;">All Documents:</mark>
```bash
curl -X GET
http://admin:couchdb@127.0.0.1:5984/examresults/_all_docs
```

<mark style="background: #04FF00A6;">Get a document:</mark>
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
- The document is saved as a <mark style="background: #04FF00A6;">new revision</mark> the entirety of that document is loaded back into CouchDB
- A revision identified is part of the metadata
- Each revision is identified by a new <mark style="background: #04FF00A6;">_rev</mark> value

If you want to update or delete a document, then CouchDB expects you to include the \_rev field of the revision you wish to change.

<mark style="background: #04FF00A6;">When CouchDB accepts the change, it will generate a new revision number:</mark>
- This ensures that, if somebody else made a change before you got to request the document update, CouchDB will not accept your update because you are likely to overwrite data you didn’t know existed.
- <mark style="background: #04FF00A6;">Simple language:</mark> whoever saves a change to a document first, wins.

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

Contain application code (JavaScript)

Like normal documents except prefixed by \_design (this is the id)

CouchDB looks for views and other application functions in the design documents

### <mark style="background: #04FF00A6;">Design Documents:</mark>

CouchDB delegates computation of design documents functions to <mark style="background: #04FF00A6;">query servers</mark>
- A Query server is an external process that communicates with CouchDB by JSON protocol
- Communicates through stdio interface
- Processes all design functions calls, such as JavaScript views.

### <mark style="background: #04FF00A6;">CouchDB Architecture:</mark>

By default, CouchDB has a built-in JavaScript query server

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
			"map": "function(doc) { 
				if (doc.course_name) {
					emit(doc.course_name, doc); 
				} 
			}"
		},
		"by_degree": {
			"map": "function(doc) { 
				if (doc.degree_name) {
					emit(doc.degree_name, doc); 
				} 
			}"
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

# <mark style="background: #04FF00A6;">06 Data Replication</mark>

### <mark style="background: #04FF00A6;">What is replication?</mark>
- Process of copying or updating data from one location to another  
- Often in real-time or near real-time

![[Pasted image 20251002160806.png]]

### <mark style="background: #04FF00A6;">Why?</mark>

<mark style="background: #04FF00A6;">If we store all our data in a single database and that database crashes:</mark>  
- Without replication data would at minimum become unavailable and applications unusable
- At its most catastrophic, data could be lost

<mark style="background: #04FF00A6;">If we operate in multiple geographic locations</mark>
- If we have a single database that is located in a single region, other regions will experience latency and our application performance will be impacted
- We operate applications that generate millions of queries to a database at the same time. 
- A single database would not be able to cope

### <mark style="background: #04FF00A6;">Use Cases</mark>  

<mark style="background: #04FF00A6;">High Availability:</mark> 
- Helps ensure data availability and minimise downtime.  
- By maintaining copies of data in multiple locations or systems, organisations can continue operations even if one system fails.  
- Critical for businesses that require uninterrupted access to their data, such as e-commerce websites, financial institutions, and healthcare providers.  

<mark style="background: #04FF00A6;">Fault Tolerance:</mark>  
- If one server or data centre experiences a hardware failure, a natural disaster, or any other catastrophic event, data can still be retrieved from another location.  
- Helps in preventing data loss and maintaining business continuity

<mark style="background: #04FF00A6;">Scaling and Performance:</mark>
- Can improve system performance by distributing read operations across multiple replicas, reducing the load on the primary source.  
- Particularly beneficial for read-intensive workloads and large-scale applications.  

<mark style="background: #04FF00A6;">Load Balancing:</mark>  
- Can distribute read and write requests across multiple servers or locations, thereby balancing the load on the system.  
- Particularly important for high-traffic websites and applications, as it can improve performance and reduce response times.  

<mark style="background: #04FF00A6;">Real-time Analytics:</mark>  
- Replicating data to a separate system or data warehouse allows organisations to run real-time analytics and reporting without impacting the performance of their primary operational database

<mark style="background: #04FF00A6;">Compliance and Data Governance:</mark>
- Replicating data can assist organisations in meeting compliance requirements, as it provides redundancy and data security. It also enables the implementation of data retention policies and auditing capabilities.  

<mark style="background: #04FF00A6;">Geographic Distribution:</mark>  
- Organisations with a global presence may use data replication to ensure that users in different regions have low-latency access to data.  
- Common in content delivery networks (CDNs) and cloud services, where data is replicated to servers in multiple geographic locations.

<mark style="background: #04FF00A6;">Data Backup and Archiving:</mark>
- Replicating data to secondary systems or storage media provides a means for data backup and archiving. This helps in protecting against data loss due to accidental deletion, corruption, or malicious actions, and it allows for long-term data retention.  

<mark style="background: #04FF00A6;">Disaster Recovery:</mark>  
- Data replication is a key component of disaster recovery strategies. By keeping data copies offsite or in geographically dispersed locations, organisations can recover their data and systems in the event of a disaster, such as fires, floods, or cyberattacks.

<mark style="background: #04FF00A6;">Database Maintenance:</mark>
- During maintenance or upgrades of a database system, data replication can ensure that the application remains operational.
- Organisations can route traffic to a secondary database while performing maintenance on the primary one.  

<mark style="background: #04FF00A6;">Migrating Data:</mark>  
- Data replication is useful when migrating data from one system to another, ensuring that both systems remain synchronised during the transition period.

### <mark style="background: #04FF00A6;">Replication Models/Architecture: Leader → Follower (AKA Primary → Replica, or Single Leader)</mark>

Allows data to be stored on multiple nodes/centres.  

But only one node (leader/primary) can update the data.  

The other node (follower/replica) have copies of the data and can be queried.  

When an update occurs on the Leader, the data on the slaves is also updated.

![[Pasted image 20251002162408.png]]

### <mark style="background: #04FF00A6;">Leader → Follower</mark>

When a client wants to execute a write query it is sent to the Leader/Primary node who executes it and stores the result to its local store.  

The Leader/Primary then sends data changes to the Followers/Replicas.  

The Follower/Replica applies the change to its own local data.  

If a Follower/Replica goes offline, another Follower/Replica can replace it.  

If a Leader/Primary goes offline one of the Followers/Replicas is promoted to become leader/primary.

![[Pasted image 20251002162506.png]]

<mark style="background: #04FF00A6;">Benefits:</mark>
- Spread the read load  
- Followers take the read load off the leader

![[Pasted image 20251002162557.png]]

When the leader executes the change, it forwards the change immediately to the followers.  

Replication can then happen

<mark style="background: #04FF00A6;">Synchronously:</mark>  
- The write is not considered complete until all followers have executed it.  
- The client that made the request has to wait for the Leader to inform it that the change has been made to all followers  
- <mark style="background: #04FF00A6;">Disadvantages:</mark> if one follower doesn’t respond the write won’t be completed 
- <mark style="background: #04FF00A6;">Advantage:</mark> Followers are guaranteed an up-to-date copy of the data  

<mark style="background: #04FF00A6;">Asynchronously:</mark>
- Once the leader write is complete, the client is notified that the request is complete. The follower updates will eventually be executed.  
- <mark style="background: #04FF00A6;">Disadvantage:</mark> if the leader fails before the update is sent, the changes to followers is lost and they will be perpetually inconsistent. As such the write is not durable even though the leader has successfully executed it.  
- <mark style="background: #04FF00A6;">Advantage:</mark> Speeds up performance.

### <mark style="background: #04FF00A6;">Replication Models/Architecture: Multi-leader (AKA Multi-Primary, Active to Active)</mark>

All the nodes are primary/leaders.

All the nodes can process read and write requests.  

Clients can send read/write requests to any nodes.  

Each node propagates its changes to every other node so that the system stays consistent.

Each primary/leader node is a follower of primary/leader node.  

But each primary/leader node will have its own followers (which may be just followers).

![[Pasted image 20251002163011.png]]

Conflicts may arise if two nodes received conflicting write requests.  

Need a conflict resolution mechanism to allow data to come to a stable state.  

Usually this involves the nodes communicating with each other and using a consensus algorithm or using a more brute force mechanism of timestamps to resolve.  

Once resolution is reached, the latest update is kept, and the rest are discarded.

More flexible than the Primary-Follower model.  

Even if one of the databases goes down the other primaries can be used to update the database.  

If the system is asynchronous then if one of the databases goes down, it can lead to an inconsistent state.  

The need for conflict resolution complicates things.  

This complication increases as more databases become involved.

<mark style="background: #04FF00A6;">Benefits:</mark>
- <mark style="background: #04FF00A6;">High availability:</mark> Because data is replicated across multiple nodes, if one node goes down, clients can still access the database through the other nodes.  
- <mark style="background: #04FF00A6;">Load balancing:</mark> By spreading read and write traffic across multiple nodes, multi-leader replication can help distribute the load on the database system.  
- <mark style="background: #04FF00A6;">Geographic distribution:</mark> Can improve performance particularly when dealing with geographic distribution

### <mark style="background: #04FF00A6;">Leaderless/Peer-to-Peer</mark>

No concept of a primary/leader.  

Nodes in the leaderless setting are considered peers and all of them accept writes and reads from the client.  

Without a leader that handles all write requests, leaderless replication offers better availability

![[Pasted image 20251002163310.png]]

<mark style="background: #04FF00A6;">For a write request:</mark>
- The client broadcasts the request to all replicas instead of a special node (the leader)
- It then waits for a certain number of acknowledgments from other nodes.  

<mark style="background: #04FF00A6;">For a read request:</mark>
- The client contacts all replicas and waits for a set number of responses  
- Because the client waits for many responses, this approach is also called a quorum

<mark style="background: #04FF00A6;">Benefits:</mark>
- <mark style="background: #04FF00A6;">Scalability:</mark> Allows for easy horizontal scaling - new nodes can be added to the system without the need for a central leader node to coordinate the process 
- <mark style="background: #04FF00A6;">Fault tolerance:</mark> With no central leader, the system is more resilient to node failures - the absence of a single point of failure means that the system can continue to operate even if some nodes go down. 
- <mark style="background: #04FF00A6;">Load Distribution:</mark> Load can be distributed across nodes in a balanced manner - each node is capable of handling both reads and writes, distributing the processing load and improving overall system performance.

### <mark style="background: #04FF00A6;">Types/Approaches</mark>

<mark style="background: #04FF00A6;">Leader → Follower:</mark>
- Only one node (leader) can update the data.  
- The other nodes (followers) have copies of the data and can be queried.  

<mark style="background: #04FF00A6;">Multi-Leader:</mark>
- All the nodes are leaders.  
- All the nodes can process read and write requests.  
- Each node propagates its changes to every other node so that the system stays consistent.  
- Each node may have its followers which are part of a leader->follower replication.  

<mark style="background: #04FF00A6;">Leaderless/Peer-to-Peer:</mark>
- No concept of a primary/leader.  
- Nodes are considered peers and all of them accept writes and reads from the client.  
- For a write request, the client broadcasts the request to all replicas instead of a special node and waits for a certain number of acknowledgments from other nodes.  
- For a read request, the client contacts all replicas and waits for a set number of responses

### <mark style="background: #04FF00A6;">Question</mark>

You are Netflix — evaluate each of the models and identify pros and cons of each  

Discuss in your groups for 5 mins and prepare to feed back to the class

<mark style="background: #04FF00A6;">Leader–Follower (Primary–Replica):</mark> 
- How would a single leader affect performance with millions of global users?  
- What happens if the leader goes down? 
- Are reads and writes well balanced for Netflix’s workload?  

<mark style="background: #04FF00A6;">Multi-Leader (Active–Active):</mark>
- How does this help with writes from users in different regions (e.g. Europe, US, Asia)?  
- What kind of conflicts might arise (e.g., two updates to the same user profile)?  
- How complex is conflict resolution in this scenario?  

<mark style="background: #04FF00A6;">Leaderless (Peer-to-Peer):</mark>
- How would this model improve availability if a data center fails?  
- What consistency issues might show up (e.g., user sees outdated watch history)?  
- Is eventual consistency acceptable for Netflix’s main use cases?

### <mark style="background: #04FF00A6;">Some Questions to consider for Netflix:</mark>

Which replication model(s) provide the lowest latency for streaming video?  

Where do you need strong consistency?  

Where can you accept eventual consistency ?  

How do the replications models support scaling to hundreds of millions of users?  

What happens during a regional outage — does the model recover quickly?

### <mark style="background: #04FF00A6;">Managing Consistency - Approaches</mark> 

<mark style="background: #04FF00A6;">Synchronous Replication:</mark>
- Update each replica as part of a single atomic transaction  
- Also called eager replication  
- Consensus algorithms apply this approach to achieve strong consistency on a replicated data set  
- Minimal risk of data inconsistency across replicas.  
- Slows performance: There is higher latency for write operations - the primary node has to wait for acknowledgments from all replicas. If any replica is slow or experiences network delays.

<mark style="background: #04FF00A6;">Asynchronous Replication (Lazy Replication):</mark>
- Execute updates as separate transactions  
- Aims to strike a balance between consistency and performance by delaying the propagation of updates to replicas until they are actually needed  
- <mark style="background: #04FF00A6;">Provides eventual consistency:</mark> All replicas will eventually converge to the same state given enough time and absence of new updates.  
- Need to employ a conflict resolution strategy for when concurrent writes occur.  
- Can tolerate failures without impacting the overall performance.  
- Lower latency for write operations as the primary node doesn't wait for acknowledgments from replicas.  
- Data inconsistency is a real potential problem - Particularly if replicas fail before the update is replicated. 
- Read operations on secondary nodes may return slightly stale data until replication catches up.

<mark style="background: #04FF00A6;">Time-based or Version Based Conflict Resolution:</mark>
- Each update is assigned a timestamp or version  
- Replicas are updated based on a predefined schedule or time intervals.  
- Where conflicts arise, such as updates with the same timestamp or updates arriving out of order, a conflict resolution mechanism is needed  
- Could involve comparing timestamps, applying predetermined rules, or involving a central authority to resolve conflicts.

<mark style="background: #04FF00A6;">Monitoring and Alerts for Inconsistencies:</mark>
- Implement a monitoring system that constantly checks the data across replicas for any deviations or discrepancies.
- When inconsistencies are detected, automated alerts can notify administrators/trigger an automatic response - Facilitates investigation and resolution of issues.  
- This helps maintain data consistency by identifying and addressing problems as they arise.  
- Introduces complexity and an overhead which may impact performance  
- Requires extensive knowledge and a comprehensive strategy to be effective  
- Reactive rather than preventative  
- May waste time if other approaches are employed - by the time issue is investigated it may be resolved.

### <mark style="background: #04FF00A6;">Consider this scenario:</mark>

You are working as database engineers for a global e-commerce company (think Amazon).

The company uses a Multi-Leader (Active–Active) replication model to support operations in different regions (e.g., Europe, US, and Asia).  

Each regional data centre can accept both reads and writes, and updates are asynchronously replicated between leaders.

<mark style="background: #04FF00A6;">This setup is chosen to:</mark>  
- Reduce latency (customers write to the nearest data centre).  
- Improve availability (if one region goes offline, others can continue processing).  

A customer updates their shipping address in Europe at the same time as a customer service agent in the US updates it in the system (two different values).  
- Because replication is asynchronous, both updates happen independently before being replicated across regions.  
- Now there is a conflict: Europe has Address = Dublin, Ireland. US has Address = Boston, USA.  
- When replication catches up, the system must decide which update to keep

What consistency approach is being used here?  

What are the risks of this approach?  

How could the system resolve this conflict?  

What trade-offs are being made between performance, availability, and consistency?

### <mark style="background: #04FF00A6;">Summary Answers to Scenario</mark> 

<mark style="background: #04FF00A6;">What consistency approach is being used here?</mark>  
- Asynchronous replication (lazy replication).  
- Each leader accepts writes independently, and changes are propagated later.  
- This improves performance and availability but risks temporary divergence.  

<mark style="background: #04FF00A6;">What are the risks of this approach?</mark>
- <mark style="background: #04FF00A6;">Data inconsistency:</mark> Two conflicting updates exist for the same record.  
- <mark style="background: #04FF00A6;">Stale reads:</mark> Customers or staff may see outdated information depending on which replica they connect to.  
- <mark style="background: #04FF00A6;">Customer confusion / business errors:</mark> Wrong shipping address could lead to failed deliveries

<mark style="background: #04FF00A6;">How could the system resolve this conflict?</mark>
- <mark style="background: #04FF00A6;">Last-write-wins (timestamp-based):</mark> Keep the most recent update — simple but may discard a valid change.
- <mark style="background: #04FF00A6;">Application-level rules:</mark> e.g., customer edits override staff edits (or vice versa). This ties resolution to business rules.
- <mark style="background: #04FF00A6;">Manual resolution:</mark> System detects the conflict and prompts the user to confirm the correct address. Reliable, but slower.
- <mark style="background: #04FF00A6;">Consensus/majority vote:</mark> Leaders exchange updates and decide collectively, but this adds latency and complexity.

<mark style="background: #04FF00A6;">What trade-offs are being made between performance, availability, and consistency?</mark>  
- <mark style="background: #04FF00A6;">Performance:</mark> Asynchronous replication improves write performance (no waiting for all replicas).  
- <mark style="background: #04FF00A6;">Availability:</mark> Each leader can keep accepting writes, even if other regions are offline.  
- <mark style="background: #04FF00A6;">Consistency:</mark> Sacrificed in the short term — replicas may diverge until conflicts are resolved.

<mark style="background: #04FF00A6;">Overall:</mark>
- The system prioritises performance + availability over immediate consistency → aligns with AP systems in the CAP theorem (eventual consistency).  
- Stronger consistency could be achieved with synchronous replication, but at the cost of higher latency and reduced availability.

### <mark style="background: #04FF00A6;">Managing Latency:</mark>

Replicating data across geographically distributed locations can introduce latency - Delay in replicating data.  

Achieving low-latency replication is crucial, especially in scenarios where real-time or near-real-time access to data is essential.  

The approach to replication (synchronous, asynchronous, time-based) has a significant issue.

### <mark style="background: #04FF00A6;">Security:</mark>

Replicating sensitive data across multiple nodes introduces security challenges.  

<mark style="background: #04FF00A6;">Encrypting data during transmission and at rest is important:</mark>
- authorization mechanisms  
- protecting against unauthorized access.  
- data masking at rest

### <mark style="background: #04FF00A6;">Minimising Downtime:</mark>  

Helps maintain a consistent and up-to-date state across all replicated nodes. Any delay in replication could lead to data inconsistencies and potential conflicts.  

<mark style="background: #04FF00A6;">Helps preserve data integrity:</mark> Timely replication ensures that changes made to the data are accurately and reliably propagated to all relevant nodes.  

Often involves having redundant nodes and failover mechanisms. To ensure that if one node becomes unavailable, another can take over seamlessly, providing high availability.  

<mark style="background: #04FF00A6;">Helps ensure a reliable service with minimal disruptions for users:</mark>
- Even in the presence of hardware failures, software issues, or maintenance activities.  
- Reliability and consistent availability contribute to building trust with users and maintaining a positive reputation in the market.

<mark style="background: #04FF00A6;">Automatic Failover:</mark>
- Maintaining one or more replica databases (followers) alongside the primary database (leader).  
- In the event of a leader database failure, automatic failover mechanisms detect the failure and promote one of the replica databases to become the new leader, ensuring continuity of service.  
- Provides redundancy and immediate availability if the leader database experiences a failure ensuring consistency and availability.

<mark style="background: #04FF00A6;">Load Balancing and Traffic Routing:</mark>
- Distribute incoming traffic across multiple database servers, including the leader and replica databases.  
- In case of a failure, load balancers automatically reroute traffic to the available and operational database servers.  
- Where high traffic loads are common, load balancing ensures that database resources are utilised efficiently.  
- When a database server fails, the traffic routing mechanism immediately directs requests to operational servers, mitigating downtime and maintaining a responsive shopping experience.

<mark style="background: #04FF00A6;">Geographic Redundancy and Failover:</mark>
- Deploy replica databases in different geographic regions or data centres.  
- In the event of a regional outage or catastrophic failure, traffic can be redirected to a replica in another region, ensuring service continuity.  
- Where customers are in different regions and expect uninterrupted service, geographic redundancy minimises the impact of regional outages.

### <mark style="background: #04FF00A6;">Consider this Scenario:</mark>

Suppose we have a Primary in Dublin and a replica in Sydney  

What problems arise, and how would you fix them? 

<mark style="background: #04FF00A6;">Consider latency:</mark>
- How long will it take for data written in Dublin to appear in Sydney?  
- What problems could stale data cause for users in Australia?  
- Would synchronous or asynchronous replication be better here?

<mark style="background: #04FF00A6;">Consider failover and downtime:</mark>
- If the Dublin primary crashes, what happens to users?  
- How can we promote Sydney to primary quickly?  
- What mechanisms (automatic failover, monitoring) would you need?

<mark style="background: #04FF00A6;">Consider load balancing:</mark>
- Can we route read requests to Sydney while keeping writes in Dublin?  
- How would this help reduce latency and load on Dublin?

<mark style="background: #04FF00A6;">Consider geographic redundancy:</mark>
- What if there’s a regional outage in Dublin (e.g., power or network failure)?  
- Should we have replicas in multiple regions (not just Dublin + Sydney)?

<mark style="background: #04FF00A6;">Consider security:</mark> 
- How do we protect sensitive data as it travels between Dublin and Sydney? 
- What measures (e.g., encryption in transit, secure authentication) are needed to prevent unauthorized access?

### <mark style="background: #04FF00A6;">Consider this Scenario - Solution</mark> 

<mark style="background: #04FF00A6;">Latency:</mark>
 - Writes in Dublin take time to replicate to Sydney (high network latency across continents).  
 - Users in Australia may see stale data.  
 - Use asynchronous replication for better performance, but warn about possible stale reads.  
 - For critical data, use regional leaders (multi-leader replication) so writes can be made closer to the user.

<mark style="background: #04FF00A6;">Failover and Downtime:</mark>
- If Dublin fails, all writes stop until Sydney can be promoted to primary. This risks long downtime.  
- Implement automatic failover (e.g., monitoring, election of a new leader).  
- Keep health checks running across both regions.  
- Consider a multi-leader setup to allow both Dublin and Sydney to accept writes.

<mark style="background: #04FF00A6;">Load Balancing:</mark>
- Dublin may become overloaded handling global requests.  
- Route read queries to Sydney to reduce Dublin’s load. 
- Use a global load balancer to direct users to the nearest replica for reads. 
- Ensure eventual consistency is acceptable for non-critical reads.

<mark style="background: #04FF00A6;">Geographic Redundancy:</mark>
- If Dublin suffers a regional outage (e.g., power failure), Sydney alone may not handle all traffic.  
- Deploy additional replicas in multiple geographic regions (e.g., North America, Asia).  
- Use geo-distributed replication with failover between regions. 
- Apply disaster recovery planning (cold or warm standby replicas).

<mark style="background: #04FF00A6;">Security:</mark>
- Replicating sensitive data across continents increases exposure to attacks.  
- Encrypt data in transit and at rest in both Dublin and Sydney.  
- Use secure authentication/authorization for replication streams.  
- Apply data masking if compliance requires it (e.g., GDPR).

### <mark style="background: #04FF00A6;">Replication in CouchDB:</mark>

Persistent replication in CouchDB is controlled through a document in the <mark style="background: #04FF00A6;">_replicator</mark> database.

Each <mark style="background: #04FF00A6;">document in _replicator</mark> describes one replication process.  

When a replication task is initiated on the sending node, it is called push replication, if it is initiated by the receiving node, it is called pull replication.

<mark style="background: #04FF00A6;">Can be:</mark>
- Leader → Follower or Primary → Replica  
- Active to Active/Multi-Primary

During replication, CouchDB will compare the source and the destination database to determine which documents differ between the source and the destination database.  

It does so by following the Changes Feeds on the source and comparing the documents to the destination.  

Changes are submitted to the destination in batches where they can introduce conflicts.  

Documents that already exist on the destination in the same revision are not transferred. As the deletion of documents is represented by a new revision, a document deleted on the source will also be deleted on the target.  

A replication task will finish once it reaches the end of the changes feed.  

If its continuous property is set to true, it will wait for new changes to appear until the task is cancelled.

### <mark style="background: #04FF00A6;">Change Feeds in CouchDB:</mark> 

Provide a continuous stream of changes as they occur, allowing clients to stay synchronised with the database in near real-time.  

Allows you to receive real-time updates about changes to the database.  

A change feed is typically accessed through a continuous feed, an HTTP connection that stays open and continuously sends updates to the client as changes occur in the database.

Clients can subscribe to the changes feed by making a GET request to the `_changes` endpoint.  

The feed=continuous parameter indicates that the client wants to receive changes continuously.

The `_changes` endpoint supports various options to filter and customise the changes feed.  

You can specify a `since` parameter to start the feed from a particular sequence number or a `filter` parameter to filter changes based on specific criteria. e.g.  

```bash
curl  
http://localhost:5984/your_database/_changes?feed=continuous&since=12345&filter  
=my_filter
```  

By default, the changes feed provides only the IDs and metadata of changed documents.  

However, you can include the full document bodies in the feed by adding the `include_docs=true` parameter

<mark style="background: #04FF00A6;">The continuous feed uses long-polling:</mark>
- The server holds the connection open until a change occurs or a timeout is reached.  
- If a change occurs within the timeout period, the server immediately sends the change to the client.
- If no changes occur, the server sends an empty response after the timeout, and the client can then open a new connection to continue listening for changes

![[Pasted image 20251003100452.png]]

# <mark style="background: #04FF00A6;">07 Denormalisation</mark>

### <mark style="background: #04FF00A6;">Database Normalisation:</mark>

<mark style="background: #04FF00A6;">Normalisation is a design technique:</mark> “..a very important ingredient in database design”, Coronel, C., & Morris, S. (2016). Database systems: design, implementation, & management. Cengage Learning

<mark style="background: #04FF00A6;">Objectives:</mark>
- Eliminate redundant data (storing the same data in more than one table)  
- Ensure data dependencies make sense (only storing related data in a table)  

<mark style="background: #04FF00A6;">Focus:</mark> Correct assignment of attributes to tables
  
<mark style="background: #04FF00A6;">How:</mark> 
- Considering the rules of the real world  
- Examining the actual values attributes can take  

<mark style="background: #04FF00A6;">Why is it important?</mark> If you don’t normalise, databases can be inaccurate, slow, and inefficient for day-to-day transactions (OLTP) and they might not produce the data you expect.

### <mark style="background: #04FF00A6;">Anomalies in DBMS:</mark>

There are three types of anomalies that occur when the database is not normalised.

<mark style="background: #04FF00A6;">These are:</mark>
- Insertion 
- Update 
- Deletion

### <mark style="background: #04FF00A6;">Insert Anomaly</mark>

Suppose a new employee joins the company  

They are not assigned to any department while they are training and there is no official training department  

At the moment we would not be able to insert the data into the table if ``emp_dept`` field doesn’t allow nulls.

![[Pasted image 20251009164153.png]]

### <mark style="background: #04FF00A6;">Update Anomaly</mark>

We have two rows for employee Rick as he works in two departments of the company.  

If we want to update Rick’s address, then we must update two rows in the employee table or the data will become inconsistent.  

If somehow, the correct address gets updated for one department but not the other then as far as the database is concerned Rick has two different addresses this is not correct or consistent with the real world we are modelling.

![[Pasted image 20251009164244.png]]

### <mark style="background: #04FF00A6;">Delete Anomaly:</mark>

Suppose the company closes the department D890  

Deleting the rows that have ``emp_dept`` as D890 would also delete the information of employee Maggie since she is assigned only to this department

But she is still an employee of the company so this is incorrect.

### <mark style="background: #04FF00A6;">Example (Dental Appointments)</mark>

Suppose we have a database to manage dental appointments in a surgery  

We have only a single table in the database (shown above)  

Where is the redundancy?  

Can you think of an insert, update and delete anomaly?
![[Pasted image 20251009164400.png]]

### <mark style="background: #04FF00A6;">Database Tables and Normalisation</mark>

<mark style="background: #04FF00A6;">Normalisation works through a series of stages called normal forms:</mark>
- 1NF (First Normal Form)  
- 2NF (Second Normal Form)  
- 3NF (Third Normal Form)  
- BCNF (Boyce-Codd Normal Form)  
- 4NF (Fourth Normal Form)  
- 5NF (Fifth Normal Form)  
- 6NF (Sixth Normal Form)  

The higher levels of normalisation are not always advisable.

<mark style="background: #04FF00A6;">1NF (First Normal Form) requires that:</mark>
- Each column contains atomic (indivisible) values.  
- Each column contains only one type of data.  
- There are no repeating groups of columns.
![[Pasted image 20251009164530.png]]

The data is in 1NF because each field contains atomic values (e.g., only one patient name per row, one appointment date, etc.).

<mark style="background: #04FF00A6;">2NF (Second Normal Form) requires that:</mark>
- The table is already in 1NF.  
- All non-key attributes are fully functionally dependent on the entire primary key.
![[Pasted image 20251009164618.png]]

Assume the primary key to be a composite key: ``StaffNum`` and ``PatientNum`` and ``AppointmentDate``  

This table is not in 2NF because there are partial dependencies.  

For example: The ``DentistName`` and Home Postcode are dependent on ``StaffNum`` but not on ``PatientNum``. This means these attributes are not fully dependent on the entire composite key (``StaffNum`` and ``PatientNum``), violating 2NF

<mark style="background: #04FF00A6;">To bring the table into 2NF, we can split the table into two:</mark>
- Dentists Table: ``StaffNum``, ``DentistName``, Home Postcode  
- Appointments Table: ``StaffNum``, ``PatientNum``, ``PatientName``, Appointment Date, Time, ``SurgeryNum``

![[Pasted image 20251009164818.png]]

<mark style="background: #04FF00A6;">3NF (Third Normal Form) requires that:</mark>
- The table is already in 2NF.  
- There are no transitive dependencies, meaning no non-key attribute should depend on another non-key attribute.  

In the 2NF tables, we still have a transitive dependency in the Appointments Table, where ``PatientName`` is dependent on ``PatientNum``, which is not part of the primary key.  

<mark style="background: #04FF00A6;">To achieve 3NF, we can further split the data into:</mark>
- Dentists Table: ``StaffNum``, ``DentistName``, Home Postcode  
- Patients Table: ``PatientNum``, ``PatientName``  
- Appointments Table: ``StaffNum``, ``PatientNum``, Appointment Date, Time, ``SurgeryNum``

![[Pasted image 20251009164959.png]]
![[Pasted image 20251009165010.png]]

### <mark style="background: #04FF00A6;">What is good about normalisation?</mark>

Minimise the amount of duplicated data stored in a database  

Build a database which allows you to access and manipulate the data quickly and efficiently balanced with maintaining the integrity of the data stored  

Organise the data so that, when you modify it, you make the changes in only one place  

Updates run quickly due to no data being duplicated in multiple locations.

Inserts run quickly since there is only a single insertion point for a piece of data and no duplication is required.  

Tables are typically smaller than the tables found in non-normalised databases.  

This usually allows the tables to fit into the buffer, thus offering faster performance.  

Data integrity and consistency is an absolute must if the database must be ACID compliant.  

A normalised database helps a lot with this.

### <mark style="background: #04FF00A6;">If normalisation is ideal, why do we ever break it?</mark> 

<mark style="background: #04FF00A6;">Performance:</mark>
- Normalisation reduces redundancy, but it often means joining many tables to answer a single query.  
- Joins are computationally expensive, especially at large scale or in distributed systems.  
- So, we sometimes denormalise (duplicate data) to make reads faster.  

<mark style="background: #04FF00A6;">Query Driven Design:</mark>
- Real-world systems are optimised around how data is accessed, not just how it’s stored.  
- In NoSQL systems, data is designed for reads — meaning duplication is normal and intentional

<mark style="background: #04FF00A6;">Scalability and distribution:</mark>
- Normalised relational models assume centralised data.  
- In distributed databases, joins across nodes are slow or impossible.  
- Denormalisation allows each node to serve complete queries locally, improving availability and latency.  
- <mark style="background: #04FF00A6;">Example:</mark> Global services like Netflix or Instagram duplicate user data across data centres to keep performance consistent worldwide.  

<mark style="background: #04FF00A6;">Analytics and caching:</mark>
- Analytical workloads benefit from precomputed or flattened tables. 
- Caches or materialised views intentionally break normalisation to serve read-heavy workloads efficiently.

### <mark style="background: #04FF00A6;">Denormalisation</mark> 

Normalised (decomposed) tables require additional processing, reducing system speed.  

Normalisation purity is often difficult to sustain in the modern database environment.  

The conflict between design efficiency, information requirements, and processing speed are often resolved through compromises that include <mark style="background: #04FF00A6;">Denormalisation</mark> - primarily a database optimisation technique focused on improving read/query performance.

Normalisation minimises redundancy to preserve data integrity and update efficiency.  

Denormalisation intentionally re-introduces redundancy to improve query performance, especially in read-heavy or analytical workloads.

<mark style="background: #04FF00A6;">Objective:</mark>
- To optimise read/query performance of the database 
- To reduce complexity  
- To improve query performance  
- To support analytics and reporting

<mark style="background: #04FF00A6;">How:</mark> By systematically adding precomputed redundant data to a database  

<mark style="background: #04FF00A6;">Why:</mark> Can help avoid costly joins in a relational database made during normalisation  

<mark style="background: #04FF00A6;">When is it done:</mark> Can be done as part of design or delegated to the DBMS (handled by the DBA

### <mark style="background: #04FF00A6;">Example</mark>

Three tables Student table, Branch table and HOD table after normalisation

![[Pasted image 20251009165752.png]]![[Pasted image 20251009165803.png]]
![[Pasted image 20251009165818.png]]

Suppose we want to retrieve all student names along with their branch name and hod name.  

We need to use a JOIN operation involving all three tables.  

If the amount of data held is small this is fine but in case for large amounts of data, joins on tables can take an excessively long time

```SQL
SELECT s.student_name, b.branch_name, h_hod_name  
FROM student s  
JOIN branch b  
ON s.branch_id = b.branch_id  
JOIN hod h  
on b.hod_id = h.hod_id
```
![[Pasted image 20251009165936.png]]

We can denormalise the database by including redundant data and extra effort to maximise the efficiency benefits of fewer joins.  
We can add the branch name, hod's name data from the Branch and HOD table respectively to the student table to optimise the database.  

Now we have a simple select on this table to handle our request  

<mark style="background: #04FF00A6;">Problems? Anomalies?</mark>

### <mark style="background: #04FF00A6;">Denormalisation – What anomalies might reappear?</mark>

![[Pasted image 20251009170045.png]]

### <mark style="background: #04FF00A6;">Denormalisation ≠ Improved Performance</mark>  

<mark style="background: #04FF00A6;">Illustration in in-class files:</mark>
- CMPU4003-W4-Normalised.sql  
- CMPU4003-W4-DeNormalised.sql  

<mark style="background: #04FF00A6;">Experiment Setup:</mark>
- <mark style="background: #04FF00A6;">Normalised Schema:</mark> student, branch, hod (1M rows)  
- <mark style="background: #04FF00A6;">Denormalised Schema:</mark> student_denorm (1M rows, redundant data) 
- <mark style="background: #04FF00A6;">Query:</mark> Join 3 tables vs Single table scan  
- <mark style="background: #04FF00A6;">Join Type:</mark> Hash Join vs Sequential Scan

### <mark style="background: #04FF00A6;">Performance Output</mark>

![[Pasted image 20251009170305.png]]
Normalised Execution Time no indexes:  
547.7 ms  

Denormalised Execution Time: 180.4 ms

![[Pasted image 20251009170314.png]]

Normalised Execution Time with indexes: 545.7 ms

### <mark style="background: #04FF00A6;">Key Points</mark>
- Indexes ≠ automatically faster.  
- Denormalisation ≠ automatically faster.  
- Normalisation is efficient when joins are small and indexed.  
- Denormalisation benefits large analytical workloads with many joins.  
- Trade-off: Query performance vs. Storage and Update integrity.

### <mark style="background: #04FF00A6;">Denormalisation Techniques</mark>

### <mark style="background: #04FF00A6;">Pre-joining tables</mark>

You can pre-join tables by including a non-key column in a table  

This will speed up specific queries.  

You must ensure that any application code updates the denormalised column each time the “master” column value changes in the referenced record.

![[Pasted image 20251009170559.png]]

If users of an email messaging service want to access messages by category, keeping the name of a category in the ``User_messages`` table can save time and reduce the number of joins needed.

![[Pasted image 20251009170622.png]]

<mark style="background: #04FF00A6;">When To use?</mark>
- When frequent queries against many tables are required  
- When slightly stale data is acceptable (stale data = not 100% up to date)  

<mark style="background: #04FF00A6;">Advantages:</mark>
- Time-consuming joins can be avoided  
- Updates may be postponed when stale data is acceptable  

<mark style="background: #04FF00A6;">Disadvantages:</mark>
- Extra DML needed to update original non-denormalised column  
- Extra column and possibly larger indices require more working space and disk space

### <mark style="background: #04FF00A6;">Storing Derivable Values</mark>

If a frequently executed query, includes a calculation it can be worthwhile storing the results of the calculation.  

<mark style="background: #04FF00A6;">Where to store?</mark> If the calculation involves detail records, then store the derived calculation in the master table.  

Make sure that the denormalised derivable values cannot be directly updated.  

They should always be recalculated by the application when impacted.

![[Pasted image 20251009170753.png]]

In this email service, once a user receives a message they get only a pointer to this message, stored in the ``User_messages`` table.  

This is to prevent the messaging system from storing multiple copies of an email message in case it’s sent to many different recipients at a time.  

If a user deletes the message only the respective entry in the ``User_messages`` table is actually removed. So to completely delete the message, all ``User_messages`` records for it must be removed.  

If we add a add a ``users_received_count`` to the Messages table to keep a record of ``User_messages`` kept for a specific message then when a user deletes this message (read: removes the pointer to the actual message), the ``users_received_count`` column is decremented by one.  

When the ``users_received_count`` equals zero, the actual message can be deleted completely

![[Pasted image 20251009170910.png]]

<mark style="background: #04FF00A6;">When To use?</mark>
- Source values for the calculation are in multiple records or tables  
- The derivable values are frequently needed and the source values are not  
- The source values are infrequently changed  

<mark style="background: #04FF00A6;">Advantages:</mark>
- Source values do not need to be looked up every time the derivable value is required  
- The calculation does not need to be performed during a query or report  

<mark style="background: #04FF00A6;">Disadvantages:</mark>
- Any DML against the source data will require recalculation or adjustment of the derivable data  
- Data duplication introduces the possibility of data inconsistencies

### <mark style="background: #04FF00A6;">Using Hardcoded Values</mark>

If there is a table with constant records, you can hardcode them into your application to avoid joining tables when these values are needed.

Create a check constraint to validate values against reference values.

This must be rewritten each time a new reference value is added.

<mark style="background: #04FF00A6;">Advantages:</mark>
- No need to implement a lookup table  
- No joins to a lookup table  

<mark style="background: #04FF00A6;">Disadvantages:</mark> Recoding and restating are required if look-up values are altered

### <mark style="background: #04FF00A6;">Short Circuit Keys</mark>

If your database design contains three (or more) levels of master detail, and there is a need to query the lowest and highest level records only, consider creating short-circuit keys.

These new foreign key definitions directly link the lowest level detail records to higher level grandparent records.

The result can produce fewer table joins when queries execute

![[Pasted image 20251009171240.png]]

The email messaging service has to handle frequent queries that require data from the Users and Messages tables only, without addressing the Categories table.  

In a normalised database, such queries would need to join the Users and Categories tables.  

To improve database performance and avoid such joins, we can add a primary or unique key from the Users table directly to the Messages table.  

This way we can provide information about users and messages without querying the Categories table, which means we can do without a redundant table join.

![[Pasted image 20251009171328.png]]

<mark style="background: #04FF00A6;">When To use?</mark> When queries frequently require values from a grandparent and grandchild, but not from the parent  

<mark style="background: #04FF00A6;">Advantages:</mark> Queries join fewer tables together  

<mark style="background: #04FF00A6;">Disadvantages:</mark>
- Extra foreign keys are required  
- Extra code is required to make sure that the value of the denormalised column (e.g. ``A_id``) is consistent with the value you would find after a join with the master record (e.g. table B)

### <mark style="background: #04FF00A6;">End Date Column</mark>

The most common denormalisation decision is to store the end date for periods that are consecutive  

<mark style="background: #04FF00A6;">E.g:</mark>
- When the end date for a period can be derived from the start date of the previous period.  
- Could be associated with price of a product for each sales period  

If you do this, to find a detail record for a particular date you avoid the need to use a complex subquery.

![[Pasted image 20251009171532.png]]

### <mark style="background: #04FF00A6;">End Date Column</mark>

<mark style="background: #04FF00A6;">When To use?</mark> When queries are needed from tables with long lists or records that are historical and you are interested in the most current record

<mark style="background: #04FF00A6;">Advantages:</mark> Can use the between operator for date selection queries instead of potentially time consuming synchronised subquery  

<mark style="background: #04FF00A6;">Disadvantages:</mark> Extra code needed to populate

### <mark style="background: #04FF00A6;">Current Indicator Column</mark>

Can be used in similar situations to the end date column technique.  

It can even be used in addition to an end date.  

<mark style="background: #04FF00A6;">Suppose most of the queries are to find the most current detail record:</mark>
- With this type of requirement, you could consider adding a new column to the details table to represent the currently active record.  
- You would need to add code to update that column each time you insert a new record
![[Pasted image 20251009171733.png]]

<mark style="background: #04FF00A6;">When To use?</mark> When the situation requires retrieving the most current record from a long list  

<mark style="background: #04FF00A6;">Advantages:</mark> Less complicated queries or subqueries  

<mark style="background: #04FF00A6;">Disadvantages:</mark>
- Extra column and application code to maintain it  
- The concept of “current” makes it impossible to make data adjustments ahead of time

### <mark style="background: #04FF00A6;">Keeping details with master</mark>  

You move a <mark style="background: #04FF00A6;">small, fixed number</mark> of detail attributes (or rows) into the master table to avoid joins.  

If the number of detail records per master is a fixed value (or has a fixed maximum) and usually all detail records are queried with the master, you may consider adding the detail columns to the master table.  

Works best when the number of records in the detail table are small.  

Will reduce the number of joins during queries.

![[Pasted image 20251009171943.png]]

<mark style="background: #04FF00A6;">If in the email messaging service, we need to limit the maximum amount of storage space allocated to a user:</mark>
- We need to implement restraints in our email messaging service − one for messages and another for files. 
- Since the amount of allowed storage space for each of these restraints is different, we need to track each restraint individually.  
- In a normalised relational database, we could simply introduce two different tables − Storage_types and Storage_restraints − that would store records for each user.  

<mark style="background: #04FF00A6;">We can go a different way and add denormalised columns to the Users table:</mark>
- ``message_space_allocated``  
- ``message_space_available``  
- ``file_space_allocated``  
- ``file_space_available``
- The denormalised Users table stores not only the actual information about a user but the restraints as well, so in terms of functionality the table doesn’t fully correspond to its name

![[Pasted image 20251009172113.png]]

<mark style="background: #04FF00A6;">When to use?</mark>
- When the number of detail records for all masters is fixed and static  
- When the number of detail records multiplied by the number of columns of the detail is small, say less than 30  

<mark style="background: #04FF00A6;">Advantages:</mark>
- No joins are required  
- Saves space, as keys are not propagated  

<mark style="background: #04FF00A6;">Disadvantages:</mark>
- Increases complexity of data manipulation language (DML) and SELECTs across detail values  
- Checks for detail columns must be repeated for all

### <mark style="background: #04FF00A6;">Repeating single details with master:</mark>  

Instead of adding multiple columns (Amount_1, Amount_2, ...), you add a single repeated attribute directly in the master, duplicating it across rows:
- When the storage of historical data is necessary, many queries require only the most current record.  
- You can add a new foreign key column to store this single detail with its master.  
- Make sure you add code to change the denormalised column any time a new record is added to the history table.

![[Pasted image 20251009172315.png]]

### <mark style="background: #04FF00A6;">Repeating single details with master</mark>

Users send not only messages but attachments too.  

Most messages are sent either without an attachment or with a single attachment.  

Some messages have several attachments.  

By denormalising the Messages table and adding the first_attachment_name column we have an improvement for messages with 0 or 1 attachment.  

If a message contains more than one attachment, only the first attachment will be taken from the Messages table.  

The other attachments will be stored in a separate Attachments table and, therefore, will require table joins.  

But this would be helpful for the majority of cases in our messaging system.

![[Pasted image 20251009172406.png]]

<mark style="background: #04FF00A6;">When To use?</mark>
- When detail records per master have a property such that one record can be considered “current” and others “historical”  
- When queries frequently need this specific single detail, and only occasionally need the other details  
- When the Master often has only one single detail record  

<mark style="background: #04FF00A6;">Advantages:</mark>
- No join is required for queries that only need the specific single detail  

<mark style="background: #04FF00A6;">Disadvantages:</mark>
- Detail value must be repeated, with the possibility of data inconsistencies  
- Additional code must be written to maintain the duplicated single detail value at the master record.

### <mark style="background: #04FF00A6;">Denormalising Guidelines</mark>

Always create a conceptual data model that is completely normalised.  

Consider denormalisation as the last option to boost performance.  

Never presume denormalisation will be required. 

To meet performance objectives, denormalisation should be done during the database design.  

Once performance objectives have been met, do not implement any further denormalisation.  

Fully document all denormalisation, stating what was done to the tables, what application code was added to compensate for the denormalisation, and the reasons for and against  
doing it.

# <mark style="background: #04FF00A6;">08 Cassandra</mark>

Apache Cassandra is a wide-column NOSQL Database

<mark style="background: #04FF00A6;">What happens when your relational database can’t keep up?</mark>
- Billions of users
- Always-on availability
- Geo-distributed data

![[Pasted image 20251010103450.png]]

### <mark style="background: #04FF00A6;">Apache Cassandra At A Glance</mark>

<mark style="background: #04FF00A6;">Distributed:</mark> Cassandra can run on multiple machines (nodes) while appearing to users as a unified whole.  

<mark style="background: #04FF00A6;">Cluster:</mark> Multiple nodes can be organised logically into a cluster, or "ring".  

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
- Data access patterns and application queries determine the structure and organisation of data -> design of the tables  
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

<mark style="background: #04FF00A6;">Example:</mark>
- Cassandra: ``student_subject_results`` (all in one row)  
- To find a student’s results:  

```sql
SELECT * FROM  
student_subject_results WHERE  
student_id = 1;
```

![[Pasted image 20251010104240.png]]

### <mark style="background: #04FF00A6;">Query Driven Modelling v Normalisation Driven Modelling</mark>  

<mark style="background: #04FF00A6;">Query Driven:</mark> More writes (denormalisation) → fewer joins or lookups during reads → faster reads.  

<mark style="background: #04FF00A6;">Normalisation Driven:</mark> Fewer writes (normalised schema) → more complex reads → slower performance

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
- Optimise your data read performance by maximising the number of data writes.  

<mark style="background: #04FF00A6;">Summary:</mark>  
- To make reads fast, you design your tables for each query pattern 
- Even if it means writing the same data in several places.

Keep the rules in mind when modelling your data.  

<mark style="background: #04FF00A6;">Maximise data duplication:</mark>
- Data denormalisation and data duplication are defacto of Cassandra.  
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

Each stores the same data but organised differently. When you query, Cassandra reads from exactly one partition -very fast.

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
- A replication factor of more than 2 is good to attain no single point of failure.  
- 3 is good replication factor  

```sql
CREATE KEYSPACE example  
WITH replication = {'class':'SimpleStrateg  
y', 'replication_factor' : 3};
```

<mark style="background: #04FF00A6;">Strategy:</mark>
- There are two types of strategy declaration in Cassandra syntax
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
- A probabilistic data structure that allows Cassandra to determine one of two possible states:
- The data definitely does not exist in the given file, or  
- The data probably exists in the given file.

### <mark style="background: #04FF00A6;">NoSQL Landscape</mark>

![[Pasted image 20251010122742.png]]
![[Pasted image 20251010122756.png]]

# <mark style="background: #04FF00A6;">09 Lab - Couch DB Replication and Cassandra</mark>

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

These control the Java Virtual Machine (JVM) memory allocation for Cassandra, which is written in Java. These parameters help optimise memory usage and performance.  

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

# <mark style="background: #04FF00A6;">10 Data Warehousing</mark>

### <mark style="background: #04FF00A6;">Online Analytical Processing (OLAP) vs. Online Transaction Processing (OLTP)</mark>

<mark style="background: #04FF00A6;">OLTP: Involves</mark>
- Day-to-day transaction processing, such as order entry and inventory updates.  
- Optimised for high-volume, short transactions  
- Used in transactional databases  

<mark style="background: #04FF00A6;">OLAP: Focuses on</mark>
- Data analysis and querying  
- Enabling users to perform multi-dimensional analysis of data (e.g., drilling down, slicing and dicing).  
- Typically used in data warehouses

<mark style="background: #04FF00A6;">OLTP:</mark>
- <mark style="background: #04FF00A6;">Highly normalised:</mark> orders, order_items, customers, products, payments, shipping  
- <mark style="background: #04FF00A6;">Example:</mark> Aim is to record every sale correctly  
- <mark style="background: #04FF00A6;">Typical operation:</mark> “Insert a new order when a customer checks out.” ``INSERT INTO orders (...) VALUES (...);``
- To get total sales per region, you’d need to join: orders → order_items → customers → regions → products and aggregate across millions of rows. That’s <mark style="background: #04FF00A6;">slow, CPU-heavy, and blocks transactions</mark>

<mark style="background: #04FF00A6;">OLAP:</mark>
- <mark style="background: #04FF00A6;">Denormalised:</mark> one central data table (e.g., ``sales_events``) that stores measurable transactions - linked to several context tables such as date, product, customer, and region. 
- <mark style="background: #04FF00A6;">Example:</mark> Aim is understanding sales trends 
- <mark style="background: #04FF00A6;">Typical operation:</mark> “What was our average order value per region, per quarter, over the last 3 years?”
- Data has been pre-aggregated by ``Region``, ``Quarter``, and ``ProductCategory``.  
- To get the total sales per region, just query a single table — no complex joins

### <mark style="background: #04FF00A6;">OLAP vs. OLTP</mark>

<table>
	<tr>
		<th>Aspect</th>
		<th>OLTP (Operational Systems)</th>
		<th>OLAP (Analytical / Data Warehouse Systems)</th>
	</tr>
	<tr>
		<th>Primary Goal</th>
		<td>Ensure every transaction is recorded accurately and immediately.</td>
		<td>Enable deep analysis and discovery of patterns, trends, and summaries.</td>
	</tr>
	<tr>
		<th>Design Focus</th>
		<td>Efficiency and integrity of inserts, updates, and deletes (CRUD)</td>
		<td>Efficiency of reads, aggregations, and comparisons over large data volumes</td>
	</tr>
	<tr>
		<th>Data Purpose</th>
		<td>Day-to-day business operations - capturing what’s happening now.</td>
		<td>Strategic decision-making  examining what has happened over time</td>
	</tr>
	<tr>
		<th>Data Structure</th>
		<td>Highly normalised to reduce redundancy and maintain data consistency.</td>
		<td>Denormalised or aggregated to speed up queries and support flexible exploration</td>
	</tr>
	<tr>
		<th>Workload Pattern</th>
		<td>Thousands of small, simple transactions per second</td>
		<td>Fewer, complex queries scanning large portions of data.</td>
	</tr>
	<tr>
		<th>Users</th>
		<td>Front-line applications and operational staff.</td>
		<td>Analysts, managers, and data scientists</td>
	</tr>
	<tr>
		<th>Time horizon</th>
		<td>Current and recent data</td>
		<td>Historical and time-variant data</td>
	</tr>
	<tr>
		<th>Optimisation</th>
		<td>For correctness, concurrency, and response time per transaction</td>
		<td>For analytical efficiency, aggregation, and multi-dimensional queries.</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Example - Banking / Transactions</mark>

“Why is it risky to run large aggregation queries on a live banking transaction system?”

<table>
	<tr>
		<th>&nbsp;</th>
		<th>OLTP (Operational Systems)</th>
		<th>OLAP (Analytical / Data Warehouse Systems)</th>
	</tr>
	<tr>
		<th>Use case</th>
		<td>Recording daily account deposits, withdrawals, and transfers</td>
		<td>Detecting spending patterns, risk, or forecasting cashflow.</td>
	</tr>
	<tr>
		<th>Schema</th>
		<td>Tables: accounts, transactions, branches, employees</td>
		<td>Aggregate table: ``agg_transactions``, dimensions for time, branch, account type, and customer segment</td>
	</tr>
	<tr>
		<th>Analytical pain</th>
		<td>To compute “average monthly balance per customer segment,” OLTP must repeatedly scan detailed transaction records, calculate running totals, and join to multiple lookup tables.</td>
		<td>OLAP stores snapshots or aggregated balances by month, branch, and segment — query runs in seconds.</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Example - University / Student Records</mark>

“What could happen if we ran a query calculating average grades for every module and every semester directly on the live student registration system during the first week of the semester?”

<table>
	<tr>
		<th>&nbsp;</th>
		<th>OLTP (Operational Systems)</th>
		<th>OLAP (Analytical / Data Warehouse Systems)</th>
	</tr>
	<tr>
		<th>OLTP purpose</th>
		<td>Manage registrations, update grades, handle module enrolments</td>
		<td>Analyse long-term performance or trends.</td>
	</tr>
	<tr>
		<th>Analytical question</th>
		<td>What percentage of students who enrolled in first-year Computer Science graduated within 4 years?”</td>
		<td>What percentage of students who enrolled in first-year Computer Science graduated within 4 years?”</td>
	</tr>
	<tr>
		<th>Problems in OLTP</th>
		<td>Data spread across normalised tables: students, enrolments, modules, results, graduations. Querying across years and semesters is complex and slow.</td>
		<td>Can summarise enrolments and completions per cohort. Can incorporate a Time dimension enables trend analysis easily.</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">What is a Data Warehouse?</mark>

A centralised repository that stores <mark style="background: #04FF00A6;">integrated, historical data</mark> from multiple sources.  

Designed to support <mark style="background: #04FF00A6;">querying, reporting, and data analysis</mark>  

Enables businesses to <mark style="background: #04FF00A6;">make informed decisions</mark> based on historical data.  

The data is organised in a way that facilitates fast, efficient querying and supports <mark style="background: #04FF00A6;">business intelligence (BI)</mark> processes.

![[Pasted image 20251017113025.png]]

### <mark style="background: #04FF00A6;">Why Data Warehouses?</mark>

<mark style="background: #04FF00A6;">Organisations need to analyse data so that it can:</mark>
- <mark style="background: #04FF00A6;">Understand trends:</mark>  Turn “What happened?” into “What’s been happening - and why?”  
- <mark style="background: #04FF00A6;">Predict future behaviour and needs Goal:</mark> Move from reactive decisions to proactive planning.  
- <mark style="background: #04FF00A6;">Personalise contact with customers/clients/users:</mark> Use insight to tailor communication and improve experience.  
- <mark style="background: #04FF00A6;">Be competitive:</mark> Compete on insight — not just on operations.

All of this in a speedy manner, with the ability to do "What if’s"

<table>
	<tr>
		<th>Analytical Objective</th>
		<th>What it enables</th>
		<th>Why OLAP makes it possible</th>
	</tr>
	<tr>
		<th>Understand trends</th>
		<td>Identify long-term changes and causes</td>
		<td>Retains historical, integrated data</td>
	</tr>
	<tr>
		<th>Predict future behaviour</th>
		<td>Forecast outcomes, anticipate needs</td>
		<td>Enables data mining and modelling over time</td>
	</tr>
	<tr>
		<th>Personalise interactions</th>
		<td>Tailor services and communication</td>
		<td>Combines data from multiple sources</td>
	</tr>
	<tr>
		<th>Be competitive</th>
		<td>Make faster, evidence-based decisions</td>
		<td>Provides quick, consistent insights</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">What is a Data Warehouse?</mark>

Data from relevant relational databases (and other sources) are  
- <mark style="background: #04FF00A6;">extracted</mark>,  
- <mark style="background: #04FF00A6;">transformed</mark> into a clearly-defined structure 
- and then <mark style="background: #04FF00A6;">loaded</mark> into a single place to make reading the data as efficient and seamless as possible.  

ETL is a core data integration process used in the creation of data warehouses.

### <mark style="background: #04FF00A6;">ETL</mark>

<mark style="background: #04FF00A6;">Extract:</mark> Data is pulled from various source systems (e.g., databases, flat files, APIs).  

<mark style="background: #04FF00A6;">Transform:</mark> The data is cleaned, formatted, and integrated to ensure consistency across different sources.  

<mark style="background: #04FF00A6;">Load:</mark> The transformed data is loaded into the data warehouse for querying and  analysis.

![[Pasted image 20251017114409.png]]

![[Pasted image 20251017114409.png]]

### <mark style="background: #04FF00A6;">What is a Data Warehouse?</mark>

<mark style="background: #04FF00A6;">Fundamentally, it is a database:</mark>
- A structured system for storing and querying data.  
- It can be built using a relational database platform such as Oracle, PostgreSQL, or SQL Server.

<mark style="background: #04FF00A6;">It is not a live or transactional system:</mark>
- Daily updates, inserts, and operational transactions occur elsewhere.
- Day-to-day transactions are captured by operational databases (OLTP systems) that are fully normalised for efficiency and accuracy.

The warehouse collects, cleans, integrates, and stores selected data from those operational sources, often on a scheduled basis (daily, weekly, or monthly).  

Its design is read-oriented, optimised for queries, summaries, and analysis rather than updates.

It holds historical and time-stamped data, so users can see how things change over time.

It supports decision-making and analytics, providing the foundation for dashboards, reports, forecasting, and trend analysis.

It brings together information from multiple business systems - finance, sales, HR, student records, etc. - into a single, consistent view of the organisation.

Access is typically read-only for analysts, managers, and data scientists, rather than everyday operational users.

### <mark style="background: #04FF00A6;">Data Warehouse Architecture</mark>

![[Pasted image 20251017114618.png]]

### <mark style="background: #04FF00A6;">What is a Data Warehouse?</mark>

<mark style="background: #04FF00A6;">A DWH:</mark>
- is updated at specific points in time  
- is mainly read-only (analytics)  
- is optimised for (read) performances  
- is a collection (integration) of different sources

The “yellow” box (= the <mark style="background: #04FF00A6;">staging area</mark>) is permanent, and it is where data is cleaned and integrated

### <mark style="background: #04FF00A6;">Data Warehouse</mark>

Contains data from different systems  

<mark style="background: #04FF00A6;">Imports data from different systems on a regular basis:</mark> 
- Detailed data and summarised data  
- Historic data  
- Metadata  

Overcomes difficulties when using existing transaction systems for those tasks  

OLTP applications remain, DWH is a completely new system

### <mark style="background: #04FF00A6;">Data Warehouse Definition</mark>

<mark style="background: #04FF00A6;">Ralph Kimball:</mark> A data warehouse is a copy of transaction data specifically structured for querying and reporting

<mark style="background: #04FF00A6;">William Marshall, Bill Inmon:</mark> A data warehouse is a subject oriented , integrated , time variant , non-volatile collection of data in support of management’s decision making process.

### <mark style="background: #04FF00A6;">Data Warehouse - Key characteristics</mark>

<mark style="background: #04FF00A6;">Characteristics:</mark>
- Subject-oriented
- Integrated
- Time Variant
- Non-volatile

<mark style="background: #04FF00A6;">Subject-Oriented:</mark> Data is organised around the major subjects Of the enterprise (e.g. customers, sales, products) rather than application areas (e.g. invoicing, stock control etc.)

![[Pasted image 20251017140406.png]]

<mark style="background: #04FF00A6;">Integrated:</mark> Data from different sources are combined, these sources may be inconsistent and formatted differently,

<mark style="background: #04FF00A6;">The DW establishes a consistent combined data source:</mark>
- consistent naming conventions
- consistent measurement Of variables
- consistent encoding structures
- consistent physical attributes of data

![[Pasted image 20251017141414.png]]

<mark style="background: #04FF00A6;">Time Variant:</mark>
- Data is only accurate at a particular point of time or over some time interval.
- Time variances is shown in the extended time that data is held.
- The implicit or explicit association of time with all the data and the fact that the data represents a series of snapshots.

![[Pasted image 20251017141518.png]]

<mark style="background: #04FF00A6;">Non-Volatile:</mark>
- Data is not updated in real-time but refreshed from operational data at regular intervals.
- New data is already added as a supplemental to the database rather than as a replacement.
- The database constantly absorbs new data, incrementally integrating it with the previous data.

![[Pasted image 20251017141637.png]]

### <mark style="background: #04FF00A6;">Dimensional Modelling</mark>  

Dimensional Models have a specific structure and organise the data

<mark style="background: #04FF00A6;">What is dimensional modelling?</mark>
- A logical design technique that seeks to present the data in a standard, intuitive framework that allows for high-performance access.  
- <mark style="background: #04FF00A6;">Data Dimensional Modelling (DDM)</mark> is a modelling/structuring technique 
- It uses <mark style="background: #04FF00A6;">Facts and Dimensions</mark> to store the data in a Data Warehouse efficiently  
- It optimises the database for faster retrieval of the data.  
- Dimensional Models have a specific structure and organise the data to generate reports that improve performance

Every dimensional model is composed of one table with a multipart key called the <mark style="background: #04FF00A6;">fact</mark> table,  

Plus a set of smaller support tables called <mark style="background: #04FF00A6;">dimension</mark> tables

![[Pasted image 20251017141942.png]]

### <mark style="background: #04FF00A6;">Fact and Dimension</mark>

<mark style="background: #04FF00A6;">A fact:</mark>
- A quantitative piece of information 
- e.g. a sale or a download.

<mark style="background: #04FF00A6;">A Dimension:</mark>  
- A companion to facts 
- Describe the objects in a fact table.

<mark style="background: #04FF00A6;">Facts</mark> are stored in fact tables and have a <mark style="background: #04FF00A6;">foreign key relationship</mark> with <mark style="background: #04FF00A6;">dimension</mark> tables.

![[Pasted image 20251017142139.png]]

### <mark style="background: #04FF00A6;">Dimensional Modelling Steps</mark>

<mark style="background: #04FF00A6;">Steps:</mark>
1. Select the business process.  
2. Declare the grain.  
3. Identify the dimensions.  
4. Identify the facts.

### <mark style="background: #04FF00A6;">1. Select the Business Process</mark>

A business process is a <mark style="background: #04FF00A6;">repeatable, measurable activity</mark> that the organisation performs
- Something that generates data you can track over time.  
- It’s the event or operation you want to analyse.  

<mark style="background: #04FF00A6;">Examples:</mark>
- In retail: processing a sales order or handling a product return  
- In education: registering students for classes or recording exam results  
- In banking: processing a loan or snapshotting account balances  
- In logistics: shipping an order or receiving a delivery  

<mark style="background: #04FF00A6;">Each process produces events that can be measured:</mark>
- For example, “items sold,” “amount charged,” “time taken,” or “grade achieved.”  
- These measurable outcomes become the numeric values we analyse later (e.g., total sales, quantity, marks, time, cost).

Events generate or capture performance metrics that translate into facts in a fact table.  

Most fact tables focus on the results of a single business process.  

Choosing the process is important because it defines a specific design target and allows the grain, dimensions, and facts to be declared

### <mark style="background: #04FF00A6;">2. Declare the grain</mark>

<mark style="background: #04FF00A6;">What this means:</mark> The grain defines the level of detail at which data will be stored and analysed.  

<mark style="background: #04FF00A6;">It answers the question:</mark> “What does one row in the fact table actually represent?

<mark style="background: #04FF00A6;">In a retail business:</mark>  
- <mark style="background: #04FF00A6;">Transactional level:</mark> one row per individual sale at the till (very detailed)  
- <mark style="background: #04FF00A6;">Daily summary:</mark> one row per store per day (moderately detailed)  
- <mark style="background: #04FF00A6;">Monthly summary:</mark> one row per region per month (highly summarised)  

<mark style="background: #04FF00A6;">In a university context:</mark>
- <mark style="background: #04FF00A6;">Exam event level:</mark> one row per student per exam
- <mark style="background: #04FF00A6;">Module level:</mark> one row per student per module per semester
- <mark style="background: #04FF00A6;">Programme level:</mark> one row per student per academic year

Each of these choices produces a different dataset, suitable for different analytical purposes

<mark style="background: #04FF00A6;">Declaring the grain is one of the most critical design decisions because it determines:</mark>  
- How much detail the warehouse will hold  
- What types of questions you can (and cannot) answer  
- Which descriptive tables (context data) will connect properly  
- It sets a clear boundary for your model every measure and every contextual attribute must align with this level of detail.  
- Once chosen, the grain becomes a binding design rule.

<mark style="background: #04FF00A6;">The atomic grain:</mark>
- The lowest possible level at which the event occurs (e.g. each sale, each enrolment, each transaction)
- Is usually best for long-term flexibility.  
- It allows later aggregation (daily, weekly, monthly) without losing fidelity.  

<mark style="background: #04FF00A6;">Coarser</mark> grains (daily or monthly summaries) reduce storage and improve performance but limit the types of analysis possible later.

The grain defines what each row in the <mark style="background: #04FF00A6;">fact table</mark> represents.  

Declaring the grain is like defining the <mark style="background: #04FF00A6;">resolution</mark> of your data picture:
- It determines how sharp or how blurry your analytical view will be.  
- Once you’ve chosen that resolution, every measure and descriptive field must fit it exactly.

<mark style="background: #04FF00A6;">Fact Tables:</mark>
- Contain related measures  
- Store quantifiable business data (such as sales, expenses, and inventory)  
- Usually the largest tables in our schema  
- Usually appended to  
- Can contain detail or summary data  
- Measures are usually additive

### <mark style="background: #04FF00A6;">3. Identify the Dimensions</mark>

Once you know what each record in your central table represents (the grain), the next step is to decide <mark style="background: #04FF00A6;">what descriptive information</mark> you need to fully explain or categorise each event.  

These descriptive tables provide the <mark style="background: #04FF00A6;">who, what, where, when, and how</mark> context for the business event.  

They do not store numbers or measurements. Instead, they store <mark style="background: #04FF00A6;">labels, categories, and attributes</mark> that help you filter, group, and interpret the data.  

They give meaning to the numeric measures recorded in the main event table.

<mark style="background: #04FF00A6;">Retail Example:</mark>  
- <mark style="background: #04FF00A6;">Product</mark> → describes what was sold (name, brand, category)  
- <mark style="background: #04FF00A6;">Customer</mark> → describes who made the purchase (name, gender, loyalty tier)  
- <mark style="background: #04FF00A6;">Store/Branch</mark> → describes where the sale occurred (city, region, manager)  
- <mark style="background: #04FF00A6;">Time/Date</mark> → describes when it happened (day, month, quarter, year)  

<mark style="background: #04FF00A6;">University:</mark>  
- <mark style="background: #04FF00A6;">Student</mark> → who achieved the result (name, program, entry year)  
- <mark style="background: #04FF00A6;">Module</mark> → what the result refers to (code, department, credits) 
- <mark style="background: #04FF00A6;">Instructor</mark> → who delivered the module (name, school, rank)  
- <mark style="background: #04FF00A6;">Time/Term</mark> → when it took place (semester, academic year)

These descriptive tables add meaning to the raw event data, making it useful for analysis.  

They allow analysts to slice and dice the measures in multiple ways, e.g. by product, by region, by time, by customer type, etc.  

They make it possible to group and compare e.g., sales by region, grades by module, attendance by term.  

They also promote data consistency: A single shared description (like a “product name” or “term code”) is reused across all analyses.

<mark style="background: #04FF00A6;">Star Schema:</mark> Singe data (fact) table surrounded by multiple descriptive (dimension) tables

![[Pasted image 20251017154423.png]]

![[Pasted image 20251017154433.png]]

<mark style="background: #04FF00A6;">Snowflake Schema:</mark> Singe data (fact) table surrounded by layers of descriptive (dimension) tables

Normalised dimension tables

![[Pasted image 20251017154515.png]]

### <mark style="background: #04FF00A6;">4. Identify the Facts</mark>

Facts are the measurements that result from a business process event and are almost always numeric.  

A fact table corresponds to a physical observable event, and not to the demands of a particular report.  

A <mark style="background: #04FF00A6;">single fact table row</mark> has a one-to-one relationship to a measurement event as described by the fact table’s grain.  

Within a fact table, only facts consistent with the declared grain are allowed.  

For example, in a retail sales transaction, the quantity of a product sold and its extended price are good facts, whereas the store manager’s salary is disallowed.

<mark style="background: #04FF00A6;">Fact tables:</mark>
- In addition to numeric measures, a fact table always contains foreign keys for each of its associated dimensions,
- Fact tables are the primary target of computations and dynamic aggregations arising from queries.

![[Pasted image 20251017154845.png]]

### <mark style="background: #04FF00A6;">Dimension Table Key</mark>

A dimension table is designed with one column serving as a unique primary key.  

<mark style="background: #04FF00A6;">This cannot be the operational system’s natural key because:</mark>  
- There will be multiple dimension rows for that natural key when changes are tracked over time.  
- These may be created by more than one source system, and these natural keys may be incompatible or poorly administered.

You should create <mark style="background: #04FF00A6;">anonymous integer primary keys</mark> for every dimension (in the ETL process)  

These dimension <mark style="background: #04FF00A6;">surrogate keys</mark> are simple integers, assigned in sequence, starting with the value 1, every time a new key is needed.

A date dimension is exempt from the surrogate key rule  

Date dimensions are highly predictable and stable so you can use a more meaningful primary key.

### <mark style="background: #04FF00A6;">Fact Table Key</mark>

A fact table contains information about things that an organisation wants to measure.  

A fact table’s key is made up from the keys of two or more dimensions.  

A fact always ‘resolves’ a many-to-many relationship between the parent, or dimension tables.  

The most useful fact tables also contain one or more numerical measures, or facts, that occur for the combination of keys that define each record.  

<mark style="background: #04FF00A6;">Example:</mark> the facts are Dollars Sold, Units Sold, and Dollars Cost

### <mark style="background: #04FF00A6;">Dimensional Modelling – Fact Surrogate Keys</mark>

<mark style="background: #04FF00A6;">Fact table surrogate keys</mark>, which are not associated with any dimension, are assigned sequentially during the ETL load process and are used  
1) as the single column primary key of the fact table;  
2) to serve as an immediate identifier of a fact table row without navigating multiple dimensions for ETL purposes;  
3) to allow an interrupted load process to either back out or resume;  
4) to allow fact table update operations to be decomposed into less risky inserts plus deletes.

### <mark style="background: #04FF00A6;">Fact surrogate key</mark>

<mark style="background: #04FF00A6;">Use them when:</mark>  
- There is a need for a single-column unique identifier for easier reference.  
- Joins based on individual fact records are frequent.  
- Auditing, lineage, or change tracking is important.  

<mark style="background: #04FF00A6;">Avoid them when:</mark>
- The grain is well-defined by existing foreign keys.  
- Storage space is a concern, especially for very large fact tables. 
- Adding the key does not significantly improve performance or manageability.

### <mark style="background: #04FF00A6;">When don’t we need surrogate Fact keys?</mark>

<mark style="background: #04FF00A6;">Grain Already Defined by Foreign Keys:</mark> In a star schema, the natural grain is already defined by the combination of foreign keys (e.g., ITEM_KEY, TIME_ID, etc.).  

These columns uniquely identify each record, so adding a surrogate key is not strictly necessary for ensuring uniqueness.  

<mark style="background: #04FF00A6;">Increased Storage:</mark> Adding a surrogate key to a very large fact table can consume additional storage space without providing significant value, especially if the existing foreign keys already serve the required purposes.  

<mark style="background: #04FF00A6;">Complexity Without Added Benefit:</mark> If the fact table does not need to be joined to other tables based on an individual record or if there is no requirement for tracking changes at the row level, adding a surrogate key may introduce unnecessary complexity.

### <mark style="background: #04FF00A6;">How do we get from normalised data to a star schema?</mark>

<mark style="background: #04FF00A6;">Method:</mark>
1. Classify your entities
2. Identify your entity types

### <mark style="background: #04FF00A6;">Classify your entities:</mark>

<mark style="background: #04FF00A6;">Transaction Entities:</mark>
- These are your potential sources of facts
- Store details of business proceedings (e.g., orders, shipments, payments, insurance claims, bank transactions, hotel bookings, airline reservations, and hospital admissions).
- Most models will be related to events like these and applications built based on them will aim to sport trends and patterns or opportunities within the data.
- Another type of transaction entity is a ‘snapshot’ entity which record the state of an entity at a point in time (e.g. account balance, inventory level for a product). These relate to the condition of an entity.

<mark style="background: #04FF00A6;">Component Entities:</mark>
- Linked to a transaction entity by a one-to-many relationship.
- Store data associated with the business event, and answer “who,” “what”, “where”, “how”, and “why” questions.

<mark style="background: #04FF00A6;">Classification Entities:</mark>
- Associated with component entities by chains of one-to-many relationships
- Used to categorise component entities.

### <mark style="background: #04FF00A6;">Identify your entity types:</mark>

The organisation wants to analyse sales performance.  

<mark style="background: #04FF00A6;">From the enterprise model:</mark>
- You identify the <mark style="background: #04FF00A6;">transaction entities</mark>: ``Order`` and ``OrderItem``.
- You also have <mark style="background: #04FF00A6;">component entities</mark>: Product, Customer  
- You also have <mark style="background: #04FF00A6;">classification entities</mark>: Store, and ``ProductType``.

### <mark style="background: #04FF00A6;">Identify your grain</mark>

<mark style="background: #04FF00A6;">Atomic Grain:</mark> One record per item sold in each order.  

<mark style="background: #04FF00A6;">What it captures:</mark> 
- Each line item in every customer’s order  
- Includes individual quantities, unit price, discount, etc.  

<mark style="background: #04FF00A6;">Use case:</mark>
- Ideal for detailed analysis such as:  
- “What products sell most per store per day?” 
- “Which customers buy premium items?”  

<mark style="background: #04FF00A6;">Storage:</mark> Large, but highly flexible.

![[Pasted image 20251017160150.png]]

<mark style="background: #04FF00A6;">Coarser Grain:</mark> One record per product per store per day.  

<mark style="background: #04FF00A6;">What it captures:</mark> 
- Aggregated totals for each day and store  
- Quantity and total revenue summed over all orders that day  

<mark style="background: #04FF00A6;">Use case:</mark>
- Ideal for high-level dashboards such as:
- “Daily total sales by product and region.”  
- “Weekly revenue trends.”

<mark style="background: #04FF00A6;">Storage:</mark> Smaller, faster to query

![[Pasted image 20251017160246.png]]

<mark style="background: #04FF00A6;">Coarser Grain:</mark> One record per region per month.  

<mark style="background: #04FF00A6;">Use Case:</mark> 
- Great for executives; unsuitable for detailed analysis  
- “Which products drove growth?”

![[Pasted image 20251017160337.png]]

### <mark style="background: #04FF00A6;">Choosing your grain</mark>

<mark style="background: #04FF00A6;">As your grain level becomes coarser:</mark>
- Storage decreases  
- Query speed increases  
- Analytical flexibility decreases

### <mark style="background: #04FF00A6;">Identify your dimensions:</mark>

How, Where, Who

### <mark style="background: #04FF00A6;">Design the Fact table</mark>

<mark style="background: #04FF00A6;">Define the Key:</mark> 
- This will be a composite key consisting of all the keys of all dimension tables. This key is not minimal unlike of relational databases. 

<mark style="background: #04FF00A6;">Define the Fact:</mark>
- The non-key attributes of the fact table are measures (fact) that can be analysed using numerical functions.
- What facts are defined depends on the event information collected by operational systems (attributes that are stored in transaction entities).

### <mark style="background: #04FF00A6;">Design the Dimension tables:</mark> 

<mark style="background: #04FF00A6;">Define Dimensional Key:</mark>
- Should be simple numeric key.  
- Usually, we have to generate operational key to keep it unique as this may cause problems while performing historical analysis.  
- Sometimes we can retain the keys.

<mark style="background: #04FF00A6;">Collapse hierarchies:</mark>
- Dimension tables are usually formed by collapsing or denormalising hierarchies (defined by classification entities) into component entities.  
- It is possible for a dimension table to contain hundreds of attributes.  
- This process introduces redundancy in form of transitive dependencies which are violations to third normal form (3NF).

# <mark style="background: #04FF00A6;">11 CouchDB Document Collections</mark>

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
- <mark style="background: #04FF00A6;">Reduce</mark>: aggregates or summarises those pairs.  

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
		<td>Think of it like GROUP BY — summarise or aggregate that data.</td>
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

``doc.type === "exam_result"`` → ensures only result documents are processed.  

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

# <mark style="background: #04FF00A6;">12 More about Data Warehouses</mark>

### <mark style="background: #04FF00A6;">Definitions</mark>

"A data warehouse is a subject-oriented, integrated, time-variant, and non-volatile collection of data in support of management’s decision-making process." - William Marshall, Bill Inmon  

<mark style="background: #04FF00A6;">Data warehousing:</mark> The process of constructing and using data warehouses

### <mark style="background: #04FF00A6;">Data Warehouse v Data Mart</mark>
  
A <mark style="background: #04FF00A6;">data warehouse</mark> is a large centralised repository of data that contains information from many sources within an organisation.

The collated data is used to guide business decisions through analysis, reporting, and data mining tools.

A <mark style="background: #04FF00A6;">data mart</mark> is a subset of a data warehouse oriented to a specific business process.  

Marts contain repositories of summarised data collected for analysis on a specific section or unit within an organisation, for example, the sales department.

### <mark style="background: #04FF00A6;">Data Mart</mark>

<mark style="background: #04FF00A6;">A subset of a data warehouse:</mark> Focuses on a specific business area (e.g., sales, finance). 

Typically, smaller and more subject-specific, providing faster access to data for departmental needs.  

Can be <mark style="background: #04FF00A6;">dependent</mark> (sourced from a central data warehouse)  

Or <mark style="background: #04FF00A6;">independent</mark> (sourced directly from operational systems)

![[Pasted image 20251023094247.png]]

### <mark style="background: #04FF00A6;">Data Warehouse v Data Lake</mark>

<mark style="background: #04FF00A6;">A data warehouse is a centralised repository:</mark> It stores data that has been treated and transformed with a specific purpose in mind, which can then be used to source analytic or operational reporting (determined in advance).

<mark style="background: #04FF00A6;">A data lake is a centralised repository:</mark> It stores large volumes of data in its original form. The data can then be processed and used as a basis for a variety of analytic needs (determined by the user as needed).

### <mark style="background: #04FF00A6;">Data Cube</mark>

A data warehouse is based on a multidimensional data model which views data in the form of a data cube  

A data cube contains aggregates of measure values, on various combinations of dimensions, and furthermore, with various levels of aggregation on individual dimension.

![[Pasted image 20251023094435.png]]

A <mark style="background: #04FF00A6;">data cube</mark> is about how you analyse data.

The <mark style="background: #04FF00A6;">data cube</mark> is the <mark style="background: #04FF00A6;">logical or conceptual representation</mark> of the data warehouse.  

It’s a <mark style="background: #04FF00A6;">multidimensional structure</mark> that allows users to quickly explore aggregated measures across different perspectives.  

It’s what you get when you think of the fact table and its linked dimensions as an <mark style="background: #04FF00A6;">analytical model</mark> rather than raw tables.

![[Pasted image 20251023094557.png]]

<mark style="background: #04FF00A6;">Dimensions</mark> are the categorical attributes that define the structure of a data cube. You can use the dimensions to categorise and filter your data based on different segments.  

<mark style="background: #04FF00A6;">Measures</mark> are the quantitative data points stored within the cube to provide insights.

### <mark style="background: #04FF00A6;">Data Cube - Dimensions</mark>

<mark style="background: #04FF00A6;">Dimensions:</mark> Product, Country, Date  

The <mark style="background: #04FF00A6;">X-axis</mark> represents the time dimension (Year > Quarter > Month):
- Includes hierarchy such as years, quarters, months, or days.  
- A retail sales cube might allow analysis of sales figures by month (January, February, etc.) or year (2023, 2024).  

The <mark style="background: #04FF00A6;">Y-axis</mark> represents the geography dimension (Country > State > City):
- Includes levels such as country, state, city, or store location, enabling regional comparisons.  
- A company might analyse sales performance by region (North America, Europe) or city (New York, London).  

The <mark style="background: #04FF00A6;">Z-axis</mark> represents the product dimension (Category > Type):
- Groups data by product lines or specific items for better sales categorisation.  
- An electronics store might break it down into categories like smartphones, laptops, and accessories to see what’s selling best

### <mark style="background: #04FF00A6;">Data Cube - Measures</mark>

Measures are the <mark style="background: #04FF00A6;">quantitative data points</mark> stored within the cube to provide insights.  

You can aggregate these numeric values using mathematical operations, such as sum, average, count, or maximum.  

<mark style="background: #04FF00A6;">For example:</mark>
- <mark style="background: #04FF00A6;">Revenue:</mark> Total income generated from sales.  
- <mark style="background: #04FF00A6;">Units Sold:</mark> The number of products sold.  
- <mark style="background: #04FF00A6;">Profit Margins:</mark> This is the difference between sales revenue and product sales costs.

### <mark style="background: #04FF00A6;">Data Cube - Hierarchies</mark>

Organise dimensions into levels that help provide advanced analysis through operations.  

By structuring dimensions hierarchically, you can navigate from simple summaries to more detailed data views.  

<mark style="background: #04FF00A6;">Examples:</mark>
- A hierarchy might consist of Year > Quarter > Month > Day in the time dimension.  
- Allows drill down to finer details, such as moving from yearly sales figures to monthly breakdowns.
- In the geography dimension, a hierarchy might be Country > State > City > Store.  
- Allows aggregation of data, such as summing up sales from individual stores, to provide a city-wide total.

### <mark style="background: #04FF00A6;">Data Cube - Operations</mark>  

<mark style="background: #04FF00A6;">Roll-up:</mark>
- Summarising data along a dimension, moving from detailed data points to aggregated data.  
- E.g. roll up daily sales data to monthly or yearly sales data helps in understanding broader trends.

### <mark style="background: #04FF00A6;">Data Cube – Rollup Example (from lab W6)</mark>

<mark style="background: #04FF00A6;">Goal:</mark> Aggregate data to a higher level of summarisation.  

<mark style="background: #04FF00A6;">Example:</mark> From total spend (cost) per vendor per event → per vendor per event type

![[Pasted image 20251023100114.png]]

![[Pasted image 20251023100129.png]]

```SQL
SELECT  
	v.VendorName,  
	e.EventType,  
	SUM(f.TotalCost) AS TotalSpent  
FROM eventsDW.EventFact f  
JOIN eventsDW.VendorDimension v ON f.VendorKey = v.VendorKey  
JOIN eventsDW.EventDimension e ON f.EventKey = e.EventKey  
GROUP BY v.VendorName, e.EventType  
ORDER BY v.VendorName, e.EventType;
```  

You are rolling up the level of analysis from the detailed <mark style="background: #04FF00A6;">event</mark> level to a higher <mark style="background: #04FF00A6;">event type</mark> level (Birthday, Wedding, Corporate, etc.), showing overall vendor performance by category.

### <mark style="background: #04FF00A6;">Data Cube - Operations:</mark>

<mark style="background: #04FF00A6;">Drill-down</mark>
- Opposite of roll-up - breaking down aggregated data into finer granularity.  
- E.g. if the total yearly sales data is available, drilling down to see monthly or daily sales figures provides more specific insights.

<mark style="background: #04FF00A6;">Goal:</mark> Move to a more detailed level of data.  

<mark style="background: #04FF00A6;">Example:</mark> Move from a summary view (total spend per vendor per event date and event type) to a more detailed view per vendor per event date.

![[Pasted image 20251023100643.png]]

```SQL
SELECT  
	v.VendorName,  
	e.EventType,  
	e.EventDate,  
	SUM(f.TotalCost) AS TotalSpent  
FROM eventsDW.EventFact f  
JOIN eventsDW.VendorDimension v ON f.VendorKey = v.VendorKey  
JOIN eventsDW.EventDimension e ON f.EventKey = e.EventKey  
GROUP BY  
	v.VendorName,  
	e.EventType,  
	e.EventDate  
ORDER BY  
	v.VendorName,  
	e.EventType,  
	e.EventDate;
```

The <mark style="background: #04FF00A6;">drill-down query</mark> expands the summary, showing how each vendor’s total for a given ``EventType`` breaks down into individual events (differentiated by ``EventDate``)

### <mark style="background: #04FF00A6;">Data Cube - Operations</mark>  

<mark style="background: #04FF00A6;">Slice and Dice:</mark>
- <mark style="background: #04FF00A6;">Slice:</mark> selects a specific subset of the data cube by fixing a particular dimension.  
- E.g. slicing the cube to look at sales data for a particular year.  
- <mark style="background: #04FF00A6;">Dice:</mark> selecting a sub-cube by the third dimension or specifying values for more than one dimension.  
- E.g. looking at sales data for a specific product category within a particular region.

### <mark style="background: #04FF00A6;">Data Cube – Slice</mark>

Example (from lab W6)

<mark style="background: #04FF00A6;">Goal:</mark> Apply a filter to focus on a single dimension value.  
<mark style="background: #04FF00A6;">Example:</mark> Examine only Wedding events.

![[Pasted image 20251023102449.png]]

```SQL
SELECT  
	v.VendorName,  
	e.EventDate,  
	SUM(f.TotalCost) AS TotalSpent  
FROM eventsDW.EventFact f  
JOIN eventsDW.VendorDimension v ON f.VendorKey = v.VendorKey  
JOIN eventsDW.EventDimension e ON f.EventKey = e.EventKey  
WHERE e.EventType = 'Wedding'  
GROUP BY v.VendorName, e.EventDate  
ORDER BY v.VendorName;
```

This <mark style="background: #04FF00A6;">slice</mark> cuts the cube along the ``EventType`` dimension, showing vendor spending patterns only for weddings.

### <mark style="background: #04FF00A6;">Data Cube – Dice</mark> 

Example (from lab W6)

<mark style="background: #04FF00A6;">Goal:</mark> Apply filters on multiple dimensions simultaneously to form a focused sub-cube.  

<mark style="background: #04FF00A6;">Example:</mark> Analyse Catering vendors for Corporate events in 2024.

![[Pasted image 20251023102711.png]]

```sql
SELECT  
	v.VendorName,  
	e.EventDate,  
	SUM(f.TotalCost) AS TotalSpent  
FROM eventsDW.EventFact f  
JOIN eventsDW.VendorDimension v ON f.VendorKey = v.VendorKey  
JOIN eventsDW.EventDimension e ON f.EventKey = e.EventKey  
WHERE e.EventType = 'Wedding'  
GROUP BY v.VendorName, e.EventDate  
ORDER BY v.VendorName;
```  

This <mark style="background: #04FF00A6;">dice</mark> extracts a smaller cube (Catering × Corporate × 2024) to compare how catering vendors performed within that segment.

### <mark style="background: #04FF00A6;">Data Cube - Operations</mark>  

<mark style="background: #04FF00A6;">Pivot:</mark>
- Re-orienting the multidimensional view of data, allowing users to view the same data often from different perspectives.  
- Useful for identifying trends and patterns that may not be immediately apparent.

### <mark style="background: #04FF00A6;">Data Cube – Dice Example (from lab W6):</mark>

<mark style="background: #04FF00A6;">Goal:</mark> <mark style="background: #04FF00A6;">Reorient</mark> the data to view one dimension’s values (e.g. Event Type) as columns, allowing side-by-side comparison of aggregated measures.  

<mark style="background: #04FF00A6;">Example:</mark> Compare total spending across different event types for each vendor in a single, cross-tabulated view.

```sql
SELECT  
	v.VendorName,  
	SUM(CASE WHEN e.EventType = 'Birthday' THEN f.TotalCost ELSE 0 END) AS Birthday,
	SUM(CASE WHEN e.EventType = 'Corporate' THEN f.TotalCost ELSE 0 END) AS Corporate,
	SUM(CASE WHEN e.EventType = 'Wedding' THEN f.TotalCost ELSE 0 END) AS Wedding, 
	SUM(CASE WHEN e.EventType = 'Charity' THEN f.TotalCost ELSE 0 END) AS Charity,  
	SUM(CASE WHEN e.EventType = 'Graduation' THEN f.TotalCost ELSE 0 END) AS Graduation  
FROM eventsDW.EventFact f  
JOIN eventsDW.VendorDimension v ON f.VendorKey = v.VendorKey  
JOIN eventsDW.EventDimension e ON f.EventKey = e.EventKey  
GROUP BY v.VendorName  
ORDER BY v.VendorName;
```

The pivot operation transforms the data from a tall, row-based format into a wide, cross-tab view, making comparisons across categories much easier. Instead of reading multiple rows to compare how a vendor performs across event types, the pivot layout displays all event types side by side

```sql
CREATE EXTENSION IF NOT EXISTS tablefunc;  
SELECT  
	VendorName,  
	COALESCE(Birthday, 0) AS Birthday,  
	COALESCE(Corporate, 0) AS Corporate,  
	COALESCE(Wedding, 0) AS Wedding,  
	COALESCE(Charity, 0) AS Charity,  
	COALESCE(Graduation, 0) AS Graduation  
FROM crosstab(  
	$$  
	SELECT  
		v.VendorName,  
		e.EventType,  
	SUM(f.TotalCost) AS TotalSpent  
	FROM eventsDW.EventFact f  
	JOIN eventsDW.VendorDimension v ON f.VendorKey = v.VendorKey  
	JOIN eventsDW.EventDimension e ON f.EventKey = e.EventKey  
	GROUP BY v.VendorName, e.EventType  
	ORDER BY v.VendorName, e.EventType  
	$$,  
	$$ VALUES ('Birthday'), ('Corporate'), ('Wedding'), ('Charity'), ('Graduation') $$  
	) AS ct(  
	VendorName TEXT,  
	Birthday NUMERIC,  
	Corporate NUMERIC,  
	Wedding NUMERIC,  
	Charity NUMERIC,  
	Graduation NUMERIC
);
```

### <mark style="background: #04FF00A6;">Fact Tables</mark>
- <mark style="background: #04FF00A6;">Contain related measures:</mark> Store quantifiable business data (such as sales, expenses, and inventory)  
- Usually the largest tables in our schema  
- Usually appended to 
- Can contain detail or summary data 
- Measures are usually additive

### <mark style="background: #04FF00A6;">Data Cube v Fact Table</mark>

The <mark style="background: #04FF00A6;">data cube</mark> is the conceptual heart of the <mark style="background: #04FF00A6;">data warehouse</mark>:  
- How users view and analyse the data.  
- All possible combinations of dimensions relevant to the analysis the user wants to undertake.

The <mark style="background: #04FF00A6;">fact and dimension tables</mark> are the physical heart of the <mark style="background: #04FF00A6;">data warehouse</mark>.  
- How the data is actually stored.  
- Physical storage of measures and foreign keys.

The data cube is the logical or conceptual representation of that central structure.  

It’s what you get when you think of the fact table and its linked dimensions as an analytical model rather than raw tables.

<table>
	<tr>
		<th>Layer</th>
		<th>Description</th>
		<th>Example in W6 lab</th>
	</tr>
	<tr>
		<th>Logical Layer (Data Cube)  </th>
		<td>The multidimensional structure used for analysis </td>
		<td>Dimensions: Event Type, Vendor, Time; Measure: TotalSpend </td>
	</tr>
	<tr>
		<th>Physical Layer </th>
		<td>The actual star schema - tables in the data warehouse  </td>
		<td>EventFact, EventDimension, VendorDimension </td>
	</tr>
	<tr>
		<th>Analytical Layer</th>
		<td>The queries, reports, and dashboards users run</td>
		<td>"Show total spend by event type and vendor"</td>
	</tr>
</table>

The most useful facts in a fact table are <mark style="background: #04FF00A6;">numeric</mark> and <mark style="background: #04FF00A6;">additive</mark>: 

<mark style="background: #04FF00A6;">Additive:</mark> facts that can be summed up across any dimension without losing meaning or accuracy.

Additivity is crucial because data warehouse applications almost never retrieve a single fact table record.

Rather, they fetch back hundreds, thousands, or even millions of these records at a time, and often the most useful thing to do with so many records is to add them up.  

<mark style="background: #04FF00A6;">Type of additivity:</mark> Determines how aggregation can be done across different dimensions

### <mark style="background: #04FF00A6;">Additive</mark>

Additive measures can be aggregated across all dimensions in a data warehouse.  

Operations such as sum, average, count, etc. can be conducted across any dimension, and the results will still be meaningful.  

The most straightforward to work with and are widely used for calculating totals, averages, and other aggregate values.  

<mark style="background: #04FF00A6;">Examples:</mark>  
- <mark style="background: #04FF00A6;">Sales Amount:</mark> The total sales amount can be summed across different time periods, locations, products, etc.  
- <mark style="background: #04FF00A6;">Quantity Sold:</mark> If you want to see how many units of a product were sold over time, across different stores, or customer segments, you can sum this measure.

<mark style="background: #04FF00A6;">Semi-additive</mark> measures are those that <mark style="background: #04FF00A6;">can be aggregated  
across some dimensions but not all and not across time:</mark>  

<mark style="background: #04FF00A6;">Often require special handling:</mark> 
- E.g. using snapshot techniques (capturing data at specific points in time)  
- OR average calculations for time-based dimensions. Require more care in the dimensional modelling.

<mark style="background: #04FF00A6;">Examples:</mark>

<mark style="background: #04FF00A6;">Account Balance:</mark>  
- Account balance is a snapshot measure — it represents the amount of money in an account at a specific point in time (e.g., end of day, end of month).  
- You can sum an account balance across different accounts or locations.  
- Summing it across time doesn't make sense (you can't add account balances from different dates together).  

<mark style="background: #04FF00A6;">Inventory Levels:</mark>  
- Inventory levels represent the state of something at a specific point in time (e.g., stock on hand at the end of each day).  
- Summing inventory levels across different products or warehouses is meaningful  

Summing across different dates is not (would incorrectly represent the inventory).

### <mark style="background: #04FF00A6;">Non-Additive</mark>

<mark style="background: #04FF00A6;">Non-additive</mark> measures <mark style="background: #04FF00A6;">cannot be aggregated across any dimension</mark>. 

Any attempt to sum, average, or perform similar operations will not yield meaningful results.

Often require custom aggregation techniques or calculated measures in reporting tools, where the correct formula is applied based on the dimensions being analysed.  

<mark style="background: #04FF00A6;">Examples:</mark>  
- <mark style="background: #04FF00A6;">Ratios or Percentages:</mark> Measures like profit margin (%) or discount rate (%) cannot be aggregated by summing them. To aggregate such measures, other approaches like weighted averages may be required.  
- <mark style="background: #04FF00A6;">Averages:</mark> If the fact table stores an average value (e.g., average daily temperature), summing these averages across different dimensions won't make sense.

### <mark style="background: #04FF00A6;">Additive, Semi-Additive, Non-Additive</mark>

Understanding the difference between these types is crucial in <mark style="background: #04FF00A6;">dimensional modelling</mark>  

Affects how fact tables are designed, how data is loaded and queried, and how <mark style="background: #04FF00A6;">business intelligence</mark> tools are configured for correct aggregation.  
- <mark style="background: #04FF00A6;">Additive measures</mark> are straightforward to aggregate using standard techniques. 
- <mark style="background: #04FF00A6;">Semi-additive measures</mark> may require specialised modelling techniques like snapshot facts or custom aggregations.  
- <mark style="background: #04FF00A6;">Non-additive measures</mark> typically need <mark style="background: #04FF00A6;">calculated fields</mark> or <mark style="background: #04FF00A6;">derived</mark> measures to represent meaningful aggregates.

### <mark style="background: #04FF00A6;">Data Warehouse - Requirements</mark>

<mark style="background: #04FF00A6;">Accessibility:</mark>
- <mark style="background: #04FF00A6;">Understandable:</mark> legible, meaningfully labelled  
- <mark style="background: #04FF00A6;">Intuitive and obvious to the business user:</mark> not just developers 
- Requires well-designed tools that are simple and easy to use in accessing data 
- <mark style="background: #04FF00A6;">Tractable</mark> minimal wait time on data operations

<mark style="background: #04FF00A6;">Consistency:</mark>
- <mark style="background: #04FF00A6;">Credible data:</mark> data must be clean and quality assured  
- <mark style="background: #04FF00A6;">Cross Business Process Compatible:</mark> a customer is always a customers, otherwise it should be labelled differently  
- Common definitions should be available for end users  
- Consistent information is high quality information that is accounted for and complete

<mark style="background: #04FF00A6;">Adaptive and Resilient:</mark>
- Tolerant to business changes (which are inevitable)  
- Warehouse changes should be graceful and should not invalidate existing data or applications
- New case or business cases should not disrupt existing applications  
- If changes to descriptive data cannot be avoided, appropriate measures must be in place to account for these changes

<mark style="background: #04FF00A6;">Secure:</mark>
- A warehouse contain business critical, sensitive, confidential and valuable information that may be harmful in the wrong hands  
- <mark style="background: #04FF00A6;">Requirements include:</mark>
	- Access control  
	- Data distribution  
	- Encryption  
	- Redundancy  
	- Etc

<mark style="background: #04FF00A6;">Support improved decision making:</mark> 
- Need the right data, visualisation and analytical tools  
- There is only one true output of a DW – the decision made after viewing the evidence from the DW  
- Evidence should support decisions that deliver business impact and value  
- Decision support systems

<mark style="background: #04FF00A6;">Acceptable:</mark>
- User acceptance = success
- Senior management must also buy in and support the increased use of this approach and technology  
- Requires that users trust the data  
- Tools must be intuitive

### <mark style="background: #04FF00A6;">Slowly Changing Dimension (SCD):</mark> 

Used to manage and track <mark style="background: #04FF00A6;">changes in dimension data over time</mark>.  

When dimension attributes change <mark style="background: #04FF00A6;">slowly and infrequently</mark>, SCD techniques ensure that historical context is preserved or updated correctly — depending on the business need.  

<mark style="background: #04FF00A6;">Why?</mark>
- To maintain historical accuracy in reports.  
- To decide whether to overwrite, add, or track changes in dimension data.  
- To support time-based analysis (e.g., “What was the customer’s region at the time of the sale?”).

<mark style="background: #04FF00A6;">Type 2</mark> is the most widely used approach when historical data must be preserved.  

<mark style="background: #04FF00A6;">Each change creates a new record with:</mark>  
- A new surrogate key,
- Valid-from / valid-to dates (or a current flag), and
- Links back to the fact table, ensuring reports can show what was true at that time.

<table>
	<tr>
		<th>Type</th>
		<th>Approach</th>
		<th>Description</th>
		<th>History Preserved</th>
	</tr>
	<tr>
		<th>Type 0</th>
		<td>Retain Original</td>  
		<td>No changes allowed; the original data is kept as-is.</td>
		<td> No</td>
	</tr>
	<tr>
		<th>Type 1</th>
		<td>Overwrite</td>  
		<td>Updates the existing record with the new value; old data is lost.</td>  
		<td>No</td>
	</tr>
	<tr>
		<th>Type 2</th>
		<td>Add New Row</td>    
		<td>Inserts a new row for each change; includes start/end dates or a current flag.</td>  
		<td>Yes (Full)</td>
	</tr>
	<tr>
		<th>Type 3</th>
		<td>Add New Column</td>  
		<td>Adds a new column for the previous value; limited to the most recent change.</td>  
		<td>Yes (Partial)</td>
	</tr>
	<tr>
		<th>Type 4</th>
		<td>Add Mini-Dimension</td>  
		<td>Stores changing attributes in a separate “mini” dimension table. </td>  
		<td>Yes (via link)</td>
	</tr>
	<tr>
		<th>Type 6 </th>
		<td>Hybrid</td>
		<td>Combines features of Types 1, 2, and 3 for complex change tracking. </td>  
		<td>Yes (Flexible)</td>
	</tr>
</table>

![[Pasted image 20251023120146.png]]![[Pasted image 20251023120154.png]]
![[Pasted image 20251023120204.png]]

# <mark style="background: #04FF00A6;">13 ETL Step by Step Example</mark>

![[Pasted image 20251023120255.png]]

![[Pasted image 20251023120306.png]]

### <mark style="background: #04FF00A6;">CUSTOMER DIMENSION</mark>
![[Pasted image 20251023120325.png]]

<mark style="background: #04FF00A6;">1. Consolidation / Entity Matching:</mark>  
- <mark style="background: #04FF00A6;">Rule defined:</mark> Assume same name = same customer.  
- Assign same surrogate key

![[Pasted image 20251023120410.png]]

<mark style="background: #04FF00A6;">2. .Assign Surrogate Keys:</mark>  
- This information is used for future load of new data, it is not temporary!

![[Pasted image 20251023120506.png]]

![[Pasted image 20251023120525.png]]

### <mark style="background: #04FF00A6;">DIMENSION ITEM</mark>

![[Pasted image 20251023120545.png]]

<mark style="background: #04FF00A6;">1. Consolidation / Entity Matching</mark>  
<mark style="background: #04FF00A6;">2. Assign surrogate keys</mark>

![[Pasted image 20251023120554.png]]
![[Pasted image 20251023120659.png]]

### <mark style="background: #04FF00A6;">DATE DIMENSION</mark>

  It can be pre-populated (the same for time dimension).

### <mark style="background: #04FF00A6;">FACT TABLE</mark>

![[Pasted image 20251023120746.png]]

<mark style="background: #04FF00A6;">Assign Surrogate Key:</mark>
1. Join the stage Fact Table with the Customer Stage Table to get the right Customer SK. <mark style="background: #04FF00A6;">Join on the CustID and the SourceDB</mark>.  
2. Join the stage Fact Table with the Item Stage Table to get the right Item SK. <mark style="background: #04FF00A6;">Join on the ItemID and the SourceDB</mark>. 
3. Join the stage Fact Table with the Date dimension to get the right DateSK. <mark style="background: #04FF00A6;">Join on the field Date of the stage Fact Table</mark>.  
4. <mark style="background: #04FF00A6;">Price</mark> is a derived field (Qty X Price). In the fact table it is called TotalPrice.

![[Pasted image 20251023120920.png]]

### <mark style="background: #04FF00A6;">WHAT HAPPENS WHEN THERE IS NEW DATA?</mark> 

HOW DOES IT GET LOADED INTO THE STAR SCHEMA?

![[Pasted image 20251023120948.png]]
![[Pasted image 20251023120958.png]]
![[Pasted image 20251023121009.png]]

### <mark style="background: #04FF00A6;">Changes in the Fact Table and Dimensions</mark>  

New facts are 99% appended in the fact table (very few exceptions)  

Dimensions change slower than the fact table.  

When a dimension is modified by an update, multiple strategies are possible (as discussed)

# <mark style="background: #04FF00A6;">14 Relational Database Query Processing</mark>

### <mark style="background: #04FF00A6;">Data Storage in PostgreSQL</mark>  

POSTGRESQL STORES TABLE AND INDEX DATA IN FIXED-SIZE PAGES (DEFAULT = 8 KB EACH).  

<mark style="background: #04FF00A6;">A PAGE</mark> = THE SMALLEST UNIT OF I/O — WHEN READING FROM DISK, POSTGRESQL ALWAYS READS OR WRITES FULL PAGES.

### <mark style="background: #04FF00A6;">Buffers and Shared Memory:</mark>

<mark style="background: #04FF00A6;">Buffers</mark> are copies of these data pages kept in <mark style="background: #04FF00A6;">shared memory</mark> (RAM).  

<mark style="background: #04FF00A6;">The Buffer Manager decides:</mark>
- When to read pages from disk into memory.  
- When to write modified pages (dirty buffers) back to disk.

### <mark style="background: #04FF00A6;">Cache Layers</mark>  

<mark style="background: #04FF00A6;">Shared Buffers:</mark> PostgreSQL’s internal cache - stores recently used data pages.  

<mark style="background: #04FF00A6;">OS File Cache:</mark> The operating system may also keep recently read files in memory.

PostgreSQL stores recently accessed table and index pages in memory, inside the shared buffer cache. If a query needs a page that’s already cached, PostgreSQL can read it directly from memory — much faster than reading from disk.  

<mark style="background: #04FF00A6;">Cold Cache Query:</mark> 
- Happens when data pages are not yet loaded into memory.  
- PostgreSQL must read them from disk, which is slower.  
- <mark style="background: #04FF00A6;">Typically occurs:</mark>
	- On the first time you run a query after starting PostgreSQL, or  
	- After clearing cache (e.g. restarting the database).  

<mark style="background: #04FF00A6;">Warm Cache Query:</mark>
- Happens when the same data pages are already cached in shared buffers.  
- PostgreSQL can return results from memory, without touching disk.  
- Usually faster, because it avoids I/O delays

### <mark style="background: #04FF00A6;">Cache</mark>

Every time PostgreSQL plans and runs a query, it has to look up table definitions, column types, indexes, etc. (catalog metadata)  

These are stored in internal tables like ``pg_class``, ``pg_attribute``, etc.  

Those lookups bring a small number of pages into the shared buffer cache - Typically a few dozen to a few hundred pages depending on your system.  

So even on a “fresh” start some catalog pages were accessed and cached.  

<mark style="background: #04FF00A6;">Key idea:</mark> Catalog metadata is always accessed first, so it ends up in memory.  

<mark style="background: #04FF00A6;">Plus:</mark> As the query runs, it populates the cache.

Basic Stages in Query Processing

![[Pasted image 20251106142305.png]]

### <mark style="background: #04FF00A6;">The Life of a Query:</mark>

<mark style="background: #04FF00A6;">From SQL to Result:</mark>  
- <mark style="background: #04FF00A6;">Client sends SQL</mark>.  
- <mark style="background: #04FF00A6;">Parser</mark> checks syntax and converts to a parse tree.  
- <mark style="background: #04FF00A6;">Rewriter</mark> simplifies or replaces views.  
- <mark style="background: #04FF00A6;">Optimiser</mark> finds the best way to execute (chooses indexes, join order).  
- <mark style="background: #04FF00A6;">Executor</mark> runs the plan.  
- <mark style="background: #04FF00A6;">Results returned</mark> to the client.

![[Pasted image 20251106142431.png]]

### <mark style="background: #04FF00A6;">Parser</mark>

<mark style="background: #04FF00A6;">Responsible for:</mark>  
- Checking literal syntax errors.  
- Generating parse tree  

SQL is parsed using the <mark style="background: #04FF00A6;">flex</mark> (Flex lexical analyser) and <mark style="background: #04FF00A6;">bison</mark> parser tools.  

The <mark style="background: #04FF00A6;">lexer</mark> recognises lexemes in the query string (such as SQL keywords, string and numeric literals, etc.)  

The <mark style="background: #04FF00A6;">parser</mark> makes sure that the resulting set of lexemes is grammatically valid.

### <mark style="background: #04FF00A6;">When PostgreSQL executes a query</mark>

The <mark style="background: #04FF00A6;">Executor</mark> requests data pages (blocks) from tables or indexes.  

The <mark style="background: #04FF00A6;">Storage Manager</mark> decides where that data lives — on disk or already in memory.  

<mark style="background: #04FF00A6;">The Buffer Manager checks:</mark>  
- Is the required page already in shared buffers (in-memory cache)?  
- If yes → read directly from memory (faster).  
- If no → fetch from disk, store it in a buffer for reuse.  

Client → Parser → Rewriter → Optimiser → Executor  
↓  
Catalog Manager / Transaction Manager  
↓  
Storage Manager  
↓  
Buffer Manager  
↓  
Disk

<table>
	<tr>
		<th>Stage</th>
		<th>Purpose / Key Tasks</th>
		<th>Example / Notes (PostgreSQL)</th>
	</tr>
	<tr>
		<th>Parsing</th>
		<td>Checks SQL syntax, names, and permissions. Converts SQL into a parse tree. </td>
		<td>Uses <mark style="background: #04FF00A6;">flex</mark> (lexer) and bison (parser). Performs early security checks.</td>
	</tr>
	<tr>
		<th>Rewriting</th>
		<td>Simplifies the query, expands views into base tables, and adds useful predicates. </td>
		<td>Uses the <mark style="background: #04FF00A6;">Catalog Manager</mark> to validate tables and attributes.</td>
	</tr>
	<tr>
		<th>Optimisation</th>  
		<td>Chooses the lowest-cost query plan using estimated I/O and CPU costs. </td>
		<td>Cost-based optimiser determines join order and scan type. EXPLAIN. </td>
	</tr>
	<tr>
		<th>Execution</th>
		<td> Executes the chosen plan using relational operators.</td>
		<td>The <mark style="background: #04FF00A6;">Executor</mark> uses plan nodes (Scan, Join, Sort, Aggregate). ANALYZE</td>
	</tr>
	<tr>
		<th>Buffer Management</th>
		<td>Handles data movement between disk and memory, caching frequently accessed pages.</td>
		<td>Uses the <mark style="background: #04FF00A6;">Buffer Manager</mark> to manage shared buffers. Performance visible in EXPLAIN (ANALYZE, BUFFERS). </td>
	</tr>
	<tr>
		<th>Storage Manager</th>
		<td>Reads/writes data pages on disk through access methods. </td>
		<td>Works with tables, indexes, and transaction logs.</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Parse Tree:</mark> 

<mark style="background: #04FF00A6;">RTE – Range Table Entry:</mark> "range table" in the PostgreSQL source code refers to tables, subqueries, results of joins—in other words, any record sets that SQL statements operate on

```sql
SELECT schemaname, tablename  
FROM pg_tables  
WHERE tableowner = 'postgres’  
ORDER BY tablename;
```

![[Pasted image 20251106143931.png]]

### <mark style="background: #04FF00A6;">Understanding EXPLAIN Output (Simplified)</mark>

Each step = Node (Scan, Join, Sort, etc.)  

Nodes form a tree – bottom = data read, top = final result.  

<mark style="background: #04FF00A6;">Key fields:</mark> 
- <mark style="background: #04FF00A6;">Node Type:</mark> what operation is used (e.g., Hash Join)  
- <mark style="background: #04FF00A6;">Cost:</mark> estimated work (startup..total)  
- <mark style="background: #04FF00A6;">Actual Time:</mark> measured during ANALYZE  
- <mark style="background: #04FF00A6;">Rows:</mark> estimated vs. actual row count  

<mark style="background: #04FF00A6;">Buffers – number of data pages read from memory (shared buffers) vs. disk:</mark>
- shared read = from disk  
- shared hit = already in memory (faster)  
- temp read/write = temporary disk I/O  

### <mark style="background: #04FF00A6;">Simple Example</mark>

Suppose we have a simple database table of Employees with two attributes ID (primary key) and name (non-unique, non-primary key):  

```SQL
-- Create the table  
CREATE TABLE employee (  
ID INT PRIMARY KEY,  
NAME VARCHAR(50)  
);  
-- Insert the data  
INSERT INTO employee (ID, NAME) VALUES  
(1, 'Fred'),  
(2, 'Joe'),  
(3, 'Jane'),  
(4, 'Mary'),  
(5, 'Paulette'),  
(6, 'Pierre');
```

![[Pasted image 20251106145518.png]]

### <mark style="background: #04FF00A6;">Simple Example:</mark>

Given the current data, these two queries will return the same result:  

Query 1:  
```SQL
SELECT *  
FROM employee  
WHERE name=‘Joe’;
``` 

Query 2:  
```sql
SELECT *  
FROM employee  
WHERE ID=2;
```

But they may have different <mark style="background: #04FF00A6;">query plans</mark> since ID is unique and name is non-unique  

<mark style="background: #04FF00A6;">Query 1:</mark>
```sql
explain (analyze, buffers) SELECT *  
FROM employee  
WHERE name='Joe'
```  

This will use a sequential scan which means all rows of the database will be checked  
- If the name Joe is found it will be added to the resultset  
- As more than one row can have the value Joe for name all rows have to be checked to ensure all data is found

<mark style="background: #04FF00A6;">QUERY PLAN</mark>
```
Seq Scan on employee (cost=0.00..16.75 rows=3 width=122) (actual  
time=2.345..2.347 rows=1 loops=1)  
Filter: ((name)::text = 'Joe'::text)  
Rows Removed by Filter: 5  
Buffers: shared read=2  
Planning Time: 0.048 ms  
Execution Time: 2.362 ms
```

But they may have different query plans since ID is a key and name is non-primary key.  

<mark style="background: #04FF00A6;">Query 2:</mark>  
```sql
explain (analyze, buffers) SELECT *  
FROM employee  
WHERE ID=2;
```  

This will use a index scan  

The index is used to determine which rows to read data from.  

The actual data of the row is then read.

<mark style="background: #04FF00A6;">QUERY PLAN</mark>

```
Index Scan using employee_pkey on employee (cost=0.15..8.17 rows=1 width=122) (actual  
time=0.020..0.021 rows=1 loops=1)|  
Index Cond: (id = 2) |  
Buffers: shared hit=2 |  
Planning Time: 0.077 ms |  
Execution Time: 0.044 ms
```

### <mark style="background: #04FF00A6;">Node Types</mark>

<table>
	<tr>
		<th>Node Type</th>
		<th> Description </th>
		<th>When Used</th>
	</tr>
	<tr>
		<th>Seq Scan</th>
		<td>Reads all rows</td>
		<td>Small tables or no index</td>
	</tr>
	<tr>
		<th>Index Scan</th>
		<td>Uses index to find rows</td>
		<td>Selective WHERE clause</td>
	</tr>
	<tr>
		<th>Index-Only Scan</th>
		<td>Reads only from index</td>
		<td>Query uses only indexed columns</td>
	</tr>
	<tr>
		<th>Bitmap Index Scan</th>
		<td>Combines multiple indexes</td>
		<td>Complex filters</td>
	</tr>
	<tr>
		<th>Nested Loop Join</th>
		<td>Loops over inner table</td>
		<td>Small joins</td>
	</tr>
	<tr>
		<th>Hash Join</th>
		<td>Hashes smaller table</td>
		<td>Equality joins</td>
	</tr>
	<tr>
		<th>Merge Join</th>
		<td>Sorted inputs</td>
		<td>Large sorted joins</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">The Life of a Query Shared Components</mark>

<mark style="background: #04FF00A6;">Catalog Manager and Memory Manager:</mark> 
- Invoked as utilities during any transaction  
- Catalog is used by the query processor during authentication, parsing, and query optimisation 
- Memory manager is used throughout the DBMS whenever memory needs to be dynamically allocated or deallocated  

Administration, Monitoring and Utilities 

Replication and Loading Services  

Batch Services  

All run independently of a query focus is on keeping the database reliable.

![[Pasted image 20251106151619.png]]

### <mark style="background: #04FF00A6;">EXPLAIN ANALYZE BUFFERS IN ACTION</mark>

<mark style="background: #04FF00A6;">Open:</mark> CMPU4003-W8-ExplainPlan-ExamResultsDW.pdf  

What kind of joins appear?

Which table seems largest?  

What node has the highest total cost?  

What is happening with the buffers? Is it reading from disk/cache?

### <mark style="background: #04FF00A6;">What kind of joins appear?</mark>

<mark style="background: #04FF00A6;">All the joins are Hash Joins:</mark>
- Hash Join  
- Hash Cond: (factmarks.student_sk = dimstudent.student_sk)  
- Hash Join  
- Hash Cond: (factmarks.course_sk = dimcourse.course_sk)  
- Hash Join  
- Hash Cond: (factmarks.degree_sk = dimdegree.degree_sk)  

PostgreSQL is using hash-based equality joins - it builds an in-memory hash table of the smaller (dimension) table and probes it using rows from the larger (fact) table.  

<mark style="background: #04FF00A6;">This is efficient when:</mark>
- The join condition uses =  
- The smaller table fits in memory

### <mark style="background: #04FF00A6;">Which table seems largest?</mark>

<mark style="background: #04FF00A6;">factmarks is the largest table in this query:</mark>
- Highest row estimate (rows=1660)  
- It is scanned first to drive the joins (the “fact” table in a star schema).  

The dimension tables (dimstudent, dimcourse, dimdegree) each have only ~200–250 estimated rows.

### <mark style="background: #04FF00A6;">What node has the highest total cost?</mark> 

<mark style="background: #04FF00A6;">Hash Join (cost=45.52..85.45 rows=1660 width=554):</mark>
- The top-level Hash Join has the highest total cost (85.45).  
- That’s the final join combining all previous joins into the full result set.
- The “total cost” is the estimated total work (CPU + I/O), so this join represents the accumulated cost of the entire query execution.

### <mark style="background: #04FF00A6;">What is happening with the buffers?</mark>

Buffers: shared hit=4  
Buffers: shared hit=3  
Buffers: shared hit=2  
Buffers: shared hit=1  
  
Planning:  
Buffers: shared hit=13  

<mark style="background: #04FF00A6;">All buffer stats are shared hit, no read. That means:</mark>  
- All pages were found in shared memory (cache),  
- No disk reads occurred — data was already cached from a previous query or load.  

This is a <mark style="background: #04FF00A6;">warm cache</mark> case.  

<mark style="background: #04FF00A6;">If it had been a cold cache, you’d see:</mark>
- Buffers: shared read= . . .
- indicating data blocks were read from disk into memory.

### <mark style="background: #04FF00A6;">Explain Analyze Buffers</mark>  

This is a schema for a small data warehouse.  

We are driving from the fact (factmarks) which stores the result for a student including the degree, course, date and student id.  

To retrieve all information from this database we can use this select:  

```sql
Select student_firstname, student_lastname, modeofstudy, degree_name, course_name, examdate, pass  
From factmarks  
Join dimstudent using (student_sk)  
Join dimcourse using (course_sk)  
Join dimdegree using (degree_sk)  
Join dimdate using (date_sk);
```

### <mark style="background: #04FF00A6;">Explain Analyze Buffers</mark>

<mark style="background: #04FF00A6;">Open:</mark> CMPU4003-W8-ExplainPlan-ExamResultsDW.pdf  

<mark style="background: #04FF00A6;">Read from bottom up:</mark>
- Scan the base tables  
- Seq Scan on factmarks ... rows=6 ... Buffers: shared hit=1. Reads all rows in factmarks (it’s tiny here → 6 rows returned). Page already in memory (hit).
- Seq Scan on dimstudent ... rows=4 ... Buffers: shared hit=1. Reads the whole student dimension (4 rows). 
- Seq Scan on dimcourse ... rows=4 ... Buffers: shared hit=1  Reads the whole course dimension.  
- Seq Scan on dimdegree ... rows=3 ... Buffers: shared hit=1 Reads the whole degree dimension.

Build hash tables for the small (dimension) inputs

<mark style="background: #04FF00A6;">Hash above each dimension scan (student, course, degree):</mark>
- <mark style="background: #04FF00A6;">Buckets: 1024, Batches: 1, Memory Usage:</mark> 9kB → fits easily in memory; no spill to disk.  
- This step turns each small dimension into an in-memory hash table keyed by the join column.

<mark style="background: #04FF00A6;">First join: factmarks ⟗ dimstudent (Hash Join)</mark>
- <mark style="background: #04FF00A6;">Hash Cond:</mark> (factmarks.student_sk = dimstudent.student_sk) Executor <mark style="background: #04FF00A6;">probes</mark> the student hash table with each row from factmarks.  
- <mark style="background: #04FF00A6;">Result:</mark> 6 joined rows (since all 6 fact rows matched).  
- <mark style="background: #04FF00A6;">Buffers:</mark> shared hit=2 → pages used so far were all in shared buffers.

<mark style="background: #04FF00A6;">Second join: (fact⟗student) ⟗ dimcourse (Hash Join)</mark>
- <mark style="background: #04FF00A6;">Hash Cond:</mark> (factmarks.course_sk = dimcourse.course_sk)  
- Build course hash (done in step 2), then probe it with the 6 rows from the previous join. 
- Still 6 rows after this join (all matched). 
- <mark style="background: #04FF00A6;">Buffers:</mark> shared hit=3.

<mark style="background: #04FF00A6;">Third (final) join: ... ⟗ dimdegree (Hash Join)</mark>
- <mark style="background: #04FF00A6;">Hash Cond:</mark> (factmarks.degree_sk = dimdegree.degree_sk)
- Build degree hash and probe it with the 6 rows. 
- <mark style="background: #04FF00A6;">Final output:</mark> 6 rows returned to the client. 
- <mark style="background: #04FF00A6;">Buffers:</mark> shared hit=4.

<mark style="background: #04FF00A6;">Costs, times, and cardinality:</mark>
- Each Hash Join node shows cost=startup..total (estimates), e.g. top node 45.52..85.45. 
- actual time=0.043..0.048 shows real timing (very small here). 
- Planner estimated rows=1660 at various joins (it doesn’t know your tables are tiny); actual was rows=6.

<mark style="background: #04FF00A6;">Planning phase</mark>
- <mark style="background: #04FF00A6;">Planning: Buffers:</mark> shared hit=13 → the planner also touched catalog pages (and maybe small table pages) that were already cached while building the plan. 
- <mark style="background: #04FF00A6;">Planning Time:</mark> 0.321 ms, Execution Time: 0.085 ms → tiny dataset, mostly planning overhead.

### <mark style="background: #04FF00A6;">Query Processing:</mark>

Process of converting high level queries to low level expressions to extract the data from physical level file system like databases

<mark style="background: #04FF00A6;">A relational query processor:</mark>
- Takes in a declarative SQL statement  
- Validates it 
- Optimises it into a procedural dataflow execution plan  
- Executes that dataflow program on behalf of a client program (subject to admission control)

### <mark style="background: #04FF00A6;">Query Parsing</mark>

![[Pasted image 20251106160421.png]]

<mark style="background: #04FF00A6;">Given an SQL statement the SQL Parser will:</mark>
1. checks that the query is correctly specified  
2. resolves names and references  
3. converts the query into the internal format used by the Query Optimiser  
4. verifies that the user is authorized to execute the query.  

<mark style="background: #04FF00A6;">Note:</mark>  
- Some DBMSs defer some or all security checking to execution time but the parser is still responsible for gathering the data needed for the execution-time security check  
- <mark style="background: #04FF00A6;">PostgreSQL</mark> is one of the DBMSs that performs some <mark style="background: #04FF00A6;">security checking at parse time</mark> and <mark style="background: #04FF00A6;">defers others until execution time</mark>.

The parser first considers each of the tables referenced in the FROM clause.  

<mark style="background: #04FF00A6;">It converts all table names used into the fully qualified name:</mark>
- Form used is ``server.database.schema.table`` (called four part name)  
- If you are not spanning multiple servers the form ``database.schema.table`` is used

The query processor then invokes the catalog manager to check that the table is registered in the system catalog.

It then uses the catalog to ensure that attribute references are correct.

The data types of attributes are used to drive the disambiguation logic for overloaded functional expressions, comparison operators, and constant expressions  

<mark style="background: #04FF00A6;">For example:</mark>  Suppose we include the expression (EMP.salary * 1.15) < 75000 in our query. Here decisions need to be made about:
- the code for the multiplication function and comparison operator  
- the assumed data type and internal format of the strings “1.15” and “75000”  
- These decisions depend on the data type of the EMP.salary attribute.  
- Could be an integer, a floating-point number, or a “money” value

<mark style="background: #04FF00A6;">Additional SQL syntax checks are needed. E.g.:</mark>
- Are variables used consistently  
- Are tables compatible for use with set operators (UNION/INTERSECT/EXCEPT)  
- Are attributes suitable for use in aggregation  
- Are sub-queries nested appropriately . . . .

### <mark style="background: #04FF00A6;">Query Rewrite</mark>

Simplifies and normalises the query without changing its semantics  

Can only use the query and the metadata in the catalog. Cannot use the data in the tables  

Rewrite = Translation -> To an internal representation  

So what does it do?

<mark style="background: #04FF00A6;">It rewrites the query</mark>
- Substituting any references with column references to tables used in the view  
- This process is applied recursively until the query is expressed exclusively over tables and includes no views

### <mark style="background: #04FF00A6;">Query Rewrite - Logical Rewriting of Predicates</mark>  

Applied based on the predicates and constants in the WHERE clause  

Simple Boolean logic is often applied to improve the match between expressions and the capabilities of index-based access methods  

E.g A predicate such as NOT Emp.Salary > 1000000, for example, may be rewritten as Emp.Salary <= 1000000

Applied based on the predicates and constants in the WHERE clause  

Transitivity of predicates is used to produce new predicates e.g. R.x < 10 AND R.x = S.y Could become R.x < 10 AND S.y < 10.  

Adding these transitive predicates increases the ability of the optimiser to choose plans that filter data early in execution, especially through the use of index-based access methods

### <mark style="background: #04FF00A6;">Query Rewrite - Semantic Optimisation</mark> 

Integrity constraints on the schema are stored in the catalog and can be used to help rewrite some queries.

Can lead to redundant join elimination.

```sql
SELECT E.Lname, M.Lname  
FROM EMPLOYEE AS E, EMPLOYEE AS M  
WHERE E.Super_ssn=M.Ssn AND E.Salary >  
M.Salary
```  

Suppose we had implemented a constraint that an employee can never earn more than their manager?  

If the semantic query optimiser checks for the existence of this constraint then it will know the result of this query will be zero so it doesn’t have to run it at all

### <mark style="background: #04FF00A6;">Query Optimiser</mark>  

<mark style="background: #04FF00A6;">SQL is a declarative language:</mark>
- A SQL query entered by a user describes what the user wants  
- The query is then parsed and rewritten into an internal query representation  

The query optimiser transforms an internal query representation into an efficient query plan for executing the query  

Query plan is a list of instructions that the DBMS needs to follow in order to execute a query on the data. Can be thought of (and depicted) as a dataflow diagram that pipes table data through a graph of query operators.

### <mark style="background: #04FF00A6;">Query Optimiser Objective</mark>  

For a given query, find a correct execution plan that has the lowest “cost”.  

This is the part of a DBMS that is the hardest to implement well (proven to be NP-Complete).  

The query optimiser tries to determine the most efficient way to execute a given query by considering the possible query plans  

<mark style="background: #04FF00A6;">No optimiser truly produces the “optimal” plan:</mark>
- Use estimation techniques to guess real plan cost.  
- Use heuristics to limit the search space.

### <mark style="background: #04FF00A6;">Query Optimiser</mark>

<mark style="background: #04FF00A6;">Three components:</mark>
1. Search space  
2. Plan enumeration algorithms  
3. Cardinality and cost estimation

### <mark style="background: #04FF00A6;">Search space</mark>  

<mark style="background: #04FF00A6;">Two ways to optimise:</mark>
- <mark style="background: #04FF00A6;">Analyse and transform equivalent relational expressions:</mark> Attempting to minimise the tuple and column counts of the intermediate and final query processes  
- <mark style="background: #04FF00A6;">Using different algorithms for each operation:</mark> Underlying algorithms determine how tuples are accessed from the data structures they are stored in, indexing, hashing, data retrieval and hence influence the number of disk and block accesses

### <mark style="background: #04FF00A6;">Relational Algebra</mark>

A formal representation of queries based on mathematical sets  

Every SQL query can be rewritten as a relation.  

<mark style="background: #04FF00A6;">For example:</mark>  
```sql
SELECT R.A, R.B  
FROM R  
WHERE R.A > 5;  
SELECT R.A, R.B: -- Retrieves the columns A and B from relation (table) R.  
FROM R: -- Specifies the relation (table) R.  
WHERE R.A > 5: -- Filters the rows where the value in column A is greater than 5. 
``` 

<mark style="background: #04FF00A6;">Can be written as:</mark>  
```sql
PROJECT(A, B) [ SELECT(A > 5) [ R ] ]
```  

<mark style="background: #04FF00A6;">In relational algebra, the process of querying data is done through a sequence of operations:</mark>
- Selection (also called "σ" or "select") (SELECT(A > 5)): 
- Filters the table R based on the condition A > 5. 
- Projection (also called "π" or "project") (PROJECT(A, B)): Retrieves only the specific columns A and B from the filtered data.

We can describe tables in a relational database as sets of tuples  

We can describe query operators using set theory  

<mark style="background: #04FF00A6;">The query language is called relational algebra:</mark>
- Every query can be converted to relational algebra  
- <mark style="background: #04FF00A6;">Operands:</mark> variables or values from which new values can be constructed  
- <mark style="background: #04FF00A6;">Operators:</mark> symbols denoting procedures that construct new values from given values
- Expressions can be constructed by applying operators to atomic operands and/or other expressions  

Relational algebra can be converted to tree with joins as branches 

Each operator has implementation choices  

Operators can also be applied in different order

<mark style="background: #04FF00A6;">Form:</mark> An operator takes as input a relation (or two in the case of joins and unions) and produces another relation as output  

<mark style="background: #04FF00A6;">A series of operators can therefore be chained together, each consuming the output of the operator that precedes it, right down to the source:</mark>
- You imagine the data as streams of information.  
- You channel these streams through operators that filter out unneeded data, join it with other streams of information or process some kind of aggregate function like ``sum()`` or ``count()``.  

The appropriate operators applied in the appropriate order materialises the query’s results 

<mark style="background: #04FF00A6;">We can model the chain of operators as a tree:</mark>
- The leaves of the tree are the raw tables.  
- The output of the root operator is the query’s result.  
- We can translate SQL into a tree of Relational Operators, also termed as an Abstract Syntax Tree (AST)  
- Leaves are operands (Either variables standing for relations or particular, constant relations)  
- Interior nodes are operators, applied to their child or children

![[Pasted image 20251106162207.png]]

### <mark style="background: #04FF00A6;">Example</mark>  

<mark style="background: #04FF00A6;">SQL states the WHAT:</mark>
```sql
Product(pid, name, price)  
Purchase(pid, cid, store)  
Customer(cid, name, city)  
SELECT DISTINCT x.name, z.name  
FROM Product x, Purchase y, Customer z  
WHERE x.pid = y.pid and y.cid = y.cid and x.price > 100 and z.city = ‘Seattle’
```

![[Pasted image 20251106162336.png]]

### <mark style="background: #04FF00A6;">Query Optimiser:</mark>

<mark style="background: #04FF00A6;">Search space:</mark>
- Set of all alternative plans that are considered by the optimiser  
- Defined by the set of algebraic laws and the set of plans used by the optimiser

On completion, a few operators are typically added to the top of each query block as post-processing to compute GROUP BY, ORDER BY, HAVING and DISTINCT clauses if they exist. The various blocks are then stitched together in a straightforward fashion

![[Pasted image 20251106163116.png]]

### <mark style="background: #04FF00A6;">Example:</mark>

<mark style="background: #04FF00A6;">Find names of stars and the length of the movies they have appeared in 2014</mark>
- ``Stars( name, address)``  
- ``AppearIn( star_name,title, year),``  
- ``Movies( title, year, length, type, studio_name)``

<mark style="background: #04FF00A6;">Most Efficient Plan (Can be found by the optimiser):</mark>
```
πname,length(Stars ⋈  
πname,length(AppearIn ⋈  
(πtitle,year,length σyear=2014(Movies)))
```  

<mark style="background: #04FF00A6;">Start with the Movies table:</mark>
- Select only the movies where year = 2014.  
- σyear=2014(Movies) = “all movies released in 2014”. 
- Project (keep only) the columns title, year, and length.  
- πtitle,year,length(σyear=2014(Movies))  
- means “keep only each 2014 movie’s title, year, and length”.  
- Join that result with the AppearIn table.  
- → AppearIn ⋈ (...Movies...)/ This links each appearance record with its matching movie (so you know which star appeared in which 2014 movie and how long the movie is).  
- Project the star’s name and movie length. → πname,length(AppearIn ⋈ ...) keeps only the star’s name and the movie’s length for each match.  
- Join that with the Stars table. → Stars ⋈ (...) connects each name with the corresponding star record (perhaps to include star details).
- Final projection: → πname,length(Stars ⋈ ...) keeps only two attributes in the final output: the star’s name, and the length of each movie they appeared in (from 2014).

### <mark style="background: #04FF00A6;">Query Optimiser:</mark>

<mark style="background: #04FF00A6;">Approaches</mark>
- Heuristics  
- Heuristics + Cost-based Join Order Search  
- Randomised Algorithms  
- Stratified Search  
- Unified Search

Query optimisation ≠ changing results - it changes <mark style="background: #04FF00A6;">how</mark> the result is produced.  

PostgreSQL picks a plan based on estimated <mark style="background: #04FF00A6;">cost</mark> and <mark style="background: #04FF00A6;">statistics</mark>.  

Always confirm with EXPLAIN ANALYZE BUFFERS.  

Understanding node types = understanding performance

### <mark style="background: #04FF00A6;">How do we know what is happening?</mark>  

Query plans  

PostgreSQL  

<mark style="background: #04FF00A6;">EXPLAIN:</mark>  
- Takes as a parameter a SQL statement  
- Returns the estimated plan and cost, in plain text by default (you can request a different format)  

<mark style="background: #04FF00A6;">ANALYZE:</mark>
- Takes as a parameter a SQL statement  
- Will actually run the query (so be careful with updates or deletes and transactions)  

<mark style="background: #04FF00A6;">BUFFERS:</mark> Adds I/O information to the plan showing how data was accessed.

# <mark style="background: #04FF00A6;">15 Improving PostgreSQL Performance</mark>


<mark style="background: #04FF00A6;">Common Causes of Performance Bottlenecks</mark>
- Large sequential scans on tables
- Poor Index Selectivity
- Poor Join Order or Missing Filters
- Cold cache after restart
- Outdated Statistics or Bloated Tables
- I/O pressure during aggregation

### <mark style="background: #04FF00A6;">Large sequential scans on tables</mark> 

A sequential scan reads every row in a table, one by one, even if only a small subset of rows is needed.  

This is efficient for small tables or queries retrieving most rows — but costly for large tables with selective filters.  

<mark style="background: #04FF00A6;">Sequential scans occur when:</mark>
- No suitable index exists for the query predicate.  
- The optimiser estimates (based on outdated statistics) that scanning the entire table is cheaper than using an index.  

<mark style="background: #04FF00A6;">Example:</mark>  
- ``SELECT * FROM sales WHERE region_id = 5;``  
- If only 1% of rows match and there’s no index on region_id, PostgreSQL scans the whole table — a large I/O operation

### <mark style="background: #04FF00A6;">Poor Index Selectivity</mark>

Index selectivity measures how effectively an index filters data — the ratio of unique indexed values to total rows.  
- High selectivity = many distinct values → index is effective.  
- Low selectivity = few distinct values → index is inefficient.  

The planner will avoid using an index if it believes the index scan won’t reduce I/O significantly.  

<mark style="background: #04FF00A6;">Example:</mark>  
- EXPLAIN (ANALYZE, BUFFERS)  
- SELECT *  
- FROM examresultsdw.factmarks  
- WHERE examdate BETWEEN '2024-01-01' AND '2024-12-31';  
- The query includes an entire year of data.  
- If each year holds, say, 20%–30% of all records, that’s hundreds of thousands of rows for a large university.  
- Although there’s an index on examdate, PostgreSQL estimates that too many rows match the condition, so using the index would  require scanning large portions of the index tree, fetching most table pages anyway.  
- In this case, the Sequential Scan is cheaper.  

<mark style="background: #04FF00A6;">Key takeaway:</mark> Indexes help only when they sharply reduce the number of rows read — otherwise, they add overhead

### <mark style="background: #04FF00A6;">Poor Join Order or Missing Filters</mark>  

PostgreSQL’s optimiser must choose which tables to join first and how (e.g. nested loop, hash join, merge join).  
- A suboptimal join order can dramatically increase the size of intermediate results — millions of rows might be joined unnecessarily.  
- Missing filters (e.g. WHERE clauses not pushed down early) cause the same issue by preventing early row elimination.  

<mark style="background: #04FF00A6;">Example:</mark>
```sql
SELECT * FROM fact_sales f  
JOIN dim_region r ON f.region_id = r.region_id  
JOIN dim_date d ON f.date_id = d.date_id;
```  

If the filter ``WHERE d.year = 2024`` is applied <mark style="background: #04FF00A6;">after</mark> the joins, all rows across all years are joined first — massive overhead.  

Always apply selective filters as early as possible to reduce join size and cost

### <mark style="background: #04FF00A6;">Cold cache after restart</mark>  

When PostgreSQL restarts (or a Docker container is rebuilt), shared buffers and the OS file cache are cleared.  

The first query after restart must read all data pages from disk — <mark style="background: #04FF00A6;">cold cache</mark> - causing slow performance.  

Subsequent queries benefit from warm cache, where the same pages are already in memory.  

<mark style="background: #04FF00A6;">Indicators:</mark>  
- First run: Buffers: shared read=XXXX (disk reads).  
- Second run: Buffers: shared hit=XXXX (cached).  
- <mark style="background: #04FF00A6;">Mitigation:</mark> Run warm-up queries after startup, or use pg_prewarm to preload frequently accessed tables or indexes.

### <mark style="background: #04FF00A6;">Outdated Statistics or Bloated Tables</mark>

PostgreSQL’s query planner relies on table statistics (row counts, distinct values, data distribution) to estimate query costs.  

<mark style="background: #04FF00A6;">If statistics are stale — for example, after large data loads — the planner may:</mark>
- Choose the wrong join order.  
- Skip using an index.  
- Expect fewer rows than actually exist.  

Table bloat occurs when dead tuples (from updates/deletes) remain on disk until vacuumed. This inflates table size and increases I/O.  

<mark style="background: #04FF00A6;">Preventive Actions:</mark>
- Run ANALYZE after bulk inserts or updates to refresh statistics.  
- Schedule regular VACUUM to reclaim space and keep planner estimates accurate.  

``VACUUM ANALYZE fact_sales;``

### <mark style="background: #04FF00A6;">I/O pressure during aggregation:</mark>

Large aggregations (GROUP BY, ORDER BY, DISTINCT, JOIN + COUNT/SUM/AVG) require sorting and temporary storage.  

PostgreSQL uses memory (``work_mem``) to hold intermediate results; if they exceed this limit, it spills to disk.  

Disk-based operations are significantly slower — this is where ``temp_files`` and ``temp_bytes`` increase in ``pg_stat_database``.  

<mark style="background: #04FF00A6;">Example:</mark>  
```sql
SET work_mem = '1MB';  
EXPLAIN (ANALYZE)  
SELECT region_id, SUM(sales)  
FROM fact_sales GROUP BY region_id;
```  

With large data, you’ll see “``Disk: ... kB``” under ``Sort`` or ``HashAggregate``.  

<mark style="background: #04FF00A6;">Mitigation:</mark>  
- Increase ``work_mem`` for analytical queries.  
- Use materialised views or summary tables for repeated aggregations

### <mark style="background: #04FF00A6;">Diagnostic Tools</mark>

<mark style="background: #04FF00A6;">EXPLAIN (ANALYZE, BUFFERS)</mark>
- Used to <mark style="background: #04FF00A6;">analyze and visualise how PostgreSQL executes a query</mark> - showing the actual execution plan, timing, and I/O activity.  

<mark style="background: #04FF00A6;">Key features:</mark>
- ``EXPLAIN`` → shows the estimated plan and cost.  
- ``ANALYZE`` → actually runs the query to measure real execution time.  
- ``BUFFERS`` → reports how many data pages were read from disk (read) vs served from memory (hit).  

<mark style="background: #04FF00A6;">Use it to:</mark>
◦ Identify <mark style="background: #04FF00A6;">sequential scans</mark>, <mark style="background: #04FF00A6;">index usage</mark>, and <mark style="background: #04FF00A6;">join types</mark>.  
◦ Diagnose <mark style="background: #04FF00A6;">performance bottlenecks</mark> or locks in live systems.

### <mark style="background: #04FF00A6;">pg_stat_database</mark>

<table>
	<tr>
		<th>Column</th> 
		<th>Meaning</th> 
		<th>Why it’s useful</th> 
	</tr> 
	<tr>
		<th>datid</th> 
		<td>Database OID (internal ID)</td> 
		<td>Technical identifier for joins with other system catalogs.</td> 
	</tr>
	<tr>
		<th>datname</th> 
		<td>Database name</td> 
		<td>Human-readable name of the database.</td> 
	</tr>
	<tr>
		<th>numbackends</th> 
		<td>Active connections</td> 
		<td>How many sessions are currently connected.</td> 
	</tr>
	<tr>
		<th>xact_commit / xact_rollback</th> 
		<td>Committed and rolled-back transactions</td> 
		<td>Shows overall transaction volume and rollback rate.</td> 
	</tr>
	<tr>
		<th>blks_read</th> 
		<td>Number of data blocks read from disk</td> 
		<td>Indicates how much physical I/O is happening.</td> 
	</tr>
	<tr>
		<th>blks_hit</th> 
		<td>Number of data blocks found in shared buffers (cache hits)</td> 
		<td>Lets you calculate cache efficiency.</td> 
	</tr>
	<tr>
		<th>tup_returned / tup_fetched / tup_inserted / tup_updated / tup_deleted</th> 
		<td>Row-level activity</td> 
		<td>How many rows were processed - helps spot heavy workloads.</td>
	</tr>
	<tr>
		<th>temp_files / temp_bytes</th> 
		<td>Temporary files and bytes used for disk-based operations</td> 
		<td>High numbers suggest queries spilling to disk (e.g. due to low work_mem).</td> 
	</tr>
	<tr>
		<th>deadlocks</th> 
		<td>Number of deadlocks detected</td> 
		<td>Shows concurrency issues.</td> 
	</tr>
	<tr>
		<th>blk_read_time / blk_write_time</th> 
		<td>Time spent reading/writing blocks (in ms)</td> 
		<td>Indicates how much time is spent on I/O.</td> 
	</tr>
	<tr>
		<th>stats_reset</th> 
		<td>When stats were last cleared</td> 
		<td>Helps measure activity since a specific reset point.</td> 
	</tr>
</table>

<mark style="background: #04FF00A6;">blks_hit vs blks_read</mark> → <mark style="background: #04FF00A6;">shows cache efficiency</mark> - <mark style="background: #04FF00A6;">Cache Hit Ratio = blks_hit / (blks_hit + blks_read)</mark>  

Measures how often PostgreSQL can serve data directly from memory instead of reading from disk.  

<mark style="background: #04FF00A6;">Example:</mark> 358000 / (358000 + 1800) ≈ 99.5% hit rate → excellent cache usage.  

A lower hit ratio (<95%) suggests insufficient memory allocation for shared buffers or frequent large sequential scans causing cache misses.  

<mark style="background: #04FF00A6;">temp_files / temp_bytes</mark> → <mark style="background: #04FF00A6;">indicates disk spills</mark>  

When non-zero, these show that queries have created temporary files on disk.  

Happens when in-memory work areas (e.g. work_mem) are too small for sorting, joining, or aggregating large result sets.  

Repeatedly high values suggest <mark style="background: #04FF00A6;">I/O-bound queries</mark>.  

Tune by increasing work_mem or optimising queries to reduce intermediate result sizes.

<table>
	<tr>
		<th>datname</th>
		<td>numbackend s</td> 
		<td>blks_read</td> 
		<td>blks_hit</td> 
		<td>temp_files</td> 
		<td>temp_bytes</td> 
		<td>xact_commit</td> 
		<td>xact_rollback</td> 
		<td>blk_read_time (ms)</td> 
		<td>blk_write_time (ms)</td> 
	</tr>
	<tr>
		<th>postgres</th> 
		<td>2</td> 
		<td>1,800</td> 
		<td>358,000</td> 
		<td>5</td> 
		<td>128,000,000</td> 
		<td>45,123</td> 
		<td>123</td> 
		<td>5,400.25</td> 
		<td>812.37</td>
	</tr>
</table>

<mark style="background: #04FF00A6;">xact_commit / xact_rollback</mark> → <mark style="background: #04FF00A6;">shows transaction success ratio</mark>  

Reflects the reliability and efficiency of workload execution.  

<mark style="background: #04FF00A6;">Transaction Success Ratio</mark> = <mark style="background: #04FF00A6;">xact_commit / (xact_commit + xact_rollback)</mark> 

High ratio (≈99% or above) means most transactions complete successfully.  

A higher rollback count may indicate constraint violations, logic errors, or application faults.  

<mark style="background: #04FF00A6;">blk_read_time / blk_write_time</mark> → <mark style="background: #04FF00A6;">identifies I/O bottlenecks</mark>  

Records cumulative time (in milliseconds) spent reading and writing data blocks to disk.  

<mark style="background: #04FF00A6;">High blk_read_time</mark> → slow data retrieval from storage (possibly cold cache or slow disks).  

<mark style="background: #04FF00A6;">High blk_write_time</mark> → heavy update, checkpoint, or vacuum activity.  

Increasing values over time highlight <mark style="background: #04FF00A6;">disk-bound performance issues</mark> — consider faster storage, increased memory, or query tuning

### <mark style="background: #04FF00A6;">Optimisation Techniques:</mark>

<table>
	<tr>
		<th>Technique</th>
		<th>What It Does</th>
		<th>When to Use</th>
		<th>Trade-offs</th>
	</tr>  
	<tr>
		<th>pg_prewarm</th>
		<td>Preloads table or index blocks into shared buffers to reduce cold cache delays.</td>
		<td>Before running critical analytical queries or ETL jobs after restart.</td>
		<td>Increases startup time and memory use; ephemeral after restart unless used with autoprewarm.</td>
	</tr>  
	<tr>
		<th>Temporary Tables</th>
		<td>Stores intermediate results for repeated use in same session.</td>
		<td>When a query repeatedly joins or aggregates the same derived dataset.</td>
		<td> Session-only, not visible to others; can break query planning if overused.</td>
	</tr>  
	<tr>
		<th>Unlogged Tables</th>
		<td>Like normal tables but no WAL logging (faster writes).</td>
		<td>For transient data, staging tables, or ETL pipelines where durability is not required.</td>
		<td>Data lost after crash or restart.</td>
	</tr>  
	<tr>
		<th>Materialised Views</th>
		<td>Stores results of complex queries for reuse.</td>
		<td>When queries are repeated often and data changes infrequently.</td>
		<td>Must be manually refreshed; uses disk space.</td>
	</tr>  
	<tr>
		<th>Parallel Workers</th>
		<td>Splits large scans, joins, or aggregates across CPU cores.</td>
		<td>For large analytical workloads or long sequential scans.</td>
		<td>Overhead for small queries; requires tuning (max_parallel_workers_per_gather).</td>
	</tr>  
</table>

### <mark style="background: #04FF00A6;">pg_prewarm</mark>

``pg_prewarm`` is a PostgreSQL <mark style="background: #04FF00A6;">extension</mark> that helps you manually load tables or indexes into the <mark style="background: #04FF00A6;">shared buffer cache</mark> before running queries.  

Normally, PostgreSQL loads data into memory <mark style="background: #04FF00A6;">only when it’s first accessed</mark> — the first query after a restart will be slower because all pages must be read from disk (a ``cold cache``).  

<mark style="background: #04FF00A6;">Purpose:</mark> Manually warm shared buffers.  
```sql
CREATE EXTENSION IF NOT EXISTS pg_prewarm;  
SELECT pg_prewarm('factmarks');
```  

<mark style="background: #04FF00A6;">Use when:</mark>  
◦ Restarted server before analytics jobs.  
◦ Large fact tables queried repeatedly

<mark style="background: #04FF00A6;">Note: Write-Ahead Log (WAL)</mark>   PostgreSQL’s mechanism for ensuring <mark style="background: #04FF00A6;">data integrity and crash recovery</mark>.  

Every time data is modified (INSERT, UPDATE, DELETE), PostgreSQL:  
◦ <mark style="background: #04FF00A6;">First writes</mark> the change to the WAL file on disk.  
◦ <mark style="background: #04FF00A6;">Then applies</mark> the change to the actual table

### <mark style="background: #04FF00A6;">Temporary Tables</mark>

<mark style="background: #04FF00A6;">Purpose:</mark>
- Temporary (TEMP) tables are short-lived tables that exist only within your current database session. When you disconnect, they are automatically
- Store intermediate results within a session  

They differ from regular tables in two key ways

<mark style="background: #04FF00A6;">Session-local:</mark>
- Only visible to your current connection.  
- Other users or sessions cannot access them.  
- Useful for storing intermediate or staging data safely during analysis.  

<mark style="background: #04FF00A6;">Bypass the WAL:</mark>
- PostgreSQL does not write TEMP table operations to the WAL. 
- This avoids the overhead of crash recovery logging.  

<mark style="background: #04FF00A6;">When:</mark> Reusing derived data across multiple queries.  

<mark style="background: #04FF00A6;">Benefits:</mark> Reduces re-computation and I/O.  

<mark style="background: #04FF00A6;">Trade-off:</mark>
- Session scope only. Session-local;  
- Lost after session ends;  
- Limited reusability  

<mark style="background: #04FF00A6;">Low risk but not durable — good for transient workloads only</mark>  

```sql
CREATE TEMP TABLE temp_summary AS  
SELECT degree_sk, AVG(pass) AS avg_pass  
FROM factmarks GROUP BY degree_sk;  
EXPLAIN (ANALYZE, BUFFERS)  
SELECT * FROM temp_summary  
JOIN dimdegree USING (degree_sk);  
```

<mark style="background: #04FF00A6;">Expected:</mark> Lower cost and no re-scan of factmarks

### <mark style="background: #04FF00A6;">Unlogged Tables</mark>

<mark style="background: #04FF00A6;">Purpose:</mark> Speed up bulk loads by disabling WAL logging.  

<mark style="background: #04FF00A6;">When:</mark> ETL staging tables or intermediate transformations.  

<mark style="background: #04FF00A6;">Benefit:</mark> Skip WAL → ~2× faster inserts for staging/ETL  

<mark style="background: #04FF00A6;">Trade -off:</mark> Data lost on crash or restart.  

Best for ETL pipelines where reload is possible; monitor to avoid accidental data loss  

<mark style="background: #04FF00A6;">Maintainability:</mark> Over-use of UNLOGGED tables complicates recovery scripts; always pair with reproducible ETL or data validation logs.

```sql
CREATE UNLOGGED TABLE stage_load AS  
SELECT * FROM raw_import;  
-- Compare load times with vs without UNLOGGED
```

<table>
	<tr>
		<th>Type</th>
		<th>Load Time</th>
		<th>WAL size</th>
	</tr>
	<tr>
		<th>Logged</th>
		<td>2.3 s</td>
		<td>120 mb</td>
	</tr>
	<tr>
		<th>Unlogged</th>
		<td>1.2s</td>
		<td>0 mb</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Materialised Views</mark> 

<mark style="background: #04FF00A6;">Purpose:</mark>  
- Store results of expensive aggregations.  
- A materialised view is like a saved query result — it precomputes and stores the data from complex query as a physical table.  
- Unlike a normal view (which runs the query every time it’s accessed), a materialised view retrieves results instantly because the data is already stored.  

<mark style="background: #04FF00A6;">When:</mark> Query results don’t change frequently.  

<mark style="background: #04FF00A6;">Trade-off:</mark> 
- You gain performance but lose immediate freshness — the view shows data as of the last refresh, not live updates.  
- Requires refreshing.  

<mark style="background: #04FF00A6;">Benefit:</mark> Analyst queries hit precomputed results (instant response).  

<mark style="background: #04FF00A6;">Data freshness trade-off:</mark> Choose refresh interval based on SLA — e.g., daily for dashboards, hourly for near-real-time reporting.  

```plSQL
CREATE MATERIALISED VIEW mv_degree_summary AS  
SELECT degree_name, AVG(pass)  
FROM factmarks JOIN dimdegree USING (degree_sk)  
GROUP BY degree_name;  
-- Refresh when new data loaded  
REFRESH MATERIALISED VIEW mv_degree_summary;
```

### <mark style="background: #04FF00A6;">Parallel Query Execution</mark>

<mark style="background: #04FF00A6;">Purpose:</mark>  
- PostgreSQL can split certain operations - such as large aggregations, scans, or joins - across multiple CPU cores using parallel workers.  
- Instead of one process doing all the work, PostgreSQL launches several worker processes that each handle a portion of the data.  
- The results from each worker are then combined by a Gather node in the final query plan

<mark style="background: #04FF00A6;">Key settings:</mark>  
```plsql
SET max_parallel_workers_per_gather = 4;  
SET parallel_setup_cost = 1000;  
SET parallel_tuple_cost = 0.1;
```  

<mark style="background: #04FF00A6;">Benefits:</mark>  
- Faster execution for large analytical queries (especially group-by aggregations).  
- Better CPU utilisation on multi-core systems.  

<mark style="background: #04FF00A6;">Trade-off:</mark>  
- Increases CPU usage and memory demand.  
- Small queries may not benefit because parallel setup overhead outweighs the gain.  

<mark style="background: #04FF00A6;">Maintainability note:</mark> Parallel query plans can vary with hardware - always test across deployment environments.  

```plsql
EXPLAIN ANALYZE SELECT COUNT(*) FROM factmarks;
```  

<mark style="background: #04FF00A6;">Look for:</mark> Gather node → worker usage shown.

### <mark style="background: #04FF00A6;">Choosing the right technique</mark>

<table>
	<tr>
		<th>Symptom</th>
		<th>Technique</th>
		<th>Notes</th>
	</tr>
	<tr>
		<th>Cold Start Delay</th>
		<td>pg_prewarm</td>
		<td>Preloads into cache</td>
	</tr>
	<tr>
		<th>Repeated joins on same derived set</th>
		<td>Temp tables</td>
		<td>Session only</td>
	</tr>
	<tr>
		<th>Slow bulk loads</th>
		<td>Unlogged tables</td>
		<td>Non-durable</td>
	</tr>
	<tr>
		<th>Repeated complex aggregations</th>
		<td>Materialised views</td>
		<td>Refresh periodically</td>
	</tr>
	<tr>
		<th>CPU idle but query slow</th>
		<td>Parallel workers</td>
		<td>Tune gather workers</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Common Pitfalls</mark>
- Over-indexing → slow writes.  
- Using temp tables without indexes → slower joins.  
- Forgetting to refresh materialised views.  
- Parallel queries disabled by high cost thresholds.  
- Misinterpreting EXPLAIN output (cost ≠ time exactly).

<table>
	<tr>
		<th>Bottleneck</th>
		<th> Short-term Fix</th>
		<th>Long-term Mitigation</th>
	</tr>
	<tr>
		<th>Large sequential scans</th>
		<td>Add index on selective column</td>
		<td> Periodically review index effectiveness (``pg_stat_user_indexes``); drop unused indexes to reduce maintenance cost</td>
	</tr>
	<tr>
		<th>Poor join order / missing filters</th>
		<td>Rewrite query; add selective WHERE filters</td>
		<td>Use ANALYZE and ``pg_stat_statements`` to monitor and refactor inefficient joins</td>
	</tr>
	<tr>
		<th>Cold cache</th>
		<td>Use ``pg_prewarm``</td>
		<td>Persistent caching layers or query scheduling for analytics workloads</td>
	</tr>
	<tr>
		<th>Outdated statistics / bloat</th>
		<td>Run VACUUM ANALYZE</td>
		<td>Schedule autovacuum tuning, partition large tables to control bloat</td>
	</tr>
	<tr>
		<th>I/O pressure during aggregation</th>
		<td>Increase work_mem</td>
		<td>Materialise summary tables; automate refresh schedules</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Why indexes matter</mark> 

Indexes speed up data retrieval by avoiding full table scans.  

PostgreSQL automatically updates indexes when data changes.  

<mark style="background: #04FF00A6;">But:</mark> too many indexes slow INSERT/UPDATE/DELETE operations.  
<mark style="background: #04FF00A6;">Key metric:</mark>  
- <mark style="background: #04FF00A6;">Index selectivity</mark> — how well an index filters rows.  
- Index selectivity = fraction of rows that match a given indexed value.

### <mark style="background: #04FF00A6;">When Indexes Help (and When They Don’t):</mark> 

<mark style="background: #04FF00A6;">Useful when:</mark>  
- Query filters on <mark style="background: #04FF00A6;">highly selective columns</mark>.  
- You need range queries or ordering.  

<mark style="background: #04FF00A6;">Avoid when:</mark>  
- Most rows match the predicate.  
- The table is small.  
- Query filters on <mark style="background: #04FF00A6;">low-selectivity columns</mark> (e.g., boolean flags).

### <mark style="background: #04FF00A6;">Index Selectivity</mark>

```plsql
CREATE TABLE examresultsdw.factmarks (  
	student_id INT,  
	degree_sk INT,  
	examdate DATE,  
	pass BOOLEAN  
);  
CREATE INDEX idx_pass ON examresultsdw.factmarks(pass);
```  

If pass = TRUE for 95% of all rows, → only 5% are FALSE → <mark style="background: #04FF00A6;">low selectivity</mark>  

If ``examdate`` has one value per day across several years, → each date covers <0.1% of rows → high selectivity  

<mark style="background: #04FF00A6;">High selectivity</mark> = the index sharply reduces the number of rows retrieved → good for performance  

<mark style="background: #04FF00A6;">Low selectivity</mark> = index scan fetches nearly the whole table → PostgreSQL may ignore it

### <mark style="background: #04FF00A6;">Index Selectivity</mark>  

<mark style="background: #04FF00A6;">Checking index selectivity using the pg_stats table:</mark>
```plsql
SELECT attname AS column, n_distinct, reltuples  
FROM pg_stats  
WHERE tablename = 'factmarks’;
```  

<mark style="background: #04FF00A6;">Interpretation:</mark>  

``n_distinct`` ≈ number of unique values in the column  

``reltuples`` = estimated total rows in the table  

``Selectivity ≈ 1 / n_distinct`` (for roughly uniform  
data)

<table>
	<tr>
		<th>column</th>
		<th>n_distinct</th>
		<th>reltuples</th>
		<th>selectivity (approx.)</th>
	</tr>
	<tr>
		<th>pass</th>
		<td>2</td>
		<td>1,000,000</td>
		<td> ~0.5 (low)</td>
	</tr>  
	<tr>
		<th>examdate</th>
		<td>730</td>
		<td>1,000,000</td>
		<td>~0.0014 (high)</td>
	</tr>
</table>

<mark style="background: #04FF00A6;">Compare Plans:</mark>
```plsql
EXPLAIN (ANALYZE, BUFFERS)  
SELECT * FROM examresultsdw.factmarks 
WHERE pass = true;
  
EXPLAIN (ANALYZE, BUFFERS)  
SELECT * FROM examresultsdw.factmarks 
WHERE pass = false;
```

<table>
	<tr>
		<th>Query</th>
		<th>Plan Type</th>
		<th>Reason</th>
	</tr>
	<tr>
		<td>pass = true</td>
		<td>Seq Scan</td>
		<td>Too many matches → index ignored</td>
	</tr>
	<tr>
		<td>pass = false</td>
		<td>Index Scan</td>  
		<td>Few matches → index effective</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">General Index Types</mark>

<div style="overflow-x: scroll;">
<table>
	<tr>
		<th>Index Type</th>
		<th>Defined On </th>
		<th>Data Ordering</th>
		<th>Uniqueness</th>
		<th>Storage Structure</th>
		<th>Advantages</th>
		<th>Limitations / Trade-offs</th>
		<th>Typical Use Case</th>
	</tr> 
	<tr>
		<th>Primary Index</th>  
		<td>Ordering (key) field - usually the <mark style="background: #04FF00A6;">primary key</mark> </td>  
		<td>Yes — data stored in same order as index</td>  
		<td>Usually unique</td>  
		<td>One entry per block (often sparse)</td>  
		<td>Fast access to records by primary key; small index size; often fits in memory</td>  
		<td>Costly for inserts/deletes — may require reordering data</td>  
		<td>Access by primary key or range on key field</td>
	</tr>
	<tr>
		<th>Secondary Index</th>  
		<td>Non-ordering (non-key)field</td>  
		<td>No — separate from physical order</td>  
		<td>May be unique or non-unique</td>  
		<td>Typically dense (every record represented)</td>  
		<td>Enables fast lookup on non-key attributes</td>  
		<td>Slower writes; can add I/O overhead; adds indirection</td>  
		<td>Searching by attributes other than primary key</td>
	</tr>
	<tr>
		<th>Clustering Index</th>  
		<td>Ordering field where data is physically stored in same order as index (clustered storage)</td>  
		<td>Yes</td>  
		<td>May be unique or non-unique</td>  
		<td>Data physically arranged by index</td>  
		<td>Improves performance for range and sequential access</td>  
		<td>Only one clustering index allowed per table; slower for random writes</td>  
		<td>Tables frequently accessed in sorted order (e.g., time, region)</td>
	</tr>
	<tr>
		<th>Dense Index</th>  
		<td>Any field</td>  
		<td>Not required</td>  
		<td>1 entry per record</td>  
		<td>Index file includes all search keys</td>  
		<td>Very fast lookups — only one I/O to fetch record</td>  
		<td>Larger index size; more maintenance during updates</td>  
		<td>Small tables or read-heavy datasets</td>
	</tr>
	<tr>
		<th>Sparse Index</th>  
		<td>Any field (usually ordered data)</td>  
		<td>Requires ordered data</td>  
		<td>1 entry per block</td>  
		<td>Index file smaller - one key per data block</td>  
		<td>Smaller storage cost; fits easily in memory</td>  
		<td>Requires extra disk access to locate record within block</td>  
		<td>Large ordered tables where memory is limited</td>
	</tr>
</table>
</div>

### <mark style="background: #04FF00A6;">Index Types (PostgreSQL)</mark>

<div style="overflow-x: scroll;">
<table>
	<tr>
		<th>Index Type</th>
		<th>Best For</th>
		<th>Supported Operations</th>
		<th>When to Use</th>
		<th>Advantages</th>
		<th>Limitations / Trade-offs</th>
		<th>Example</th>
	</tr>
	<tr>
		<th>B-Tree (default)</th>  
		<td>General-purpose indexing</td> 
		<td>=, <, >, BETWEEN, LIKE 'abc%', sorting</td>  
		<td>Most queries on numeric, date, or text columns</td>  
		<td>Balanced, reliable, supports range and order operations</td>  
		<td>Larger index size; slower updates on heavy write tables</td>  
		<td>CREATE INDEX idx_examdate ON factmarks(examdate);</td>
	</tr>
	<tr>
		<th>Hash</th>  
		<td>Exact equality lookups</td>  
		<td>= only</td>  
		<td>When filtering on a single exact value</td>  
		<td>Compact and fast for equality comparisons</td>  
		<td>Cannot be used for range queries or sorting</td>
		<td>CREATE INDEX idx_regionid_hash ON factmarks USING hash(region_id);</td>
	</tr>
	<tr>
		<th>GIN (Generalised Inverted Index)</th>  
		<td>  JSONB, arrays, full-text search</td>  
		<td>Element or key containment (@>, ?, @@)</td>  
		<td>Searching within multi-valued or nested data</td>  
		<td>Excellent for complex containment or text searches</td>  
		<td>Slower to update; larger maintenance cost</td>  
		<td>CREATE INDEX idx_meta_jsonb ON events USING gin(metadata);</td>
	</tr>
	<tr>
		<th>GiST (Generalised Search Tree)</th>  
		<td>Spatial, geometric, range data</td>  
		<td>Range overlap (&&), distance, similarity</td>  
		<td>Geolocation, network, or nearest-neighbor queries</td>  
		<td>Highly flexible for complex data types</td>  
		<td>Slower for simple equality lookups</td>  
		<td>CREATE INDEX idx_location_gist ON sites USING gist(geom);</td>
	</tr>
	<tr>
		<th>BRIN (Block Range Index)</th>  
		<td>Sequentially ordered, very large tables</td>  
		<td>Range queries (BETWEEN, <, >)</td>  
		<td>Time-series or append-only datasets (e.g. logs)</td>  
		<td>Extremely small and fast to build; great for large data</td>  
		<td>Less precise - must read relevant blocks for exact matches</td>  
		<td>CREATE INDEX idx_examdate_brin ON factmarks USING brin(examdate);</td>
	</tr>
</table>
</div>

### <mark style="background: #04FF00A6;">Index Types</mark>
  
<table>
	<tr>
		<th>Type</th>
		<th>Best For</th>
		<th>Example</th>
	</tr>
	<tr>
		<th>B-Tree Equality</th>
		<td>range, sort</td>  
		<td>Dates, IDs</td>
	</tr>
	<tr>
		<th>Hash</th>
		<td>Exact match</td>  
		<td>Codes</td>
	</tr>
	<tr>
		<th>GIN</th>
		<td>JSONB, text, arrays</td>  
		<td>Metadata</td>
	</tr>
	<tr>
		<th>GiST</th>
		<td>Spatial/range</td>  
		<td>Coordinates</td>
	</tr>
	<tr>
		<th>BRIN</th>
		<td>Sequential data</td>  
		<td>Time series</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Why PostgreSQL Might Ignore an Index</mark> 
- Low selectivity (too many matching rows).  
- Outdated statistics.  
- Index not covering query predicate.  
- Sequential scan estimated cheaper.  
- Small table (index overhead not worth it).

<table>
	<tr>
		<th>Technique</th>  
		<th>Benefits</th>  
		<th>Trade-offs</th>
	</tr>
	<tr>
		<th>B-tree (default)</th>  
		<td>Fast equality and range lookups; good general purpose index</td>  
		<td>Slower inserts/updates due to index maintenance; storage overhead</td>
	</tr>
	<tr>
		<th>Hash index</th>  
		<td>Ideal for equality comparisons (=)</td>  
		<td>Not useful for range queries; not WAL-logged before PostgreSQL 10; higher risk of corruption if crash</td>
	</tr>
	<tr>
		<th>GIN index</th>  
		<td>Excellent for array/JSONB membership search</td>  
		<td>Large build time and size; high maintenance cost</td>
	</tr>
	<tr>
		<th>GiST index</th>  
		<td>Good for geometric, full-text, range queries</td>
		<td>Complex tuning; higher insert cost</td>
	</tr>
	<tr>
		<th>BRIN index</th>  
		<td>Compact, efficient for naturally ordered data (e.g., date/time)</td>  
		<td>Coarse granularity — inefficient if data not clustered by column</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Long-term considerations</mark>  

Over-indexing increases storage and slows writes.  

Plan periodic index usage audits via ``pg_stat_user_indexes``.  

Choose index type based on query access patterns and data growth trend, not short-term query speed alone.

### <mark style="background: #04FF00A6;">Long Term Optimisation Options</mark>

<table>
	<tr>
		<th>&nbsp;</th>
		<th>Strategy</th>  
		<th>Benefits</th>
		<th>Trade-offs / Risks</th>
	</tr>
	<tr>
		<th>Partitioning</th>  
		<td>Use RANGE/LIST/HASH partitioning on large fact tables (e.g. by month or region).</td>  
		<td>Query pruning reduces scan size; faster VACUUM/ANALYZE; improved cache locality.</td>  
		<td>More complex DDL and ETL maintenance; higher schema-management cost.</td>
	</tr>
	<tr>
		<th>Replication / Caching Layers</th>  
		<td>Add read replicas or a caching tier for heavy analytical workloads.</td>  
		<td>Offloads queries from primary node; improves availability.</td>  
		<td>Extra infrastructure cost; potential replication lag → stale reads.</td>
	</tr>
	<tr>
		<th>Autovacuum & Statistics Maintenance</th>
		<td>Schedule regular VACUUM ANALYZE; tune autovacuum thresholds.</td>  
		<td>Keeps planner estimates accurate; prevents table bloat; consistent performance.</td>  
		<td>Background I/O and CPU overhead; must balance with system load.</td>
	</tr>
	<tr>
		<th>Monitoring and Optimising Indexes</th>  
		<td>Periodically query pg_stat_user_indexes and pg_stat_all_indexes to review index usage and bloat. Drop unused indexes; rebuild bloated ones.</td>  
		<td>Maintains optimal read/write balance; reduces disk footprint and maintenance time.</td>  
		<td>Requires DBA attention; dropping infrequently used indexes may later hurt ad-hoc queries.</td>
	</tr>
	<tr>
		<th>Materialised Views</th>  
		<td>Pre-compute and store complex aggregations for recurring analytical queries. Automate REFRESH MATERIALISED VIEW after ETL.</td>  
		<td>Near-instant query response; offloads heavy aggregations from live tables.</td>  
		<td>Data freshness trade-off—results only as current as last refresh; maintenance cost for scheduling refresh jobs</td>
	</tr>
</table>

# <mark style="background: #04FF00A6;">16 Improving CouchDB Performance</mark>

### <mark style="background: #04FF00A6;">Query Execution Model</mark>

CouchDB has no <mark style="background: #04FF00A6;">cost-based optimiser</mark>  

Queries depend on <mark style="background: #04FF00A6;">prebuilt indexes</mark> (unlike PostgreSQL’s planner)  

No index = full database scan  

<mark style="background: #04FF00A6;">Query performance depends on:</mark> 
- Index freshness  
- Index selectivity  
- Database compaction state

### <mark style="background: #04FF00A6;">Indexing Overview (Primary vs Secondary)</mark>  

<mark style="background: #04FF00A6;">Primary index:</mark> B-tree on \_id (document key)  

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
- Predefined functions for aggregation and summarisation.  
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
		"sises": {  
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
		<td> sizes.file</td>
		<td>Total bytes occupied on disk by the view index file (≈ old disk_size).</td>
		<td>Use this to measure index growth or reduction after compaction.</td>
	</tr>
	<tr>
		<td> sizes.active</td>
		<td>Active portion of the file (≈ old data_size).</td>
		<td> Represents usable data inside the index.</td>
	</tr>
	<tr>
		<td> sizes.external</td>
		<td>Sise of the original emitted key/value data from map functions.</td>
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
		<td>(Lucene – Beyond our scope) Full-text search </td>
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

<mark style="background: #04FF00A6;">Start and End Keys:</mark> When querying views, utilise ``startkey`` and ``endkey`` parameters to limit the amount of data returned, making queries faster and reducing load.  

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

# <mark style="background: #04FF00A6;">17 Improving Cassandra Performance</mark>

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

<mark style="background: #04FF00A6;">Row Cache:</mark> can provide some improvement for very read-intensive operations, where read operations are 95% of the load.  Stores a subset of the partition data stored on disk in the SSTables in memory

![[Pasted image 20251116212508.png]]

<mark style="background: #04FF00A6;">Bloom Filter:</mark> Cassandra checks the Bloom filter to discover which SSTables are likely to have the request partition data.  

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
- Each row key is passed through multiple hash functions, and the resulting bit positions are set to 1 in a fixed-sise bit array.

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

A special column used to store a number that is changed in increments.  

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
INSERT INTO college_student (Snumber, NAME, EMAIL) 
VALUES(001,'Ayush',['ayush@gmail.com', 'AY@mail.com']);  

INSERT INTO college_student (Snumber, NAME, EMAIL)  
VALUES(002,'Aarav',['aarav@ymail.com', 'AR@mail.com']);  

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

<mark style="background: #04FF00A6;">When data is written to (insert into) a table with a secondary index attached:</mark>
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
SELECT session_id, duration, coordinator, request, started_at  
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

Remove compilation overhead when the query is executed - compiled once, not every time.

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
- The use of parameterised queries helps in standardising the structure of queries
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
		<td>to persist a write</td>
		<td>nodetool tablestats</td>
		<td>Disk I/O, replication delay</td>
	</tr>
	<tr>
		<th>Read Latency Time</th>
		<td>to retrieve data</td>
		<td>nodetool tablestats</td>
		<td>Too many SSTables, cache misses</td>
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

# <mark style="background: #04FF00A6;">18 Partitioning Data</mark>

### <mark style="background: #04FF00A6;">Data Scalability</mark>

Ability of to handle increasing amounts of data, numbers of users, and types of requests without sacrificing performance or availability.  

A scalable data solution tackles adapts to growing demands by either adding resources such as hardware or software, by optimising its design and configuration, or by undertaking some combined strategy.

<mark style="background: #04FF00A6;">Vertical scalability:</mark> Adding more processing power and memory to a single server.  

<mark style="background: #04FF00A6;">horizontal database:</mark> Adding more servers (i.e., database nodes) to distribute the workload

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

### <mark style="background: #04FF00A6;">Vertical v horizontal Partitioning</mark>  

<mark style="background: #04FF00A6;">Vertical Partitioning</mark> stores tables and/or columns in a separate database or tables.  

<mark style="background: #04FF00A6;">Horizontal Partitioning</mark> stores rows of a table in multiple database clusters.  

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

Tables, indexes and materialised views to be partitioned into disjointed sets of rows that are physically stored and accessed separately.

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
- When you scale up a single database system, it will eventually reach a physical hardware limit.
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
- If one instance fails, only the data in that partition is unavailable operations on other partitions can continue.

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

<mark style="background: #04FF00A6;">Benefits:</mark>
- Improves fault tolerance  
- Improves scalability  
- Improves availability

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

# <mark style="background: #04FF00A6;">19 Postgres Partitioning</mark>

### <mark style="background: #04FF00A6;">Table Partitioning</mark>

Used to divide a large table into smaller, more manageable chunks called partitions.  

Each partition is essentially a separate table that stores a subset of the original data.  

<mark style="background: #04FF00A6;">Benefits:</mark>
- <mark style="background: #04FF00A6;">Improved Query Performance:</mark> Allows the database to quickly narrow down the data to a specific partition, reducing the amount of data that needs to be scanned during queries. This results in faster query execution times, especially for large datasets.  
- <mark style="background: #04FF00A6;">Easier Data Management:</mark> By splitting large datasets into smaller, more manageable partitions. This can simplify tasks such as data archiving, data purging, and backup and restore operations.  
- <mark style="background: #04FF00A6;">Enhanced Data Loading and Indexing:</mark> Process can be parallelised, leading to faster data ingestion. Additionally, indexes on partitioned tables can be more efficient, as they only need to cover a smaller subset of data.  
- <mark style="background: #04FF00A6;">Cost-Effective Storage:</mark> Allows you to store older or less frequently accessed data on cheaper storage media, while keeping frequently accessed data on faster storage devices

<mark style="background: #04FF00A6;">Methods:</mark>
- Range Partitioning
- List Partitioning
- Hash Partitioning

### <mark style="background: #04FF00A6;">Range Partitioning</mark> 

Data is divided into partitions based on a specified range of values in a column.  

Useful when dealing with time-series data or any data that has a natural order.  

Each partition represents a distinct range of values, and data falling within that range is stored in that partition.  

Range partitioning allows for efficient retrieval of data within specific ranges, leading to improved query performance.

<mark style="background: #04FF00A6;">Example:</mark> RANGEPARTITIONING.SQL
![[Pasted image 20251121120701.png]]

### <mark style="background: #04FF00A6;">List Partitioning</mark> 

Data is divided into partitions based on specific values in a column.  

Allows you to define specific values for each partition.  

Useful when data can be categorised into distinct, non-overlapping sets.  

<mark style="background: #04FF00A6;">Note:</mark> When you partition a table in PostgreSQL, the primary key (or any unique constraint) must include all the columns that are part of the partitioning key.

<mark style="background: #04FF00A6;">Example:</mark> LISTPARTITIONING.SQL
![[Pasted image 20251121120807.png]]

### <mark style="background: #04FF00A6;">Hash Partitioning</mark> 

Data is divided into partitions based on the hash value of a specified column.  

Uses a hash function to distribute data uniformly across partitions.

Useful when you want to evenly distribute data across partitions to achieve load balancing.  

<mark style="background: #04FF00A6;">Note:</mark> When you partition a table in PostgreSQL, the primary key (or any unique constraint) must include all the columns that are part of the partitioning key

<mark style="background: #04FF00A6;">Example:</mark> HASHPARTITIONING.SQL
![[Pasted image 20251121120907.png]]

# <mark style="background: #04FF00A6;">20 CouchDB Partitioning</mark>

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

CouchDB does not hash documents by itself, but you can hash the partition key in your ID scheme

<mark style="background: #04FF00A6;">Example:</mark>  
- hash(user_id)%16:doc  
- Creates 16 evenly distributed partitions.  

<mark style="background: #04FF00A6;">When useful:</mark>  
- When natural keys (country, type, date) produce skew  
- To prevent uneven load and hotspots  

<mark style="background: #04FF00A6;">Pros:</mark>  
- Excellent balanced distribution  
- Avoids skew and oversised partitions  
- Good for high-write workloads  

<mark style="background: #04FF00A6;">Risk:</mark> Harder to run partition-level analytics (e.g., “all users from Ireland” are now spread across 16 hashed partitions)

# <mark style="background: #04FF00A6;">21 Cassandra Partitioning</mark>

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

It doesn't optimise for consistency.  

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

The optional clustering columns handle the data arrangement part.  

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

This will allow you to check the number of partitions that exist.

Read and write operations are performed using a partition key on a table.  

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

The company table is split into partitions using the partition key ``company_name`` and distributed across the nodes.  

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

# <mark style="background: #04FF00A6;">22 Data Distribution</mark>

### <mark style="background: #04FF00A6;">CAP Theorem</mark>  

About the trade-offs inherent in designing a distributed solution for storing data.

<mark style="background: #04FF00A6;">Consistency:</mark>
- Sequential consistency (a data item behaves as if there is one copy) – similar to the A in ACID
- All clients connected to a data store see the same data.

<mark style="background: #04FF00A6;">Availability:</mark>  
- Node failures do not prevent survivors from continuing to operate. 
- Clients are able to access and update data rapidly.

<mark style="background: #04FF00A6;">Partition-tolerance:</mark>  
- Partition=Break
- The system continues to operate even if a network partition causes communication interruption between nodes. 
- The data store is able to operate even when the network fails in some way.

“A distributed system can satisfy any two of these guarantees at the same time but not all three”

![[Pasted image 20251121130158.png]]

### <mark style="background: #04FF00A6;">Misconception:</mark>

"For a distributed application/data store you have to pick two of the three"

Each of these properties exists on a continuum.  

Attempting to increase one requires decreasing another to a certain degree

### <mark style="background: #04FF00A6;">Example:</mark>

![[Pasted image 20251121130816.png]]

Suppose we have a server S that contains some files named X, Y, and Z.  

The server is accessible via a network to clients A, B, and C.  

The clients occasionally wish to modify those files, so they can send messages like “read X” or “write Y” to change those files.  

As the server receives these requests, it sends as response message back to the client, indicating that the change is complete. 

The client waits for the response to come back before attempting another request.

The network imposes some minimum latency (let’s say 1ms) on each message  

```
latency=time to save and retrieve data
```

Reading and writing a large amount of data from this file server is going to be very slow as a result  

Much slower than accessing a local disk.

The network makes message delivery unreliable.  

A request/response could be delayed arbitrarily, or completely dropped.  

If, for example, a network cable is out of action, there will be no communication along that link  

If a client doesn’t receive a response to a message, then it has no choice but to wait and try the request again. It could wait a very long time.

<mark style="background: #04FF00A6;">For this example:</mark>
- <mark style="background: #04FF00A6;">Consistency:</mark> Every operation is applied in a known order, and all clients have an unfiltered view of the central server. (HIGH)
- <mark style="background: #04FF00A6;">Availability:</mark> Every single read or write requires a network operation, making this system much slower than accessing a local file system. (LOW)
- <mark style="background: #04FF00A6;">Partitionability:</mark> If a single client is partitioned from the file server, it cannot perform many operations. However, all other connected clients are able to continue. (MEDIUM)

### <mark style="background: #04FF00A6;">Modified Example</mark>

If we add a cache to each of the clients (with a finite capacity):

Simple logic for managing these caches locally at each client:

<mark style="background: #04FF00A6;">Read:</mark>
- When a client attempts to read a file, it first looks in its cache to see if that file's data is already present.  
- If it finds it, the read is satisfied from that data.  
- If not, the client issues a read request to the server, waits for the response, and replaces the Least Recently Used (LRU) item in the cache.

<mark style="background: #04FF00A6;">Write:</mark>
- When a client attempts to write a file, it first issues a write command to the server and waits for a response.  
- If an older version of the file exists in the client's cache, it is updated to the new value.  
- If not, the client replaces the LRU item in the cache with the newly written value.

<mark style="background: #04FF00A6;">For this example:</mark>
- <mark style="background: #04FF00A6;">Consistency:</mark> (Write Through Cache) is less consistent than the direct access example because a client may fail to see writes made by other clients, when a value is available within its own cache. (MEDIUM)
- <mark style="background: #04FF00A6;">Availability:</mark> Will see better read performance than the direct access example, because reads can be satisfied directly from cache without consulting the central server. However, writes are no faster because they always result in a network operation. (MEDIUM)
- <mark style="background: #04FF00A6;">Partitionability:</mark> A client might be able to continue operating even when the network is down, if it is only performing reads on cached data. However, any write operation must block until the network results.

<mark style="background: #04FF00A6;">Dealing with the P is central to distributed computing:</mark> 
- when we cannot communicate, should we optimistically try to make progress, or pessimistically wait, in order to achieve consistency?  
- Different applications will require different solutions

There are a variety of <mark style="background: #04FF00A6;">Consistency models</mark> that can be implemented. They adjust how and when caches are updated, and whether clients can continue to operate during a partition.

### <mark style="background: #04FF00A6;">Consistency</mark>

<mark style="background: #04FF00A6;">Strong Consistency:</mark> Once an update is complete, all clients will see that new value.  

<mark style="background: #04FF00A6;">Causal Consistency:</mark> If process A tells B that it has updated X, then B will see the latest value of X.  

<mark style="background: #04FF00A6;">Read-Your-Writes:</mark> If process A updates X, then A will never see an older value of X.  

<mark style="background: #04FF00A6;">Monotonic Reads:</mark> If process A reads a value from X, then it will never read back an older value.  

<mark style="background: #04FF00A6;">Monotonic Writes:</mark> All writes by process A are applied in the order they are given.  

<mark style="background: #04FF00A6;">Eventual Consistency:</mark> All updates will become visible to everyone, if you wait long enough.

<mark style="background: #04FF00A6;">Availability</mark> is probably the easiest to work out.  
- For a given system, one could measure every attempt to read or write a value, and then compute a statistic like the mean, median, or 99th percentile of latency for various operations.  
- A system that provides a lower mean is providing “more” availability.

<mark style="background: #04FF00A6;">Replication:</mark>
- Provides insurance against storage failures, but also provide a high degree of availability for commonly used data. 
- How does it impact consistency?

<mark style="background: #04FF00A6;">Eventual Consistency:</mark> 
- All updates will become visible to everyone, if you wait long enough. 
- Weakest kind.  
- No guarantees on order of writes applied to different replicas  
- No guarantees on what intermediate states a reader may observe.  
- Just guarantees that “eventually ” replicas will converge.

<mark style="background: #04FF00A6;">Causal Consistency:</mark> 
- If process A tells B that it has updated X, then B will see the latest value of X 
- Operations to the datastore applied in causal order. e.g. A comments on B’s post and then Bob replies to A’s comment. On all replicas, A’s comment written before B’s comment. This also means that it should be impossible to read B’s comment before reading A’s. 
- No guarantees for concurrent writes. e.g. if two people comment on two unrelated posts then it is okay to apply the two writes in different orders on different replicas

### <mark style="background: #04FF00A6;">According to Vogel:</mark>

Suppose you have a system with N replicated storage units.  

To update an item, a client must write W of the replicas upfront. (The remainder will get updated eventually in the background.)  

To read an item, a client must read R of the replicas, in order to decide whether the most recent value has been read. (If the values differ, assume you can tell which one is the newest.)

Suppose we have two replicas which are network partitioned (unable to communicate due to a network failure)  

If we allow writes on either replica we will end up with inconsistent data  

If we force the replicas to wait to synchronise we lose availability  

If we never have a network failure then we lose partition tolerance

<mark style="background: #04FF00A6;">N=2, W=2, R=1 is a strongly consistent system:</mark> a writer must update both replicas, and a reader can read either one of them.  

<mark style="background: #04FF00A6;">N=2, W=1, R=2 is also a strongly consistent system:</mark> a writer can update either replica, and a reader must read both to obtain the latest.  

<mark style="background: #04FF00A6;">N=2, W=1, R=1 is an eventually consistent system:</mark> the writer can update either replica, and the reader can read either replica, so you may not see consistent results

(W + R) > N is strongly consistent  

(W+R) <= N is weakly consistent.  

W < (N+1)/2 means write conflicts can occur

### <mark style="background: #04FF00A6;">Modern architectures:</mark>

General belief is that for wide-area systems you can’t forfeit P or partitions.  

You can’t choose to not have partitions.

Therefore, you must balance consistency and availability.  

This is the case for NoSQL Distributed Data.

### <mark style="background: #04FF00A6;">ACID V BASE:</mark>

<mark style="background: #04FF00A6;">ACID:</mark> highly consistent system

<mark style="background: #04FF00A6;">BASE:</mark> highly available system

ACID good fit for businesses which deal with online transaction processing (e.g., finance institutions) or online analytical processing (e.g., data warehousing).

BASE more flexible and fluid.  

Organisations with growth, expansion and change in data structures, likely should favour BASE.

### <mark style="background: #04FF00A6;">SQL V NoSQL</mark>

SQL primarily vertically scalable – NoSQL horizontally scalable  

SQL table based, schema required -  NoSQL column, row, key-value based, flexible schema 

SQL better fit for heavy transaction loads and complex queries 

NoSQL preferred for unstructured data where growth and change are envisioned and availability is preferred over consistency

### <mark style="background: #04FF00A6;">PACELC</mark>

In addition to Consistency, Availability, and Partition Tolerance it also includes Latency as one of the desired properties of a Distributed System.  

<mark style="background: #04FF00A6;">The acronym PACELC stands for:</mark>
- Partitioned, 
- Availability, 
- Consistency
- Else Latency, 
- Consistency

In the case of Network Partition '<mark style="background: #04FF00A6;">P</mark>', a distributed system can have trade-offs between Availability '<mark style="background: #04FF00A6;">A</mark>' and Consistency '<mark style="background: #04FF00A6;">C</mark>'.

Else '<mark style="background: #04FF00A6;">E</mark>', if there is no Network Partition, then a distributed system can have trade-offs between Latency '<mark style="background: #04FF00A6;">L</mark>' and Consistency '<mark style="background: #04FF00A6;">C</mark>'.

Latency - performance

![[Pasted image 20251121153246.png]]

<mark style="background: #04FF00A6;">Partition:</mark> two nodes are not able to communicate with each other.

### <mark style="background: #04FF00A6;">Example:</mark>

Imagine you are working on a real-time analytics application that tracks stock market prices and updates client portfolios in real time.

This system uses a distributed database to store and process data across multiple nodes to handle large amounts of data and provide fast response times to users.

<mark style="background: #04FF00A6;">During a network partition, the system needs to choose between Availability (A) and Consistency (C):</mark>
- If the application values availability over consistency (PA), it can still serve data to clients, but this data may not be fully up-to-date across all nodes.  
- If consistency is prioritised (PC), it might restrict access until the partition resolves, ensuring that all clients get accurate and consistent data

<mark style="background: #04FF00A6;">When the system is not partitioned, there is a trade-off between Latency (L) and Consistency (C):</mark>  
- If the database prioritises low latency (EL), users get rapid responses with potentially slight inconsistencies in recent stock prices.  
- If it prioritises consistency (EC), it might increase response time, ensuring the displayed portfolio is fully synchronised with the latest transactions across all nodes.

### <mark style="background: #04FF00A6;">How CAP Applies to Our Databases</mark>

<mark style="background: #04FF00A6;">Cassandra:</mark> AP system → partition tolerant + highly available (eventual consistency; tunable consistency with R/W).  

<mark style="background: #04FF00A6;">CouchDB:</mark> AP system → multi -master replication, eventual consistency.  

<mark style="background: #04FF00A6;">PostgreSQL (single node):</mark> CA system → strong consistency and availability, but not partition tolerant.

### <mark style="background: #04FF00A6;">PACELC Mapping</mark>

<mark style="background: #04FF00A6;">Cassandra → PA / EL:</mark>
- <mark style="background: #04FF00A6;">During partition:</mark> prioritises Availability (A) over Consistency (C) 
- <mark style="background: #04FF00A6;">Else (no partition):</mark> prioritises Latency (L) over Consistency (C)
- Tuneable consistency, but fundamentally AP

<mark style="background: #04FF00A6;">CouchDB → PA / EL:</mark>
- Multi-master replication
- Eventual consistency
- Prioritises availability and low latency; resolves conflicts later

<mark style="background: #04FF00A6;">PostgreSQL (Single-node) - PC / EC (strictly speaking):</mark>
- During partition (P): PostgreSQL cannot continue if the database node is isolated → it prioritises Consistency over Availability.
- Else (no partition): prioritises Consistency over Latency.
- PostgreSQL is always consistent-first. Latency is never traded to relax consistency.

<mark style="background: #04FF00A6;">PostgreSQL (Synchronous replication enabled) - Still PC / EC, but even more clearly:</mark>
- If the standby cannot acknowledge writes → the primary blocks writes (preserves consistency over availability).
- Latency increases because synchronous replication must wait → consistency over latency.

<mark style="background: #04FF00A6;">PostgreSQL (Asynchronous replication) - Still effectively PC / EC, but with a slight nuance:</mark>
- Allows writes even if standby lags (higher availability), but:
- Reads from replicas may be stale → but PostgreSQL itself remains consistent at the primary.
- It never sacrifices consistency for latency inside a single node.

# <mark style="background: #04FF00A6;">EXAM PREP</mark>

### <mark style="background: #04FF00A6;">Learning Outcomes</mark> 

<mark style="background: #04FF00A6;">Design, create, and query:</mark>
- A data warehouse  
- Assessed via CA  

<mark style="background: #04FF00A6;">Design, create, and query:</mark> 
- A distributed database  
- Assessed via CA  

<mark style="background: #04FF00A6;">Design, create, and query:</mark>
- A document-oriented database  
- Assessed via CA  

<mark style="background: #04FF00A6;">Critically compare:</mark>
- The strengths and limitations of different database technologies used in contemporary enterprise applications  
- Assessed in Exam (Informed by CA)  

<mark style="background: #04FF00A6;">Discuss:</mark>
- Recent developments and emerging trends in database technologies and their use in contemporary enterprise applications  
- Assessed in Exam (Informed by CA)

<mark style="background: #04FF00A6;">Discuss</mark>
- Challenges of, and discriminate between approaches to, database modelling – conceptual, logical, and physical design  
- Assessed in Exam (partially CA)  

<mark style="background: #04FF00A6;">Discuss</mark>  
- Database considerations for data integrity, integration, security, query optimisation, performance tuning and concurrency control in contemporary enterprise applications  
- Assessed in Exam (partially CA)  

<mark style="background: #04FF00A6;">Apply:</mark>
- Techniques for data integrity, security, data optimisation, performance tuning and concurrency control  
- Assessed in CA (partially CA)  

<mark style="background: #04FF00A6;">Understand and apply:</mark>
- Different approaches to data integration, both semantic and physical  
- Understand Assessed in Exam/Apply assessed in CA  

<mark style="background: #04FF00A6;">Understand and apply:</mark>
- Data modelling techniques for logical and physical design to support contemporary enterprise applications  
- Understand Assessed in Exam/Apply assessed in CA

### <mark style="background: #04FF00A6;">Key Point – What the exam IS NOT</mark>  

It is not based on recall and application  

Memorizing text from lecture notes and reproducing these will get you zero marks.  

<mark style="background: #04FF00A6;">You will not be required to:</mark>
- Write code.  
- Interpret/correct code.  
- Build/interpret/correct data models

### <mark style="background: #04FF00A6;">Key Point - What the exam IS</mark>

It is based on synthesis and evaluation  

You will be expected to demonstrate knowledge and understanding  

This will require you to explain your understanding of concepts/issues IN YOUR OWN WORDS.  

<mark style="background: #04FF00A6;">You will be expected to be able to apply that knowledge and understanding:</mark>
- to discuss questions posed/ideas suggested  
- to make decisions about issues/scenarios/applications  
- to provide advice/guidance about issues/scenarios/applications  
- to justify opinions/decisions/choices/advice

<mark style="background: #04FF00A6;">You will be expected to be able to apply that knowledge and understanding:</mark>
- to discussion of questions posed/ideas suggested  
- to make decisions about issues/scenarios/applications  
- to provide advice/guidance about issues/scenarios/applications  
- to justify opinions/decisions/choices/advice

### <mark style="background: #04FF00A6;">The exam paper</mark>

Includes parts of questions where you are asked to explain.  

Even if you answer all of these correctly, you will not get much more than a pass mark.  

You must be able to demonstrate that you can synthesise your knowledge and use it to evaluate/make judgments or decision/support your opinions.

<mark style="background: #04FF00A6;">Broad topics Covered:</mark> Refer to CMPU4003 – Revision Guide.pdf

### <mark style="background: #04FF00A6;">Tackling the Exam Paper:</mark>

Answer 3 of 4 questions  

All questions are worth 33 marks (there is 1 free mark)  

You have 2 hours to tackle this exam paper – 120 mins.  

Use your time strategically  

<mark style="background: #04FF00A6;">Attempt 3 Questions:</mark>
- If you only attempt 2 the max marks available are 67  
- Most of the questions have some parts at the start where you can gain easy marks 
- Maximise the available marks

<mark style="background: #04FF00A6;">How long should I spend on each question?</mark>
+ A general heuristic is to spend the same number of minutes answering a question as there are marks allocated.  
+ This includes thinking as well as writing  
+ For the Advanced Databases exam there will be a good bit of thinking needed before you do the writing  

For Advanced Databases you have to answer 3 questions.  

Each is worth 33 marks so a general guide would be to spend 33 minutes answering each (this includes thinking time).  

If we round that up to 35 marks per question. That works out at 105 minutes total.

When you reach 35 mins for a question stop and move on to another question.  

<mark style="background: #04FF00A6;">Why?</mark> The more questions you answer the better chance you have of gaining marks.  

<mark style="background: #04FF00A6;">E.g.</mark>
- If you answer two full questions that is a total of 67 marks available.  
+ If you do really well you may get 90% of those marks which will give you a result of 60.3% for the exam.
+ If you answer three questions there will be 100 marks available.  
+ If you answer 66% of each question then this is a better result.

<mark style="background: #04FF00A6;">How should I tackle answering a question?</mark>
- <mark style="background: #04FF00A6;">Read the question:</mark> pay attention to the marks per part 
- <mark style="background: #04FF00A6;">Decide your answer:</mark> make notes 
- <mark style="background: #04FF00A6;">Write your answer:</mark> Start each question on a New Page in the Answer Book. 
- <mark style="background: #04FF00A6;">Read your answer:</mark> Make any adjustments/additions

<mark style="background: #04FF00A6;">What should I do with the rest of the time?</mark> If you follow the heuristic, you are left with 15 mins.  

A suggestion would be to use this time as follows:  

At the start of the exam spend 5 mins reading the paper. Read every question and decide which questions you are going to answer.  

When you are finished answering all the questions, revisit each question in turn  

If you have left parts of the question unfinished quickly try to finish the ones that you think will be doable.  

If you have finished answering all the questions read the questions again and make sure you have answered all parts of each question.  

Max 10 mins

### <mark style="background: #04FF00A6;">Key Areas to Address (Not Exhaustive)</mark>

<mark style="background: #04FF00A6;">PostgreSQL Performance, Warehousing, and Query Optimisation:</mark>
- Understanding how bottlenecks occur and how to identify related issues  
- Performance optimisation techniques (know concept + how + trade-off)  
- Evaluating improvements (testing, EXPLAIN ANALYZE BUFFERS)  
- Long-term optimisation approaches  

<mark style="background: #04FF00A6;">Denormalisation, Migration and ETL (SQL to NoSQL):</mark>
- Denormalisation: what, why, when (to CouchDB and Cassandra)  
- Importance when migrating from RDBMS → NoSQL  
- Benefits, Risks/Trade-offs  
- ETL challenges and ways to mitigate  

<mark style="background: #04FF00A6;">Performance comparison:</mark>
- PostgreSQL joins vs. CouchDB map-reduce  
- Index behaviour in both systems  
- Impact of eventual consistency

<mark style="background: #04FF00A6;">Distributed Systems, Replication Models, and Availability:</mark>  
- Replication models (compare + advantages + risks)  
- Types (Leader -> Follower, Leader -> Leader, Leaderless)  
- Synchronous/Asynchronous  
- How writes propagate  
- Availability vs. consistency differences  
- Latency implications  
- Handling Failure  
- Advantages and risk for each model  

<mark style="background: #04FF00A6;">Architecture for reducing downtime + data loss:</mark>
- read/write quorum tuning  
- durable writes  
- backup/restore strategy  
- failover mechanisms  
- local-region synchronous replication + cross-region async

<mark style="background: #04FF00A6;">Partitioning and Sharding (Relational, Document, Wide-Column):</mark> 
- Concept of sharding / partitioning  
- Know how it differs  
- in relational (range, list, hash, table inheritance, native partitioning)  
- document DBs (shard keys, prefix partitioning)  
- wide-column (Cassandra token ring, partition key hashing)  
- Compare range, list, hash partitioning implementation in relational, document and wide column  
- Cassandra partition key choice (impact on partitioning)  

<mark style="background: #04FF00A6;">CAP and PACELC:</mark>
- What each letter means  
- How partition behaviour differs vs. normal behaviour

### <mark style="background: #04FF00A6;">What You Must Be Able to DO</mark>

1. <mark style="background: #04FF00A6;">Diagnose warehouse performance issues:</mark> (how to, typical issues)  
2. <mark style="background: #04FF00A6;">Apply and justify optimisation techniques:</mark> (for issues identified)
3. <mark style="background: #04FF00A6;">Understand data migration to NoSQL:</mark> (denormalisation, ETL, benefits, challenges document/wide column modelling)  
4. <mark style="background: #04FF00A6;">Techniques to address challenges:</mark> (in CouchDB and Cassandra)  
5. <mark style="background: #04FF00A6;">Explain distributed replication models with trade-offs</mark>  
6. <mark style="background: #04FF00A6;">Recommend approaches for scenarios</mark> (discuss options for minimising downtime)  
7. <mark style="background: #04FF00A6;">Describe partitioning approaches</mark> (range/list/hash)  
8. <mark style="background: #04FF00A6;">Recommend partitioning and database models for scenarios:</mark>(range/list/hash; relational/doc/wide-column  
9. <mark style="background: #04FF00A6;">Explain CAP and PACELC:</mark> (C. A, P, E, L. C - discuss practical implications)  
10. <mark style="background: #04FF00A6;">Recommend approach in practical contexts:</mark> (CAP: CP or AP, PACELC: PC/EC, PC/EL, PA/EC, PA/EL)

<mark style="background: #04FF00A6;">Data Models and JSONB in PostgreSQL:</mark> 
- Relational vs NoSQL models  
- JSON vs JSONB  
- JSONB operators  
- JSONPath querying  
- GIN indexing & generated columns  
- Partial indexes & constraints  
- Modelling patterns: attribute bag, event log  
- Found in: L1a, L2a  

<mark style="background: #04FF00A6;">CouchDB Fundamentals:</mark>  
- Document structure, _id, _rev  
- Single vs separate collections  
- Embedding vs linking  
- Mango queries vs Views  
- View collation and complex keys  
- Partitioned DBs and partition-local queries  
- Found in: L2b, L5b, L8c, L10c  

<mark style="background: #04FF00A6;">Cassandra Fundamentals:</mark>
- Wide-column store  
- Primary key = partition + clustering  
- Clustering order  
- Collections: list, set, map  
- Query-driven design  
- Found in: L4b, L9  

<mark style="background: #04FF00A6;">Data Warehousing:</mark>
- OLTP vs OLAP  
- Fact and dimension tables  
- Grain definition  
- Dimensional modelling steps  
- Data cubes: slice, dice, roll-up, drill-down  
- Found in: L5a, 6a