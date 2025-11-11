
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
- The optimizer estimates (based on outdated statistics) that scanning the entire table is cheaper than using an index.  

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

PostgreSQL’s optimizer must choose which tables to join first and how (e.g. nested loop, hash join, merge join).  
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
- Use materialized views or summary tables for repeated aggregations

### <mark style="background: #04FF00A6;">Diagnostic Tools</mark>

<mark style="background: #04FF00A6;">EXPLAIN (ANALYZE, BUFFERS)</mark>
- Used to <mark style="background: #04FF00A6;">analyze and visualize how PostgreSQL executes a query</mark> - showing the actual execution plan, timing, and I/O activity.  

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

Tune by increasing work_mem or optimizing queries to reduce intermediate result sizes.

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
		<th>Materialized Views</th>
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

<mark style="background: #04FF00A6;">Note: Write-Ahead Log (WAL)</mark>  

PostgreSQL’s mechanism for ensuring <mark style="background: #04FF00A6;">data integrity and crash recovery</mark>.  

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
		<th>WAL Size</th>
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

<mark style="background: #04FF00A6;">Trade -off:</mark> 
- You gain performance but lose immediate freshness — the view shows data as of the last refresh, not live updates.  
- Requires refreshing.  

<mark style="background: #04FF00A6;">Benefit:</mark> Analyst queries hit precomputed results (instant response).  

<mark style="background: #04FF00A6;">Data freshness trade-off:</mark> Choose refresh interval based on SLA — e.g., daily for dashboards, hourly for near-real-time reporting.  

```plSQL
CREATE MATERIALIZED VIEW mv_degree_summary AS  
SELECT degree_name, AVG(pass)  
FROM factmarks JOIN dimdegree USING (degree_sk)  
GROUP BY degree_name;  
-- Refresh when new data loaded  
REFRESH MATERIALIZED VIEW mv_degree_summary;
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
- Forgetting to refresh materialized views.  
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
		<td>Materialize summary tables; automate refresh schedules</td>
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
SELECT  
attname AS column,  
n_distinct,  
reltuples  
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
SELECT * FROM  
examresultsdw.factmarks WHERE  
pass = true;  
EXPLAIN (ANALYZE, BUFFERS)  
SELECT * FROM  
examresultsdw.factmarks WHERE  
pass = false;
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

### <mark style="background: #04FF00A6;">Index Types (PostgreSQL)</mark>

<table>
	<tr>
		<th>Index Type</th>
		<th>Best For</th>
		<th>Supported Operations</th>
		<th>When to Use Advantages</th>
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
		<td>Good for geometric, full-text, range queries Complex tuning; higher insert cost</td>
	</tr>
	<tr>
		<th>BRIN index</th>  
		<td>Compact, efficient for naturally ordered data (e.g., date/time)</td>  
		<td>Coarse granularity — inefficient if data not clustered by column</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Long-term considerations</mark>  

Over-indexing increases storage and slows writes.  

Plan periodic index usage audits via pg_stat_user_indexes.  

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
		<th>Materialized Views</th>  
		<td>Pre-compute and store complex aggregations for recurring analytical queries. Automate REFRESH MATERIALIZED VIEW after ETL.</td>  
		<td>Near-instant query response; offloads heavy aggregations from live tables.</td>  
		<td>Data freshness trade-off—results only as current as last refresh; maintenance cost for scheduling refresh jobs</td>
	</tr>
</table>
