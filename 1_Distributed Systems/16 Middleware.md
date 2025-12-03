### <mark style="background: #FFF503A6;">Middleware</mark>

Commonly heard term  

But no generally agreed meaning  

<mark style="background: #FFF503A6;">In the context of client server systems:</mark>
- Supports communication between clients and servers  
- Communication passes through intermediate software layers - the middleware  

<mark style="background: #FFF503A6;">In the context of distributed system:</mark> A separate layer of software that is logically placed on top of the respective operating systems of the computers that are part of the system

### <mark style="background: #FFF503A6;">Middleware</mark>  

<mark style="background: #FFF503A6;">Attributes:</mark>
- Provides services to applications
- Requires system resources, dependencies 
- Has vulnerabilities and constraints
- May or may not implement its own access control model  
- Developer may not have control over its design  
- Provides a consistent programming model

<mark style="background: #FFF503A6;">Contains:</mark> Commonly used components and functions that need  
NOT be implemented by applications separately.  

The term middleware applies to a software layer that provides a programming abstraction as well as masking the heterogeneity of the underlying:
- networks,  
- hardware,  
- operating systems, and  
- programming languages

### <mark style="background: #FFF503A6;">Distributed systems middleware</mark>

<mark style="background: #FFF503A6;">Middleware:</mark> the OS of distributed systems. A manager of resources offering its applications to efficiently share and deploy those resources across a network.

![[Pasted image 20251116181800.png]]

### <mark style="background: #FFF503A6;">Common Middleware Services:</mark> 
- Resource management
- Facilities for interapplication communication  
- Security services – Access control, Authentication
- Accounting services
- Masking of and recovery from failures.
- Naming, Location, Service discovery, Replication
- Protocol handling, Communication faults, QoS
- Synchronisation, Concurrency, Transactions, Storage

### <mark style="background: #FFF503A6;">Middleware services</mark>  

<mark style="background: #FFF503A6;">Middleware provides location transparency:</mark>
- <mark style="background: #FFF503A6;">RPC:</mark> the client that calls a procedure cannot tell whether the procedure runs in the same process or in a different process, different computer.
- <mark style="background: #FFF503A6;">RMI:</mark> object making the invocation cannot tell whether the object it invokes is local or not; 
- <mark style="background: #FFF503A6;">EBP:</mark> the generating/receiving – not aware of one anothers’ locations  

<mark style="background: #FFF503A6;">Protocol abstraction:</mark> independent of underlying transport protocols

<mark style="background: #FFF503A6;">OS heterogeneity:</mark> independent of the underlying operating system  

<mark style="background: #FFF503A6;">Hardware independence:</mark> approaches to external data representations hide the differences due to hardware architectures, such as byte ordering.  

<mark style="background: #FFF503A6;">Multi-language support:</mark>
- Allows clients written in one language to invoke methods in objects that live in server programs written in another language.
- Achieved by using an interface definition language (IDL) to define interfaces

### <mark style="background: #FFF503A6;">Middleware services</mark>

<mark style="background: #FFF503A6;">Communication:</mark> E.g. RPC - a developer need only to specify the function header expressed in a special programming language, from which the RPC subsystem can then generate the necessary code that establishes remote invocations.  

<mark style="background: #FFF503A6;">Transactions:</mark> 
- Many applications make use of multiple services that are distributed among several computers.
- Middleware generally offers special support for executing such services providing all-or-nothing feature.
- The application developer need only specify the remote services involved, and by following a standardized protocol, the  middleware makes sure that every service is invoked, or none at all.

<mark style="background: #FFF503A6;">Service composition:</mark>
- Web-based middleware can help by standardizing the way Web services are accessed and providing the means to generate their functions in a specific order.
- E.g. Web pages that combine and aggregate data from different sources.
- Well-known mashups are those based on Google maps in which maps are enhanced with extra information such as trip planners or real-time weather forecasts.  

<mark style="background: #FFF503A6;">Reliability:</mark>
- Providing enhanced functions for building reliable distributed applications, such as 
- E.g. message sent by one process is guaranteed to be received by all or no other process - such guarantees can greatly simplify developing distributed applications

### <mark style="background: #FFF503A6;">Middleware dimensions</mark>
- Request/Reply vs. Asynchronous Messaging
- Language-specific vs. Language-independent
- Proprietary vs. Standards-based
- Small-scale vs. Large-scale
- Tightly-coupled vs. Loosely-coupled components

### <mark style="background: #FFF503A6;">Asynchronous Middleware</mark>

The client is not assumed to wait for the server after issuing request  

It may continue processing before reply arrives  

Often handled using message passing – Message Oriented Middleware (MOM)

### <mark style="background: #FFF503A6;">Persistent vs. Transient</mark>

Another classification of communication, including middleware  

<mark style="background: #FFF503A6;">Persistent:</mark>
- Message life does not depend on continued sender execution
- Better at handling failures (than transient)
- Network failure not a problem
- Other failures can be handled by retry (maybe)  

<mark style="background: #FFF503A6;">Transient:</mark>
- Message life does depend on continued sender execution 
- Can have transient asynchronous 
- Both active but sender continues immediately

### <mark style="background: #FFF503A6;">Middleware – Types</mark>

No agreed classification  

<mark style="background: #FFF503A6;">Remote Procedure Call (RPC) middleware:</mark> Requests are sent through local procedure call, packaged as message, processed, responded through message, and result returned as return from call.  

<mark style="background: #FFF503A6;">Object-based or Object-Oriented Middleware (OOM):</mark>
- Java RMI
- CORBA

<mark style="background: #FFF503A6;">Message-Oriented Middleware (MOM):</mark>  
- Jakarta Messaging
- IBM MQ (https://www.ibm.com/products/mq)
- Web Services  

<mark style="background: #FFF503A6;">Publish/Subscribe Middleware:</mark> IBM Event Streams, an event-streaming platform built on open-source Apache Kafka technology (https://www.ibm.com/cloud/event-streams)  

<mark style="background: #FFF503A6;">Peer-to-peer middleware: generations</mark>  
- 3rd - Pastry, Tapestry, CAN, Chord, Kademlia  
- 2nd - Freenet, Gnutella, Kazaa and BitTorrent  
- 1st - generation: Napster

### <mark style="background: #FFF503A6;">RPC Middleware</mark> 

Allows client programs to call procedures transparently in server programs running in separate processes and in different computers from the client.  

Masks remote function calls as being local  

Request/reply paradigm - message passing  

Provides marshalling of function parameters and return value

### <mark style="background: #FFF503A6;">Advantages of RPC</mark>

<mark style="background: #FFF503A6;">Language-level pattern of function call:</mark> easy to understand for programmer  

<mark style="background: #FFF503A6;">Synchronous request/reply interaction:</mark>
- natural from a programming language point-of-view
- matches replies to requests
- built in synchronisation  

<mark style="background: #FFF503A6;">Distribution transparency (no-failure case):</mark> hides the complexity of a distributed system  

<mark style="background: #FFF503A6;">Various reliability guarantees:</mark> deals with some distributed systems aspects of failure

### <mark style="background: #FFF503A6;">Disadvantages of RPC:</mark>

<mark style="background: #FFF503A6;">Synchronous request/reply interaction:</mark>
- tight coupling between client and server
- may block for a long time
- leads to multi-threaded programming  

<mark style="background: #FFF503A6;">Distribution Transparency:</mark> Not possible to mask all problems  

<mark style="background: #FFF503A6;">Lacks notion of services:</mark> programmer not interested in server but in service  

<mark style="background: #FFF503A6;">RPC paradigm is not object-oriented:</mark> invoke methods on objects as opposed to functions on servers

### <mark style="background: #FFF503A6;">Object-Based Middleware</mark>
- Also known as Object-Oriented Middleware (OOM)  
- Objects can be <mark style="background: #FFF503A6;">local</mark> or <mark style="background: #FFF503A6;">remote</mark>  
- Object references can be <mark style="background: #FFF503A6;">local</mark> or <mark style="background: #FFF503A6;">remote</mark>
- Remote objects have visible remote interfaces
- Masks remote objects as being local using proxy objects
- Remote method invocation

### <mark style="background: #FFF503A6;">Object-Based Middleware: Properties</mark>

<mark style="background: #FFF503A6;">Support for object-oriented programming model:</mark>
- objects, methods, interfaces, encapsulation, ...  
- exceptions (also in some RPC systems)  

<mark style="background: #FFF503A6;">Location Transparency:</mark> mapping object references to locations  

<mark style="background: #FFF503A6;">Synchronous request/reply interaction:</mark> same as RPC  

Services comprising multiple servers are easier to build

### <mark style="background: #FFF503A6;">Object-Based Middleware: Disadvantages</mark>

<mark style="background: #FFF503A6;">Synchronous request/reply interaction:</mark>
- Asynchronous Method Invocation (AMI)  
- But implementations may not be loosely coupled  

<mark style="background: #FFF503A6;">Distributed garbage collection:</mark> Releasing memory for unused remote objects  

<mark style="background: #FFF503A6;">Rather static and heavy-weight:</mark> Bad for ubiquitous systems and embedded devices

### <mark style="background: #FFF503A6;">MESSAGE ORIENTED MIDDLEWARE (MOM)</mark>

<mark style="background: #FFF503A6;">Aims at high-level persistent asynchronous communication:</mark>  
- Processes send each other messages, which are queued
- Sender need not wait for immediate reply, but can do other things
- Middleware often ensures fault tolerance

Asynchronous persistent communication through support of middleware-level queues.  

Queues correspond to buffers at communication servers.  

Based on message passing  

<mark style="background: #FFF503A6;">Extensive support for persistent asynchronous communication:</mark>
- have intermediate-term storage capacity for messages
- neither sender nor receiver required to be active during transmission  

<mark style="background: #FFF503A6;">Not a new idea:</mark>
- it is how networks work  
- for example, Unix sockets  

<mark style="background: #FFF503A6;">Messages can be large</mark>  
- time in minutes
- as opposed to sockets, where seconds

Communication using <mark style="background: #FFF503A6;">messages</mark>

Messages stored in <mark style="background: #FFF503A6;">message queues</mark>  

Optional <mark style="background: #FFF503A6;">message server</mark> decouples client and server  

Various assumptions about <mark style="background: #FFF503A6;">message content</mark>

### <mark style="background: #FFF503A6;">MOM: Queues</mark>

Asynchronous persistent communication through support of middleware-level queues.  

Queues correspond to buffers at communication servers.  

Basic interface to a queue in a message-queuing system.

<table>
	<tr>
		<th>Operation</th>
		<th>Description</th>
	</tr>
	<tr>
		<th>PUT</th>
		<td>Append a message to a specified queue</td>
	</tr>
	<tr>
		<th>GET</th>
		<td>Block until the specified queue is nonempty, and remove the first message</td>
	</tr>
	<tr>
		<th>POLL</th>
		<td>Check a specified queue for messages, and remove the first. Never block.</td>
	</tr>
	<tr>
		<th>NOTIFY</th>
		<td>Install a handler to be called when a message is put into the specified queue</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">General model</mark>  

<mark style="background: #FFF503A6;">Queue managers:</mark>  
- Queues are managed by queue managers. An application can put messages only into a local queue.
- Getting a message is possible by extracting it from a local queue only
- Queue managers need to route messages

![[Pasted image 20251116185510.png]]

### <mark style="background: #FFF503A6;">Message broker</mark>

Message queuing systems assume a common messaging protocol: 
- all applications agree on message format
- i.e., structure and data representation  

<mark style="background: #FFF503A6;">Broker handles application heterogeneity in an MQ system</mark>  
- Transforms incoming messages to target format
- Often acts as an application gateway
- May provide subject-based routing capabilities
- i.e., publish-subscribe capabilities

![[Pasted image 20251116185609.png]]

### <mark style="background: #FFF503A6;">Properties of MOM</mark>

<mark style="background: #FFF503A6;">Asynchronous interaction:</mark>  
- Client and server are only loosely coupled
- Messages are queued
- Good for application integration  

<mark style="background: #FFF503A6;">Support for reliable delivery service:</mark> Keep queues in persistent storage  

<mark style="background: #FFF503A6;">Processing of messages by intermediate message server:</mark>  
- Filtering, transforming, logging, ... 
- Networks of message servers  

Natural for database integration

### <mark style="background: #FFF503A6;">Disadvantages of MOM</mark> 

<mark style="background: #FFF503A6;">Poor programming abstracting:</mark>
- Rather low-level (cf. Packets)
- Results in multi-threaded code
- Request/reply more difficult to achieve 

<mark style="background: #FFF503A6;">Message formats unknown to middleware:</mark> No type checking  

<mark style="background: #FFF503A6;">Queue abstraction only gives one-to-one communication:</mark> Limits scalability

### <mark style="background: #FFF503A6;">MOM/MQ - additional functionalities</mark> 

<mark style="background: #FFF503A6;">Transactions support:</mark> Support for the sending or receiving of a message to be contained within a transaction  

<mark style="background: #FFF503A6;">Message transformation:</mark>
- An arbitrary transformation can be performed on an arriving message.
- E.g. - to transform messages between formats to deal with heterogeneity in underlying data representations.  
- Important tool in dealing with heterogeneity  
- <mark style="background: #FFF503A6;">Message broker:</mark> Term often used to denote a service responsible for message transformation.

### <mark style="background: #FFF503A6;">Message queues vs Message Passing:</mark>  

Message queues are similar to the message-passing systems  

<mark style="background: #FFF503A6;">The difference:</mark>
- message-passing systems have implicit queues associated with senders and receivers
- message queuing systems have explicit queues that are third-party entities, separate from the sender and the receiver.  

<mark style="background: #FFF503A6;">This is the key difference that makes message queues:</mark>  
- an indirect communication paradigm
- with the crucial properties of space and time uncoupling

### <mark style="background: #FFF503A6;">MOM Examples/Toolkits</mark>

A major class of commercial middleware with key implementations including  
- IBM’s MQ (previously WebSphere MQ), 
- Amazon Simple Queue Service  
- RabbitMQ  

<mark style="background: #FFF503A6;">Other Examples:</mark>  
- <mark style="background: #FFF503A6;">Jakarta Messaging:</mark> a Java Message Oriented Middleware API create, send, and receive messages via loosely coupled, reliable asynchronous communication services.  
- Web Services  

The MOM paradigm has had a long history in distributed applications. Message Queue Services (MQS) have been in use since the 1980’s

### <mark style="background: #FFF503A6;">IBM MQ</mark>

Provides messaging and queuing capabilities for enterprise messaging: https://www.ibm.com/products/mq  

<mark style="background: #FFF503A6;">Messaging:</mark> Programs communicate by sending each other data  
in messages rather than by calling each other directly.  

<mark style="background: #FFF503A6;">Queuing:</mark> Messages are placed on queues, so that programs can run independently of each other, at different speeds and times, in different locations, and without having a direct connection between them.

### <mark style="background: #FFF503A6;">RabbitMQ</mark>

<mark style="background: #FFF503A6;">RabbitMQ:</mark>
- Implementation of Advanced Message - Queuing Protocol (AMQP)
- Free and open source 
- https://www.rabbitmq.com/

### <mark style="background: #FFF503A6;">Publish-Subscribe Middleware</mark>

<mark style="background: #FFF503A6;">Publishers</mark> publish <mark style="background: #FFF503A6;">events</mark> (messages)

<mark style="background: #FFF503A6;">Subscribers</mark> express interest in events with subscriptions

<mark style="background: #FFF503A6;">Event Service</mark> notifies interested subscribers of published events

Events can have arbitrary content or name/value pairs

### <mark style="background: #FFF503A6;">Example: Kafka</mark>

<mark style="background: #FFF503A6;">Apache Kafka:</mark> Process streams of records in real time – huge amunts  

<mark style="background: #FFF503A6;">Open source publish-subscribe messaging system:</mark>
- Allows consumers to subscribe to topics for which they want to receive messages
- Developed by LinkedIn in 2011 - open-sourced and donated Kafka to the Apache
- Written in Scala and Java  

<mark style="background: #FFF503A6;">The main functions:</mark>  
- Enables applications to publish or subscribe to data or event streams.
- Stores records in the order in which they occurred in a fault-tolerant and durable way.
- It processes records in real-time - as they occur.

### <mark style="background: #FFF503A6;">Peer-to-peer middleware</mark>

Peer-to-peer middleware systems are designed specifically to meet the need for – the automatic placement and subsequent location of the distributed objects managed by peer-to-peer systems and applications.

### <mark style="background: #FFF503A6;">Peer-to-peer middleware functions:</mark>

To simplify the construction of services that are implemented across many hosts in a widely distributed network.  

It must enable clients to locate and communicate with any individual resource made available to a service, even though the resources are widely distributed amongst the hosts.  

<mark style="background: #FFF503A6;">To have the ability:</mark>  
- to add new resources and to remove them at will, and
- to add hosts to the service and remove them.

### <mark style="background: #FFF503A6;">Non-functional requirements of peer-to-peer middleware</mark> 

<mark style="background: #FFF503A6;">Global scalability:</mark> Must be designed to support applications that access millions of objects on tens of thousands or hundreds of thousands of hosts.  

<mark style="background: #FFF503A6;">Load balancing:</mark> Achieved by a random placement of resources together with the use of replicas of heavily used resources.  

Optimisation for local interactions between neighbouring peers. The middleware should aim to place resources close to the nodes that access them the most.

<mark style="background: #FFF503A6;">Accommodating to highly dynamic host availability</mark>
- As hosts join the system, they must be integrated into the system and the load must be redistributed to exploit their resources.
- When they leave the system whether voluntarily or involuntarily, the system must detect their departure and redistribute their load and resources.

<mark style="background: #FFF503A6;">Security of data in an environment with heterogeneous trust:</mark> In global-scale systems with participating hosts of diverse ownership, trust must be built up by the use of authentication and encryption mechanisms to ensure the integrity and privacy of information  

<mark style="background: #FFF503A6;">Anonymity, deniability and resistance to censorship:</mark> Anonymity for the holders and recipients of data is a legitimate concern in many situations demanding resistance to censorship

### <mark style="background: #FFF503A6;">Structured P2P</mark>  

<mark style="background: #FFF503A6;">Make use of a semantic-free index:</mark>  
- Each data item that is to be maintained by the system is uniquely associated with a key. 
- This key is subsequently used as an index
- Common practice: use a hash function
- ``key(data item) = hash(data item’s value)``  
- P2P system now responsible for storing (key,value)pairs.  

<mark style="background: #FFF503A6;">The peer-to-peer system as a whole is now responsible for storing (key,value) pairs. To this end,  </mark>
- each node is assigned an identifier from the same set of all possible hash values, and 
- each node is made responsible for storing data associated with a specific subset of keys.  

In essence, the system is thus seen to implement a distributed hash table (DHT)

### <mark style="background: #FFF503A6;">Example: Chord system</mark> 

Given a key, it will determine the node responsible for storing the key's value  

<mark style="background: #FFF503A6;">Principle:</mark>
- Nodes are logically organized in a ring at ``hash(IP address)``  
- Each node has an <mark style="background: #FFF503A6;">m-bit identifier</mark>. 
- Each data item is hashed to an <mark style="background: #FFF503A6;">m-bit key</mark>. 
- Data item with key k is stored at node with smallest identifier ``id ≥ k`` , called the <mark style="background: #FFF503A6;">successor</mark> of ``key k`` .
- The ring is extended with various shortcut links to other nodes.

### <mark style="background: #FFF503A6;">Unstructured peer-to-peer systems</mark>

In an unstructured peer-to-peer system, each node maintains an ad hoc list of neighbors.  

Structured peer-to-peer systems attempt to maintain a specific, deterministic overlay network.  

When a node joins, it often contacts a well-known node to obtain a starting list of other peers in the system.  

This list can then be used to find more peers, and perhaps ignore others, and so on.  

Unlike structured peer-to-peer systems, looking up data cannot follow a predetermined route when lists of neighbors are constructed in an ad hoc fashion.  

Instead, in an unstructured peer-to-peer systems, we really need to resort to searching for data

### <mark style="background: #FFF503A6;">P2P Example: BitTorrent</mark>

Peer-to-peer file downloading system - (Mainly) unstructured  

An important design goal was to ensure collaboration.  

When an end user is looking for a file, it downloads chunks of the file from other users until the downloaded chunks can be assembled together - yielding the complete file.

### <mark style="background: #FFF503A6;">Middleware and Enterprise Application Integration (EAI)</mark>  

Middleware offers communication facilities for integration  

<mark style="background: #FFF503A6;">RPC:</mark> Requests are sent through local procedure call, packaged as message, processed, responded through message, and result returned as return from call.  

<mark style="background: #FFF503A6;">MOM:</mark> Messages are sent to logical contact point (published), and forwarded to subscribed applications.

![[Pasted image 20251116192259.png]]

<mark style="background: #FFF503A6;">Middleware:</mark> in the form of a distributed system can significantly help in integration by providing the right facilities such as support for RPCs or messaging.  

Supporting enterprise application integration is an important goal and target field for many middleware products

### <mark style="background: #FFF503A6;">Criteria for selecting middleware</mark>

<mark style="background: #FFF503A6;">Suitability:</mark>
- integration of software/hardware aspects of architectures
- Users will only be satisfied if their middleware–OS combination has good performance.
- Middleware runs on a variety of OS–hardware combinations (platforms) at the nodes of a distributed system.  

<mark style="background: #FFF503A6;">Integration of applications:</mark> standards and middleware technology considerations  

Reliability and robustness  

Transparency  

Risks and cost aspects

<mark style="background: #FFF503A6;">Strength of product support:</mark>
- The maturity and stability of the tool;
- The fault tolerance provided by the tool;
- The availability of developer tools;  
- Maintainability; 
- Code reuse  

Security characteristics

### <mark style="background: #FFF503A6;">Middleware: Security Goals</mark>

Engineer application to depend on middleware only as much as necessary, in view of middleware’s capabilities, liabilities and constraints  

Engineer system to account for middleware’s capabilities, liabilities and constraints.

### <mark style="background: #FFF503A6;">Middleware – limitations</mark> 

Many distributed applications rely entirely on the services provided by the available middleware to support their needs for communication and data sharing.  

E.g., systems constrained by use of only RMI for communication and data sharing – consider a C-S model for request/reply of names and addresses in a database.  

Abstraction and full ‘independence’ of application layer is not achieved, yet!  

E.g., consider a C-S-based mail service provider where a server must add its own error detection/recovery mechanism for retransmission if a link breaks on large transmissions. Or vice-versa, is possible.  

Arguably, error detection/recovery needs to be at several levels, not only at middleware

### <mark style="background: #FFF503A6;">References</mark>

Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, Section 5.1  

Chapter 2: Maarten van Steen, Andrew S. Tanenbaum, Distributed Systems, 4th edition (2025)  

Stoica I., Morris R., Liben-Nowell D., Karger D. R., Kaashoek M. F., Dabek F., and Balakrishnan H. Chord: A Scalable Peer-to-peer Lookup Protocol for Internet Applications. IEEE/ACM Transactions on Networking, 11(1):17–32, Feb. 2003. → 91, 333, 336  

https://www.ibm.com/cloud/learn/middleware  

https://www.ibm.com/cloud/learn/apache-kafka