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

Offers flexibility for semi-structured data - E.g. preferences, events, attributes

Provides rich operators and JSONPath

Allows use of GIN indexing for nested keys - Prefer columns when shape is stable and heavily queried

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

<mark style="background: #04FF00A6;">GIN indexes can be large</mark> → consider partial indexes / generated
columns

<mark style="background: #04FF00A6;">Use LATERAL carefully:</mark> Explode arrays only when needed

### <mark style="background: #04FF00A6;">Rules of Thumb</mark>

Start flexible with JSONB while requirements churn

As fields stabilize and become critical - promote to columns based on usage patterns

Index what you filter/sort on

Keep indexes lean