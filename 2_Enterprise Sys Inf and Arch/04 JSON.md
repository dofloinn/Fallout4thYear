### <mark style="background: #00ECFFA6;">JSON</mark>  

<mark style="background: #00ECFFA6;">JavaScript Object Notation "A lightweight data-interchange format":</mark> 
- Client <-> Server  Mobile apps / Rich Web apps
- Uses javascript syntax
- Can be used natively with javascript code  

JSON <-> Objects

### <mark style="background: #00ECFFA6;">JSON Example</mark>  

```json
{  
	"to": "John",  
	"from": "Jane",  
	"subject": "Greeting",  
	"body": "Hi John"  
}
```

### <mark style="background: #00ECFFA6;">JSON Syntax Rules</mark>  

```json
{  
	"to": "John",  
	"from": "Jane",  
	"subject": "Greeting",  
	"body": "Hi John"  
}
```  

Name value pairs (colon separated)

Comma separated pairs  

<mark style="background: #00ECFFA6;">Keys:</mark> double quoted strings  

<mark style="background: #00ECFFA6;">Values:</mark> string, number, object, array, Boolean, null  

Curly brace holders

### <mark style="background: #00ECFFA6;">JSON Files / Structure</mark>

The file type for JSON files is ".json"  

The Internet media type is "application/json"  

```json
{  
	"messages":[  
		{  
			"to": "John",  
			"from": "Jane",  
			"subject": "Greeting",  
			"body": "Hi John"  
		},  
		{  
			"to": "Mick",  
			"from": "Joe",  
			"subject": "Goodbye",  
			"body": "See ya Mick"  
		}  
	]  
}
```

### <mark style="background: #00ECFFA6;">JSON Data Types</mark> 

<mark style="background: #00ECFFA6;">String:</mark> Must be contained in double quotes  

<mark style="background: #00ECFFA6;">Number:</mark> Integer or Floating point  

<mark style="background: #00ECFFA6;">JSON Object:</mark> E.g. ``"message" : { "to":"John", "from":"Jane", "text":"Hello" }``  

<mark style="background: #00ECFFA6;">Array:</mark> E.g. ``{ "messages":[ "Hello", "Goodbye", "Farewell" ] }``  

<mark style="background: #00ECFFA6;">Boolean:</mark> E.g. ``{ "sent" : true }``  

<mark style="background: #00ECFFA6;">Null:</mark> E.g. ``{ "subject" : null }``

### <mark style="background: #00ECFFA6;">JSON Schema</mark>

<mark style="background: #00ECFFA6;">JSON Schema</mark> is a vocabulary that allows you to annotate and validate JSON documents.  

A <mark style="background: #00ECFFA6;">JSON Schema</mark> is itself <mark style="background: #00ECFFA6;">JSON</mark>. 

The <mark style="background: #00ECFFA6;">JSON document</mark> being validated or described is called the <mark style="background: #00ECFFA6;">instance</mark>, and the document containing the description is called the schema.  

Latest JSON Schema Specification draft update was December 2020.

### <mark style="background: #00ECFFA6;">Starting a Schema File</mark>  

A schema is always placed in a separate JSON document.

Currently you cannot reference the schema from the instance document.

`"$schema": "http://json-schema.org/draft/2020-12/schema#"`

### <mark style="background: #00ECFFA6;">Example JSON Schema</mark>  

```json
{  
	"$schema": "http://json-schema.org/draft/2020-12/schema#",  
	"title": "message",  
	"type": "object",  
	"properties": {  
		"id": { "type": "string" },  
		"to": { "type": "string" },  
		"from": { "type": "string" },  
		"subject": { "type": "string" },  
		"body": { "type": "string" }  
	}  
}
```

### <mark style="background: #00ECFFA6;">JSON Schema Types - String</mark>  
  
<mark style="background: #00ECFFA6;">Length:</mark>
```json
{  
	"type": "string",  
	"minLength": 2,  
	"maxLength": 3  
}
```  

<mark style="background: #00ECFFA6;">Regular Expression:</mark>

```json
{  
	"type": "string",  
	"pattern": "^(\\([0-9]{3}\\))?[0-9]{3}-[0-9]{4}$"  
}
``` 

<mark style="background: #00ECFFA6;">Built-in Formats:</mark> 
- Dates and Times
- Email addresses
- IP addresses
- And others...

### <mark style="background: #00ECFFA6;">JSON Schema Types - Numeric</mark>  

<mark style="background: #00ECFFA6;">Integer:</mark> 
```json
{  
	"type": "integer"  
}
```  

<mark style="background: #00ECFFA6;">Number:</mark>
```json
{  
"type": "number"  
}
```  

<mark style="background: #00ECFFA6;">Multiples:</mark>
```json
{  
"type":"number",  
"multipleOf":10  
}
```  

<mark style="background: #00ECFFA6;">Range:</mark>
```json
{  
	"type":"number",  
	"minimum":0,  
	"exclusiveMaximum":100  
}
```

### <mark style="background: #00ECFFA6;">JSON Schema Types - Object</mark>  

<mark style="background: #00ECFFA6;">Properties:</mark> key-value pairs

<mark style="background: #00ECFFA6;">Required Properties:</mark> Use of "required" keyword

<mark style="background: #00ECFFA6;">Property names:</mark> The names of properties can be validated against a schema irrespective of their values

<mark style="background: #00ECFFA6;">Size:</mark> Use of "minProperties" and "maxProperties"

<mark style="background: #00ECFFA6;">Dependencies:</mark>
- <mark style="background: #00ECFFA6;">Property dependencies:</mark> declare that certain other properties must be present if a given property is present
- <mark style="background: #00ECFFA6;">Schema dependencies:</mark> declare that the schema changes when a given property is present

### <mark style="background: #00ECFFA6;">JSON Schema Types - Array</mark>  

<mark style="background: #00ECFFA6;">Items:</mark> Each element in an array may be of a different type  
- <mark style="background: #00ECFFA6;">List validation:</mark> a sequence of arbitrary length where each item matches the same schema
- <mark style="background: #00ECFFA6;">Tuple validation:</mark> a sequence of fixed length where each item may have a different schema

<mark style="background: #00ECFFA6;">Length:</mark> Use of ``"minItems"`` and ``"maxItems"`` keywords  

<mark style="background: #00ECFFA6;">Uniqueness:</mark> Use of the ``"uniqueItems"`` keyword e.g. array of numbers so that the same number is not repeated.

### <mark style="background: #00ECFFA6;">JSON Schema Types - Boolean & Null</mark>  

``{ "type": "boolean" }``  

Value of true or false (not "true" or "false")  

``{ "type": "null" }``  

Value of null (not "null" in double quotes) generally used to represent a missing value – value must be null.

### <mark style="background: #00ECFFA6;">JSON Schema v XML Schema</mark>

<table>
	<tr>
		<th>Aspect</th>
		<th>JSON Schema</th>
		<th>XML Schema (XSD)</th>
	</tr>
	<tr>
		<td>Primary format</td> 
		<td>JSON</td> 
		<td>XML</td>  
	</tr>
	<tr>
		<td>Typical use</td> 
		<td>APIs, web services, config files</td> 
		<td>Enterprise systems, document-heavy workflows, config files</td>  
	</tr>
	<tr>
		<td>Data model</td> 
		<td>Object/array-based</td> 
		<td>Tree-based with elements & attributes</td>  
	</tr>
	<tr>
		<td>Namespaces</td> 
		<td>Not native</td> 
		<td>First-class feature</td>  
	</tr>
	<tr>
		<td>Ordering</td> 
		<td>Object fields unordered</td> 
		<td>Element order significant</td>  
	</tr>
	<tr>
		<td>Tooling maturity</td> 
		<td>Growing, draft specifications</td> 
		<td>Very mature, enterprise-grade</td>  
	</tr>
	<tr>
		<td>Extensibility</td> 
		<td>Lightweight</td> 
		<td>Very powerful but can be complex</td>
	</tr>
</table>

### <mark style="background: #00ECFFA6;">Strengths / Weaknesses</mark> 

<mark style="background: #00ECFFA6;">JSON Schema - Strengths:</mark>  
- Simple & readable  
- Ideal for APIs & web apps  
- Lightweight, dev-friendly  
- Modern tooling  

<mark style="background: #00ECFFA6;">XML Schema (XSD) - Strengths:</mark>
- Very expressive & precise  
- Strong typing & validation  
- Native namespaces  
- Mature enterprise tooling  

<mark style="background: #00ECFFA6;">JSON Schema - Weaknesses:</mark>  
- Less powerful for complex models  
- Limited cross-field rules
- No native namespaces  

<mark style="background: #00ECFFA6;">XML Schema (XSD) - Weaknesses:</mark>
- More verbose & complex  
- Steeper learning curve  
- Heavy for simple use cases