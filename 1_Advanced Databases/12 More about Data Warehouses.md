### <mark style="background: #04FF00A6;">Definitions</mark>

"A data warehouse is a subject-oriented, integrated, time-variant, and non-volatile collection of data in support of management’s decision-making process." - William Marshall, Bill Inmon  

<mark style="background: #04FF00A6;">Data warehousing:</mark> The process of constructing and using data warehouses

### <mark style="background: #04FF00A6;">Data Warehouse v Data Mart</mark>
  
A <mark style="background: #04FF00A6;">data warehouse</mark> is a large centralised repository of data that contains information from many sources within an organisation.  

The collated data is used to guide business decisions through analysis, reporting, and data mining tools.

A <mark style="background: #04FF00A6;">data mart</mark> is a subset of a data warehouse oriented to a specific business process.  

Marts contain repositories of summarized data collected for analysis on a specific section or unit within an organisation, for example, the sales department.

### <mark style="background: #04FF00A6;">Data Mart</mark>

<mark style="background: #04FF00A6;">A subset of a data warehouse:</mark> Focuses on a specific business area (e.g., sales, finance). 

Typically, smaller and more subject-specific, providing faster access to data for departmental needs.  

Can be <mark style="background: #04FF00A6;">dependent</mark> (sourced from a central data warehouse)  

Or <mark style="background: #04FF00A6;">independent</mark> (sourced directly from operational systems)

![[Pasted image 20251023094247.png]]

### <mark style="background: #04FF00A6;">Data Warehouse v Data Lake</mark>

<mark style="background: #04FF00A6;">A data warehouse is a centralised repository:</mark> It stores data that has been treated and transformed with a specific purpose in mind, which can then be used to source analytic or operational reporting (determined in advance).  

<mark style="background: #04FF00A6;">A data lake is a centralised repository:</mark> It stores large volumes of data in its original form. The data can then be processed and used as a basis for a variety of analytic needs (determined by the user as needed)

### <mark style="background: #04FF00A6;">Data Cube</mark>

A data warehouse is based on a multidimensional data model which views data in the form of a data cube  

A data cube contains aggregates of measure values, on various combinations of dimensions, and furthermore, with various levels of aggregation on individual dimension.

![[Pasted image 20251023094435.png]]

A <mark style="background: #04FF00A6;">data cube</mark> is about how you analyse data  

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

<mark style="background: #04FF00A6;">Contain related measures:</mark> Store quantifiable business data (such as sales, expenses, and inventory)  

Usually the largest tables in our schema  

Usually appended to Can contain detail or summary data 

Measures are usually additive

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

<mark style="background: #04FF00A6;">Additive:</mark> facts that can be summed up across any dimension without losing meaning or accuracy  

Additivity is crucial because data warehouse applications almost never retrieve a single fact table record  

Rather, they fetch back hundreds, thousands, or even millions of these records at a time, and often the most useful thing to do with so many records is to add them up.  

<mark style="background: #04FF00A6;">Type of additivity:</mark>Determines how aggregation can be done across different dimensions

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
- OR average calculations for time-based dimensions  Require more care in the dimensional modelling.  

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
- <mark style="background: #04FF00A6;">Semi-additive measures</mark> may require specialized modelling techniques like snapshot facts or custom aggregations.  
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
- New case or busines cases should not disrupt existing applications  
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