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

![[Pasted image 20250925160445.png]]

<mark style="background: #04FF00A6;">Relational Data Model:</mark>
- Database is a collection of relations
- Relations (Tables) are two dimensional
- Each row represents an entity
- Each column an attribute of that entity

![[Pasted image 20250925160605.png]]

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

# <mark style="background: #FFB8EBA6;">SLIDE 8</mark>