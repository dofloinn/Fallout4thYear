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

Client → Parser → Rewriter → Optimizer → Executor  
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
		<td>Cost-based optimizer determines join order and scan type. EXPLAIN. </td>
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

<mark style="background: #04FF00A6;">Catalog Manager and Memory Manager:</mark> Invoked as utilities during any transaction  

Catalog is used by the query processor during authentication, parsing, and query optimisation 

Memory manager is used throughout the DBMS whenever memory needs to be dynamically allocated or deallocated  

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

PostgreSQL is using hash-based equality joins — it builds an in-memory hash table of the smaller (dimension) table and probes it using rows from the larger (fact) table.  

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

### <mark style="background: #04FF00A6;">Explain Analyse Buffers</mark>  

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
- Optimizes it into a procedural dataflow execution plan  
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

The query processor then invokes the catalog manager to check that the table is registered in the system catalog  

It then uses the catalog to ensure that attribute references are correct.

The data types of attributes are used to drive the disambiguation logic for overloaded functional expressions, comparison operators, and constant expressions  

<mark style="background: #04FF00A6;">For example:</mark>  
- Suppose we include the expression (EMP.salary * 1.15) < 75000 in our query  
- Here decisions need to be made about  
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

Simplifies and normalizes the query without changing its semantics  

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

Adding these transitive predicates increases the ability of the optimizer to choose plans that filter data early in execution, especially through the use of index-based access methods

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

If the semantic query optimizer checks for the existence of this constraint then it will know the result of this query will be zero so it doesn’t have to run it at all


### <mark style="background: #04FF00A6;">Query Optimiser</mark>  

<mark style="background: #04FF00A6;">SQL is a declarative language:</mark>
- A SQL query entered by a user describes what the user wants  
- The query is then parsed and rewritten into an internal query representation  

The query optimizer transforms an internal query representation into an efficient query plan for executing the query  

Query plan is a list of instructions that the DBMS needs to follow in order to execute a query on the data. Can be thought of (and depicted) as a dataflow diagram that pipes table data through a graph of query operators.

### <mark style="background: #04FF00A6;">Query Optimiser Objective</mark>  

For a given query, find a correct execution plan that has the lowest “cost”.  

This is the part of a DBMS that is the hardest to implement well (proven to be NP-Complete).  

The query optimizer tries to determine the most efficient way to execute a given query by considering the possible query plans  

<mark style="background: #04FF00A6;">No optimiser truly produces the “optimal” plan:</mark>
- Use estimation techniques to guess real plan cost.  
- Use heuristics to limit the search space.

### <mark style="background: #04FF00A6;">Query Optimiser:</mark>

<mark style="background: #04FF00A6;">Three components:</mark>
1. Search space  
2. Plan enumeration algorithms  
3. Cardinality and cost estimation

### <mark style="background: #04FF00A6;">Search space</mark>  

<mark style="background: #04FF00A6;">Two ways to optimise:</mark>
- <mark style="background: #04FF00A6;">Analyse and transform equivalent relational expressions:</mark> Attempting to minimize the tuple and column counts of the intermediate and final query processes  
- <mark style="background: #04FF00A6;">Using different algorithms for each operation:</mark> Underlying algorithms determine how tuples are accessed from the data structures they are stored in, indexing, hashing, data retrieval and hence influence the number of disk and block accesses

### <mark style="background: #04FF00A6;">Relational Algebra:</mark>

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

In relational algebra, the process of querying data is done through a sequence of operations:  
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

A series of operators can therefore be chained together, each consuming the output of the operator that precedes it, right down to the source  
- You imagine the data as streams of information.  
- You channel these streams through operators that filter out unneeded data, join it with other streams of information or process some kind of aggregate function like ``sum()`` or ``count()``.  

The appropriate operators applied in the appropriate order materializes the query’s results  

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

Most Efficient Plan (Can be found by the optimiser)  

```
πname,length(Stars ⋈  
πname,length(AppearIn ⋈  
(πtitle,year,length σyear=2014(Movies)))
```  
Start with the Movies table
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

Query optimization ≠ changing results — it changes <mark style="background: #04FF00A6;">how</mark> the result is produced.  

PostgreSQL picks a plan based on estimated <mark style="background: #04FF00A6;">cost</mark> and <mark style="background: #04FF00A6;">statistics</mark>.  

Always confirm with EXPLAIN ANALYZE BUFFERS.  

Understanding node types = understanding performance


### <mark style="background: #04FF00A6;">How do we know what is happening?</mark>  

Query plans  

PostgreSQL  

<mark style="background: #04FF00A6;">EXPLAIN:</mark>  
- Takes as a parameter a SQL statement  
- Returns the estimated plan and cost, in plain text by default (you can request a different format)  

<mark style="background: #04FF00A6;">ANALYSE:</mark>
- Takes as a parameter a SQL statement  
- Will actually run the query (so be careful with updates or deletes and transactions)  

<mark style="background: #04FF00A6;">BUFFERS:</mark> Adds I/O information to the plan showing how data was accessed.