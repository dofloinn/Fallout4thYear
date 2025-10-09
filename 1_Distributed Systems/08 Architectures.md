### <mark style="background: #FFF503A6;">Introduction</mark> 

Architectural model of a distributed system  

Concerned with hierarchy/placement of component parts and relationships, e.g., Client-Server (C-S) and Peer-Process models.  

Define the layer/levels of components, placement, and manner of interactions

### <mark style="background: #FFF503A6;">Architectural styles</mark>

<mark style="background: #FFF503A6;">Architecture:</mark>
- structure which defines the placement of system components, to guarantee reliability, manageability, adaptability, and cost-effectiveness  
- a consistent frame of reference  

An architectural model of a distributed system first simplifies and abstracts the functions of the individual components of a distributed system and then it considers:  
- The placement of the components across a network of computers that are seeking to define useful patterns for the distribution of data and workload;  
- The interrelationships between the components: their functional roles and the patterns of communication between them.  

In most real-world distributed systems, many different styles are combined.

### <mark style="background: #FFF503A6;">Software Architecture</mark>

The organization of distributed systems is mostly about the software components that constitute the system.  

<mark style="background: #FFF503A6;">Software architectures:</mark> tell us how the various software components are to be organized and how they should interact.

### <mark style="background: #FFF503A6;">Software and hardware service layers in distributed systems</mark>

![[Pasted image 20251009090738.png]]

### <mark style="background: #FFF503A6;">Middleware</mark>

Layer of software, which masks heterogeneity in DS, and facilitates API programming by application programmers  

It is represented by processes and objects on ‘service providing’ computers for communication and resource (files/data, code, device) sharing.  

Provides building blocks (classes, objects, interfaces, library modules) for constructing DS components  

<mark style="background: #FFF503A6;">It abstracts device-level communication requirements via, – e.g:</mark>
- Remote Method Invocation (RMI), 
- Remote Procedure Calling (RPC), 
- request/send, 
- notify, 
- selective or group communication, 
- broadcast, 
- protection/security, 
- data replication/integrity

### <mark style="background: #FFF503A6;">Architectural styles:</mark>

<mark style="background: #FFF503A6;">Basic idea:</mark>
- A style is formulated in terms of (replaceable) components with  well-defined interfaces  
- the way that components are connected to each other  
- the data exchanged between components  
- how these <mark style="background: #FFF503A6;">components</mark> and <mark style="background: #FFF503A6;">connectors</mark> are jointly configured into a system.  

<mark style="background: #FFF503A6;">Connector:</mark>
- A mechanism that mediates communication, coordination, or cooperation among components.  
- <mark style="background: #FFF503A6;">Example:</mark> facilities for (remote) procedure call, messaging, or streaming.

<mark style="background: #FFF503A6;">Several styles - the most important ones for distributed systems are:</mark>  
- Layered architectures  
- Service-oriented architectures  
- Publish-subscribe architectures  
- In most real-world distributed systems, many styles are combined.

### <mark style="background: #FFF503A6;">Layered architecture</mark>

Components are organized in a <mark style="background: #FFF503A6;">layered fashion</mark>  

It is such a universal principle that it is generally combined with most other architectural styles  

A component at layer ``Lj`` can make a <mark style="background: #FFF503A6;">downcall</mark> to a component at a lower-level layer Li (with ``i < j``), it generally expects a response.  

Only in exceptional cases will an <mark style="background: #FFF503A6;">upcall</mark> be made to a higher-level component.  

<mark style="background: #FFF503A6;">Layered architecture:</mark> major drawback is the often strong dependency between different layers

<mark style="background: #FFF503A6;">Example: communication protocols:</mark>
![[Pasted image 20251009091249.png]]

### <mark style="background: #FFF503A6;">Tiered architecture</mark>

Tiered architectures are complementary to layering.  

Layering deals with the vertical organisation of services into layers of abstraction  

Tiering is a technique to organize functionality of a given layer and place this functionality into appropriate servers and, as a secondary consideration, on to physical nodes.  

This technique is most commonly associated with the organisation of applications but it also applies to all layers of a distributed systems architecture.

### <mark style="background: #FFF503A6;">Application Layering</mark>

<mark style="background: #FFF503A6;">Traditional three-layered view:</mark>
- <mark style="background: #FFF503A6;">Application-interface layer:</mark>contains units for interfacing to users or external applications
- <mark style="background: #FFF503A6;">Processing layer:</mark> contains the functions of an application, i.e., without specific data  
- <mark style="background: #FFF503A6;">Data layer:</mark> contains the data that a client wants to manipulate through the application components  

This layering is found in many distributed information systems, using traditional database technology and accompanying applications.

### <mark style="background: #FFF503A6;">Application Layering Example: A simple search engine</mark>

<mark style="background: #FFF503A6;">A search engine dedicated to buying houses:</mark> 
- Appears as seemingly simple Websites through which someone can provide descriptors such as a city or region, a price range, the type of house, etc.  
- The back end consists of a huge database of houses currently for sale.  
- The processing layer does nothing else but transform the provided descriptors into a collection of database queries, retrieves the answers and post-processes these answers by, for example, ranking the output by relevance and subsequently generating an HTML page.

![[Pasted image 20251009091530.png]]

### <mark style="background: #FFF503A6;">Two-tier and three-tier architectures</mark>

![[Pasted image 20251009091557.png]]

### <mark style="background: #FFF503A6;">Multi-tier architectures</mark>

N-tiered (or multi-tier) solutions  

Application domain is partitioned into n logical elements, each mapped to a given server element.  

<mark style="background: #FFF503A6;">Example:</mark> Wikipedia, the web-based publicly editable encyclopaedia, adopts a multi-tier architecture to deal with the high volume of web requests – up to 60,000 page requests per second.

### <mark style="background: #FFF503A6;">Service-Oriented Architectures (SOAs)</mark>

An architectural style reflecting a more loose organization of a collection of separate, independent entities.  

Each entity encapsulates a service.  

<mark style="background: #FFF503A6;">Services:</mark> Whether they are called <mark style="background: #FFF503A6;">services</mark>, <mark style="background: #FFF503A6;">objects</mark>, or <mark style="background: #FFF503A6;">microservices</mark>, they have in common that the service is executed as a separate process (or thread).  

Running separate entities does not necessarily lower dependencies in comparison to a layered architectural style.

### <mark style="background: #FFF503A6;">SOAs: Object-based style</mark>

<mark style="background: #FFF503A6;">Essence:</mark>
- Components are objects, connected to each other through procedure calls.  
- Objects may be placed on different machines; calls can thus execute across a network.  

<mark style="background: #FFF503A6;">Encapsulation:</mark> Objects are said to encapsulate data and offer methods on that data without revealing the internal implementation.

![[Pasted image 20251009091757.png]]

### <mark style="background: #FFF503A6;">SOAs: Microservice architectural style</mark>

The service as a whole is realized as a self-contained entity although it can possibly make use of other services.  

Essential is that each microservice runs as a separate (network) process  

The implementation of a microservice could be in the form of a remote object,  

There is no common agreement on what the size of such a service should be.  

Microservice must represents a separate, independent service  

Modularization is key to designing microservices  

One of the problems with service composition is that connecting various components can easily turn into an integration nightmare.

### <mark style="background: #FFF503A6;">Resource-based architectures: RESTful architectures</mark>

View a distributed system as a collection of resources, individually managed by components.  

Resources may be added, removed, retrieved, and modified by (remote) applications.

### <mark style="background: #FFF503A6;">Resource-based architectures</mark>

1. Resources are identified through a single naming scheme  
2. All services offer the same interface  
3. Messages sent to or from a service are fully self-described  
4. After executing an operation at a service, that component forgets everything about the caller

<mark style="background: #FFF503A6;">Basic operations:</mark>
- ``PUT`` - Create a new resource  
- ``GET`` - Retrieve the state of a resource in some representation  
- ``DELETE`` - Delete a resource  
- ``POST`` - Modify a resource by transferring a new state

<mark style="background: #FFF503A6;">Example: Amazon’s Simple Storage Service (S3):</mark> Objects (i.e., files) are placed into buckets (i.e., directories). Buckets cannot be placed into buckets. Operations on ``ObjectName`` in bucket  
``BucketName`` require the following identifier:  
http://BucketName.s3.amazonaws.com/ObjectName  

<mark style="background: #FFF503A6;">Typical operations:</mark>  
- All operations are carried out by sending HTTP requests:  
- Create a bucket/object: PUT, along with the URI  
- Listing objects: GET on a bucket name  
- Reading an object: GET on a full URI

### <mark style="background: #FFF503A6;">Publish-subscribe architectures</mark>

Dependencies between processes as loose as possible  

Strong separation between processing and coordination  

View a system as a collection of autonomously operating processes.  

<mark style="background: #FFF503A6;">Coordination:</mark> the communication and cooperation between processes.

### <mark style="background: #FFF503A6;">Code migration</mark>

So far – communication assumed to pass data  

There are situations in which passing programs, sometimes even while they are being executed, simplifies the design of a distributed system.

### <mark style="background: #FFF503A6;">Reasons to migrate code: Performance</mark>

<mark style="background: #FFF503A6;">Load distribution:</mark>
- Ensuring that servers in a data center are sufficiently loaded (e.g., to prevent waste of energy)  
- Minimising communication by ensuring that computations are close to where the data is (think of mobile computing).  

<mark style="background: #FFF503A6;">Flexibility:</mark> moving code to a client when needed
![[Pasted image 20251009092325.png]]

### <mark style="background: #FFF503A6;">Reasons to migrate code</mark>

<mark style="background: #FFF503A6;">Privacy and security:</mark>
- In many cases, one cannot move data to another location, for whatever reason (often legal ones).  
- <mark style="background: #FFF503A6;">Solution:</mark> move the code to the data.  

<mark style="background: #FFF503A6;">Flexibility:</mark> If code can move between different machines, it becomes possible to dynamically configure distributed systems. 

<mark style="background: #FFF503A6;">For example:</mark>  
- A server implements a standardized interface to a file system.  
- To allow remote clients to access the file system, the server makes use of a proprietary protocol

### <mark style="background: #FFF503A6;">Paradigms for code mobility</mark>

<mark style="background: #FFF503A6;">Client-server computing:</mark> The code, execution state, and resource segment are all located at the server, and after execution, only the execution state at the server is generally modified.  

<mark style="background: #FFF503A6;">Remote evaluation:</mark> The client migrates code to the server where that code is executed and leading to a modification of the execution state at the server.  

<mark style="background: #FFF503A6;">Code-on-demand:</mark> Receiver-initiated scheme by which the client obtains code from the server, with its execution modifying the client-side execution state and operating on the client’s resources.  

<mark style="background: #FFF503A6;">Mobile agents:</mark> Follow a sender-initiated approach, moving code as well as execution state from the client to the server, operating on both the client’s and the server’s resources.

![[Pasted image 20251009092610.png]]

### <mark style="background: #FFF503A6;">System architectures:</mark>

Architectural design has a major impact on performance, reliability, and security.  

Deciding on software components, their interaction, and their placement leads to an instance of a software architecture, also known as a <mark style="background: #FFF503A6;">system architecture</mark>  

One issue that most researchers and practitioners agree upon – thinking in terms of clients that request services from servers helps to understand and manage the complexity of distributed systems  

An initial simplifications is achieved by classifying processes as  
- server process,  
- client process and  
- peer processes (processes that cooperate and communicate in a symmetrical manner)

<mark style="background: #FFF503A6;">Client-server architectures:</mark>
- Simple client-server  
- The Multi-Server model  
- The Proxy Servers and Caches mode  
- Mobile agents model  
- Thin client model  

<mark style="background: #FFF503A6;">Peer-to-peer systems</mark>  

<mark style="background: #FFF503A6;">Hybrid system architectures:</mark>
- Cloud computing  
- The edge-cloud architecture  
- <mark style="background: #FFF503A6;">Blockchain architectures:</mark> enable the registration of transactions - also referred to as distributed ledgers.

### <mark style="background: #FFF503A6;">Simple client-server architecture</mark>

Widely used, servers/clients on different computers provide services to clients/servers on different computers via request/reply messaging.  

Servers could also become clients in some services, and vice-versa, e.g., for web servers and web pages retrievals, DNS resolution, search engine-servers and web ‘crawlers’, which are all independent, concurrent and asynchronous (synchronous?) processes.

![[Pasted image 20251009092833.png]]

### <mark style="background: #FFF503A6;">The Multi-Server</mark>

A DS with multiple, interacting servers responding to parts of a given request in a cooperative manner.  

Service provision is via the partitioning and distributing of object sets, data replication, (or code migration).  
- E.g., A browser request targeting multiple servers depending on location of resource/data OR replication of data at several servers to speed up request/reply turnaround time, and guarantee availability and fault tolerance – consider the Network Information Service (NIS) replication of network login-files for user authorisation.  
- Replication is used to increase performance and availability and to improve fault tolerance. It provides multiple consistent copies of data in processes running in different computers.

![[Pasted image 20251009092944.png]]

### <mark style="background: #FFF503A6;">The Proxy Servers and Caches</mark>

A cache is a store of recently used data objects that is closer than the objects themselves.  

Caching frequently used: objects/data/code, which can be collocated at all clients, or located at a <mark style="background: #FFF503A6;">single/multiple ‘proxy’ server(s)</mark> and accessed/shared by all clients.  

When requested object/data/code is not in cache is it fetched or, sometimes, updated. E.g., clients caching of recent web pages.  

Web proxy servers provide a shared cache of web resources for the client machines at a site or across several sites. The purpose of proxy servers is to increase availability and performance of the service by reducing the load on the wide-area network and web servers. Proxy servers can take on other roles: e.g., they may be used to access remote web servers through a firewall

![[Pasted image 20251009093047.png]]

### <mark style="background: #FFF503A6;">Mobile agents model</mark>

Both code and associated data are migrated to a number of computers to carry out specified functions/tasks, and eventually  
returning results – A variant of the C-S model  

It tends to minimise delays due to communication (vis-à-vis static clients making multiple requests to servers).  

E.g., a software installation-agent installing applications on different computers for given hardware-configs; or price compare-agent checking variations in prices for a commodity; or a worm agent that looks for idle CPU cycles in cluster-computing.  

Caution: security threat due to potential ‘Trojan Horse’ problem in  migrated code, incomplete exec or ‘hanging’ of agents.  

The mobile agents may not be able to complete their tasks if they are refused access to the information they need.

Can also help improve performance by exploiting parallelism  

<mark style="background: #FFF503A6;">For example: Searching for information in the Web</mark>  
- Implement a search query in the form of a small mobile agent (program), that moves from site to site.  
- By making several copies of such a program, and sending each off to different sites, we may be able to achieve a linear speed-up compared to using just a single program instance.  
- Mobile agents have never become overly successful because they did not really offer an obvious advantage over other technologies

### <mark style="background: #FFF503A6;">Thin Client model</mark>

Each client computer supports a layer of software which invokes a remote <mark style="background: #FFF503A6;">compute server</mark> for computational services  - A variant of the C-S/Network computer model,  

The compute server will typically be a multiprocessor or cluster computer.  

If the application is interactive and results are due back to client- user, delays and communication can eclipse any advantages

![[Pasted image 20251009093304.png]]

<mark style="background: #FFF503A6;">Drawbacks:</mark> delays experienced by users can be increased to unacceptable levels by the need to transfer images and vector information between the thin client and the application process, due to both network and operating system latencies.  

<mark style="background: #FFF503A6;">Thin client concept has led to the emergence of virtual network computing (VNC):</mark>
- providing remote access to graphical user interfaces  
- a VNC client (or viewer) interacts with a VNC server through a VNC protocol.  
- <mark style="background: #FFF503A6;">Examples:</mark> RealVNC, Apple Remote Desktop, TightVNC, Aqua Connect

### <mark style="background: #FFF503A6;">Peer-to-peer (P2P) systems</mark>

Without any distinction between servers and clients.  

All processes interact and cooperate in servicing requests.  

Processes are able to maintain consistency and needed synchronisation of actions; and pattern of communication depends on the application.  

E.g., consider a ‘whiteboard’ application where multiple peer processes interact to modify a shared picture file – interactions and synch done via middleware layer for notification/group comm.

![[Pasted image 20251009093509.png]]

### <mark style="background: #FFF503A6;">P2P systems characteristics</mark>

Their design ensures that each user contributes resources to the system.  

They may differ in the resources that they contribute, but all the nodes in a peer-to-peer system have the same functional capabilities and responsibilities.  

Their correct operation does not depend on the existence of any centrally administered systems.  

They can be designed to offer a limited degree of anonymity to the providers and users of resources.  

<mark style="background: #FFF503A6;">A key issue for their efficient operation:</mark> the choice of an algorithm for the placement of data across many hosts and subsequent access to it in a manner that balances the workload and ensures availability without adding undue overheads.

### <mark style="background: #FFF503A6;">Peer-to-peer architecture</mark>

![[Pasted image 20251009093624.png]]

### <mark style="background: #FFF503A6;">P2P: issues to handle</mark>

<mark style="background: #FFF503A6;">Connectivity:</mark> how to find and connect other P2P nodes that are running in the network. Unlike traditional servers, they don't have a fixed, known IP address  

<mark style="background: #FFF503A6;">Instability:</mark> nodes may always be joining and leaving the network  

<mark style="background: #FFF503A6;">Message routing:</mark> how messages should be routed to get from one node to another. The two nodes may not directly know about each other  

<mark style="background: #FFF503A6;">Searching:</mark> how to find desired information from the nodes connected to the network  

<mark style="background: #FFF503A6;">Security - extra issues including:</mark>
- nodes being able to trust other nodes,  
- preventing malicious nodes from doing corrupting the P2P network or the individual nodes,  
- being able to send and receive data anonymously, etc.

### <mark style="background: #FFF503A6;">P2P generations</mark>  

<mark style="background: #FFF503A6;">Three generations of peer-to-peer system and application development can be identified:</mark>
- <mark style="background: #FFF503A6;">The first generation</mark> was launched by the Napster music exchange service  
- <mark style="background: #FFF503A6;">A second generation</mark> of files sharing applications offering greater scalability, anonymity and fault tolerance followed: Freenet, Gnutella, Kazaa and BitTorrent  
- The third generation - middleware layers for the application- independent management of distributed resources on a global scale.  

<mark style="background: #FFF503A6;">The third generation</mark> is designed to place resources (data objects, files) on a set of computers that are widely distributed throughout the Internet and to route messages to them on behalf of clients: 
- relieving clients of any need to make decisions about placing resources and to hold information about the whereabouts of the resources they require.  
- <mark style="background: #FFF503A6;">Examples include:</mark> Pastry, Tapestry, CAN, Chord and Kademlia

### <mark style="background: #FFF503A6;">Cloud computing</mark>

Make a distinction between four layers  
- <mark style="background: #FFF503A6;">Hardware:</mark> Processors, routers, power and cooling systems. Customers normally never get to see these. 
- <mark style="background: #FFF503A6;">Infrastructure:</mark> Deploys virtualisation techniques. Evolves around allocating and managing virtual storage devices and virtual servers. 
- <mark style="background: #FFF503A6;">Platform:</mark> Provides higher-level abstractions for storage and such. Example: Amazon S3 storage system offers an API for (locally created) files to be organized and stored in so-called buckets. 
- <mark style="background: #FFF503A6;">Application:</mark> Actual applications, such as office suites (text processors, spreadsheet applications, presentation applications). Comparable to the suite of apps shipped with OSes.
![[Pasted image 20251009094052.png]]

### <mark style="background: #FFF503A6;">Edge-server architecture</mark>

Systems deployed on the Internet where servers are placed at the edge of the network - the boundary between enterprise networks and the actual Internet.

![[Pasted image 20251009094230.png]]

### <mark style="background: #FFF503A6;">Edge-server architecture: Example</mark>

<mark style="background: #FFF503A6;">Universities:</mark> Many universities reside on a campus consisting of various buildings, each having their own local network, in turn connected through a campuswide network.  

As part of the campus, there may be multiple on-premise services for storage, computing, security, lectures, and so on.  

Much of the traffic related to those services will never leave the campus network, and the network together with its servers and services form a typical <mark style="background: #FFF503A6;">edge infrastructure</mark>.  

At the same time, such servers may be connected to those of other universities and perhaps even making use of, again, other servers.  

Instead of setting up connections between universities in a peer-to-peer fashion, we also see configurations in which various universities share services through a logically centralised infrastructure.  

Such an infrastructure may be situated “in the cloud,” but it may equally well have been set up through a regional infrastructure using locally available data centres.

### <mark style="background: #FFF503A6;">Reasons for having an edge infrastructure:</mark>

Why not connect to the cloud service directly, using existing and often excellent networking facilities?  

<mark style="background: #FFF503A6;">Commonly used (and often misconceived) arguments</mark>  

<mark style="background: #FFF503A6;">Latency and bandwidth:</mark> Especially important for certain real-time applications, such as augmented/virtual reality applications; (semi-)autonomous driving.  

<mark style="background: #FFF503A6;">Reliability:</mark> 
- The connection to the cloud is often assumed to be unreliable, which is often a false assumption.  
- There may be critical situations in which extremely high connectivity guarantees are needed (e.g. hospitals, factories)  

<mark style="background: #FFF503A6;">Security and privacy:</mark>
- The implicit assumption is often that when assets are nearby, they can be made better protected. Practice shows that this assumption is generally false.  
- Securely handling data operations in the cloud may be trickier than within your own organisation.

### <mark style="background: #FFF503A6;">Summary</mark>

Most distributed systems are arranged according to one of a variety of architectural models.  

The client-server model is prevalent – the Web and other Internet services such as ftp, news and mail , DNS are based on C-S model.  

Services such as DNS that have large numbers of users and manage a vast amount of information are based on multiple servers and use data partition and replication to enhance availability and fault tolerance.  

Caching by clients and proxy servers is widely used to enhance the performance of service.

### <mark style="background: #FFF503A6;">References:</mark>

Chapter 2: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, 5/E  

Chapter 2: Maarten van Steen, Andrew S. Tanenbaum, Distributed Systems, 4th edition (2023)