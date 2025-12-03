Set of protocols by which services can be published, discovered, and used in a technology neutral form - Language & architecture independent  

Provide a basis where a client program in one organisation may interact with a server in another organisation without human supervision.  

Based on the ability to use an HTTP request to cause the execution of a program. A result is produced by called program and then returned.

### <mark style="background: #FFF503A6;">Web Services</mark>

<mark style="background: #FFF503A6;">General principles:</mark>  
- Payloads are text (XML or JSON) Technology-neutral 
- HTTP used for transport  
- Use existing infrastructure: web servers, firewalls, load-balancers  

<mark style="background: #FFF503A6;">Web server:</mark> Provides a basic HTPP service  

<mark style="background: #FFF503A6;">Web service:</mark> Provides a service based on the operation defined in its interface.

### <mark style="background: #FFF503A6;">Service Oriented Architecture (SOA) and Microservices</mark>  

Applications will typically invoke multiple web services, and designing the ways of interacting with these services led to the  
development of  
- Service Oriented Architecture (SOA), and  
- Microservices  

They allow building applications as the integration of services - each service having a well-defined interface.

### <mark style="background: #FFF503A6;">Benefits of SOA</mark>

<mark style="background: #FFF503A6;">Autonomous modules:</mark>
- Each module does one thing well  
- Supports reuse of modules across applications  

<mark style="background: #FFF503A6;">Loose coupling:</mark>
- <mark style="background: #FFF503A6;">Requires minimal knowledge:</mark> don’t need to know implementation
- <mark style="background: #FFF503A6;">Migration:</mark> Services can be located and relocated on any servers 
- <mark style="background: #FFF503A6;">Scalability:</mark> new services can be added/removed on demand... and on different servers - or load balanced  
- <mark style="background: #FFF503A6;">Updates:</mark> Individual services can be replaced without interruption

### <mark style="background: #FFF503A6;">Microservices</mark>

<mark style="background: #FFF503A6;">Microservices architecture:</mark>
- Emphasizes modularity and scalability
- Builds on top of the principles of SOA 
- microservices decompose a software application into smaller, independently operable services tailored for a specific function. 

<mark style="background: #FFF503A6;">Use lightweight protocols:</mark>
- REST over HTTP/HTTPS 
- JSON is a favoured data format for messaging.  
- more fine-grained and decentralized approach

### <mark style="background: #FFF503A6;">General Principles of Web Services</mark>  

<mark style="background: #FFF503A6;">Platform neutral:</mark>
- Messages don’t rely on the underlying language, OS, or hardware  
- Standardised protocols & data formats  
- Payloads are text (XML or JSON)  

<mark style="background: #FFF503A6;">Message-oriented:</mark> Communicate by exchanging messages  

<mark style="background: #FFF503A6;">HTTP often used for transport:</mark> Use existing infrastructure: web servers, authentication, encryption, firewalls, load-balancers

### <mark style="background: #FFF503A6;">Web Services</mark>

Provide a standard way to package any business logic (i.e. a service) and make it accessible to any other service (e.g. a business partner’s systems) via the web.  

<mark style="background: #FFF503A6;">A web service:</mark> a piece of business logic, located somewhere on the Internet, this is accessible through standard Internet protocols (e.g. HTTP)  

Can access and encapsulate other services to perform its function

### <mark style="background: #FFF503A6;">Web services infrastructure and components</mark>

Web services and applications may be built on top other web services.  

Some particular web services provide general functionality required for the operation of a large number of other web services:  
- Directory services,  
- Security  

A web service generally provides a service <mark style="background: #FFF503A6;">description</mark>, which includes an interface definition and other information, such as the server’s URL

### <mark style="background: #FFF503A6;">Properties of Web Services</mark>

<mark style="background: #FFF503A6;">Combination of web services:</mark> The provision of a service interface allows its operations to be combined with those of other services to provide new functionality  

<mark style="background: #FFF503A6;">Communication patterns:</mark>
- <mark style="background: #FFF503A6;">Synchronous</mark> request-reply pattern of communication with their clients, or  
- They communicate by means of <mark style="background: #FFF503A6;">asynchronous</mark> messages  
- An <mark style="background: #FFF503A6;">event-style pattern</mark> can also be used - e.g., clients of a directory service may register for events of interest - and they will be notified whenever certain events occur. For example, an event could be the arrival or departure of service

<mark style="background: #FFF503A6;">No particular programming model:</mark>
- Designed to support distributed computing in the Internet, in which many different programming languages are used.  
- They are independent of any particular programming paradigm.  

The main differences from the distributed object model are that remote objects can not be instantiated - a web service consists of a single remote object and therefore:  
- Garbage collection is irrelevant;  
- Remote object references are irrelevant.

### <mark style="background: #FFF503A6;">Properties of Web Services</mark>

<mark style="background: #FFF503A6;">Service references:</mark> Each web service Has a URI, which clients use to refer to it. The URL is the most frequently used form of URI.  

<mark style="background: #FFF503A6;">Activation of services:</mark>
- A web service will be accessed via the computer whose domain name is included in its current URL. 
- That computer may run the web service itself or it may run it on another server computer.  
- The URL is a persistent reference - meaning that it will continue to refer to the service for as long as that server exists.

### <mark style="background: #FFF503A6;">Transparency</mark>

Middleware platform protects the programmer from the details of data representation and marshalling. None of these things is provided as part of an infrastructure or middleware platform for web services.  

At the simplest level, clients and servers may read and write their messages directly in SOAP, using XML.  

The details of SOAP and XML are generally hidden by a local API in a programming language such as Java, Perl, Python or C++.

### <mark style="background: #FFF503A6;">Web Services vs. Distributed Objects</mark>

<table>
	<tr>
		<th>Web Services</th>
		<th>Distributed Objects</th>
	</tr>
	<tr>
		<td>Document Oriented
		- Exchange documents</td>  
		<td>Object Oriented
		- Instantiate remote objects  
		- Request operations on a remote object  
		- Receive result  
		- ...  
		- Eventually release the object</td>  
	</tr>
	<tr>
		<td>Document design is the key. Interfaces are just a way to pass documents</td>  
		<td>Interface design is the key. Data structures just package data</td>  
	</tr>
	<tr>
		<td>Stateless computing. State is contained within the  
documents that are exchanged (e.g., customer ID)</td>  
		<td>Stateful computing. Remote object maintains state</td>  
	</tr>
</table>

### <mark style="background: #FFF503A6;">Web Services types</mark>

<mark style="background: #FFF503A6;">Main types of web services</mark>  
- SOAP web services  
- SOAP is a protocol  
- RESTful web services  
- REST an architectural style not a protocol.


### <mark style="background: #FFF503A6;">SOAP Infrastructure and components</mark>

<mark style="background: #FFF503A6;">Typical communication architecture in which web services operate:  </mark>
- A web service is identified by URI and can be accessed by clients using messages formatted in XML.  
- Simple Object Access Protocol (SOAP) is used to encapsulate these messages and transmit them over HTTP or another protocol, e.g. TCP or SMTP.  
- A web service deploys service descriptions to specify the interface and other aspects of the service for the benefit of potential clients

![[Pasted image 20251203201835.png]]

### <mark style="background: #FFF503A6;">SOAP</mark>

Designed to enable both client-server and asynchronous interaction over the Internet.  

<mark style="background: #FFF503A6;">It defines a scheme for using XML to represent:</mark>  
- the contents of request and reply messages  
- a scheme for the communication of documents.  

Objects marshalled and unmarshalled to SOAP-format XML  

<mark style="background: #FFF503A6;">SOAP is a messaging format:</mark>
- No garbage collection or object references  
- Does not define transport

### <mark style="background: #FFF503A6;">SOAP Web Services Architecture</mark>

A web service is identified by URI and can be accessed by clients using messages formatted in XML.  

SOAP is used to encapsulate these messages and transmit them over HTTP or another protocol, e.g. TCP or SMTP.  

A web service deploys service descriptions to specify the interface and other aspects of the service for the benefit of potential clients

![[Pasted image 20251203202134.png]]

### <mark style="background: #FFF503A6;">Technologies</mark>

Many implementations/frameworks for web services but common technologies.

<mark style="background: #FFF503A6;">SOAP (Simple Object Access Protocol):</mark>
- provides a way to communicate between applications running on different operating systems, with different technologies and programming languages
- XML based protocol (on HTTP)  

<mark style="background: #FFF503A6;">WSDL (Web Service Description Language):</mark>
- machine-readable descriptions of Web services interfaces.  
- XML based  

<mark style="background: #FFF503A6;">UDDI (Universal Description, Discovery and Integration):</mark> UDDI provides an interface for publishing and updating information about web services. 

<mark style="background: #FFF503A6;">The Uniform Resource Identifier (URI):</mark>
- a general resource identifier, whose value may be either a URL or a URN.  
- Uniform Resource Names (URNs) are location independent they rely on a lookup service to map them onto the URLs of resources.

### <mark style="background: #FFF503A6;">Technologies in the Process</mark>
1. client queries UDDI registry for a service - by name, category, identifier or some other criteria stored by registry  
2. client then obtains information about location of WSDL doc from UDDI registry  
3. WSDL doc contains info about how to contact service and format of request msg  
4. client creates SOAP msg in accordance with WSDL and sends request to host where service is  
5. service responds with a SOAP msg to indicate results of service request

![[Pasted image 20251203202621.png]]

### <mark style="background: #FFF503A6;">WSDL Service Descriptions</mark>

Interface definitions needed to allow clients to communicate with services - All the information required by the client  

Java Remote Interfaces ~= IDL ~= WSDL  

<mark style="background: #FFF503A6;">WSDL (Web Services Description Language):</mark>
- Describe operations, a set of services  
- Name, operations, parameters, where to send requests  
- Provide URI, Identify Transport Protocol  
- Organizations exchange WSDL documents  

<mark style="background: #FFF503A6;">Describes either:</mark>
- Types of messages it can receive  
- Types of operations it can perform

![[Pasted image 20251203202734.png]]

### <mark style="background: #FFF503A6;">SOAP - the future?</mark>

<mark style="background: #FFF503A6;">Considered heavyweight:</mark> 
- XML  
- verbose messaging structure  

<mark style="background: #FFF503A6;">Still used, but:</mark> Dropped by Google APIs in 2006

### <mark style="background: #FFF503A6;">RESTful architectures</mark>  

<mark style="background: #FFF503A6;">Essence:</mark> View a distributed system as a collection of resources, individually managed by components. Resources may be added, removed, retrieved, and modified by (remote) applications.  

1. Resources are identified through a single naming scheme  
2. All services offer the same interface  
3. Messages sent to or from a service are fully self-described  
4. After executing an operation at a service, that component forgets everything about the caller  

<mark style="background: #FFF503A6;">Basic operations:</mark>
![[Pasted image 20251203202932.png]]

### <mark style="background: #FFF503A6;">Example: Amazon’s Simple Storage Service</mark>  

<mark style="background: #FFF503A6;">Essence:</mark> Objects (i.e., files) are placed into buckets (i.e., directories). Buckets cannot be placed into buckets.  

E.g. Operations on ``ObjectName`` in bucket ``BucketName`` require the following identifier: http://BucketName.s3.amazonaws.com/ObjectName  

<mark style="background: #FFF503A6;">Typical operations:</mark>
- All operations are carried out by sending HTTP requests:  
- Create a bucket/object: PUT, along with the URI  
- Listing objects: GET on a bucket name  
- Reading an object: GET on a full URI

### <mark style="background: #FFF503A6;">Interfaces</mark>

A service offers functionality, and at best the way that the service is accessed is determined by the interface.  

<mark style="background: #FFF503A6;">Issue:</mark> A service cannot be made easier or more difficult just because of the particular interface it offers.  

Many people like RESTful approaches because the interface to a service is so simple. The catch is that much needs to be done in the <mark style="background: #FFF503A6;">parameter space</mark>.  

Amazon S3 SOAP interface (deprecated by now) - consists of approximately 16 operations

### <mark style="background: #FFF503A6;">On interfaces</mark> 

<mark style="background: #FFF503A6;">Simplifications:</mark> Assume an interface bucket offering an operation create, requiring an input string such as mybucket, for creating a bucket “mybucket.”  

<mark style="background: #FFF503A6;">SOAP</mark>  
```soap
import bucket  
bucket.create("mybucket")
```  

<mark style="background: #FFF503A6;">RESTful</mark>
```shell
PUT "https://mybucket.s3.amazonsws.com/"
```

### <mark style="background: #FFF503A6;">Representational State Transfer (REST)</mark> 

The key characteristic of most web services is that they can process XML formatted SOAP messages -  An alternative is the REST approach  

<mark style="background: #FFF503A6;">REST is a web standards based architecture:</mark>
-  Uses HTTP Protocol for data communication  
-  Resource-oriented  
- every component is a resource  
- a resource is accessed by a common interface using HTTP standard methods  

Clients use URLs and the HTTP operations GET, PUT, DELETE and POST to manipulate resources  

The emphasis is on the manipulation of data resources rather than on interfaces.

### <mark style="background: #FFF503A6;">REST</mark>

When a new resource is created, it has a new URL by which it can be accessed or updated.  

Clients are supplied with the entire state of a resource instead of calling an operation to get some part of it.  

The Amazon web services may be accessed either by SOAP or by REST

<mark style="background: #FFF503A6;">REST Server:</mark> provides access to resources  

<mark style="background: #FFF503A6;">REST client:</mark> accesses and presents the resources  

<mark style="background: #FFF503A6;">REST resources:</mark> 
- each resource is identified by URIs/ Global IDs
- representations of a resource
- Text, JSON and XML
- JSON is now the most popular format

### <mark style="background: #FFF503A6;">RESTful Web Services</mark>

<mark style="background: #FFF503A6;">A web service is:</mark>  
-  A collection of open protocols  
-  Standards used for exchanging data between applications or systems  
-  Interoperability between different languages (Java and Python) or platforms (Windows and Linux)  

<mark style="background: #FFF503A6;">Web services based on REST Architecture are known as RESTful Web Services:</mark>
-  Use HTTP methods to implement the concept of REST architecture  
-  URI (Uniform Resource Identifier) to define a RESTful service  
-  Resources representation  
- JSON

### <mark style="background: #FFF503A6;">REST</mark>

Everything is a resource  

Any interaction of a RESTful API is an interaction with a resource.  

<mark style="background: #FFF503A6;">Resources are sources of information:</mark> 
-  typically documents or services, or  
-  Users (e.g. as a URL of their GitHub)

<mark style="background: #FFF503A6;">REST characteristics</mark>
- Resources are identified through a single naming scheme.  
- All services offer the same interface via basic operations  
- Messages sent to or from a service are fully self-described  
- Component forgets everything about the caller - after executing an operation at a service

Describes how resources on web servers should be accessed via the HTTP protocol  

Resource identification through a uniform resource identifier (URI)

### <mark style="background: #FFF503A6;">HTTP Methods in a REST based architecture</mark>

<mark style="background: #FFF503A6;">Basic four operations (CRUD: Create, Read, Update, Delete):</mark>
- PUT - Create, Used to create a new resource.  
- GET - Read, Provides a read only access to a resource.  
- POST - Update, Used to update an existing resource or create a new resource.
- DELETE - Delete, Used to remove a resource.  

<mark style="background: #FFF503A6;">Fifth operation:</mark>
- determine options associated with a resource  
- OPTIONS − Query, Used to get the supported operations on a resource.

### <mark style="background: #FFF503A6;">REST conventions</mark>

Easily understood consistent naming scheme  

Traversing the path from more generic to more specific, you are navigating the data  

www.myappdomain.com  

<mark style="background: #FFF503A6;">Examples:</mark>
- retrieve a list of users: GET www. myappdomain.com/users  
- retrieve user 23: GET www. myappdomain.com/users/23  
- create a new user: POST www. myappdomain.com/users  
- update user 23: PUT www. myappdomain.com/users/23  
- remove user 23: DELETE www.mmyappdomain.com/users/23

### <mark style="background: #FFF503A6;">Examples of REST services:</mark>
- Various Amazon & Microsoft APIs  
- Facebook Graph API  
- Yahoo! Search APIs  
- Flickr  
- Twitter

### <mark style="background: #FFF503A6;">SOAP vs RESTful Web Services</mark>

<mark style="background: #FFF503A6;">SOAP:</mark>
- A protocol - comes with strict rules and advanced security features such as built-in ACID compliance and authorization.  
- Permits XML data format only  
- SOAP can't use REST  
- Has higher complexity, and requires more bandwidth and resources, which can lead to slower page load times.  

<mark style="background: #FFF503A6;">REST:</mark>
- An architectural style - not a protocol  
- Can use different messaging formats, such as HTML, CSV, JSON, XML  
- REST can use SOAP web services because it is a concept  
- Can use any protocol like HTTP, SOAP.  
- Consumes fewer resources than SOAP because its messages are typically smaller.- better performance

### <mark style="background: #FFF503A6;">SOAP versus REST</mark>

<mark style="background: #FFF503A6;">SOAP:</mark>
- API calls cannot be cached  
- Only XML  
- Requires more bandwidth and computing power  
- Better security, built-in extensibility, standardised  
- <mark style="background: #FFF503A6;">Usage:</mark> Banks or payment gateways, PayPal  

<mark style="background: #FFF503A6;">REST:</mark>
- API calls can be cached  
- Plain text, HTML, XML, JSON, CSV...  
- Requires fewer computing resources  
- Faster, scalability  
- <mark style="background: #FFF503A6;">Usage:</mark> Facebook, Google, Twitter

### <mark style="background: #FFF503A6;">How to choose: SOAP or REST (1)</mark>

<mark style="background: #FFF503A6;">Overall application design:</mark>  
- Mobile apps and hybrid applications work better with REST APIs scalability and flexibility to use microservices and containers
- if you need to integrate or extend systems that already have SOAP APIs  
- better continuing with SOAP  

<mark style="background: #FFF503A6;">Security:</mark>
- Tighter security measures in WS-Security of SOAP  
- For public APIs, with lower security requirements  
- REST may be a better choice
  
<mark style="background: #FFF503A6;">ACID compliance:</mark>
- SOAP has built-in compliance for atomicity, consistency, isolation, and durability (ACID)
- May be a better suited for high data integrity requirements applications, like finance transactions  
- REST APIs may require additional software modules
- REST is not ACID compliant

### <mark style="background: #FFF503A6;">Coordination of web services</mark>

The SOAP infrastructure supports single request-response interactions between clients and web services.  

Many applications involve several requests that need to be done in a particular order. The need for web services as clients to be provided with a description of a particular protocol to follow when interacting with other web services.  

For composite web services, a transactions management protocol such as 2PC is required - WS-Coordination  

Simpler approach is Web Service choreography  
- Global description of a set of interactions  
- Defines coordination  
- Enhances interaction

### <mark style="background: #FFF503A6;">Travel agent scenario</mark>

1. The client asks the travel agent service for information about a set of services; for example, flights, car hire and hotel bookings.  
2. The travel agent service collects prices and availability information and sends it to the client, which chooses one of the following on behalf of the user: 
	- (a) refine the query, possibly involving more providers to get more information, then repeat step 2;  
	- (b) make reservations;  
	- (c) quit.  
3. The client requests a reservation and the travel agent service checks availability.  
4. Either all are available; or for services that are not available; either alternatives are offered to the client who goes back to step 3; or the client goes back to step 1.  
5. Take deposit.  
6. Give the client a reservation number as a confirmation.  
7. During the period until the final payment, the client may modify or cancel reservations


### <mark style="background: #FFF503A6;">Fig: The ‘travel agent service’ combines other web services</mark>

![[Pasted image 20251203205748.png]]

### <mark style="background: #FFF503A6;">Applications of web services</mark>

<mark style="background: #FFF503A6;">The major areas where web services have been employed extensively:</mark>
- Service-oriented architecture  
- The Grid, and  
- Cloud computing

### <mark style="background: #FFF503A6;">The Grid</mark>

Middleware that is designed to enable the sharing of resources such as files, computers, software, data and sensors - on a very large scale  

<mark style="background: #FFF503A6;">An example of a Grid application:</mark> 
- The World-Wide Telescope application developed at Microsoft Research.  
- This project is concerned with deploying the data resources shared by the astronomy community.

### <mark style="background: #FFF503A6;">Cloud computing</mark> 

A set of Internet-based application, storage and computing services sufficient to support most users’ needs - enabling them to largely or totally dispense with local data storage and application software.  

<mark style="background: #FFF503A6;">Promotes a view of everything as a service:</mark>
- from physical or virtual infrastructure,  
- through to software, often paid for on a per-usage basis rather than purchased.  

<mark style="background: #FFF503A6;">Examples:</mark>
- Google App Engine  
- Amazon Web Services (AWS) [aws.amazon.com]  
- A set of cloud services implemented on the extensive physical  infrastructure owned by Amazon.com.

### <mark style="background: #FFF503A6;">Grid and Cloud Computing</mark>

The development of the Grid preceded the emergence of cloud computing and was a significant factor in its emergence.  

They share the same goal of providing resources (services) out there in the greater Internet.  

<mark style="background: #FFF503A6;">Grid:</mark> tends to focus on high-end data-heavy or computationally expensive applications  

<mark style="background: #FFF503A6;">Cloud computation:</mark> more general, offering a range of services for individual computer users through to high-end users.  

The business model associated with cloud computing is also a distinguishing characteristic  

The Grid is an early example of cloud computing, but cloud computing has developed significantly since then.

### <mark style="background: #FFF503A6;">Amazon Web Services (AWS)</mark>

A set of cloud services implemented on the extensive physical infrastructure owned by Amazon.com.  

Made available using web service standards described earlier.

### <mark style="background: #FFF503A6;">AWS</mark>

Amazon’s AWS is based entirely on web service standards coupled with the REST philosophy of service construction.  

The approach enables interoperability across the Internet.  

Amazon also adopts the REST approach

### <mark style="background: #FFF503A6;">Comparison of web services with distributed object model</mark>  

A web service has a service interface - provide operations for accessing and updating the data resource it manages.  

For a web service, the client uses a URI to invoke an operation in the resource named by that URI.  

<mark style="background: #FFF503A6;">Remote object references are not very similar to URIs:</mark>  
- The URI of a web service can be compared with the remote object reference of a single object.  
- However, in the distributed object model, objects can create remote objects dynamically and return remote reference to them.  
- The recipient of these remote references can use them to invoke operations in the object to which they refer.

### <mark style="background: #FFF503A6;">Web Service Examples</mark>

<mark style="background: #FFF503A6;">An application that requires the presence of a web service is one that implements ‘sniping’ in eBay auctions:</mark>
- placing a bid during the last few seconds before an auction closes.  
- although humans can perform the same actions by direct interaction with the web page, they cannot do it as quickly.  

An inventory control and purchasing application that might order supplies of various commodities as they are needed from Amazon.com and automatically keep track of the changing status of each order.

### <mark style="background: #FFF503A6;">References</mark>

Chapter 9 - Coulouris, Dollimore, Kindberg and Blair (2012), Distributed Systems, Concepts and Designs (Edition 5), Addison Wesley  

RPC & Web Services: Case Studies, Paul Krzyzanowski, Rutgers University  

https://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm  

https://www.ibm.com/docs/en/was/8.5.5?topic=technologies-web-services  

https://aws.amazon.com/compare/the-difference-between-soap-rest/