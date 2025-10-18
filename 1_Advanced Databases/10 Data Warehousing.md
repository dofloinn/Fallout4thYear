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
- <mark style="background: #04FF00A6;">Denormalised:</mark> one central data table (e.g., ``sales_events``) that stores measurable transactions — linked to several context tables such as date, product, customer, and region. 
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
		<th>Time Horizon</th>
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

The data is organized in a way that facilitates fast, efficient querying and supports <mark style="background: #04FF00A6;">business intelligence (BI)</mark> processes.

![[Pasted image 20251017113025.png]]

### <mark style="background: #04FF00A6;">Why Data Warehouses?</mark>

<mark style="background: #04FF00A6;">Organisations need to analyse data so that it can:</mark>
- <mark style="background: #04FF00A6;">Understand trends:</mark>  Turn “What happened?” into “What’s been happening — and why?”  
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

<mark style="background: #04FF00A6;">Load:</mark> The transformed data is loaded into the data warehouse for querying and analysis.

![[Pasted image 20251017114409.png]]

### <mark style="background: #04FF00A6;">What is a Data Warehouse?</mark>

<mark style="background: #04FF00A6;">Fundamentally, it is a database:</mark>
- A structured system for storing and querying data.  
- It can be built using a relational database platform such as Oracle, PostgreSQL, or SQL Server.  

<mark style="background: #04FF00A6;">It is not a live or transactional system:</mark>
- Daily updates, inserts, and operational transactions occur elsewhere.  
- Day-to-day transactions are captured by operational databases (OLTP systems) that are fully normalised for efficiency and accuracy.

The warehouse collects, cleans, integrates, and stores selected data from those operational sources, often on a scheduled basis (daily, weekly, or monthly).  

Its design is read-oriented, optimized for queries, summaries, and analysis rather than updates.  

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
- Detailed data and summarized data  
- Historic data  
- Metadata  

Overcomes difficulties when using existing transaction systems for those tasks  

OLTP applications remain, DWH is a completely new system

### <mark style="background: #04FF00A6;">Data Warehouse Definition</mark>

<mark style="background: #04FF00A6;">Ralph Kimball:</mark> A data warehouse is a copy of transaction data specifically structured for querying and reporting

<mark style="background: #04FF00A6;">William Marshall, Bill Inmon:</mark> A data warehouse is a subject oriented , integrated , time variant , non-volatile collection of data in support of management’s decision making process

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
- Linked to a transaction entity by a one-to-many relationship
- Store data associated with the business event, and answer “who,” “what”, “where”, “how”, and “why” questions  

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