### <mark style="background: #FFF503A6;">Marshalling and Unmarshalling</mark>

The information stored in running programs is represented as data structures – e.g., by sets of interconnected objects  

The information in message consists of sequences of bytes.  

Irrespective of the form of communication used, the data structures must be  
- Flattened, converted to a sequence of bytes before transmission  
- Rebuilt on arrival  

<mark style="background: #FFF503A6;">External data representation:</mark> An agreed standard for the representation of data structures and primitive values

### <mark style="background: #FFF503A6;">Sending data over the network</mark>

The individual primitive data items transmitted in messages can be data values of many different types, and not all computers store primitive values such as integers in the same order.  

The representation of floating-point numbers also differs between architectures.  

<mark style="background: #FFF503A6;">Remote machine may have:</mark>
- Different byte ordering  
- Different sizes of integers and other types  
- Different floating point representations  
- Different character sets  
- Alignment requirements

### <mark style="background: #FFF503A6;">Marshalling and Unmarshalling</mark>

<mark style="background: #FFF503A6;">Marshalling</mark> is the process of taking a collection of data items and assembling them into a form suitable for transmission in a message.  

<mark style="background: #FFF503A6;">Marshalling</mark> consists of the translation of structured data items and primitive values into an external data representation.  

<mark style="background: #FFF503A6;">Unmarshalling</mark> is the process of disassembling them on arrival to produce an equivalent collection of data items at the destination.  

Unmarshalling consists of the generation of primitive values from their external data representation and the rebuilding of the data structures.

### <mark style="background: #FFF503A6;">Marshalling and Unmarshalling: Integer ordering</mark>

<mark style="background: #FFF503A6;">There are two variants for the ordering of integers:</mark>
- <mark style="background: #FFF503A6;">Big-endian order:</mark> the most significant byte comes first  
- <mark style="background: #FFF503A6;">Little-endian order:</mark> the most significant byte comes last  

E.g., say that the 32-bit pattern 0x12345678 is stored at address 0x00400000.  
- the most significant byte is 0x12;  
- the least significant is 0x78.  

Some processors may operate in either mode - <mark style="background: #FFF503A6;">Bi-endian</mark>

![[Pasted image 20251023090441.png]]

### <mark style="background: #FFF503A6;">Representing data</mark>

IP (headers) use big endian byte ordering for 16- and 32-bit values  
<mark style="background: #FFF503A6;">Big endian:</mark>
- JVM, 
- OpenRISC, 
- Atmel AVR32,
- IBM z-series, 
- SPARC < V9,
- older PowerPC,
- Motorola 680x0  

<mark style="background: #FFF503A6;">Little endian:</mark>
- Intel/AMD IA-32, x64  

<mark style="background: #FFF503A6;">Bi-endian:</mark>
- PowerPC, SPARC V9, MIPS, IA-64 (Intel Itanium), ARM 

```c
main() {  
	unsigned int num;  
	char *a = (char *)&num;  
	num = 0x55667788;  
	printf("%02x, %02x, %02x, %02x\n", a[0], a[1], a[2], a[3]);  
}
```

<mark style="background: #FFF503A6;">Output on IntelCPU:</mark> 88, 77, 66, 55  

<mark style="background: #FFF503A6;">Output on PowerPC:</mark> 55, 66, 77, 88

### <mark style="background: #FFF503A6;">Marshalling and Unmarshalling: Character Codes</mark>

Another issue is the set of codes used to represent characters.  

<mark style="background: #FFF503A6;">For example:</mark>
- the majority of applications on systems such as UNIX use ASCII character coding, taking <mark style="background: #FFF503A6;">one</mark> byte per character, but  
- the Unicode standard allows for the representation of texts in many different languages and takes <mark style="background: #FFF503A6;">two</mark> bytes per character.

### <mark style="background: #FFF503A6;">External data representation and marshalling</mark>  
The following methods can be used to enable any two computers to exchange binary data values:  
- The values are converted to an agreed external format before transmission and converted to the local form on receipt;  
- If the two computers are known to be the same type, the conversion to external format can be omitted.  

The values are transmitted in the sender’s format, together with an indication of the format used, and the recipient converts the values if necessary.

### <mark style="background: #FFF503A6;">Marshalling vs. serialisation</mark>

<mark style="background: #FFF503A6;">Marshalling</mark> uses serialisation  

<mark style="background: #FFF503A6;">Loosely</mark> synonymous  

<mark style="background: #FFF503A6;">Serialisation:</mark> converting an object data into a sequence of bytes that can be sent over a network  

<mark style="background: #FFF503A6;">Marshalling:</mark>  
- Converting <mark style="background: #FFF503A6;">parameters</mark> into a form that can be reconstructed (unmarshalled) by another process.  
- It may include object ID or other state.

### <mark style="background: #FFF503A6;">External data representation: Approaches</mark>

<mark style="background: #FFF503A6;">Java’s object serialisation</mark>, which is concerned with the flattening and data representation of any single object or tree of objects that may need to be transmitted in a message or stored on a disk. It is for use only by Java.  

<mark style="background: #FFF503A6;">XML (Extensible Markup Language):</mark>
- Defines a textual format for representing structured data.  
- It was originally intended for documents containing textual self-describing structured data. For example, documents accessible on the Web.
- Now also used to represent the data sent in messages exchanged by clients and servers in web services.

### <mark style="background: #FFF503A6;">XML definitions</mark>

XML consists of tags and character data  

XML document is defined by pairs of tags enclosed in angle brackets.  

Person structure with value: {‘Smith’, ‘London’, 1984}  
```xml
<person id="123456789">  
<name>Smith</name>  
<place>London</place>  
<year>1984</year>  
<!-- a comment -->  
</person >  
```  

``<name>`` and ``<place>`` are both tags.

As in HTML, layout can generally be used to improve readability.  

Comments are denoted in the same way as those in HTML.

### <mark style="background: #FFF503A6;">XML: eXtensible Markup Language</mark>

<mark style="background: #FFF503A6;">Pros:</mark>
- Human-readable  
- Human-editable  
- Interleaves structure with text (data) 
- There are binding libraries for lots of languages.  
- A good choice if you want to share data with other applications/projects  

<mark style="background: #FFF503A6;">Cons:</mark>  
- <mark style="background: #FFF503A6;">Verbose:</mark> Transmits more data than needed and space intensive  
- Data conversion always required for numbers 
- <mark style="background: #FFF503A6;">Encoding/decoding:</mark> Can impose a huge performance addition on applications. Longer parsing time  
- Navigating an XML DOM tree is considerably more complicated than navigating simple fields in a class

### <mark style="background: #FFF503A6;">External data representation: other techniques</mark>

<mark style="background: #FFF503A6;">Protocol buffers:</mark>
- Google uses an approach called <mark style="background: #FFF503A6;">protocol buffers</mark> (aka ``protobuf``) to capture representations of both stored and transmitted data 
- offers a common serialization format for Google, including the serialisation of requests and replies in remote invocation  

<mark style="background: #FFF503A6;">JSON (JavaScript Object Notation):</mark> an approach to external data representation [www.json.org].  

<mark style="background: #FFF503A6;">Protocol buffers and JSON:</mark>  
- more lightweight approaches to data representation  
- when compared, for example, to XML.

### <mark style="background: #FFF503A6;">JSON (JavaScript Object Notation)</mark>  

<mark style="background: #FFF503A6;">Features:</mark>
- Lightweight (relatively efficient) data interchange format – Lighter alternative to XML  
- Based on JavaScript  
- Human writeable and readable  
- Self-describing (explicitly typed)  
- Language independent  
- Easy to parse

Derived from JavaScript that is used in web services and other connected applications.  

Browsers can parse JSON into JavaScript objects natively.  

On the server, JSON needs to be parsed and generated using JSON APIs.

### <mark style="background: #FFF503A6;">Uses of JSON</mark> 

Ajax applications  

Configurations  

Databases  

<mark style="background: #FFF503A6;">RESTful web services:</mark>
- All popular websites offer JSON as the data exchange format with their RESTful web services.  
- RESTful web services are web services which are REST based.  
- Representational State Transfer (REST) is an approach in which clients use URLs and the HTTP operations GET, PUT, DELETE and POST to manipulate resources that are represented in XML.  
- The emphasis is on the manipulation of data resources rather than on interfaces.

### <mark style="background: #FFF503A6;">REST API and JSON Example</mark>
  
<mark style="background: #FFF503A6;">Assume:</mark>
- That weather information is posted on a website  
- There is an REST API server that also provides the weather information  

The client sends a request to the server as an HTTP POST Request for weather information it wants in JSON format.  
- Include the POST data in the request's body.  
- You need to provide the Content-Type: application/JSON  

<mark style="background: #FFF503A6;">REST API Server response:</mark> weather is sent to the client in JSON format (Content-Type: application/JSON)

![[Pasted image 20251023092519.png]]

### <mark style="background: #FFF503A6;">JSON in MEAN Stack:</mark>

<mark style="background: #FFF503A6;">MEAN stack:</mark> a JavaScript and JSON based framework for developing web applications  

JSON documents created in Angular.js front can be sent to the Express.js server  
- <mark style="background: #FFF503A6;">MongoDB:</mark> document database  
- <mark style="background: #FFF503A6;">Express(.js):</mark> Node.js web framework  
- <mark style="background: #FFF503A6;">Angular(.js):</mark> a client-side JavaScript framework  
- <mark style="background: #FFF503A6;">Node(.js):</mark> JavaScript web server

![[Pasted image 20251023092752.png]]

### <mark style="background: #FFF503A6;">JSON in MERN Stack:</mark>

<mark style="background: #FFF503A6;">MERN stack:</mark> one variations of the MEAN stack; Angular.js front-end framework is replaced with React.js  

JSON documents created in React.js front can be sent to the Express.js server  
- <mark style="background: #FFF503A6;">MongoDB</mark>  
- <mark style="background: #FFF503A6;">Express(.js)</mark>  
- <mark style="background: #FFF503A6;">React(.js)</mark> - a client-side JavaScript framework  
- <mark style="background: #FFF503A6;">Node(.js)</mark>

![[Pasted image 20251023092852.png]]

### <mark style="background: #FFF503A6;">Node.js</mark>

Uses asynchronous I/O programming  

Event-driven, JavaScript based, single threaded  

<mark style="background: #FFF503A6;">Used for:</mark>
- <mark style="background: #FFF503A6;">Real-time applications (socket.io library):</mark> chat applications, online gaming, live data streaming  
- Microservices  
- Scalable web applications and RESTful APIs.  

https://nodejs.org/en

### <mark style="background: #FFF503A6;">JSON vs XML</mark>

<mark style="background: #FFF503A6;">Similarities:</mark>  
- Both are "self describing" (human readable)  
- Both are hierarchical (values within values)  
- Both can be parsed and used by lots of programming languages  
- Both can be fetched with an ``XMLHttpRequest``  

<mark style="background: #FFF503A6;">Differences:</mark>
- JSON doesn't use end tag
- JSON is shorter  
- JSON is quicker to read and write  
- JSON can use arrays  
- JSON can be parsed by a standard JavaScript function.  

<mark style="background: #FFF503A6;">XML:</mark> has to be parsed with an XML parser.

JSON vs XML  

<mark style="background: #FFF503A6;">JSON:</mark>
```json
{
	"employees":[  
		{ "firstName":"John", "lastName":"Doe" },  
		{ "firstName":"Anna", "lastName":"Smith" },  
		{ "firstName":"Peter", "lastName":"Jones" }  
	]
}
```  

<mark style="background: #FFF503A6;">XML:</mark>
```xml
<employees>  
	<employee>  
		<firstName>John</firstName> <lastName>Doe</lastName>  
	</employee>  
	<employee>  
		<firstName>Anna</firstName> <lastName>Smith</lastName>  
	</employee>  
	<employee>  
		<firstName>Peter</firstName> <lastName>Jones</lastName>  
	</employee>  
</employees>
```

### <mark style="background: #FFF503A6;">JSON vs XML</mark>  

XML is much more difficult to parse than JSON.  

JSON is parsed into a ready-to-use JavaScript object.

### <mark style="background: #FFF503A6;">Protocol Buffers (protobuf)</mark>

A mechanism for serializing structured data  

<mark style="background: #FFF503A6;">Similar to XML:</mark> smaller, faster, and simpler  

<mark style="background: #FFF503A6;">Uses binary format:</mark> rather than text format of XML and JSON  

Is in fact an IDL (Interface Definition Language)

### <mark style="background: #FFF503A6;">Google Protocol Buffers</mark> 

<mark style="background: #FFF503A6;">Properties:</mark>  
- Efficient, binary serialization  
- Support protocol evolution  
- Can add new parameters  
- Order in which parameters are specified is not important  
- Skip non-essential parameters  
- Supports types, which give you compile-time errors  
- Supports quite complex structures  

<mark style="background: #FFF503A6;">Usage:</mark>
- It is a binary encoding format that allows you to specify a <mark style="background: #FFF503A6;">schema</mark> for your data  
- Protocol buffers are used for other things, e.g., serialising data to non-relational databases – their backward-compatible feature make them suitable for long-term storage formats  

As well as being language- and platform-neutral, protocol buffers are also agnostic with respect to the underlying RPC protocol - compatible with many types.

### <mark style="background: #FFF503A6;">Google Protocol Buffers vs XML</mark>

Simpler format compared to XML, faster in operation  

<mark style="background: #FFF503A6;">But, Google infrastructure is a relatively closed system</mark>  
- It does not address interoperability across open systems  
- XML does  

<mark style="background: #FFF503A6;">XML is significantly richer:</mark>
- it generates self-describing messages that contain the data and associated metadata describing the structure of the messages  
- Protocol buffers do not provide this facility directly