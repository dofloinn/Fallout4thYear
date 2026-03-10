### <mark style="background: #00ECFFA6;">EMAIL FROM CIARAN</mark>

**_The lab tests will take place Tuesday and Thursday of week 7 (March 10th/12th) during the normal lab sessions_**. There will be two different tests for each lab group but they will be similar in terms of format, number of questions and content. The test will be a Brightspace Quiz **_(see notes below)_** and will be available for 60 minutes starting 10 minutes after the start of the scheduled lab session. You will need to submit a written response to each of three questions in the quiz.

- You **_must attend the test in the lab_** (for your lab group) - there will be an attendance sign-in sheet.
- You **_must use the lab PCs to do the test_** - no laptops or mobile devices will be allowed.
- You **_must use Notepad++ to do your work_** and copy and paste your answer into the quiz text box provided - _**no other editors/tools or AI plugins are permitted**_.
- You _**may use a browser to access the Brightspace module only**_ (this means you can use any of the module material that has been made available on Brightspace e.g. lecture notes, lab solutions - no other online web access or tools may be used. Please bear this in mind in terms of your preparation.
- The questions are worth 10, 20 and 30 marks respectively. You must submit an answer to one question before you can move on to the next, after which you will not be able to return to that question.
- The questions will include writing sample XML based on an XML Schema, developing an XML Schema based on a written description and writing XSL to transform XML from one format to another. Each question will be independent of the others.

<mark style="background: #00ECFFA6;">XML</mark>
- EXtensible Markup Language  
- XML was designed to carry data  
- XML tags are not predefined - you must define your own tags

### <mark style="background: #00ECFFA6;">XML Example</mark> 

```xml
<message>  
	<to>John</to>  
	<from>Jane</from>  
	<subject>Greeting</subject>  
	<body>Hi John</body>  
</message>
```

<mark style="background: #00ECFFA6;">XML – Naming Rules</mark>
- Names can contain letters, numbers, and other characters  
- Names cannot start with a number or punctuation character  
- Names cannot start with the letters xml (or XML, or Xml, etc.)  
- Names cannot contain spaces

### <mark style="background: #00ECFFA6;">XML Documents</mark> 

<mark style="background: #00ECFFA6;">XML documents consist of three parts:</mark>
- The prolog
- The document body
- The epilog  

The prolog and epilog are optional and provide information about the document itself

### <mark style="background: #00ECFFA6;">Structure of an XML doc</mark>

<mark style="background: #00ECFFA6;">The prolog consists of four parts in the following order:</mark>
- XML declaration
- Miscellaneous statements or comments
- Schema / Document type declaration
- Miscellaneous statements or comments  

This order has to be followed or the parser will generate an error message.  

None of these four parts are required, but it is good form to include them.

### <mark style="background: #00ECFFA6;">XML Declaration</mark>

The XML declaration is always the first line of code in an XML document. It tells the processor what follows is written using XML.

It can also provide any information about how the parser should interpret the code.

<mark style="background: #00ECFFA6;">The complete syntax is:</mark>
```xml
<?xml version="version number" encoding="encoding type" standalone="yes | no" ?>
```  

<mark style="background: #00ECFFA6;">A sample declaration might look like this:</mark>
```xml 
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
```

### <mark style="background: #00ECFFA6;">XML Comments</mark>

Comments or miscellaneous statements go after the declaration. Comments may appear anywhere after the declaration.  

The syntax for comments is: ``<!-- comment text -->`` 

This is the same syntax for HTML comments

### <mark style="background: #00ECFFA6;">XML Elements & Attributes</mark>

Elements are the basic building blocks of XML Documents (files).  

<mark style="background: #00ECFFA6;">XML supports two types of elements:</mark>
- Closed
- Empty/Open

<mark style="background: #00ECFFA6;">Closed:</mark> 
```xml
<element_name>Content</element_name>  

Example: 
<Student>John Doe</Student>  
```  

<mark style="background: #00ECFFA6;">Empty (also called Open):</mark>
```xml
<element_name/>

Example:
<Student/>
```

Element names are <mark style="background: #00ECFFA6;">case sensitive</mark>

<mark style="background: #00ECFFA6;">Elements can be nested, as follows:</mark>
```xml
<message>  
	<to>John</to>  
	<from>Jane</from>  
	<subject>Greeting</subject>  
	<body>Hi John</body>
</message>
```

Nested elements are called <mark style="background: #00ECFFA6;">child elements</mark>.  

Elements must be nested correctly. Child elements must be enclosed within their parent elements.  

All elements must be nested within a single <mark style="background: #00ECFFA6;">document</mark> or <mark style="background: #00ECFFA6;">root element</mark>. There can be only one root element.  

An <mark style="background: #00ECFFA6;">open</mark> or <mark style="background: #00ECFFA6;">empty element</mark> is an element that contains no content. They can be used to mark sections of the document for the XML parser.

An attribute is a feature or characteristic of an element.

Attributes are text strings and must be placed in single or double quotes. The syntax is:  
```xml
<element_name attribute="value"> ... </element_name>  

Example:  
<message id="9">  
	<to>John</to>  
	<from>Jane</from>  
	<subject>Greeting</subject>  
	<body>Hi John</body>
</message>
```

### <mark style="background: #00ECFFA6;">Well Formed XML</mark>

<mark style="background: #00ECFFA6;">Well-Formed XML is:</mark>
- XML text that satisfies the syntactic rules as laid out in the XML specification
- Non well-formed XML will cause errors in applications and parsers that expect strict XML syntax

### <mark style="background: #00ECFFA6;">XML Example for book data</mark>  

```xml
<?xml version="1.0"?>  
<bookstore>  
	<book category="CHILDREN">  
		<title>Harry Potter</title>  
		<author>J K. Rowling</author>  
		<year>2005</year>  
		<price>29.99</price>  
	</book>  
	<book category="FICTION">  
		<title>The Road</title>  
		<author>Cormac McCarthy</author>  
		<year>2006</year>  
		<price>15.99</price>  
	</book>  
	<book category="FICTION">  
		<title>Braywatch</title>  
		<author> Ross O'Carroll-Kelly </author>  
		<year>2020</year>  
		<price>9.99</price>  
	</book>  
</bookstore>
```

### <mark style="background: #00ECFFA6;">Namespaces</mark>

![[Pasted image 20260203151451.png]]

<mark style="background: #00ECFFA6;">Name Collision:</mark> The above figure shows two documents each with a "Name" element

### <mark style="background: #00ECFFA6;">Working with Namespaces</mark> 

<mark style="background: #00ECFFA6;">Name collision</mark> occurs when elements from two or more documents share the same name – i.e. if we combined the two XML documents to the left.  

Name collision is not a problem if you are not concerned with <mark style="background: #00ECFFA6;">validation</mark>.  

The document content only needs to be <mark style="background: #00ECFFA6;">well-formed</mark>.  

However, name collision will keep a document from being validated.  

Use <mark style="background: #00ECFFA6;">Namespaces</mark> to avoid name Collision

![[Pasted image 20260203151643.png]]

### <mark style="background: #00ECFFA6;">Declaring a Namespace</mark>  

A <mark style="background: #00ECFFA6;">namespace</mark> is a defined collection of element and attribute names.  

Namespaces must be declared before they can be used.  

<mark style="background: #00ECFFA6;">Names that belong to the same namespace must be unique</mark>. Elements can share the same name if they reside in different namespaces.

A namespace can be declared in the prolog or as an element attribute. The syntax to declare a namespace in the prolog is:  

```xml
<?xml:namespace ns="URI" prefix="prefix"?>
```

Where <mark style="background: #00ECFFA6;">URI</mark> is a <mark style="background: #00ECFFA6;">Uniform Resource Identifier</mark> that assigns a unique name to the namespace, and <mark style="background: #00ECFFA6;">prefix</mark> is a string of letters that associates each element or attribute in the document with the declared namespace.

### <mark style="background: #00ECFFA6;">Example: Layout of UHOSP.XML Document</mark>

![[Pasted image 20260203151906.png]]
 
This figure shows the structure of a UHOSP.xml file and the collision between the Name element.

### <mark style="background: #00ECFFA6;">Declaring a Namespace</mark>

<mark style="background: #00ECFFA6;">For example:</mark>
```xml
<?xml:namespace ns="http://uhosp/patients/ns" prefix="pat"?>
```  

Declares a namespace with the prefix "pat" and the URI http://uhosp/patients/ns.  

The URI is not a Web address. A URI identifies a physical or an abstract resource (see next slide).

### <mark style="background: #00ECFFA6;">URI and URL</mark>

A physical resource is a resource one can access and work with such as a file, a Web page, or an e-mail address. A URL is one type of URI.

An abstract resource is one that doesn’t have any physical existence, the URI is used as an identifier or an ID.

The URI http://uhosp/patients/ns is simply a text identifier.

### <mark style="background: #00ECFFA6;">Applying a Namespace to an Element</mark>  

Once it has been declared and its URI specified, the namespace is applied to elements and attributes by inserting the namespace prefix before each element name that belongs to the namespace.

```xml
<prefix:element>  
	content  
</prefix:element>
```  

Here, prefix is the namespace prefix and element is the local part of the element name.  

Prefixed names are called qualified names and an element name without a namespace prefix is called an unqualified name.

### <mark style="background: #00ECFFA6;">Declaring a Namespace as an Element Attribute</mark>  

```xml
<pat:Patients xmlns:pat="http://uhosp/patients/ns">  
	<Patient>  
		<Name>Cynthia Dibbs</Name>  
		<ID>MR890-041-02</ID>  
		<DOB>1945-05-22</DOB>  
		<Age>58</Age>  
		<Stage>II</Stage>  
		<Performance Scale="Karnofsky">0.81</Performance>  
	</Patient>  
</pat:Patients>
```  

Qualified names can be added to a document by adding the <mark style="background: #00ECFFA6;">xmlns attribute</mark> to an element.  

<mark style="background: #00ECFFA6;">The syntax is:</mark>  
```xml
xmlns:prefix="URI"
```  

Where prefix and URI are the prefix and URI for the namespace.

### <mark style="background: #00ECFFA6;">Declaring a Namespace as an Element Attribute (cont’d)</mark>  

The example on the previous slide applies the namespace http://uhosp/patients/ns to the Patient element and all of its child elements.  

While the <mark style="background: #00ECFFA6;">"pat"</mark> prefix was only added to the Patients element name, the XML parser considers the other elements part of the Patients namespace and they inherit the namespace.

They are <mark style="background: #00ECFFA6;">unqualified elements</mark>, though, because they lack a namespace prefix. 

Declaring a namespace by adding it as an attribute of the document’s root element places all elements in the namespace.  

All elements are children of the <mark style="background: #00ECFFA6;">root</mark> element.

### <mark style="background: #00ECFFA6;">Declaring a Default Namespace</mark>  

You can specify a default namespace by omitting the prefix in the namespace declaration. 

The element containing the namespace attribute and all of its child elements are assumed to be part of the default namespace.

```xml
<message xmlns="http://www.1234.com">  
	<to>John</to>  
	<from>Jane</from>  
	<subject>Greeting</subject>  
	<body>Hi John</body>  
</message>
```

### <mark style="background: #00ECFFA6;">Using Namespaces with Attributes</mark>  

Attributes, like elements, can become qualified by adding the namespace prefix to the attribute name.

```xml
prefix:attribute="value"
```  

No element may contain two attributes with the same name.  

No element may contain two qualified attribute names with the same local part, pointing to identical namespaces, even if the prefixes are different.

# <mark style="background: #00ECFFA6;">03 XSD</mark>

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

If no value is specified in the XML instance the default as specified will be used.
```xml
<xs:attribute name="lang" type="xs:string" default="EN"/>
```  
 
The value "EN" will always appear:  
```xml
<xs:attribute name="lang" type="xs:string" fixed="EN"/>
```  

Use of the attribute is mandatory:
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

This has the advantage of "storing" the structure so it can be applied to the ref attribute.

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
<attributeGroup name="name">  
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

# <mark style="background: #00ECFFA6;">05 XSL</mark>

### <mark style="background: #00ECFFA6;">XSL</mark>  

<mark style="background: #00ECFFA6;">EXtensible Style sheet Language:</mark>  
- Developed by the W3C (World Wide Web Consortium)  
- Became a recommendation circa 2000  

<mark style="background: #00ECFFA6;">XSLT:</mark>  
- EXtensible Style sheet Language Transformation
- Used to transform XML content from one XML format to another  

<mark style="background: #00ECFFA6;">Xpath:</mark> A declarative language used to locate information from an XML document and perform operations and calculations upon that content

### <mark style="background: #00ECFFA6;">Modern Uses of XSLT</mark>  

<mark style="background: #00ECFFA6;">Where it’s used:</mark>
- Document publishing (DocBook, DITA → HTML/PDF/EPUB)
- Enterprise & legacy system integration 
- XML → HTML rendering (CMS, reports)  
- Schema-driven data normalization & enrichment  
- API / message mediation (ESBs, gateways)  
- XML JSON transformation (XSLT 3.0)  

<mark style="background: #00ECFFA6;">Why it’s still used:</mark>
- Declarative & predictable
- Excellent for tree-to-tree transformations
- Strong schema compatibility 
- Stable, long-term maintainability  

<mark style="background: #00ECFFA6;">Where it’s not:</mark>
- Frontend UI logic
- Lightweight REST APIs 
- General-purpose scripting  

<mark style="background: #00ECFFA6;">XLST is:</mark>
- Boring
- Stable
- Extremely good at what it does

### <mark style="background: #00ECFFA6;">XSLT Style Sheet</mark>

<mark style="background: #00ECFFA6;">An XSLT Style Sheet document:</mark>
- has a file extension .xsl
- is an XML document  
- contains instructions for transforming the contents of an XML document into another format

### <mark style="background: #00ECFFA6;">Transforming an XML Document</mark>  

An XSLT processor takes an XML document and an XSLT style sheet and produces a result document.

![[Pasted image 20260210171652.png]]

### <mark style="background: #00ECFFA6;">Transforming an XML Document</mark>  

<mark style="background: #00ECFFA6;">Server-side transformation:</mark> A client can request an XML document from the server. The server applies the style sheet and returns the resulting document and not the original XML document.

<mark style="background: #00ECFFA6;">Client-side transformation:</mark> A client can request and XML document and a stylesheet from a server and perform the transformation itself.

### <mark style="background: #00ECFFA6;">XSLT Stylesheets</mark>

```xml
<?xml version ="1.0"?>  
<xsl:stylesheet version=1.0 xmlns:xsl= "http://www.w3.org/1999/XSL/Transform">  
	Content of the style sheet  
</xsl:stylesheet>
```

![[Pasted image 20260210171825.png]]

### <mark style="background: #00ECFFA6;">Remember the Node Tree</mark> 

Under XPath, each component in the document is referred to as a node, and the entire structure of the document is a node tree  

<mark style="background: #00ECFFA6;">The node tree consists of the following objects:</mark>
- The XML document itself  
- Comments  
- Processing Instructions  
- Namespaces  
- Elements  
- Element text  
- Element attributes

![[Pasted image 20260210171918.png]]

### <mark style="background: #00ECFFA6;">Document Nodes</mark>  

At the top of the node tree is the <mark style="background: #00ECFFA6;">root node</mark>  

A node that contains other nodes is called a <mark style="background: #00ECFFA6;">parent node</mark>, and the nodes contained in the parent are called <mark style="background: #00ECFFA6;">child nodes</mark>  

Nodes that share a common parent are called <mark style="background: #00ECFFA6;">sibling nodes</mark>  

Any node below another node is referred to as a <mark style="background: #00ECFFA6;">descendant</mark> of that node  

Nodes are distinguished based on the object they refer to in the document  

A node for an element is called an <mark style="background: #00ECFFA6;">element node</mark>  

The node that stores element attributes is called an <mark style="background: #00ECFFA6;">attribute node</mark>

### <mark style="background: #00ECFFA6;">XPath</mark>

<mark style="background: #00ECFFA6;">XPath</mark> provides the syntax to refer to the various nodes in the node tree  

The <mark style="background: #00ECFFA6;">location</mark> of a node can be expressed in either <mark style="background: #00ECFFA6;">absolute</mark> or <mark style="background: #00ECFFA6;">relative</mark> terms  

XPath also does <mark style="background: #00ECFFA6;">data extraction</mark>

### <mark style="background: #00ECFFA6;">Relative Paths</mark> 

With a relative path, the location of the node is indicated relative to a specific node in the tree called the <mark style="background: #00ECFFA6;">context node</mark>

![[Pasted image 20260210172137.png]]

### <mark style="background: #00ECFFA6;">Using XPath to Reference Nodes</mark>  


<mark style="background: #00ECFFA6;">An absolute path:</mark>

Starting from the root node:  
/child1/child2/child3/...  
  
<mark style="background: #00ECFFA6;">A relative path regardless of  
location:</mark> 
- A relative path
- //descendant
  
<mark style="background: #00ECFFA6;">Referencing groups of nodes:</mark>  
- Use the wildcard character (\*)  
- To select all of the nodes from any starting point:
- Example: /portfolio/stock/*  

<mark style="background: #00ECFFA6;">Referencing all nodes:</mark>
- To select every node in the node tree you could use:  
- //*    

<mark style="background: #00ECFFA6;">Referencing Attribute Nodes:</mark>
- The syntax for referencing an attribute node is: @attribute
- where attribute is the name of the attribute 
- Example: /portfolio/stock/name/@symbol  

### <mark style="background: #00ECFFA6;">Text Nodes</mark>  

The text contained in an element node is treated as a text node  

The syntax for selecting a text node is: @text()  

To match all text nodes in the document, use: //text()

### <mark style="background: #00ECFFA6;">Templates</mark>

A <mark style="background: #00ECFFA6;">template</mark> is a collection of elements that define how a particular section of the source document should be transformed in the result document

The <mark style="background: #00ECFFA6;">root template</mark> sets up the initial code for the result document  

### <mark style="background: #00ECFFA6;">The Root Template</mark>

<mark style="background: #00ECFFA6;">Root Template:</mark>
```xsd
<xsl:template match="/">  
XSLT and Literal Result Elements  
</xsl:template>
```  

A template contains two types of content: <mark style="background: #00ECFFA6;">XSLT elements</mark> and <mark style="background: #00ECFFA6;">literal result elements</mark>  
- XSLT elements are those elements that are part of the XSLT namespace and are used to send commands to the XSLT processor
- A literal result element is text sent to the result document, but not acted upon by the XSLT processor
  
```xsd
<xsl:template match="node">  
	XSLT and Literal Result Elements  
</xsl:template>
```

node is either the name of a node from the source document’s node tree, or an XPath expression that points to a node in the tree

### <mark style="background: #00ECFFA6;">Example Stylesheet with Root Template - Outputting HTML literals</mark>

No XSLT Elements

![[Pasted image 20260210172906.png]]

### <mark style="background: #00ECFFA6;">The xsl:output element</mark>

By default, the <mark style="background: #00ECFFA6;">XSLT processor</mark> will render the result document as an <mark style="background: #00ECFFA6;">XML file</mark>  

To control how the processor formats the source document, you can specify the output method using the ``<xsl:output/>`` element

![[Pasted image 20260210173001.png]]

Attributes of the <xsl:output/> Element

### <mark style="background: #00ECFFA6;">Transforming a Document</mark>

Most XSLT processors provide the capability to create the result document as a separate file  

An XSLT processor could transform an XML file into a HTML file.  

A browser with a <mark style="background: #00ECFFA6;">built-in</mark> XSLT processor allows you to view the result document

### <mark style="background: #00ECFFA6;">Example: Transforming an XML Document into a HTML Document </mark>

XSLT can be used to transform XML into many different types of documents  

From an <mark style="background: #00ECFFA6;">Enterprise</mark> perspective, this is most useful when <mark style="background: #00ECFFA6;">transforming XML from one schema to another schema</mark> (or any other data format).  

To explore some of its capabilities however, we’ll look at some examples of transforming XML into HTML so that a browser can display it.  

The XSLT processor adds one extra line to the document that provides additional information to the browser about the content of the document and its encoding

### <mark style="background: #00ECFFA6;">Back to our Stylesheet - Insert a Node value</mark> 

<mark style="background: #00ECFFA6;">To insert a node’s value into the result document, the syntax is:</mark>
- ``<xsl:value-of select="XPath Expression" />``
- where XPath Expression is an expression that identifies the node from the source document’s node tree  

If the node contains child elements in addition to text content, the text in those child nodes appears as well

![[Pasted image 20260210173216.png]]

### <mark style="background: #00ECFFA6;">Processing a Batch of Nodes</mark>

To process a batch of nodes, the syntax is:  

```xml
<xsl:for-each select="XPath Expression">  
	XSLT and Literal Elements  
</xsl:for-each>
```  

where XPath Expression is an expression that defines the group of nodes to which the XSLT and literal result elements are applied

![[Pasted image 20260210173336.png]]

# <mark style="background: #00ECFFA6;">06 XSL Transformations</mark>

Remember the Node Tree..

![[Pasted image 20260217150555.png]]

### <mark style="background: #00ECFFA6;">Remember XSLT Templates...</mark> 

A <mark style="background: #00ECFFA6;">template</mark> is a collection of elements that define how a particular section of the source document should be transformed in the result document  

The <mark style="background: #00ECFFA6;">root template</mark> sets up the initial code for the result document  

<mark style="background: #00ECFFA6;">To create a template, the syntax is:</mark>
```xml
<xsl:template match="node">  
XSLT and Literal Result Elements  
</xsl:template>
```  

where <mark style="background: #00ECFFA6;">node</mark> is either the name of a node from the source document’s node tree, or an XPath expression that points to a node in the tree

### <mark style="background: #00ECFFA6;">Applying a Template to a Source Document</mark>

Use the following XSLT element  
```xml
<xsl:apply-templates select="XPath Expression" />
```  
where XPath Expression indicates the node template to be applied  
  
The ``<xsl:for-each>`` block has been replaced with ``<xsl:apply-templates>``

<mark style="background: #00ECFFA6;">This is the template that will be applied:</mark>
![[Pasted image 20260217150909.png]]

### <mark style="background: #00ECFFA6;">Sorting Nodes</mark>

By default, nodes are processed in document order, by their appearance in the document

To specify a different order, XSLT provides the ``<xsl:sort>`` element

This element can be used with either the ``<xsl:apply-templates>`` or the ``<xsl:for-each>`` element

The ``<xsl:sort>`` element contains several attributes to control how the XSLT process sorts the nodes in the source document

The <mark style="background: #00ECFFA6;">select</mark> attribute determines the criteria under which the context node is sorted  

The <mark style="background: #00ECFFA6;">data-type</mark> attribute indicates the type of data (number, text)  

The <mark style="background: #00ECFFA6;">order</mark> attribute indicates the direction of the sorting (ascending or descending)

![[Pasted image 20260217151145.png]]

### <mark style="background: #00ECFFA6;">Conditionally Creating Nodes</mark>

<mark style="background: #00ECFFA6;">XSLT supports two kinds of conditional elements:</mark>
- ``<xsl:if>``
- ``<xsl:choose>``

To apply a format only if a particular condition is met , use the ``<xsl:if>`` element

To test for multiple conditions and display different outcomes, use the ``<xsl:choose>`` element

![[Pasted image 20260217151322.png]]

### <mark style="background: #00ECFFA6;">Comparison Operators & Functions</mark>

![[Pasted image 20260217151343.png]]

### <mark style="background: #00ECFFA6;">Predicates</mark>

<mark style="background: #00ECFFA6;">Predicates</mark> are XPath expressions that test for a condition and create subsets of nodes that fulfill that condition  

The predicate can also indicate the position of the node in the node tree  

To select a specific position in the source document, use the ``position()`` function combined with any XPath expression

### <mark style="background: #00ECFFA6;">Predicate Example in a Root Template</mark>

![[Pasted image 20260217151435.png]]

### <mark style="background: #00ECFFA6;">Creating Elements & Attributes</mark>

To create an element, XSLT uses the ``<xsl:element>`` tag  

The ``name attribute`` assigns a name to the element  

The ``namespace attribute`` provides a namespace  

The ``use-attribute-sets`` provides a list of attribute-sets

### <mark style="background: #00ECFFA6;">Creating an Element</mark>

To create the ``<a>`` element in the result document, use the ``<xsl:element>`` tag

![[Pasted image 20260217151618.png]]

![[Pasted image 20260217151632.png]]

### <mark style="background: #00ECFFA6;">Creating an Attribute</mark>

Attributes are created in XSLT by using the ``<xsl:attribute>`` element  

The <mark style="background: #00ECFFA6;">name attribute</mark> specifies the name of the attribute  

The <mark style="background: #00ECFFA6;">namespace</mark> attribute indicates the namespace

To add the ``href`` attribute to the ``<a>`` tag, use the ``<xsl:attribute>`` element

![[Pasted image 20260217151741.png]]

### <mark style="background: #00ECFFA6;">Creating Comments & Processing Instructions</mark>

<mark style="background: #00ECFFA6;">Comment</mark> The ``<xsl:comment>`` element creates the comment

<mark style="background: #00ECFFA6;">Processing Instruction:</mark> You can create a processing instruction by using the ``<xsl:processing-instruction>`` element

<mark style="background: #00ECFFA6;">Use</mark> e.g. If you wanted to add a processing instruction to attach the result document to the style.css sheet, use the following  code:

![[Pasted image 20260217151905.png]]

### <mark style="background: #00ECFFA6;">Summary so far:</mark>

Extensible Style sheet Language (or XSL), from an Enterprise integration perspective is composed of <mark style="background: #00ECFFA6;">XSLT</mark> and <mark style="background: #00ECFFA6;">XPath</mark>  

<mark style="background: #00ECFFA6;">XPath</mark> language is used to reference a node  

<mark style="background: #00ECFFA6;">Templates</mark> are used to format sections of the XML document and transform XML data into a variety of formats  

Nodes can be <mark style="background: #00ECFFA6;">sorted</mark> in either alphabetical or numerical order  

<mark style="background: #00ECFFA6;">Comparison</mark> elements allow changing the contents of the result document based on the values of the nodes in the source document  

<mark style="background: #00ECFFA6;">Predicates</mark> are used to handle subsets of the source document’s node tree  

You can <mark style="background: #00ECFFA6;">insert new elements and attributes</mark> in the transformed document

### <mark style="background: #00ECFFA6;">The xsl:number Element </mark> 

<mark style="background: #00ECFFA6;">Attributes:</mark>
- <mark style="background: #00ECFFA6;">value</mark>=expression: any XPath expression that evaluates to a number  
- <mark style="background: #00ECFFA6;">count</mark>=pattern: specifies which nodes to count  
- <mark style="background: #00ECFFA6;">format</mark>=pattern: pattern indicates number format  
- <mark style="background: #00ECFFA6;">grouping-size, grouping-separator:</mark> indicate how digits are grouped and separator character  

Used to determine the integer <mark style="background: #00ECFFA6;">position</mark> of the current node in the source.

### <mark style="background: #00ECFFA6;">XPath Functions</mark> 

Used to <mark style="background: #00ECFFA6;">calculate numerical values</mark> or <mark style="background: #00ECFFA6;">manipulate text strings</mark>  

The ``position()`` XPath function can be used along with the ``<xsl:number>`` element to output the numeric position of the current node in the result document

```xml
<xsl:for-each select="£playlist/track">  
	<xsl:number value="position()" format="1" />  
	<xsl:value-of select="title" /><br />  
</xsl:for-each>
```

### <mark style="background: #00ECFFA6;">XPath Numeric Functions</mark>

![[Pasted image 20260217152319.png]]

### <mark style="background: #00ECFFA6;">XPath Text Functions</mark>

![[Pasted image 20260217152338.png]]

### <mark style="background: #00ECFFA6;">XPath Mathematical Operators</mark>

![[Pasted image 20260217152357.png]]

<mark style="background: #00ECFFA6;">Formatting Numbers - Number Format Symbols:</mark>
- <mark style="background: #00ECFFA6;">XPath function:</mark> format-number  
- <mark style="background: #00ECFFA6;">Syntax:</mark> format-number(value, format) 
- <mark style="background: #00ECFFA6;">Example:</mark> format-number(56823.847, "#,##0.00") displays 56,823.85

![[Pasted image 20260217152503.png]]

### <mark style="background: #00ECFFA6;">The xsl:decimal-format Element</mark>

Holds decimal formatting information  

Controls separator characters such as . and ,  

Can be named or default if un-named  

Named decimal format passed as argument to format-number  

```xml
<xsl:decimal-format name="euro" decimal-separator="," grouping-separator="."/>  

format-number(number, format, "euro")
```

<mark style="background: #00ECFFA6;">Attributes:</mark>
![[Pasted image 20260217152629.png]]

### <mark style="background: #00ECFFA6;">Inserting Attribute Values</mark>

E.g. XSLT expression inserted into HTML attribute value

<mark style="background: #00ECFFA6;">Syntax:</mark> ``<tag attribute="{XSLT expression}">``  

<mark style="background: #00ECFFA6;">Example:</mark> ``<td rowspan="{count(../../Items/Item)}">``

### <mark style="background: #00ECFFA6;">Text Nodes & White Space</mark>  

<mark style="background: #00ECFFA6;">White space:</mark>  
- Space devoid of any printable character 
- Space, tab, new line, carriage return  

Adjacent <xsl:value-of> elements will have results combined to eliminate white space  

``<xsl:text>`` can be used to create white space:  
- <mark style="background: #00ECFFA6;">Syntax:</mark> ``<xsl:text>Text</xsl:text>``
- Can only contain literal text

### <mark style="background: #00ECFFA6;">Working with White Space</mark>  

<mark style="background: #00ECFFA6;">White Space Entities:</mark>
- Space - ``&#x20``;  
- Tab - ``&#x9``;  
- New line - ``&#xA``;  
- Carriage return - ``&#xD``;  

<mark style="background: #00ECFFA6;">Stripping space:</mark> 
- Remove text nodes from the result document that contain only white space  
- <mark style="background: #00ECFFA6;">Syntax:</mark> ``<xsl:strip-space elements="pattern">``  
- Use * as pattern to match all nodes  

<mark style="background: #00ECFFA6;">Preserving space:</mark>  
- Make sure that text nodes that contain only white space are not deleted  
- <mark style="background: #00ECFFA6;">Syntax:</mark> ``<xsl:preserve-space elements="pattern">``  
- Use * as pattern to match all nodes  

<mark style="background: #00ECFFA6;">Normalise space:</mark>  
- Remove leading and trailing spaces  
- <mark style="background: #00ECFFA6;">Syntax:</mark> normalize-space(text)

### <mark style="background: #00ECFFA6;">Variables</mark>

User-defined name that stores a particular value or object 

<mark style="background: #00ECFFA6;">Types of Variables:</mark> 
- <mark style="background: #00ECFFA6;">XPath:</mark>  
	- number  
	- text string  
	- boolean  
	- node set  
- <mark style="background: #00ECFFA6;">Non XPath:</mark> result tree fragment

### <mark style="background: #00ECFFA6;">Using Variables</mark>

<mark style="background: #00ECFFA6;">Syntax:</mark> ``<xsl:variable name="name" select="value"/>``  

<mark style="background: #00ECFFA6;">Example:</mark> ``<xsl:variable name="Months" select="12" />``  

Names are case-sensitive  

Value only set once upon declaration  

Enclose text strings in single-quotes  

Value can be an XPath expression  

<mark style="background: #00ECFFA6;">Boolean type:</mark> Set value to expression that is true or false  

<mark style="background: #00ECFFA6;">Result tree fragment type - Syntax:</mark>  
```xml
<xsl:variable name="Logo">  
	<img src="logo.gif" width="300" height="100"/> 
</xsl:variable>
```

### <mark style="background: #00ECFFA6;">To Reference a Variable</mark>

<mark style="background: #00ECFFA6;">Syntax:</mark> ``$variable-name`` 

<mark style="background: #00ECFFA6;">Example:</mark> ``$Months`` 

<mark style="background: #00ECFFA6;">xsl:copy:</mark>
- <mark style="background: #00ECFFA6;">Syntax:</mark> ``<xsl:copy/>`` 
- <mark style="background: #00ECFFA6;">Shallow copy:</mark> only node itself is copied  

<mark style="background: #00ECFFA6;">xsl:copy-of:</mark>
- <mark style="background: #00ECFFA6;">Syntax:</mark> ``<xsl:copy-of select="expression"/>``  
- <mark style="background: #00ECFFA6;">Deep copy:</mark> node and descendants are copied

### <mark style="background: #00ECFFA6;">Variable Scope</mark> 

<mark style="background: #00ECFFA6;">Global:</mark>
- Can be referenced from anywhere within the style sheet  
- Must be declared at the <mark style="background: #00ECFFA6;">top level of the style sheet</mark>, as a direct child of the ``<xsl:stylesheet>`` element 
- Must have a unique variable name  

<mark style="background: #00ECFFA6;">Local:</mark>
- Referenced <mark style="background: #00ECFFA6;">only within a template</mark> 
- Can share name with other local or global variable

### <mark style="background: #00ECFFA6;">Parameters</mark>

Similar to variables, but:  
- Value can be changed after it is declared 
- Can be set outside of scope  

<mark style="background: #00ECFFA6;">Syntax:</mark>
```xml
<xsl:param name="name" select="value"/>
```  

<mark style="background: #00ECFFA6;">Example:</mark>  
```xml
<xsl:param name="Filter" select="'C103'" />
```  

<mark style="background: #00ECFFA6;">To reference:</mark> ``$param-name``

<mark style="background: #00ECFFA6;">Setting Parameter Values Externally:</mark>
- Depends on XSLT processor 
- Some work by appending parameter value to url 
- Command line processors allow external parameter setting: MSXML and Saxon

### <mark style="background: #00ECFFA6;">Template Parameters</mark>  

Local in scope  

Created inside <xsl:template> element  

<mark style="background: #00ECFFA6;">To pass a parameter to template:</mark> 
- place ``<xsl:with-param>`` element in ``<xsl:apply-templates>`` element  
- Syntax: ``<xsl:with-param name="name"`` select="value"/>  
- No error if calling param name does not match template param name  

```xml
<xsl:template name="print_grade">  
	<xsl:param name="target_grade" />  
	<xsl:param name="list" />  
		...  
		<h1><xsl:value-of select="$target_grade" /></h1>  
		....  
</xsl:template>
```

### <mark style="background: #00ECFFA6;">Using Recursion in XSL</mark>  

Let’s have a look at recursion in functional programming - it’s a function that calls itself

![[Pasted image 20260217154045.png]]

### <mark style="background: #00ECFFA6;">Writing a Recursive Template</mark>

Templates that call themselves, usually passing along a new parameter value with each call  

Needs to have a stopping condition  

Expressed in an if statement or a choose statement  

If missing, will call itself without end  
```xml
<xsl:template name="template_name">  
	<xsl:param name="param_name" select="default_value" />  
	...  
	<xsl:if test="no_stopping_condition">  
	...  
	<xsl:call-template name="template_name">  
	<xsl:with-param name="param_name" select="new_value" />  
	</xsl:call-template>  
	...  
	</xsl:if>  
</xsl:template>
```

```xml
<xsl:template name="template_name">  
	<xsl:param name="param_name" select="default_value" />  
	...  
	<xsl:choose>  
		<xsl:when test="stopping_condition">  
		...  
		</xsl:when>  
		<xsl:otherwise>  
		...  
			<xsl:call-template name="template_name">  
			<xsl:with-param name="param_name" select="new_value" />  
			</xsl:call-template>  
			...  
		</xsl:otherwise>  
	</xsl:choose>  
</xsl:template>
```

<mark style="background: #00ECFFA6;">Example:</mark>
- Consider a list/set of item elements where the item has two attributes "qty" for the quantity of the item and "price" for the cost of the item. 
- Below is a template that will calculate the total cost for all the item elements...

![[Pasted image 20260217154310.png]]


### <mark style="background: #00ECFFA6;">Executing XML validation and Transformation in Java</mark>

<mark style="background: #00ECFFA6;">So far we’ve used other applications to do the work:</mark>
- XML parsing/viewing using a browser (we did do some simple Java for this also however)
- XML validation using Notepad++ / Online Tools 
- XML transformation using Notepad++ / Online Tools

Next we will consider these functions from a programming perspective  

In Java – we can load, parse, validate and transform XML  

To do this we require code libraries to help us achieve it  

<mark style="background: #00ECFFA6;">Java API:</mark> Java API / Architecture for XML Processing (JAXP)  

Java comes with built-in parser and transformer classes to help with this

<mark style="background: #00ECFFA6;">Java code to load an XML File:</mark>
![[Pasted image 20260217154455.png]]

<mark style="background: #00ECFFA6;">Java code to load an XML Schema File  :</mark>
![[Pasted image 20260217154510.png]]

<mark style="background: #00ECFFA6;">Java code to Validate an XML File:</mark>
![[Pasted image 20260217154526.png]]

### <mark style="background: #00ECFFA6;">Final Code to load and validate an XML file</mark>
![[Pasted image 20260217154544.png]]

### <mark style="background: #00ECFFA6;">Java Code to transform an XML file using an XSLT Stylesheet (XSL file)</mark>

![[Pasted image 20260217154608.png]]