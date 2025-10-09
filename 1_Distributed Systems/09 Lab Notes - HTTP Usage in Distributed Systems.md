### <mark style="background: #FFF503A6;">Application Programming Interfaces (APIs)</mark>

A service exposes operations by publishing a set of interfaces implemented by its business logic.

Remote clients can not access the services directly. 

<mark style="background: #FFF503A6;">Adapters:</mark> that make APIs, translate messages received from IPC mechanisms to interface calls

### <mark style="background: #FFF503A6;">APIs</mark>

<mark style="background: #FFF503A6;">IPC Technologies for request-reply interactions:</mark>
- ``gRPC`` (https://grpc.io/0)
- REST (https://ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm)
- ``GrapghQL`` (https://graphql.org/)

Internal APIs for service-to-service communication are implemented with high-performance RPC frameworks, e.g. gRPC.

External APIs, available to the public, are frameworks usually based on HTTP

### <mark style="background: #FFF503A6;">The Hypertext Transfer Protocol (HTTP)</mark>

HTTP is a request-reply protocol used to encode and transport information between a client and a server
- The client sends a request message to the server’s API endpoint
- The server replies back with a response message

Used to deliver resources across the World Wide Web (WWW).
![[Pasted image 20251009100701.png]]

### <mark style="background: #FFF503A6;">The HTTP Request Circle</mark>

<mark style="background: #FFF503A6;">Typical HTTP request / response circle:</mark>
- The browser requests an HTML page. The server returns an HTML file.
- The browser requests a style sheet. The server returns a CSS file.
- The browser requests an JPG image. The server returns a JPG file.
- The browser requests JavaScript code. The server returns a JS file
- The browser requests data. The server returns data (in XML or JSON).

### <mark style="background: #FFF503A6;">HTTP Standards</mark>

Initiated by Tim Berners-Lee at CERN in 1989.

<mark style="background: #FFF503A6;">De facto standards:</mark>

<mark style="background: #FFF503A6;">HTTP/1.1</mark> was first documented in RFC 2068 in 1997

<mark style="background: #FFF503A6;">HTTP 2:</mark>
- Designed from the ground
- Addresses main limitation of HTPP 1.1
- Binary protocol

<mark style="background: #FFF503A6;">HTTP 3:</mark>
- Based on UDP
- Its own Transport protocol

<mark style="background: #FFF503A6;">HTTP 2 and HTTP 3:</mark>
- Not ubiquitous yet
- Need to be familiar with HTPP 1.1

### <mark style="background: #FFF503A6;">HTTP/1.1</mark>

<mark style="background: #FFF503A6;">Message is a textual block of data that contains:</mark>
- Start line
- A set of headers
- An optional body

Multiple transactions can take place over a single persistent connection

Cache support

Dynamically generated pages supported better by allowing the streaming of pages to begin before the final length of the page is known

Multiple domains can be served from a single IP address

### <mark style="background: #FFF503A6;">HTTP basic usage</mark>

<mark style="background: #FFF503A6;">Common usage:</mark>
- Use a browser to communicate across WWW.
- The browser represents a client application, while the web server responds to client requests.
- The default port used by these servers is port 80.

![[Pasted image 20251009101207.png]]

### <mark style="background: #FFF503A6;">References:</mark>

Chapter 5, R. Vitillo, Understanding Distributed Systems, 2022

https://httpwg.org/specs/rfc7231.html

https://www.w3schools.com/whatis/whatis_http.asp