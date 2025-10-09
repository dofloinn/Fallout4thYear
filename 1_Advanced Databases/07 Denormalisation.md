### <mark style="background: #04FF00A6;">Database Normalisation:</mark>

<mark style="background: #04FF00A6;">Normalisation is a design technique:</mark> “..a very important ingredient in database design”, Coronel, C., &  
Morris, S. (2016). Database systems: design, implementation, & management. Cengage Learning

<mark style="background: #04FF00A6;">Objectives:</mark>
- Eliminate redundant data (storing the same data in more than one  table)  
- Ensure data dependencies make sense (only storing related data in  a table)  

<mark style="background: #04FF00A6;">Focus:</mark> Correct assignment of attributes to tables:
  
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

If somehow, the correct address gets updated for one department but not the other then as far as the database is concerned Rick has two different addresses this is not correct or consistent with the real world we are modelling

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

Normalisation works through a series of stages called normal forms:  
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
- <mark style="background: #04FF00A6;">Example:</mark> Global services like Netflix or Instagram duplicate user data across data centers to keep performance consistent worldwide.  

<mark style="background: #04FF00A6;">Analytics and caching:</mark>
- Analytical workloads benefit from precomputed or flattened tables. 
- Caches or materialised views intentionally break normalisation to serve read-heavy workloads efficiently.

### <mark style="background: #04FF00A6;">Denormalisation</mark> 

Normalised (decomposed) tables require additional processing, reducing system speed.  

Normalisation purity is often difficult to sustain in the modern database environment.  

The conflict between design efficiency, information requirements, and processing speed are often resolved through compromises that include <mark style="background: #04FF00A6;">Denormalisation</mark>

Primarily a database optimisation technique focused on improving read/query performance.

Normalisation minimises redundancy to preserve data integrity and update efficiency.  

Denormalisation intentionally reintroduces redundancy to improve query performance, especially in read-heavy or analytical workloads.

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
- Extra DML needed to update original non-denormalized column  
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

Create a check constraint to validate values against reference values  

This must be rewritten each time a new reference value is added.

<mark style="background: #04FF00A6;">Advantages:</mark>
- No need to implement a lookup table  
- No joins to a lookup table  

<mark style="background: #04FF00A6;">Disadvantages:</mark>
- Recoding and restating are required if look-up values are altered

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

<mark style="background: #04FF00A6;">Advantages:</mark> Can use the between operator for date selection queries instead of potentially time consuming synchronized subquery  

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
- In a normalized relational database, we could simply introduce two different tables − Storage_types and Storage_restraints − that would store records for each user.  

<mark style="background: #04FF00A6;">We can go a different way and add denormalized columns to the Users table:</mark>
- ``message_space_allocated``  
- ``message_space_available``  
- ``file_space_allocated``  
- ``file_space_available``
- The denormalised Users table stores not only the actual information about a user but the restraints as well, so in terms of functionality the table doesn’t fully correspond to its name

![[Pasted image 20251009172113.png]]

<mark style="background: #04FF00A6;">When To use?</mark>
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

By denormalizing the Messages table and adding the first_attachment_name column we have an improvement for messages with 0 or 1 attachment.  

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

### <mark style="background: #04FF00A6;">Denormalizing Guidelines</mark>

Always create a conceptual data model that is completely normalized.  

Consider denormalization as the last option to boost performance.  

Never presume denormalization will be required. 

To meet performance objectives, denormalisation should be done during the database design.  

Once performance objectives have been met, do not implement any further denormalisation.  

Fully document all denormalisation, stating what was done to the tables, what application code was added to compensate for the denormalisation, and the reasons for and against  
doing it