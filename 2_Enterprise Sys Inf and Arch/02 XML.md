### <mark style="background: #00ECFFA6;">XML</mark>

EXtensible Markup Language  

XML was designed to carry data  

XML tags are not predefined - you must define your own tags

### <mark style="background: #00ECFFA6;">XML Example</mark> 

```xml
<message>  
<to>John</to>  
<from>Jane</from>  
<subject>Greeting</subject>  
<body>Hi John</body>  
</message>
```

### <mark style="background: #00ECFFA6;">XML – Naming Rules</mark>

Names can contain letters, numbers, and other characters  

Names cannot start with a number or punctuation character  

Names cannot start with the letters xml (or XML, or Xml, etc.)  

Names cannot contain spaces

### <mark style="background: #00ECFFA6;">XML Documents</mark> 

<mark style="background: #00ECFFA6;">XML documents consist of three parts:</mark>
- The prolog
- The document body
- The epilog  

The prolog and epilog are optional and provide information about the document itself

### <mark style="background: #00ECFFA6;">Structure of an XML doc</mark>

The prolog consists of four parts in the following order:  
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
<?xml version=“version number” encoding=“encoding type” standalone=“yes | no” ?>
```  

<mark style="background: #00ECFFA6;">A sample declaration might look like this:</mark>
```xml 
<?xml version=“1.0” encoding=“UTF-8” standalone=“yes” ?>
```

### <mark style="background: #00ECFFA6;">XML Comments</mark>

Comments or miscellaneous statements go after the declaration. Comments may appear anywhere after the declaration.  

The syntax for comments is: <!- - comment text - -> 

This is the same syntax for HTML comments

### <mark style="background: #00ECFFA6;">XML Elements & Attributes</mark>

Elements are the basic building blocks of XML Documents (files).  

XML supports two types of elements:  

<mark style="background: #00ECFFA6;">Closed:</mark> 
```xml
<element_name>Content</element_name>  
Example: <Student>John Doe</Student>  
```  

<mark style="background: #00ECFFA6;">Empty (also called Open):</mark>
```
<element_name/>
Example: <Student/>
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
<element_name attribute=“value”> ... </element_name>  

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

<mark style="background: #00ECFFA6;">Name Collision:</mark> The above figure shows two documents each with a “Name” element

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
<?xml:namespace ns=“URI” prefix=“prefix”?>
```

Where <mark style="background: #00ECFFA6;">URI</mark> is a <mark style="background: #00ECFFA6;">Uniform Resource Identifier</mark> that assigns a unique name to the namespace, and <mark style="background: #00ECFFA6;">prefix</mark> is a string of letters that associates each element or attribute in the document with the declared namespace.

### <mark style="background: #00ECFFA6;">Example: Layout of UHOSP.XML Document</mark>

![[Pasted image 20260203151906.png]]
 
This figure shows the structure of a UHOSP.xml file and the collision between the Name element.

### <mark style="background: #00ECFFA6;">Declaring a Namespace</mark>

<mark style="background: #00ECFFA6;">For example:</mark>
```xml
<?xml:namespace ns=“http://uhosp/patients/ns” prefix=“pat”?>
```  

Declares a namespace with the prefix “pat” and the URI http://uhosp/patients/ns.  

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

While the <mark style="background: #00ECFFA6;">“pat”</mark> prefix was only added to the Patients element name, the XML parser considers the other elements part of the Patients namespace and they inherit the namespace.  

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

