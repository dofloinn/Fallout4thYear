### <mark style="background: #C900FFA6;">Summary of lecture</mark>

<mark style="background: #C900FFA6;">1. Java RMI:</mark>
- Remote Procedure Call (RPC) executes procedures in different address spaces.
- Java RMI is an example of RPC, emphasising client-server structure, distributed systems, and method signatures.

<mark style="background: #C900FFA6;">2. SOAP vs. REST:</mark>
- SOAP is a complex, protocol-specific approach with advanced features, while REST offers a flexible, lightweight architecture.
- REST's simplicity, support for various messaging formats, and better performance make it popular, especially in mobile applications.

<mark style="background: #C900FFA6;">3. REST Architecture Constraints:</mark>
- Uniform Interface, Resource-Based Design, and Manipulation through Representations define REST's architecture.
- Stateless, Cacheable, and Client-Server principles and a Layered System contribute to REST's scalability, simplicity, and portability.

<mark style="background: #C900FFA6;">Lesson Outline</mark>  
-  Section 1 – Distributed Systems  
-  Section 2 – Docker, Kubernetes and Istio  
-  Section 3 – Rest Architecture  
-  Section 4 – Rest Constraints

### <mark style="background: #C900FFA6;">Section 1 - Distributed Systems</mark>

### <mark style="background: #C900FFA6;">Java RMI</mark>

RPC: Remote Procedure Call is when a computer program causes a procedure (subroutine) to execute in a different address space  

Java RMI (Remote Method Invocation) is an RPC example.  

<mark style="background: #C900FFA6;">Structure:</mark>  
-  Client-Server  
-  Distributed systems over a shared network  
	-  Operating system processes  
	-  Method signatures  
	-  Data types (" serialisable"  objects, marshalling)  
	-  Same programming language

![[Pasted image 20260304105839.png]]

### <mark style="background: #C900FFA6;">SOAP</mark>  

<mark style="background: #C900FFA6;">SOAP: Simple Object Access Protocol</mark> 
-  Decentralised, distributed environment  
-  Information exchanged over several protocols (SMTP, HTTP...)  
-  Independent of programming and implementation details  
-  XML to define an extensible, structured messaging framework

![[Pasted image 20260304105938.png]]

### <mark style="background: #C900FFA6;">Distributed Systems using Microservices</mark>

![[Pasted image 20260304110000.png]]

### <mark style="background: #C900FFA6;">Section 2 – Docker and Kubernetes</mark>

### <mark style="background: #C900FFA6;">What are containers?</mark> 

A container's primary aim is to enable an application that operates on one machine to function on another by incorporating its libraries, binaries, and other dependencies.  

A container is an autonomous entity that allows code separation from the machine on which it operates.  

Initially, applications are developed, and subsequently, they can be deployed into production using a container.

### <mark style="background: #C900FFA6;">Containers are much lighter than the Virtual Machines</mark>  

![[Pasted image 20260304110106.png]]

\*Virtual machines need much more space since they need a complete OS for themselves.

### <mark style="background: #C900FFA6;">Advantages of Docker Containers</mark>

Containers perform the same functions as VMs but use a substantially smaller amount of memory (MBs instead of GBs) and operate more swiftly because they do not need to replicate the entire operating system.  

Unlike <mark style="background: #C900FFA6;">VMs replicating an entire operating system</mark>, containers utilise minimal memory (binaries and libraries).  

Containers are isolated at the kernel level, allowing libraries to be shared among all containers, thus eliminating the need for multiple copies.

### <mark style="background: #C900FFA6;">What is Docker?</mark>  

Docker is <mark style="background: #C900FFA6;">open-source</mark> and currently the most popular container platform.  

Docker holds a <mark style="background: #C900FFA6;">market share of 87%</mark> in the containerisation market as of 2026.  

The Dockerfile defines everything needed to run the image, including OS network specifications and file locations. A Docker image is a portable, static component that operates on the Docker Engine.  

Docker containers cannot be directly transported to different operating systems.

### <mark style="background: #C900FFA6;">Why do we need a container orchestrator?</mark>  

Coordination and planning for all containers.  

Update the applications to the latest version without interrupting the service.  

Monitor the current status of each application.

### <mark style="background: #C900FFA6;">What is Kubernetes?</mark>

<mark style="background: #C900FFA6;">Kubernetes (K8s)</mark> is a container orchestrator. It is open-source and was developed by Google before being donated to the Cloud Native Computing Foundation.  

<mark style="background: #C900FFA6;">K8s benefits from Google’s extensive experience</mark> in container management. It is a comprehensive system for automating containerised applications' deployment, scheduling, and scaling, supporting various containerisation tools such as Docker.  

<mark style="background: #C900FFA6;">Kubernetes is the market leader</mark> and the standard means of orchestrating containers and deploying distributed applications. It can run on a public cloud service or on-premises is highly modular, is open-source, and boasts a vibrant community.

### <mark style="background: #C900FFA6;">What does Kubernetes do?</mark>

Kubernetes compares the desired state (e.g., three copies of app one and four copies of app B) to the actual state, and if they are not the same, it takes steps to rectify the situation. It handles a large volume of containers and users.  

<mark style="background: #C900FFA6;">Load balancing</mark> replaces chaos with order and efficient resource allocation. It manages service discovery and communication between containers and users.  

<mark style="background: #C900FFA6;">Authentication</mark> and security should be at the infrastructure level (rather than the application level), and consistent policies should be applied across all platforms.  

<mark style="background: #C900FFA6;">Multi-platform deployment</mark> is also supported. Orchestration oversees the complex task of coordinating container operations, microservice availability, and synchronisation in a multi-platform, multi-cloud environment

### <mark style="background: #C900FFA6;">Section 3 – REST Architecture</mark>

### <mark style="background: #C900FFA6;">Origin of REST</mark>

SOAP was overly complex, and the alternative, CORBA, was even worse.  

Roy Fielding, in 2000, aimed to simplify the API process. His PhD thesis was titled Architectural Styles and the Design of Network-based Software Architectures. He received feedback from approximately 500 esteemed developers.  

In 1994, Fielding began working for the World Wide Web Consortium. He co-authored the HTTP 1.0 specification and was the principal author of the HTTP 1.1 and URI specifications. He also co-founded the Apache web server project.

### <mark style="background: #C900FFA6;">REST</mark>  

<mark style="background: #C900FFA6;">REST:</mark> REpresentational State Transfer  

Describes how resources on web servers should be exposed via the HTTP protocol  

Resource identification through a uniform resource identifier (URI)  

<mark style="background: #C900FFA6;">Resources are manipulated using a fixed set of CRUD operations (actions) with HTTP methods:</mark>  
-  POST - Create a new resource  
-  GET - Read the current state of a resource  
-  PUT – Update a resource  
-  DELETE - Delete a resource  
-  Messages are self-descriptive and straightforward, e.g. http://www.mysite.com/users/56

### <mark style="background: #C900FFA6;">SOAP versus REST</mark>  

As <mark style="background: #C900FFA6;">SOAP</mark> is an official protocol, it has <mark style="background: #C900FFA6;">strict rules and advanced security features</mark> such as built-in ACID compliance and authorisation.  

SOAP has a <mark style="background: #C900FFA6;">higher complexity</mark> and requires <mark style="background: #C900FFA6;">more bandwidth</mark> and resources, which can lead to <mark style="background: #C900FFA6;">slower page load</mark> times.  

<mark style="background: #C900FFA6;">REST</mark> consumes fewer resources than SOAP because its messages are typically smaller.  

REST was created to address SOAP's problems. Therefore, it has a more <mark style="background: #C900FFA6;">flexible architecture</mark>. It consists of guidelines and lets developers implement them in their way.  

It allows <mark style="background: #C900FFA6;">different messaging formats</mark>, such as HTML, CSV, JSON, XML, and plain text, while SOAP only allows XML.  

REST is a more <mark style="background: #C900FFA6;">lightweight architecture</mark>, so RESTful web services perform better.  

Because of that, it has become incredibly popular in the <mark style="background: #C900FFA6;">mobile era</mark>, where even a second matters a lot (both in page load time and revenue).

### <mark style="background: #C900FFA6;">SOAP versus REST</mark>

<table>
	<tr>
		<td>SOAP</td>
		<td>REST</td>
	</tr>
	<tr>
		<td>Function-driven (data available as services, e.g.: " getUser" )</td>
		<td>Data-driven (data available as resources, e.g. " user" )</td>
	</tr>
	<tr>
		<td>API calls cannot be cached</td>
		<td>API calls can be cached</td>
	</tr>
	<tr>
		<td>Requires more bandwidth and computing power</td>
		<td>Requires fewer computing resources</td>
	</tr>
	<tr>
		<td>Only XML</td>
		<td>Plain text, HTML, XML, JSON, CSV...</td>
	</tr>
	<tr>
		<td>HTTP, SMTP, UDP, TCP</td>
		<td>HTTP</td>
	</tr>
	<tr>
		<td> High security, standardised, extensible</td>
		<td>Faster, flexible, scalable</td>
	</tr>
	<tr>
		<td>High-security apps, complex transactions, financial services, payment gateways, legacy systems</td>
		<td>Public data APIs, mobile services, social networks</td>
	</tr>
	<tr>
		<td>Example: PayPal</td>
		<td>Example: X.com</td>
	</tr>
</table>

### <mark style="background: #C900FFA6;">REST(postcard) vs SOAP(Letter)</mark>

![[Pasted image 20260304112833.png]]

### <mark style="background: #C900FFA6;">Google Trends</mark>

![[Pasted image 20260304112908.png]]

### <mark style="background: #C900FFA6;">REST properties</mark> 

<mark style="background: #C900FFA6;">Platform-independency:</mark> No need to worry whether the underlining O.S. is Windows, Linux, Mac, Solaris...  

<mark style="background: #C900FFA6;">Language-independency:</mark> REST can be implemented in any language (Java, PHP, C#, Python, JavaScript...)  

<mark style="background: #C900FFA6;">Standards-based:</mark> REST runs on top of HTTP and can easily be used in the presence of firewalls.  

<mark style="background: #C900FFA6;">Lightweight:</mark> It offers no built-in features like security, session management or encryption. However, these can be added by building on top of HTTP.

<mark style="background: #C900FFA6;">Simplicity:</mark> REST helps you organise even a very complex application into simple resources.  

<mark style="background: #C900FFA6;">Portability:</mark> REST makes it easy for new clients to use your application (mobile devices, wearable devices, servers...)  

<mark style="background: #C900FFA6;">Scalability:</mark> REST helps reduce client/server coupling. It is easy to evolve a REST interface over time without breaking existing clients.

### <mark style="background: #C900FFA6;">Principal Competitors to REST</mark> 

1. <mark style="background: #C900FFA6;">GraphQL:</mark> Developed internally at Facebook in 2012 and open-sourced in 2015. A declarative query language for APIs using a single endpoint and a strongly typed schema. Clients specify exactly the data required, enabling nested queries and reducing over- and under-fetching. <mark style="background: #C900FFA6;">Competitive advantage:</mark> Efficient data aggregation for complex frontend and mobile applications, fewer round trips than REST.  
2. <mark style="background: #C900FFA6;">gRPC:</mark> Developed by Google and released as an open-source project in 2015 (successor to Stubby). A high-performance RPC framework built on HTTP/2 using Protocol Buffers for compact binary serialization. Supports strict service contracts and bidirectional streaming. <mark style="background: #C900FFA6;">Competitive advantage:</mark> Superior performance, low latency, and strong typing—well suited to microservices and internal cloud-native architectures.  
3. <mark style="background: #C900FFA6;">Web Socket:</mark> Standardised by the IETF as RFC 6455 in 2011. A full-duplex protocol establishing a persistent TCP connection after an HTTP handshake, enabling asynchronous bidirectional communication. <mark style="background: #C900FFA6;">Competitive advantage:</mark> Eliminates polling overhead and enables real-time applications such as chat systems, live dashboards, and collaborative platforms.

### <mark style="background: #C900FFA6;">Section 4 – REST Constraints</mark>

### <mark style="background: #C900FFA6;">REST architectural style constraints</mark>

Roy Fielding’s Doctoral Dissertation http://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm  

Complying with these <mark style="background: #C900FFA6;">six constraints</mark> will enable any distributed hypermedia system to have desirable properties such as <mark style="background: #C900FFA6;">scalability, simplicity and portability</mark>.  

<mark style="background: #C900FFA6;">NOTE:</mark> The only optional constraint of REST architecture is code on demand (#6).  

If a web service violates any other constraint, it cannot strictly be referred to as <mark style="background: #C900FFA6;">RESTful</mark>.

<mark style="background: #C900FFA6;">1. Uniform Interface:</mark> 
-  Defines the interface between clients and servers  
-  Simplifies and decouples the architecture, which enables each part to evolve independently. 
- <mark style="background: #C900FFA6;">A. Resource-Based:</mark> Individual resources are identified in requests using URIs as resource identifiers. The resources are conceptually separate from the representations returned to the client. For example, the server does not send its database record, but rather, some HTML, XML or JSON representing some database records
- <mark style="background: #C900FFA6;">b. Manipulation of Resources Through Representations:</mark> When a client holds a representation of a resource, including any metadata attached, it has enough information to modify or delete the resource on the server, provided it has permission to do so.
- <mark style="background: #C900FFA6;">c. Self-descriptive Messages:</mark> Each message includes enough information to describe how it should be processed. For example, an Internet media type (previously known as a MIME type) may specify which parser to invoke. 
- e.g. Accept Header, Content-Type Header = application/json
- <mark style="background: #C900FFA6;">d. Hypermedia as the Engine of Application State (HATEOAS)</mark> Clients deliver state via body contents, query-string parameters, request headers and the requested URI (the resource name).  
- Services deliver state to clients via body content, response codes, and response headers. This is technically referred to as hypermedia. 
- HATEOS also means that, where necessary, links are contained in the returned body (or headers) to supply the URI for retrieval of the object itself or related objects (hyperlinks within hypertext).  
- The server response contains the requested data (resource representation) and links or references to related resources and the possible actions that can be performed on those resources.

```shell
# Examples of resources:  
GET /students  
GET /students/123  
GET /courses  
GET /courses/CS101  

# In this design:  
/students # represents the collection of all students  
/students/123 # represents one specific student
/courses/CS101 # represents one specific course

PUT /users/10  
Content-Type: application/json  
{  
	"id": 10,  
	"name": "Maria",  
	"email": "maria.new@email.com"   
}  

# The client updates the resource by sending its modified representation.

# Client requests an order:  
GET /orders/1001  
Accept: application/json  
Server response:  
HTTP/1.1 200 OK  
Content-Type: application/json  
{  
	"orderId": 1001,  
	"status": "PROCESSING",  
	"total": 120.00,  
	"links": [  
		{ "rel": "self", "href": "/orders/1001" },  
		{ "rel": "cancel", "href": "/orders/1001/cancel" },  
		{ "rel": "payment", "href": "/orders/1001/payment" }  
	]  
}
```

<mark style="background: #C900FFA6;">2. Stateless:</mark>  
- The necessary information to handle a request is contained within it, whether as part of the <mark style="background: #C900FFA6;">URI</mark>, <mark style="background: #C900FFA6;">query-string parameters</mark>, <mark style="background: #C900FFA6;">body</mark>, or <mark style="background: #C900FFA6;">headers</mark>.  
- <mark style="background: #C900FFA6;">The URI uniquely identifies the resource, and the body</mark> contains that resource's state (or state change). After the server processes, the appropriate state is communicated to the client via headers, status and response body.  
- In REST, <mark style="background: #C900FFA6;">every HTTP request occurs in complete isolation</mark>; if something is repeatedly required (e.g. authentication tokens), the client must send it again across multiple requests.  
- <mark style="background: #C900FFA6;">Statelessness</mark> enables <mark style="background: #C900FFA6;">greater scalability</mark> since the server cannot maintain or communicate sessions.

```shell
# Client logs in and receives a token:  
POST /login  
→ Server returns token: abc123xyz  

# To access data, the client must send the token every time:  
GET /accounts/5001  
Authorization: Bearer abc123xyz
```

<mark style="background: #C900FFA6;">3. Cacheable</mark>
- As on the World Wide Web, clients can cache responses. <mark style="background: #C900FFA6;">Responses must, therefore, implicitly or explicitly define themselves as cacheable or not</mark> to prevent clients from reusing stale or inappropriate data in response to further requests.  
- Well-managed caching partially or eliminates some client-server interactions, further improving <mark style="background: #C900FFA6;">scalability</mark> and <mark style="background: #C900FFA6;">performance</mark>. e.g. Expires Header

```shell
Server response:  
HTTP/1.1 200 OK  
Content-Type: application/json  
Expires: Wed, 10 Jun 2026 10:00:00 GMT  
{  
“id”: 10,  
“name”: “Laptop”,  
“price”: 999  
}  
The Expires header tells the client it can  
reuse this response until that date.
```

<mark style="background: #C900FFA6;">4. Client-Server:</mark> 
- The <mark style="background: #C900FFA6;">uniform interface separates clients from servers</mark>. This separation of concerns means that, for example, <mark style="background: #C900FFA6;">clients are not concerned with data storage</mark>, which remains internal to each server, improving the portability of client code.  
- <mark style="background: #C900FFA6;">Servers are not concerned with the user interface or state</mark>, so they can be simpler and more scalable.  
- Servers and clients may also be replaced and developed independently as long as the interface is not altered.

<mark style="background: #C900FFA6;">Client–Server – Example</mark>  
- A mobile app sends GET /products/10.  
- The client only displays the product and does not know how the data is stored. The server retrieves the data from its database and returns JSON.  
- If the server changes its internal database, the app still works as long as the API does not change.  
- Client handles the UI. Server handles data. Both evolve independently.

<mark style="background: #C900FFA6;">5. Layered System:</mark>
- A client cannot ordinarily tell whether it is connected directly to the end server or to an intermediary.  
- Intermediary servers may improve system scalability by facilitating load-balancing and shared caches.  
- Layers may also enforce security policies. A layered system also allows for hierarchical components that cannot "see" beyond the immediate layer with which they interact.  
- Every layer should have a single high-level purpose, e.g. data access, business logic, and presentation.

![[Pasted image 20260304115104.png]]

<mark style="background: #C900FFA6;">6. Code on Demand (optional):</mark>  
- When necessary, the response can contain executable code.  
- Servers can temporarily extend or customise the client functionality by transferring logic that the client can execute.  
- Examples of this may include compiled components such as Java applets, or client-side scrips: JavaScript.

![[Pasted image 20260304115155.png]]

### <mark style="background: #C900FFA6;">URI – Uniform Resource Identifier</mark> 

Everything that should be identifiable should get an ID. On the Web, there is a unified concept for IDs: The URI.  

URIs make up a global namespace, and using URIs to identify your key resources means they get a unique, global ID.  

<mark style="background: #C900FFA6;">These identify all of the “high-level” resources that your application provides, whether they represent:</mark>  
- individual items  
- collections of items  
- computation results...

### <mark style="background: #C900FFA6;">REST conventions</mark>  

The main benefit of a <mark style="background: #C900FFA6;">consistent naming scheme</mark> is that it follows a <mark style="background: #C900FFA6;">predictable structure</mark> therefore, it can be understood by anybody:  
- http://localhost/books/  
- http://localhost/books/ISBN-0011  
- http://localhost/books/ISBN-0011/authors  
- http://localhost/classes  
- http://localhost/classes/dt228-4  
- http://localhost/classes/dt228-4/students  

As you traverse the path from more generic to more specific, you are navigating the data.

### <mark style="background: #C900FFA6;">REST conventions</mark> 

<mark style="background: #C900FFA6;">www.mysite.com:</mark>  
- Retrieve a list of users: GET www.mysite.com/users  
- Retrieve user 56: GET www.mysite.com/users/56  
- Create a new user: POST www.mysite.com/users  
- Update user 56: PUT www.mysite.com/users/56  
- Remove user 56: DELETE www.mysite.com/users/56

www.mysite.com/users instead of www.mysite.com/overview.php?type=users&list=all => URL routing

### <mark style="background: #C900FFA6;">Example</mark>  

Request: GET www.mysite.com/users/56  

Just a URI sent to the server by the HTTP method GET  

<mark style="background: #C900FFA6;">Response:</mark>  
- raw result data  
- not embedded inside anything (e.g. like a SOAP response envelope)  
- ready to use

![[Pasted image 20260304115421.png]]

### <mark style="background: #C900FFA6;">REST GET request</mark>

![[Pasted image 20260304115507.png]]

### <mark style="background: #C900FFA6;">REST POST request</mark>

![[Pasted image 20260304115528.png]]

When you create a new resource with POST, the server decides the URI.

### <mark style="background: #C900FFA6;">REST PUT request</mark>

A PUT request must send the new complete representation of the resource to the server.

![[Pasted image 20260304115601.png]]

### <mark style="background: #C900FFA6;">REST DELETE request</mark>

![[Pasted image 20260304115617.png]]

### <mark style="background: #C900FFA6;">Safety and Idempotence</mark> 

GET requests are safe (ignoring or repeating them has no consequences)  

PUT and DELETE methods are idempotent (can be repeated without side effects)  

<mark style="background: #C900FFA6;">POST is unsafe and non-idempotent => handle with care</mark>  
- “Are you sure you want to post this form again?”  
- “Do you want to purchase this item again?”

### <mark style="background: #C900FFA6;">Representations (Type format)</mark> 

It is common to have multiple representations of the same data  

<mark style="background: #C900FFA6;">The client can ask for a representation in a particular format:</mark> 
- CSV, XML, JSON... 
- An AJAX application may want JSON  
- A Ruby application may want XML...  

HTTP Headers or the URI can specify the desired format

### <mark style="background: #C900FFA6;">Example: Google Maps Distance Matrix API</mark>  

<mark style="background: #C900FFA6;">Google Maps Distance Matrix API (JSON or XML)</mark> https://developers.google.com/maps/documentation/distance-matrix/start  

<mark style="background: #C900FFA6;">Request:</mark>  
- https://maps.googleapis.com/maps/api/distancematrix/outputFormat?parameters
- https://maps.googleapis.com/maps/api/distancematrix/json?origins=Seattle&destinations=San+Francisco&key=YOUR_API_KEY  

<mark style="background: #C900FFA6;">Defaults:</mark> mode = driving. Distance value: meters, duration: seconds  
- NOT JUST A DIV WITH A GOOGLE MAP ON YOUR PAGE! 
- A GET REQUEST WITH PARAMETERS THAT RETURN JSON OR XML!

### <mark style="background: #C900FFA6;">RESPONSE</mark>

```json
{  
	"destination_addresses" : [ "San Francisco, CA, USA" ],  
	"origin_addresses" : [ "Seattle, WA, USA" ],  
	"rows" : [  
	{  
		"elements" : [  
			{  
				"distance": {  
					"text": "1,300 km", "value": 1299875  
				},  
				"duration": {  
					"text": "12 hours 25 mins", "value": 44722  
				},  
				"status": "OK"  
				}  
			]  
		}  
	],  
	"status": "OK"  
}
```

### <mark style="background: #C900FFA6;">Requesting from the Client-Side</mark>  

Due to browser security restrictions, most AJAX and Fetch requests are subject to the <mark style="background: #C900FFA6;">same-origin policy</mark>  

The request cannot retrieve data from a different domain, subdomain, port, or protocol <mark style="background: #C900FFA6;">unless the response includes the right CORS headers</mark>.

![[Pasted image 20260304120244.png]]

### <mark style="background: #C900FFA6;">What is CORS?</mark>  

https://www.youtube.com/watch?v=4KHiSt0oLJ0  

Learn CORS In 6 Minutes  

https://www.youtube.com/watch?v=PNtFSVU-YTI

### <mark style="background: #C900FFA6;">CORS</mark>  

The <mark style="background: #C900FFA6;">CORS standard</mark> works by adding new HTTP headers that allow servers to describe the set of origins that are permitted to read that information using a web browser, e.g.  

<mark style="background: #C900FFA6;">Access-Control-Allow-Origin: *</mark>

https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS

![[Pasted image 20260304120402.png]]

### <mark style="background: #C900FFA6;">Requesting from the Client-Side</mark> 

For example, Google APIs support requests and responses using CORS  

However, some firewalls will strip the ``Access-Control-Allow-Origin: *`` header from the server’s response in a CORS scenario, and you may receive an error message on the browser’s console: 
- Access to <mark style="background: #C900FFA6;">XMLHttpRequest</mark> at (...) from the origin (...) has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.  
- You can use a proxy to forward your request and send you back the result in an acceptable format, e.g. with your domain name instead of * in the allowed origins  
- https://cors-anywhere.herokuapp.com/

<mark style="background: #C900FFA6;">Example: Google Maps Distance Matrix API:</mark>  

```js
$.get("https://cors-anywhere.herokuapp.com/"+"https://maps.googleapis.com/maps/api/distancematrix/json?origins=Seattle&destinations=San+Francisco&key="+YOUR_API_KEY,function(data){ // consume the response });
```  

You’ll need to read the documentation for each specific API to determine how to format your query.  

Mind the daily request quota for free APIs.

### <mark style="background: #C900FFA6;">Requesting via the Server-Side</mark>  

You can also forward the request to your server, have a script request the API data, and send the result back to the client-side code;  

This method does not trigger security settings in browsers or firewalls, and it is compatible across all browsers.  

However, <mark style="background: #C900FFA6;">it may affect your server’s load and scalability</mark>.

![[Pasted image 20260304120918.png]]

### <mark style="background: #C900FFA6;">Some APIs</mark>  
- The Open Movie Database (JSON or XML) http://www.omdbapi.com/  
- Spotify Web API (JSON) https://developer.spotify.com/web-api/  
- AccuWeather Enterprise API (JSON) http://apidev.accuweather.com/developers/  
- Wikipedia/Wikimedia (XML) https://www.mediawiki.org/wiki/REST_API  
- Facebook Graph API (JSON) https://developers.facebook.com/docs/graph-api/overview  
- Flickr (XML, JSON, SOAP, RPC) https://www.flickr.com/services/api/  
- Zomato (JSON or XML) https://developers.zomato.com/api
