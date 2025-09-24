### <mark style="background: #04FF00A6;">Problem?</mark>

Data (and the ability to use manage and use it) is the main focus of modern computer systems

Volumes of data are growing rapidly

And so is the variation in the type of questions analysis organisations want to conduct using this data, which increasingly requires multiple types of data suited to data models other than relational

### <mark style="background: #04FF00A6;">Big Data 5 Vs:</mark>

![[images/Pasted image 20250924110913.png]]

### <mark style="background: #04FF00A6;">Big Data:</mark>

![[images/Pasted image 20250924111013.png]]
![[images/Pasted image 20250924111023.png]]

### <mark style="background: #04FF00A6;">Problem?</mark>

Organisations have lots and lots and lots of data that is not necessarily nicely structured and organised

They are constantly collecting more data

### <mark style="background: #04FF00A6;">What is the module about?</mark>

Making Databases work and implementing:
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

<mark style="background: #04FF00A6;">Apply:</mark> Techniques for data integrity, security, data optimisation,
performance tuning and concurrency control;

<mark style="background: #04FF00A6;">Understand and apply:</mark> 
- Different approaches to data integration, both semantic and physical;
- Data modelling techniques for logical and physical design to support contemporary enterprise applications;

<mark style="background: #04FF00A6;">Design, create, and query:</mark> 
- A data warehouse;
- A distributed database;
- A document-oriented database

<mark style="background: #04FF00A6;">Critically compare:</mark>
- The strengths and limitations of different database technologies used in contemporary enterprise applications;

<mark style="background: #04FF00A6;">Discuss:</mark>
- Recent developments and emerging trends in database technologies and their use in contemporary enterprise applications

### <mark style="background: #04FF00A6;">Module Content:</mark>

<mark style="background: #04FF00A6;">Relational database design:</mark> reviewing and distinguishing between conceptual and logical design and addressing considerations and implications of implementing physical design from logical design.

<mark style="background: #04FF00A6;">Data warehouses:</mark> definitions, rationale, architectures, design, implementation, and manipulation; dimensional modelling techniques: design of star and snowflakes schemas, types of fact tables, conversion of relational model into dimensional model.

<mark style="background: #04FF00A6;">Distributed databases:</mark> definitions, rationale, architectures, design, implementation, and manipulation; approaches to fragmentation and replication (synchronous and asynchronous); the CAP theorem.

<mark style="background: #04FF00A6;">Document-oriented data stores:</mark> definitions, rationale, architectures, design, implementation, and manipulation; differentiating between document- oriented, key-value pairs, column-oriented and graph types; designing schema-less data structures;.

<mark style="background: #04FF00A6;">Data and database integration:</mark> process, challenges, benefits; ETL process for different database types; standards for interoperability and integration including JSON and Web services.

<mark style="background: #04FF00A6;">Optimisation and performance tuning:</mark> understanding the reasons for and the implications of poorly performing queries; identifying poorly performing queries and structures; examining how queries are executed in various database technologies; using constraints and indexes; choosing between alternative execution plans; amending queries to perform more appropriately.

<mark style="background: #04FF00A6;">Security and integrity:</mark> requirements, e.g. confidentiality, integrity, reliability, storage, and availability; security preserving approaches, integrity preserving approaches; polyglot persistence; transactions, concurrency control; the BASE model vs. the ACID model for transactions management.;

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
- optimization
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