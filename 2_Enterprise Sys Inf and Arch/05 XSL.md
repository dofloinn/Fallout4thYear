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

<mark style="background: #00ECFFA6;">Server-side transformation:</mark> A client can request an XML document from the server. The server applies the style sheet and returns the resulting document and not the original XML document  

<mark style="background: #00ECFFA6;">Client-side transformation:</mark> A client can request and XML document and a stylesheet from a server and perform the transformation itself

### <mark style="background: #00ECFFA6;">XSLT Stylesheets</mark>

```xml
<?xml version =“1.0”?>  
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

Transforming a Document  

Most XSLT processors provide the capability to create the result document as a separate file  

An XSLT processor could transform an XML file into a HTML file.  

A browser with a <mark style="background: #00ECFFA6;">built-in</mark> XSLT processor allows you to view the result document

### <mark style="background: #00ECFFA6;">Example:</mark>

Transforming an XML Document into a HTML Document XSLT can be used to transform XML into many different types of documents  

From an <mark style="background: #00ECFFA6;">Enterprise</mark> perspective, this is most useful when <mark style="background: #00ECFFA6;">transforming XML from one schema to another schema</mark> (or any other data format).  

To explore some of its capabilities however, we’ll look at some examples of transforming XML into HTML so that a browser can display it.  

The XSLT processor adds one extra line to the document that provides additional information to the browser about the content of the document and its encoding

### <mark style="background: #00ECFFA6;">Back to our Stylesheet - Insert a Node value</mark> 

To insert a node’s value into the result document, the syntax is:  
- ``<xsl:value-of select=“XPath Expression” />``
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