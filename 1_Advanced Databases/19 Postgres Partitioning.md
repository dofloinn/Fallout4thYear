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

Useful when data can be categorized into distinct, non-overlapping sets.  

<mark style="background: #04FF00A6;">Note:</mark> When you partition a table in PostgreSQL, the primary key (or any unique constraint) must include all the columns that are part of the partitioning key

<mark style="background: #04FF00A6;">Example:</mark> LISTPARTITIONING.SQL
![[Pasted image 20251121120807.png]]

### <mark style="background: #04FF00A6;">Hash Partitioning</mark> 

Data is divided into partitions based on the hash value of a specified column.  

Uses a hash function to distribute data uniformly across partitions.

Useful when you want to evenly distribute data across partitions to achieve load balancing.  

<mark style="background: #04FF00A6;">Note:</mark> When you partition a table in PostgreSQL, the primary key (or any unique constraint) must include all the columns that are part of the partitioning key

<mark style="background: #04FF00A6;">Example:</mark> HASHPARTITIONING.SQL
![[Pasted image 20251121120907.png]]