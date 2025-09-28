### <mark style="background: #04FF00A6;">Why are there different types?</mark>

<mark style="background: #04FF00A6;">Nature of applications and user demands has changed over time:</mark>
- Relational databases dominated for decades
- Data integrity and consistency valued over speed of retrieval
- Evolution of web applications, big data and real-time analytics led to alternatives being developed
- Speed of retrieval became more highly valued
- e.g. document, key-value stores, and graph database

<mark style="background: #04FF00A6;">Different models:</mark>
- Suit different application types
- Offer different: Optimization strategies, Scalability options, Flexibility options, Consistency and Availability options

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
{ "studentDetails": {
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

# <mark style="background: #FFB8EBA6;">SLIDE 31:</mark>
