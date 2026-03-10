<mark style="background: #00ECFFA6;">XML Schemas</mark>  
- A <mark style="background: #00ECFFA6;">schema</mark> is an XML document that defines the content and structure of one or more XML documents  
- Defines a <mark style="background: #00ECFFA6;">vocabulary</mark> and rules around specific XML  
- Alternative to <mark style="background: #00ECFFA6;">Document Type Definitions (DTDs)</mark>  
- The XML document containing the content is called the <mark style="background: #00ECFFA6;">instance document</mark>

### <mark style="background: #00ECFFA6;">Schema Dialects</mark>  

There is no single schema form. Several schema "dialects" have been developed in the XML language.

Support for a particular schema depends on the XML parser being used for validation

![[Pasted image 20260210150455.png]]

### <mark style="background: #00ECFFA6;">Starting a Schema File</mark> 

A schema is always placed in a separate XML document that is <mark style="background: #00ECFFA6;">referenced</mark> by the <mark style="background: #00ECFFA6;">instance document</mark>.

### <mark style="background: #00ECFFA6;">Elements and Attributes of the Patient Document example</mark>

![[Pasted image 20260210150553.png]]

### <mark style="background: #00ECFFA6;">Schema (Element) Types</mark>

<mark style="background: #00ECFFA6;">XML Schema recognise two categories of element types:</mark> 
- complex
- simple.  

A complex type element has one or more attributes or is the parent to one or more child elements.

A simple type element contains only character data and has no attributes.

![[Pasted image 20260210150627.png]]

### <mark style="background: #00ECFFA6;">Simple Type Elements</mark>

Use the following syntax to declare a simple type element in XML Schema: ``<element name="name" type ="type"/>``

Above, name is the name of the element in the instance document and type is the data type of the element.  

If a namespace prefix is used with the XML Schema namespace, any XML Schema tags must be qualified with the namespace prefix. e.g. ``<xs:element name="message" type="xs:string"/>``

### <mark style="background: #00ECFFA6;">Understanding Data Types</mark>

<mark style="background: #00ECFFA6;">XML Schema supports two data types:</mark> 
- built-in
- and user-derived. 

A <mark style="background: #00ECFFA6;">built-in</mark> data type is part of the XML Schema specifications and is available to all XML Schema authors.

A <mark style="background: #00ECFFA6;">user-derived</mark> data type is created by the XML Schema author for specific data values in the instance document.

A <mark style="background: #00ECFFA6;">primitive data type</mark>, also called a base type, is one of 19 fundamental data types not defined in terms of other types.  

A <mark style="background: #00ECFFA6;">derived data type</mark> is a collection of 25 data types that the XML Schema developers created based on the 19 primitive types.

![[Pasted image 20260210151119.png]]

![[Pasted image 20260210151137.png]]

### <mark style="background: #00ECFFA6;">Complex Type Elements</mark> 

<mark style="background: #00ECFFA6;">The syntax for complex type elements is:</mark>
```XML
<element name="name">  
	<complexType>  
		compositor  
			element declarations  
		compositor  
		attribute declarations  
	</complexType>  
</element>
```  

Here, <mark style="background: #00ECFFA6;">name</mark> is the name of the element in the instance document.

<mark style="background: #00ECFFA6;">Compositors</mark> define how the list of elements is to be organised.

<mark style="background: #00ECFFA6;">Element declarations</mark> can be simple type element declarations for each child element (or could be complex types).

<mark style="background: #00ECFFA6;">Attribute declarations</mark> define any of the attributes of the elements.

### <mark style="background: #00ECFFA6;">Compositors</mark> 

A <mark style="background: #00ECFFA6;">compositor</mark> is a schema tag that defines how the list will be treated. 

<mark style="background: #00ECFFA6;">Three types of compositors are supported: sequence, choice, and all. </mark>
- The <mark style="background: #00ECFFA6;">sequence</mark> compositor forces elements to be entered in the same order as indicated in the schema.  
- The <mark style="background: #00ECFFA6;">choice compositor</mark> allows any one of the items in the list to be used.  
- The <mark style="background: #00ECFFA6;">all</mark> compositor allows any of the items to appear in any order.  

Compositors may be nested inside of one another.

### <mark style="background: #00ECFFA6;">Declaring an Attribute</mark>  

Any element that contains an attribute is also a complex type. The syntax to declare an attribute is:
```xml
<attribute name="name" type="type" use="use"  
default="default" fixed="fixed"/>
```

### <mark style="background: #00ECFFA6;">Attribute Examples</mark>

If no value is specified in the XML instance the default as specified will be used 
```xml
<xs:attribute name="lang" type="xs:string" default="EN"/>
```  
 
The value “EN” will always appear  
```xml
<xs:attribute name="lang" type="xs:string" fixed="EN"/>
```  

Use of the attribute is mandatory
```XML
<xs:attribute name="lang" type="xs:string" use="required"/>
```  

### <mark style="background: #00ECFFA6;">Example – excerpt from message.xsd</mark>

```xml
<xs:element name="message">  
	<xs:complexType>  
		<xs:sequence>  
			<xs:element name="to" type="xs:string"/>  
			<xs:element name="from" type="xs:string"/>  
			<xs:element name="subject" type="xs:string"/>  
			<xs:element name="body" type="xs:string"/>  
		</xs:sequence>  
		<xs:attribute name="id" type="xs:string" use="required"/>  
	</xs:complexType>
</xs:element>
```

```xml
<message id="9">  
	<to>John</to>  
	<from>Jane</from>  
	<subject>Greeting</subject>  
	<body>Hi John</body>  
</message>
```

### <mark style="background: #00ECFFA6;">Attaching a Schema to a Namespace</mark>

The syntax to associate the schema with a namespace is:
``<prefix:schema xmlns:prefix=http://www.w3.org/2001/XMLSchema>``  

```xml
<?xml version="1.0"?>  
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">  
	<xs:element name="message">  
		<xs:complexType>  
			<xs:sequence>  
				<xs:element name="to" type="xs:string"/>  
				<xs:element name="from" type="xs:string"/>  
				<xs:element name="subject" type="xs:string"/>  
				<xs:element name="body" type="xs:string"/>  
			</xs:sequence>  
			<xs:attribute name="id" type="xs:string" use="required"/>  
		</xs:complexType>  
	</xs:element>  
</xs:schema>
```

### <mark style="background: #00ECFFA6;">Structuring a Schema</mark>  

Schemas can be structured in a number of ways. One structure is called a <mark style="background: #00ECFFA6;">Russian Doll design</mark>. This design involves sets of nested declarations.  

While this design makes it easy to associate the schema with the instance document, it can be confusing and difficult to maintain

![[Pasted image 20260210152000.png]]

Another schema design is a <mark style="background: #00ECFFA6;">Flat Catalog Design</mark>.  

In this design, all element declarations are made globally.  

The structure of the instance document is created by referencing the global element declarations.  

The syntax is: ``<element ref="name">``

![[Pasted image 20260210152045.png]]

### <mark style="background: #00ECFFA6;">Named Schema Elements</mark>

A structure can be named creating a <mark style="background: #00ECFFA6;">named complex type</mark> that can be used elsewhere in the schema.  

This has the advantage of “storing” the structure so it can be applied to the ref attribute.

### <mark style="background: #00ECFFA6;">Named Model Groups</mark>

A <mark style="background: #00ECFFA6;">named model group</mark> is a collection of elements. The syntax is:

```xml
<group name="name">  
	element declarations  
</group>
``` 
 
The element declarations must be enclosed within a sequence, all or choice compositor.

### <mark style="background: #00ECFFA6;">Named Attribute Groups</mark>

Attributes can be placed within <mark style="background: #00ECFFA6;">named attribute groups</mark>. The syntax is:  

```xml
<attributeGroup name=“name”>  
	attribute declarations  
</attributeGroup>
```  

This can be useful if you want to use attributes with several different elements in the schema.

### <mark style="background: #00ECFFA6;">Deriving New Data Types</mark>  

<mark style="background: #00ECFFA6;">Three components are involved in deriving new data types:</mark>
- <mark style="background: #00ECFFA6;">Value space:</mark> the set of values that correspond to the data type.
- <mark style="background: #00ECFFA6;">Lexical space:</mark> the set of textual representations of the value space.
- <mark style="background: #00ECFFA6;">Facets:</mark> the properties of the data type that distinguish one data type from another.

### <mark style="background: #00ECFFA6;">User Derived Data</mark>

<mark style="background: #00ECFFA6;">New data types fall into three categories:</mark>  
- <mark style="background: #00ECFFA6;">List:</mark> a list of values where each list is derived from a base type.
- <mark style="background: #00ECFFA6;">Union:</mark> the combination of two or more data types.
- <mark style="background: #00ECFFA6;">Restriction:</mark> a limit placed on the facet of a base type.

### <mark style="background: #00ECFFA6;">Deriving a Restricted Data Type</mark>

The most common way to derive a new data type is to restrict the properties of a base type. XML Schema provides twelve constraining facets for this purpose.  

```xml
<xs:element name="age">  
	<xs:simpleType>  
		<xs:restriction base="xs:integer">  
			<xs:minInclusive value="0"/>  
			<xs:maxInclusive value="120"/>  
		</xs:restriction>  
	</xs:simpleType>  
</xs:element>
```  

This element is defined to have an integer value between 0 and 120 inclusive

### <mark style="background: #00ECFFA6;">Constraining Facets</mark>

![[Pasted image 20260210152607.png]]

### <mark style="background: #00ECFFA6;">The Patterns Facet</mark>

A pattern can be created with a formatted text string called a <mark style="background: #00ECFFA6;">regular expression</mark> or <mark style="background: #00ECFFA6;">ReGex</mark>.

The basic unit of a regex is called an <mark style="background: #00ECFFA6;">atom</mark>. It can be a single character, a group of characters, or another regex enclosed in parenthesis.  

A <mark style="background: #00ECFFA6;">quantifier</mark> can be added to the atom to specify the number of occurrences for a particular character.

### <mark style="background: #00ECFFA6;">Pattern Quantifiers</mark>

![[Pasted image 20260210152707.png]]

### <mark style="background: #00ECFFA6;">Annotating a Schema</mark>  

It is helpful to include comments about a created schema for other XML developers. An annotation element stores information about the schema. 

<mark style="background: #00ECFFA6;">The syntax is:</mark>
```xml
<annotation>  
	<documentation>  
		documentation comments  
	</documentation>  
	<appinfo>  
		application information  
	</appinfo>  
</annotation>
```

### <mark style="background: #00ECFFA6;">Example – message.xml</mark>

```xml
<?xml version="1.0"?>  
<message xmlns="http://www.1234.com">  
	<to>John</to>  
	<from>Jane</from>  
	<subject>Greeting</subject>  
	<body>Hi John</body>  
</message>
```  

Here we specify a default namespace – all child elements will also belong to this namespace

```xml
<?xml version="1.0"?>  

<message xmlns="http://www.1234.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="message.xsd">  
	<to>John</to>  
	<from>Jane</from>  
	<subject>Greeting</subject>  
	<body>Hi John</body>  
</message>
```

Here, we also specify the <mark style="background: #00ECFFA6;">xsi</mark> namespace prefix and use it to give the XML schema location\name.

### <mark style="background: #00ECFFA6;">Example – message.xsd</mark>

```xml
<?xml version="1.0"?>  
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"  
targetNamespace="http://www.1234.com"  
xmlns="http://www.1234.com"  
elementFormDefault="qualified">  
	<xs:element name="message">  
		<xs:complexType>  
			<xs:sequence>  
				<xs:element name="to" type="xs:string"/>  
				<xs:element name="from" type="xs:string"/>  
				<xs:element name="greeting" type="xs:string"/>  
				<xs:element name="body" type="xs:string"/>  
			</xs:sequence>  
		</xs:complexType>  
	</xs:element>  
</xs:schema>
```