Remember the Node Tree..

![[Pasted image 20260217150555.png]]

### <mark style="background: #00ECFFA6;">Remember XSLT Templates...</mark> 

A <mark style="background: #00ECFFA6;">template</mark> is a collection of elements that define how a particular section of the source document should be transformed in the result document  

The <mark style="background: #00ECFFA6;">root template</mark> sets up the initial code for the result document  

<mark style="background: #00ECFFA6;">To create a template, the syntax is:</mark>
```xml
<xsl:template match=“node">  
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
- <mark style="background: #00ECFFA6;">Example:</mark> format-number(56823.847, “#,##0.00") displays 56,823.85

![[Pasted image 20260217152503.png]]

### <mark style="background: #00ECFFA6;">The xsl:decimal-format Element</mark>

Holds decimal formatting information  

Controls separator characters such as . and ,  

Can be named or default if un-named  

Named decimal format passed as argument to format-number  

```xml
<xsl:decimal-format name=“euro" decimal-separator="," grouping-separator="."/>  

format-number(number, format, “euro")
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
- <mark style="background: #00ECFFA6;">Syntax:</mark> ``<xsl:strip-space elements=“pattern">``  
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

<mark style="background: #00ECFFA6;">Syntax:</mark> ``<xsl:variable name=“name" select=“value"/>``  

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
- Syntax: ``<xsl:with-param name=“name"`` select=“value"/>  
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
- Consider a list/set of item elements where the item has two attributes “qty” for the quantity of the item and “price” for the cost of the item. 
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