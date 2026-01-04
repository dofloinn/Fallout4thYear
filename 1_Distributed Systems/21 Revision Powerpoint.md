### <mark style="background: #FFF503A6;">What is a Distributed System (DS)?</mark>

Multiple computers working together on one task  

Computers are connected by a network, and exchange information  

<mark style="background: #FFF503A6;">Key motivation for DS is Sharing resources, e.g:</mark>  
- data storage,  
- printers, files, databases,  
- programs/applications,  
- multimedia services: camera video/image, frames, audio/phone data

### <mark style="background: #FFF503A6;">Types of distributed systems</mark>

<mark style="background: #FFF503A6;">High performance distributed computing systems:</mark> 
- Started with parallel computing  
- Distributed shared memory systems  
- Cluster computing - a group of high-end systems connected through a LAN  
- Grid computing
- Cloud computing

<mark style="background: #FFF503A6;">Distributed information systems:</mark> Integrating applications  

Distributed systems for pervasive computing

### <mark style="background: #FFF503A6;">Middleware and distributed systems</mark>

<mark style="background: #FFF503A6;">Middleware - the OS of distributed systems:</mark>
- middleware is to a distributed system what an operating system is to a computer  
- a manager of resources offering its applications to efficiently share and deploy those resources across a network.

<mark style="background: #FFF503A6;">What does it contain?</mark>
- Commonly used components and functions that need not be implemented by applications separately.

![[Pasted image 20251204092100.png]]

### <mark style="background: #FFF503A6;">DS Characteristics</mark>

<mark style="background: #FFF503A6;">Concurrency:</mark> Collaborative and cooperative problem-solving (interdependencies)  

<mark style="background: #FFF503A6;">Independent failures of components:</mark> Autonomous but interdependent - requires coordination, graceful degradation  

<mark style="background: #FFF503A6;">Lack of global clocks:</mark>  
- Each node is autonomous and will thus have its own notion of time: there is no global clock.  
- Leads to fundamental synchronisation and coordination problems.  

<mark style="background: #FFF503A6;">Heterogeneity:</mark> Hardware/software (programs, data) variations in component systems

### <mark style="background: #FFF503A6;">DS Characteristics</mark>

<mark style="background: #FFF503A6;">Openness:</mark> Modularity, architecture and standards allow extensibility  

<mark style="background: #FFF503A6;">Security:</mark> Protection (internal and external) against malicious use or attack - integrity  

<mark style="background: #FFF503A6;">Scalability:</mark> Accommodation of increased users and resource demands over time  

<mark style="background: #FFF503A6;">Transparency:</mark> Hide separation of components (hidden by middleware)

### <mark style="background: #FFF503A6;">Scalability: more performance</mark>

<mark style="background: #FFF503A6;">Our computing needs exceed CPU advances:</mark>
- Movie rendering
- Google search queries (99,000 search queries every second (approximately). Uses hundreds of thousands of servers to do this)

<mark style="background: #FFF503A6;">What if we need more performance than a single CPU?</mark>  
- Combine CPUs - multiprocessors, or  
- Create distributed systems

### <mark style="background: #FFF503A6;">Examples of Distributed Systems</mark>  
- The Internet  
- Multiplayer Games  
- Stock markets  
- Web Search

### <mark style="background: #FFF503A6;">DS Challenges</mark>

<mark style="background: #FFF503A6;">Fundamental issue:</mark>
- Different nodes have different knowledge.  
- One node does not know the status of other nodes in the network  

If each node knew exactly the status at all other nodes in the network, computing would be easy: Impossible, theoretically and practically

<mark style="background: #FFF503A6;">Theoretical issue:</mark> Knowledge cannot be perfectly up to date  

<mark style="background: #FFF503A6;">Information transmission speed:</mark> hardware and software limitations of the nodes & network  

New things can happen while information is traveling from node A to node B  

B can never be perfectly up to date about the status of A

### <mark style="background: #FFF503A6;">Practical Challenges</mark> 

<mark style="background: #FFF503A6;">Communication is costly:</mark> It is not practical to transmit everything from A to B all the time 

<mark style="background: #FFF503A6;">There are many nodes:</mark> Transmitting updates to all nodes and receiving updates from all nodes are even more impractical

### <mark style="background: #FFF503A6;">DS Challenges - Heterogeneity</mark>

<mark style="background: #FFF503A6;">Heterogeneity (variety and difference) applies to:</mark>  
- <mark style="background: #FFF503A6;">Networks:</mark> differences are masked by the fact that all of the computers use the Internet protocols to communicate.  
- <mark style="background: #FFF503A6;">Hardware:</mark> data types, such as integers, may be represented in different ways on different sorts of hardware (byte ordering: big-endian, little-endian)  
- <mark style="background: #FFF503A6;">Operating systems:</mark> do not provide the same application API to the Internet protocols.  
- <mark style="background: #FFF503A6;">Programming languages:</mark> used different representations for characters and data structures, such as arrays and records.  
- <mark style="background: #FFF503A6;">Developers:</mark> representation of primitive data items and data structures needs to be agreed upon (standards)

<mark style="background: #FFF503A6;">Middleware:</mark>
- Software layer that provides a programming abstraction as well as masking the heterogeneity of the underlying networks, hardware, operating systems and programming languages 
- All middleware deals with the differences in operating systems and hardware.  

<mark style="background: #FFF503A6;">Mobile code:</mark>
- The code that can be sent from one computer to another and run at the destination.  
- Machine code suitable for running on one type of computer hardware is not suitable for running on another
- Virtual machines approach provides a way of making code executable on any hardware: the compiler for a particular language generates code for a virtual machine instead of a particular hardware order code.

### <mark style="background: #FFF503A6;">DS Challenges - Openness</mark> 

The characteristic that determines whether the system can be extended and re-implemented in various ways.  

Can it be extended with new content/services without disruption to the underlying system?  

Key interfaces/standards are published  

<mark style="background: #FFF503A6;">Standards:</mark>
- Request For Comments (RFC)s  
- IETF  
- W3C  

Everything conforms to a standard!

<mark style="background: #FFF503A6;">Open systems:</mark> key interfaces are published:  

<mark style="background: #FFF503A6;">Open distributed systems</mark> are based on the provision of a uniform communication mechanism and published interfaces for access to shared resources.  

They can be constructed from heterogeneous hardware and software possibly from different vendors

### <mark style="background: #FFF503A6;">DS Challenges - Security</mark>

Focuses on how to ensure authorised access to resources.  

<mark style="background: #FFF503A6;">Three main issues:</mark>
- <mark style="background: #FFF503A6;">Confidentially:</mark> protection against unauthorised information disclosure  
- <mark style="background: #FFF503A6;">Integrity:</mark> protection against unauthorised information modification  
- <mark style="background: #FFF503A6;">Availability:</mark> protection against unauthorised denial of use - interference with the means to access the resources

### <mark style="background: #FFF503A6;">DS Challenges - Scalability</mark>

A system is scalable if it will remain effective during a significant increase in the number of resources and the number of users  

<mark style="background: #FFF503A6;">Control cost of physical resources:</mark>
- For a system with n users to be scalable, the quantity of physical resources required to support them should be at most O(n) - that is, proportional to n.
- E.g., if a single file server can support 20 users, then two such servers should be able to support 40 users.

<mark style="background: #FFF503A6;">Avoid performance bottle neck:</mark>
- Algorithms should be decentralised to avoid having performance bottlenecks.  
- Predecessor of the Domain Name System (DNS) kept the name table in a single master file that could be downloaded to any computers that needed it - fine with a few hundred computers.  
- The DNS removed the bottleneck by partitioning the name table between servers located throughout the Internet and administered locally.  

<mark style="background: #FFF503A6;">Scalability techniques:</mark> Replicated data, caching, multiple servers etc.

### <mark style="background: #FFF503A6;">Techniques for scaling</mark>

<mark style="background: #FFF503A6;">Hide communication latencies:</mark>
- Make use of asynchronous communication  
- Have separate handler for incoming response  
- <mark style="background: #FFF503A6;">Problem:</mark> not every application fits this model
  
<mark style="background: #FFF503A6;">Partition data and computations across multiple machines:</mark> 
- Move computations to clients (scripts)
- Decentralised naming services (DNS)
- Decentralised information systems (WWW)

<mark style="background: #FFF503A6;">Replication and caching:</mark>
- Make copies of data available at different machines  
- Replicated file servers and databases  
- Mirrored Websites  
- Web caches (in browsers and proxies)  
- File caching (at server and client)

### <mark style="background: #FFF503A6;">DS Challenges - Failure Handling</mark>  

Failures in distributed systems are mostly partial failures which can make failure handling more difficult  

<mark style="background: #FFF503A6;">Detecting failures:</mark> Checksums  

<mark style="background: #FFF503A6;">Masking failures:</mark>
- retransmission  
- duplicate files

<mark style="background: #FFF503A6;">Tolerating failures:</mark> Web pages (informing users about failure)

<mark style="background: #FFF503A6;">Recovery:</mark> permanent data ‘rolled back’

<mark style="background: #FFF503A6;">Redundancy (use of redundant components)</mark>
- Duplication in routes, hardware,  
- DNS - every name table replicated in at least two different servers,  
- Databases - replicated in several servers  

<mark style="background: #FFF503A6;">Availability:</mark> measure of the proportion of time a system is available for use.  

DS provide a high degree of availability regarding hardware faults.

### <mark style="background: #FFF503A6;">DS Challenges - Concurrency</mark>

Resources can be shared by clients in a distributed system - several clients may access a shared resource at the same time  

Not acceptable that each request be processed in turn - must be able to process requests concurrently

<mark style="background: #FFF503A6;">Data consistency:</mark> For each ‘object’ that represents a shared resource, its operations must be synchronised in such a way that its data remains consistent

### <mark style="background: #FFF503A6;">Distribution Transparency:</mark>

Hide distribution from users and from software  

<table>
	<tr>
		<th>Transparency</th>
		<th>Description</th>
	  </tr>
	  <tr>
		  <th>Access</th>
		  <td>Hide differences in data representation and how an object is accessed</td>
	  </tr>
	  <tr>
		  <th>Location</th>
		  <td>Hide where an object is located</td>
	  </tr>
	  <tr>
		  <th>Relocation</th>
		  <td>Hide that an object may be moved to another location while in use</td>
	  </tr>
	  <tr>
		  <th>Migration</th>
		  <td>Hide that an object may move to another location</td>
	  </tr>
	  <tr>
		  <th>Replication</th>
		  <td>Hide that an object is replicated</td>
	  </tr>
	  <tr>
		  <th>Concurrency</th>
		  <td>Hide that an object may be shared by several independent users</td>
	  </tr>
	  <tr>
		  <th>Failure</th>
		  <td>Hide the failure and recovery of an object</td>
	  </tr>
</table>

### <mark style="background: #FFF503A6;">DS Challenges - Transparency</mark>

<mark style="background: #FFF503A6;">Access transparency:</mark>
- Enables local and remote resources to be accessed using identical operations.  
- E.g. A GUI with folders, which is the same whether the files are local or remote.  

<mark style="background: #FFF503A6;">Location transparency:</mark>
- Enables resources to be accessed without knowledge of their location  
- <mark style="background: #FFF503A6;">Naming:</mark> plays an important role in achieving location transparency.
- E.g. uniform resource locator(URL), https://www.distributed-systems.net/ - does not give the actual location of the Web server where this (DS) book is offered.

<mark style="background: #FFF503A6;">Relocation</mark>
- supports the mobility of processes and resources initiated by users, without affecting ongoing communication and operations.  
- becoming increasingly important in the context of cloud computing: where services are provided by huge collections of remote servers.  
- E.g. communication between mobile phones - people walking, moving  

<mark style="background: #FFF503A6;">Replication transparency:</mark>
- enables multiple instances of resources to be used; e.g. one can take over when another fails.
- increases reliability and performance without knowledge of the replicas by users or application programmers

<mark style="background: #FFF503A6;">Concurrency transparency:</mark> Enables several processes to operate concurrently using shared resources without interference between them.

<mark style="background: #FFF503A6;">Failure transparency:</mark> 
- enables the concealment of faults, allowing users and application programs to complete their tasks despite the failure of hardware or software components.  
- Email is eventually delivered, even when servers or communication links fail.

### <mark style="background: #FFF503A6;">Foundations</mark> 

<mark style="background: #FFF503A6;">Network communication protocols:</mark>
- the basis for any distributed system  
- protocols developed for the Internet  

<mark style="background: #FFF503A6;">An adapted network layering scheme:</mark>
![[Pasted image 20251204094328.png]]

### <mark style="background: #FFF503A6;">Interprocess communication</mark>

At the heart of all distributed systems

<mark style="background: #FFF503A6;">To communicate:</mark>
- one process sends a message (a sequence of bytes) to a destination  
- another process at the destination receives the message.  

This activity involves the communication of data from the sending process to the receiving process may involve the synchronisation of the two processes.

### <mark style="background: #FFF503A6;">Middleware layer</mark>

Middleware is invented to provide common services and protocols that can be used by many different applications  
- A rich set of communication protocols  
- (Un)marshalling of data, necessary for integrated systems  
- Naming protocols, to allow easy sharing of resources  
- Security protocols for secure communication  
- Scaling mechanisms, such as for replication and caching  

The rest are truly <mark style="background: #FFF503A6;">application-specific</mark> protocols

### <mark style="background: #FFF503A6;">Middleware protocols</mark>

<mark style="background: #FFF503A6;">Domain Name System (DNS):</mark>
- Distributed service that is used to look up a network address associated with a name.
- Offering a general-purpose, application-independent service - forms part of the middleware.  
- <mark style="background: #FFF503A6;">Authentication protocols:</mark> provide proof of a claimed identity.  
- <mark style="background: #FFF503A6;">Distributed commit protocols:</mark> establish that in a group of processes, possibly spread out across a number of machines, either all processes carry out a particular operation, or that the operation is not carried out at all.  
- <mark style="background: #FFF503A6;">Distributed locking protocols:</mark> a resource can be protected against simultaneous access by a collection of processes that are distributed across multiple machines.

### <mark style="background: #FFF503A6;">Multicast communication</mark>  

The basic idea is to disseminate information from <mark style="background: #FFF503A6;">one</mark> sender to <mark style="background: #FFF503A6;">multiple</mark> receivers.  

An operation that sends a single message from one process to each of the members of a group of processes - usually in such a way that the membership of the group is transparent to the sender.  

Can span multiple physical networks  

There is a range of possibilities in the desired behaviour of a multicast.  

The simplest multicast protocol provides no guarantees about message delivery or ordering.

### <mark style="background: #FFF503A6;">Multicast</mark>  

One-to-many or many-to-many distribution  

<mark style="background: #FFF503A6;">In computer networking:</mark> Group communication where information is addressed to a group of destination computers simultaneously  

<mark style="background: #FFF503A6;">Group communication, either:</mark>
- application layer multicast  
- network assisted multicast 
- makes it possible for the source to efficiently send to the group in a single transmission  

<mark style="background: #FFF503A6;">Network assisted multicast:</mark> May be implemented at the Internet layer using IP multicast

### <mark style="background: #FFF503A6;">Multicast: different ways</mark>

<mark style="background: #FFF503A6;">Multicast communication can also be accomplished in other ways than setting up explicit communication paths:</mark>
- Application-level multicasting  
- Flooding-based multicasting  
- Gossip-based data dissemination

### <mark style="background: #FFF503A6;">IP Multicast Protocol</mark>

Built on top of the Internet Protocol  

An implementation of multicast communication  

IP packets are addressed to computers - ports belong to the TCP and UDP levels  

IP multicast allows the sender to transmit a single IP packet to a set of computers that form a multicast group.

### <mark style="background: #FFF503A6;">IP multicasting</mark>

Designed to span multiple physical networks.  

No central coordinator and no restriction on the number of hosts that can be in a group  

<mark style="background: #FFF503A6;">Provides network efficiency:</mark>
- Packets in a multicast stream only need to be replicated when a router needs to send them to multiple network links.
- Only one stream of packets is needed on any network segment regardless of the number of receivers.

<mark style="background: #FFF503A6;">At the application programming level:</mark> 
- IP multicast is available only via UDP.  
- An application program performs multicasts by sending UDP datagrams with multicast addresses and ordinary port numbers.  
- It can join a multicast group by making its socket join the group, enabling it to receive messages to the group

<mark style="background: #FFF503A6;">At the IP level:</mark>
- A computer belongs to a multicast group when one or more of its processes has sockets that belong to that group.  
- When a multicast message arrives at a computer, copies are forwarded to all of the local sockets that have joined the specified multicast address and are bound to the specified port number.

### <mark style="background: #FFF503A6;">Multicasting</mark>

<mark style="background: #FFF503A6;">Broader than unicast:</mark> one sender and one receiver, point-to-point communication  

Narrower and more targeted than broadcast communication.  

Sends data from one host to many different hosts, but not to everyone; The data only goes to clients that have expressed an interest by joining a particular multicast group.  

<mark style="background: #FFF503A6;">Used for ‘public meetings’ on the Internet:</mark>
- a multicast socket sends a copy of the data to a location close to the parties that have declared an interest in the data;
- the data is duplicated only when it reaches the local network serving the interested clients;
- the data crosses the Internet only once.

### <mark style="background: #FFF503A6;">IP Multicast Use</mark> 

<mark style="background: #FFF503A6;">Initially:</mark> Internet radio, NASA shuttle missions, collaborative gaming  

<mark style="background: #FFF503A6;">IPTV (Internet Protocol Television):</mark>
- Cable TV networks are moving to IP delivery
- Multicast allows one stream of data to be sent to multiple subscribers using a single address
- <mark style="background: #FFF503A6;">Reduces:</mark> number of servers and number of duplicate network streams

### <mark style="background: #FFF503A6;">Concurrency in distributed systems</mark>

Fundamental to distributed systems is the concurrency and collaboration among multiple processes.

<mark style="background: #FFF503A6;">Concurrency in distributed systems:</mark>  
- Concurrent requests to its resources  
- Each resource must be designed to be safe in a concurrent environment

### <mark style="background: #FFF503A6;">Mutual exclusion</mark>

In many cases, processes will need to simultaneously access the same resources.  

To prevent that such concurrent accesses corrupt the resource, or make it inconsistent, solutions are needed to grant mutual exclusive access by processes.  

<mark style="background: #FFF503A6;">Mutual exclusion:</mark> making sure that only one process or thread accesses a resource at a time.  

<mark style="background: #FFF503A6;">For example:</mark> 
- One process may have to wait for another  
- Critical sections of shared resource may require exclusive access

### <mark style="background: #FFF503A6;">Mutual exclusion examples:</mark>  

Update a field in a database's tables  

Modify a shared file  

Modify file contents that are replicated on multiple servers

### <mark style="background: #FFF503A6;">Threads</mark>

Sometimes called <mark style="background: #FFF503A6;">lightweight processes</mark>  

A <mark style="background: #FFF503A6;">thread</mark> is a single sequential flow of execution that runs through a program.  

Threads exist within a process - every process has at least one  

Unlike a process, a thread does not have a separate allocation of memory, but shares memory with other threads created by the same application.  

Thread context switching can be done entirely independent of the operating system.

### <mark style="background: #FFF503A6;">Thread usage in distributed systems</mark>

Provide a way of allowing blocking system calls without blocking the entire process in which the thread is running  

Allows maintaining multiple logical connections at the same time.

### <mark style="background: #FFF503A6;">Using threads at the client side</mark>

<mark style="background: #FFF503A6;">Multiple request-response calls to other machines (RPC):</mark>
- A client does several calls at the same time, each one by a different thread.  
- It then waits until all results have been returned

### <mark style="background: #FFF503A6;">Using threads at the server side</mark>

<mark style="background: #FFF503A6;">Improve performance:</mark>
- Starting a thread is cheaper than starting a new process.  
- Having a single-threaded server prohibits simple scale-up to a multiprocessor system.  
- As with clients: hide network latency by reacting to next request while previous one is being replied to.  

<mark style="background: #FFF503A6;">Better structure:</mark>
- Most servers have high I/O demands. Using simple, well-understood blocking calls simplifies the overall structure.  
- Multithreaded programs tend to be smaller and easier to understand due to simplified flow of control.

### <mark style="background: #FFF503A6;">Architectural styles</mark>

<mark style="background: #FFF503A6;">Architecture:</mark>
- structure which defines the placement of system components, to guarantee reliability, manageability, adaptability, and cost-effectiveness  
- a consistent frame of reference  

An architectural model of a distributed system first simplifies and abstracts the functions of the individual components of a distributed system and then it considers:  
- the placement of the components across a network of computers, seeking to define useful patterns for the distribution of data and workload;  
- The interrelationships between the components  
- their functional roles and the patterns of communication between them.  

In most real-world distributed systems, many different styles are combined.

### <mark style="background: #FFF503A6;">Software and hardware service layers in distributed systems</mark>

![[Pasted image 20251204101041.png]]

### <mark style="background: #FFF503A6;">Architectural styles</mark>

<mark style="background: #FFF503A6;">Several styles - the most important ones for distributed systems are:</mark>
- Layered architectures  
- Service-oriented architectures  
- Publish-subscribe architectures  

In most real-world distributed systems, many styles are combined.

### <mark style="background: #FFF503A6;">Layered architecture</mark>

Components are organised in a <mark style="background: #FFF503A6;">layered fashion</mark>  

It is such a universal principle that it is generally combined with most other architectural styles  

A component at layer Lj can make a <mark style="background: #FFF503A6;">downcall</mark> to a component at a lower-level layer Li (with i < j) - generally expects a response.

Only in exceptional cases will an <mark style="background: #FFF503A6;">upcall</mark> be made to a higher- level component.  

<mark style="background: #FFF503A6;">Layered architecture:</mark> major drawback is the often strong dependency between different layers

### <mark style="background: #FFF503A6;">Application Layering</mark>

<mark style="background: #FFF503A6;">Traditional three-layered view:</mark>
- <mark style="background: #FFF503A6;">Application-interface layer:</mark> contains units for interfacing to users or external applications  
- <mark style="background: #FFF503A6;">Processing layer:</mark> contains the functions of an application, i.e., without specific data  
- <mark style="background: #FFF503A6;">Data layer:</mark> contains the data that a client wants to manipulate through the application components  

This layering is found in many distributed information systems, using traditional database technology and accompanying applications.

### <mark style="background: #FFF503A6;">Multi-tier architectures</mark>

N-tiered (or multi-tier) solutions  

Application domain is partitioned into n logical elements, each mapped to a given server element.  

Example: Wikipedia, the web-based publicly editable encyclopaedia, adopts a multi-tier architecture to deal with the high volume of web requests - up to 60,000 page requests per second.

### <mark style="background: #FFF503A6;">Service-Oriented Architectures (SOAs)</mark>  

An architectural style reflecting a more loose organisation of a collection of separate, independent entities.  

Each entity encapsulates a service.  

<mark style="background: #FFF503A6;">Services:</mark> Whether they are called <mark style="background: #FFF503A6;">services</mark>, <mark style="background: #FFF503A6;">objects</mark>, or <mark style="background: #FFF503A6;">microservices</mark>, they have in common that the service is executed as a separate process (or thread).  

Running separate entities does not necessarily lower dependencies in comparison to a layered architectural style.

### <mark style="background: #FFF503A6;">SOAs:</mark>  

<mark style="background: #FFF503A6;">Microservice architectural style:</mark>
- The service as a whole is realised as a self-contained entity, although it can possibly make use of other services.  
- Essential is that each microservice runs as a separate (network) process  
- The implementation of a microservice could be in the form of a remote object,  
- There is no common agreement on what the size of such a service should be.  
- Microservice must represents a separate, independent service  
- Modularisation is key to designing microservices  
- One of the problems with service composition is that connecting various components can easily turn into an integration nightmare.

### <mark style="background: #FFF503A6;">Resource-based architectures: RESTful architectures</mark>  

View a distributed system as a collection of resources, individually managed by components.  

Resources may be added, removed, retrieved, and modified by (remote) applications.

<mark style="background: #FFF503A6;">Resource-based architectures:</mark>
1. Resources are identified through a single naming scheme  
2. All services offer the same interface  
3. Messages sent to or from a service are fully self-described  
4. After executing an operation at a service, that component forgets everything about the caller

<mark style="background: #FFF503A6;">Basic operations:</mark>
- ``PUT`` - Create a new resource  
- ``GET`` - Retrieve the state of a resource in some representation  
- ``DELETE`` - Delete a resource  
- ``POST`` - Modify a resource by transferring a new state

### <mark style="background: #FFF503A6;">Publish-subscribe architectures</mark>

Dependencies between processes as loose as possible  

Strong separation between processing and coordination  

View a system as a collection of autonomously operating processes.  

<mark style="background: #FFF503A6;">Coordination:</mark> the communication and cooperation between processes.

### <mark style="background: #FFF503A6;">Paradigms for code mobility</mark> 

<mark style="background: #FFF503A6;">Client-server computing:</mark> The code, execution state, and resource segment are all located at the server, and after execution, only the execution state at the server is  
generally modified.  

<mark style="background: #FFF503A6;">Remote evaluation:</mark> The client migrates code to the server where that code is executed and leading to a modification of the execution state at the server.  

<mark style="background: #FFF503A6;">Code-on-demand:</mark> Receiver-initiated scheme by which the client obtains code from the server, with its execution modifying the client-side execution state and operating on the client’s resources.  

<mark style="background: #FFF503A6;">Mobile agents:</mark> Follow a sender-initiated approach, moving code as well as execution state from the client to the server, operating on both the client’s and the server’s resources.

### <mark style="background: #FFF503A6;">System architectures</mark> 

<mark style="background: #FFF503A6;">Client-server architectures:</mark>
- Simple client-server  
- The Multi-Server model  
- The Proxy Servers and Caches mode  
- Mobile agents model  
- Thin client model  

Peer-to-peer systems  

<mark style="background: #FFF503A6;">Hybrid system architectures:</mark>
- Cloud computing  
- The edge-cloud architecture  
- <mark style="background: #FFF503A6;">Blockchain architectures:</mark> enable the registration of transactions - also referred to as distributed ledgers.

### <mark style="background: #FFF503A6;">Simple client-server architecture</mark>

Widely used, servers/clients on different computers provide services to clients/servers on different computers via request/reply messaging.  

Servers could also become clients in some services, and vice-versa, e.g., for web servers and web pages retrievals, DNS resolution, search engine-servers and web ‘crawlers’, which are all independent, concurrent and asynchronous (synchronous?) processes.

![[Pasted image 20251204102037.png]]

### <mark style="background: #FFF503A6;">The Multi-Server</mark>

A DS with multiple, interacting servers responding to parts of a given request in a cooperative manner.  

<mark style="background: #FFF503A6;">Service provision is via the partitioning and distributing of object sets, data replication, (or code migration):</mark>
- E.g., A browser request targeting multiple servers depending on location of resource/data OR replication of data at several servers to speed up request/reply turnaround time, and guarantee availability and fault tolerance - consider the Network Information Service (NIS) replication of network login-files for user authorisation.  
- Replication is used to increase performance and availability and to improve fault tolerance. It provides multiple consistent copies of data in processes running in different computers.

![[Pasted image 20251204102137.png]]

### <mark style="background: #FFF503A6;">The Proxy Servers and Caches</mark>  

A <mark style="background: #FFF503A6;">cache</mark> is a store of recently used data objects that is closer than the objects themselves.  

Caching frequently used: objects/data/code, which can be collocated at all clients, or located at a single/multiple ‘proxy’ server(s) and accessed/shared by all clients.  

When requested object/data/code is not in cache is it fetched or, sometimes, updated. E.g., clients caching of recent web pages.  

Web proxy servers provide a shared cache of web resources for the client machines at a site or across several sites. The purpose of proxy servers is to increase availability and performance of the service by reducing the load on the wide-area network and web servers. Proxy servers can take on other roles: e.g., they may be used to access remote web servers through a firewall.

![[Pasted image 20251204102229.png]]

### <mark style="background: #FFF503A6;">Mobile agents model</mark>

Both code and associated data are migrated to a number of computers to carry out specified functions/tasks, and eventually returning results. A variant of the C-S model.

It tends to minimise delays due to communication (vis-à-vis static clients making multiple requests to servers)

<mark style="background: #FFF503A6;">Examples:</mark> 
- a software installation-agent installing applications on different computers for given hardware-configs;
- price compare-agent checking variations in prices for a commodity; 
- or a worm agent that looks for idle CPU cycles in cluster-computing.  

<mark style="background: #FFF503A6;">Caution:</mark> security threat due to potential ‘Trojan Horse’ problem in migrated code, incomplete exec or ‘hanging’ of agents.  

The mobile agents may not be able to complete their tasks if they are refused access to the information they need.

<mark style="background: #FFF503A6;">Thin Client model:</mark>

Each client computer supports a layer of software which invokes a remote compute server for computational services. - A variant of the C-S/Network computer model,  

The compute server will typically be a multiprocessor or cluster computer.  

If the application is interactive and results are due back to client- user, delays and communication can eclipse any advantages.

![[Pasted image 20251204102436.png]]

### <mark style="background: #FFF503A6;">Peer-to-peer (P2P) systems</mark> 

Without any distinction between servers and clients.  

All processes interact and cooperate in servicing requests.  

Processes are able to maintain consistency and needed synchronisation of actions; and pattern of communication depends on the application.  

E.g., consider a ‘whiteboard’ application where multiple peer processes interact to modify a shared picture file - interactions and synch done via middleware layer for notification/group comm.

![[Pasted image 20251204102531.png]]

### <mark style="background: #FFF503A6;">P2P systems characteristics</mark>

Their design ensures that each user contributes resources to the system.  

They may differ in the resources that they contribute, but all the nodes in a peer-to-peer system have the same functional capabilities and responsibilities.  

Their correct operation does not depend on the existence of any centrally administered systems.  

They can be designed to offer a limited degree of anonymity to the providers and users of resources.  

<mark style="background: #FFF503A6;">A key issue for their efficient operation:</mark> the choice of an algorithm for the placement of data across many hosts and subsequent access to it in a manner that balances the workload and ensures availability without adding undue overheads

### <mark style="background: #FFF503A6;">Peer-to-peer architecture</mark>

![[Pasted image 20251204102631.png]]

### <mark style="background: #FFF503A6;">P2P: issues to handle</mark>

<mark style="background: #FFF503A6;">Connectivity:</mark> how to find and connect other P2P nodes that are running in the network. Unlike traditional servers, they don't have a fixed, known IP address  

<mark style="background: #FFF503A6;">Instability:</mark> nodes may always be joining and leaving the network  

<mark style="background: #FFF503A6;">Message routing:</mark> how messages should be routed to get from one node to another. The two nodes may not directly know about each other  

<mark style="background: #FFF503A6;">Searching:</mark> how to find desired information from the nodes connected to the network  

<mark style="background: #FFF503A6;">Security - extra issues including:</mark>
- nodes being able to trust other nodes,  
- preventing malicious nodes from corrupting the P2P network or the individual nodes,  
- being able to send and receive data anonymously, etc.

### <mark style="background: #FFF503A6;">P2P generations</mark> 

Three generations of peer-to-peer system and application development can be identified:  

The <mark style="background: #FFF503A6;">first</mark> generation was launched by the Napster music exchange service  

A <mark style="background: #FFF503A6;">second</mark> generation of files sharing applications offering greater scalability, anonymity and fault tolerance followed: Freenet, Gnutella, Kazaa and BitTorrent  

The <mark style="background: #FFF503A6;">third</mark> generation - middleware layers for the application - independent management of distributed resources on a global scale.  
- Designed to place resources (data objects, files) on a set of computers that are widely distributed throughout the Internet and to route messages to them on behalf of clients,  
- relieving clients of any need to make decisions about placing resources and to hold information about the whereabouts of the resources they require.  
- Examples include: Pastry, Tapestry, CAN, Chord and Kademlia

### <mark style="background: #FFF503A6;">Cloud computing:</mark>

<mark style="background: #FFF503A6;">Make a distinction between four layers:</mark>
- <mark style="background: #FFF503A6;">Hardware:</mark> Processors, routers, power and cooling systems. Customers normally never get to see these.  
- <mark style="background: #FFF503A6;">Infrastructure:</mark> Deploys virtualisation techniques. Evolves around allocating and managing virtual storage devices and virtual servers.  
- <mark style="background: #FFF503A6;">Platform:</mark> Provides higher-level abstractions for storage and such. Example: Amazon S3 storage system offers an API for (locally created) files to be organised and stored in so-called buckets.  
- <mark style="background: #FFF503A6;">Application:</mark> Actual applications, such as office suites (text processors, spreadsheet applications, presentation applications). Comparable to the suite of apps shipped with OSes.

![[Pasted image 20251204103041.png]]

### <mark style="background: #FFF503A6;">Edge-server architecture</mark>

Systems deployed on the Internet where servers are placed at the edge of the network - the boundary between enterprise networks and the actual Internet.

![[Pasted image 20251204103116.png]]

### <mark style="background: #FFF503A6;">Sending data over the network:</mark>

The individual primitive data items transmitted in messages can be data values of many different types, and not all computers store primitive values such as integers in the same order.  

The representation of floating-point numbers also differs between architectures.  

<mark style="background: #FFF503A6;">Remote machine may have:</mark>  
- Different byte ordering  
- Different sizes of integers and other types  
- Different floating point representations  
- Different character sets  
- Alignment requirements

### <mark style="background: #FFF503A6;">Marshalling and Unmarshalling</mark>

<mark style="background: #FFF503A6;">Marshalling</mark> 
- The process of taking a collection of data items and assembling them into a form suitable for transmission in a message.  
- It consists of the translation of structured data items and primitive values into an external data representation.  

<mark style="background: #FFF503A6;">Unmarshalling</mark>
- The process of disassembling them on arrival to produce an equivalent collection of data items at the destination.  
- It consists of the generation of primitive values from their external data representation and the rebuilding of the data structures.

### <mark style="background: #FFF503A6;">External data representation and marshalling</mark>

<mark style="background: #FFF503A6;">The following methods can be used to enable any two computers to exchange binary data values:</mark>
- The values are converted to an agreed external format before transmission and converted to the local form on receipt; 
- If the two computers are known to be the same type, the conversion to external format can be omitted.  
- The values are transmitted in the sender’s format, together with an indication of the format used, and the recipient converts the values if necessary.

### <mark style="background: #FFF503A6;">External data representation: Approaches</mark>

<mark style="background: #FFF503A6;">Java’s object serialisation:</mark> which is concerned with the flattening and data representation of any single object or tree of objects that may need to be transmitted in a message or stored on a disk. It is for use only by Java.  

<mark style="background: #FFF503A6;">XML (Extensible Markup Language):</mark>
- Defines a textual format for representing structured data.  
- It was originally intended for documents containing textual self-describing structured data. For example, documents accessible on the Web  
- Now also used to represent the data sent in messages exchanged by clients and servers in web services.

### <mark style="background: #FFF503A6;">External data representation: other techniques</mark>

<mark style="background: #FFF503A6;">Protocol buffers:</mark>
- Google uses an approach called protocol buffers (aka ``protobuf``) to capture representations of both stored and transmitted data  
- offers a common serialisation format for Google, including the serialisation of requests and replies in remote invocation  

<mark style="background: #FFF503A6;">JSON (JavaScript Object Notation):</mark> an approach to external data representation [www.json.org].  

<mark style="background: #FFF503A6;">Protocol buffers and JSON:</mark> more lightweight approaches to data representation, when compared, for example, to XML.

### <mark style="background: #FFF503A6;">JSON (JavaScript Object Notation)</mark>

Lightweight (relatively efficient) data interchange format - Lighter alternative to XML  

Based on JavaScript  

Human writeable and readable  

Self-describing (explicitly typed)  

Language independent  

Easy to parse

### <mark style="background: #FFF503A6;">JSON vs XML</mark>

<mark style="background: #FFF503A6;">Similarities:</mark>  
- Both are "self describing" (human readable)  
- Both are hierarchical (values within values)  
- Both can be parsed and used by lots of programming languages  
- Both can be fetched with an ``XMLHttpRequest``  

<mark style="background: #FFF503A6;">Differences:</mark>  
- <mark style="background: #FFF503A6;">JSON:</mark> doesn't use end tag, Shorter, quicker to read and write, can use arrays, JSON, can be parsed by a standard JavaScript function.  
- <mark style="background: #FFF503A6;">XML:</mark> has to be parsed with an XML parser.

### <mark style="background: #FFF503A6;">Protocol Buffers (protobuf)</mark>

A mechanism for serialising structured data  

<mark style="background: #FFF503A6;">Similar to XML:</mark> smaller, faster, and simpler  

<mark style="background: #FFF503A6;">Uses binary format:</mark> rather than text format of XML and JSON  

Is in fact an IDL (Interface Definition Language)

### <mark style="background: #FFF503A6;">Remote Invocation</mark>

Based on a two-way exchange between communicating entities in a distributed system - resulting in the calling of a remote operation, procedure or method.  

<mark style="background: #FFF503A6;">Remote Procedure Calls (RPC):</mark> allow programs to call <mark style="background: #FFF503A6;">procedures</mark> located on other machines.  

<mark style="background: #FFF503A6;">Remote method invocation (RMI):</mark> allow programs to call methods on <mark style="background: #FFF503A6;">objects</mark> located on other machines.

### <mark style="background: #FFF503A6;">Basic RPC operation</mark>

Supports client-server computing with servers offering a set of operations through a service interface and clients calling these operations directly as if they were available locally.  

<mark style="background: #FFF503A6;">RPC systems offer (at a minimum):</mark>
- <mark style="background: #FFF503A6;">access transparency:</mark> the calling procedure should not be aware that the called procedure is executing on a different machine or vice versa.  
- <mark style="background: #FFF503A6;">location transparency</mark>

![[Pasted image 20251204104013.png]]

### <mark style="background: #FFF503A6;">Remote method invocation (RMI)</mark>

<mark style="background: #FFF503A6;">RMI:</mark>
- Strongly resembles remote procedure calls  
- Extended into the world of distributed objects.  

A calling object can invoke a method in a remote object.  

<mark style="background: #FFF503A6;">Communication among distributed objects via RMI:</mark> Recipients of remote invocations are remote objects, which implement remote interfaces for communication  

<mark style="background: #FFF503A6;">Reliability:</mark> Either one or both the invoker and invoked can fail, and status of communication is supported by the interface. e.g.,  
- notification on failures,  
- reply generation,  
- parameter processing - marshalling/unmarshalling  

Local invocations target local objects, and remote invocations target remote objects

### <mark style="background: #FFF503A6;">The distributed object model: Remote and local method invocations</mark>

Objects receiving remote invocations (service objects) are remote objects, e.g., B and F  

Object references are required for invocation, e.g., C must have E’s reference or B must have A’s reference  

B and F must have remote interfaces (of their accessible methods)

![[Pasted image 20251204104152.png]]

### <mark style="background: #FFF503A6;">Distributed Garbage Collection</mark>

<mark style="background: #FFF503A6;">Where any process includes remote objects, then it is equipped with both:</mark>
- Local garbage collector  
- Distributed garbage collector  

For any remote object O - ``O.holders`` is a list of all the processes that have a remote reference to that object i.e. got a stub for it  

When a client C receives a remote reference for O it makes an ``addRef`` call to O’s garbage collector resulting in its being added to ``O.holders``  

When C’s local garbage collector attempts to delete the stub object for O, it calls ``removeRef`` on O’s garbage collector, resulting in its being removed from ``O.holders``  

When ``O.holders`` is empty, O can be deleted

### <mark style="background: #FFF503A6;">RPC Invocation Semantics</mark> 

In RPC call semantics, there is a two way interaction between the client and the server with the client sending a request  
- The server executing the (remote) procedure and the server sending a reply back to the client.  
- The semantics are defined over this complete path and not just the delivery of the initial message (the request)  

<mark style="background: #FFF503A6;">Unreliable network:</mark> For all request- reply protocols, messages may get lost  

<mark style="background: #FFF503A6;">Solutions for lost / retransmitted messages:</mark>
- Retry request  
- Filter Duplicates  
- Retransmit results

### <mark style="background: #FFF503A6;">Invocation Semantics</mark> 

Remote procedure calls provide a range of invocation semantics  

<mark style="background: #FFF503A6;">In local systems:</mark> all methods are invoked exactly once per request - guaranteed - unless whole process fails  

In distributed system, we need to know what has happened if we do not hear result from remote object/procedure i.e. did the request go missing, did the response go missing  

3 different types of guarantee (invocation semantics) may be provided - could be implemented in a middleware platform intended to support remote method invocations:  
- Maybe  
- At-Least-Once  
- At-Most-Once

<mark style="background: #FFF503A6;">Maybe Invocation Semantics:</mark>
- If the invoker cannot tell whether a remote method has been invoked or not  
- Very inexpensive, but only useful if the system can tolerate occasional failed invocations

<mark style="background: #FFF503A6;">At-Least-Once Invocation Semantics:</mark>  
- If the invoker receives a result, then it is guaranteed that the method was invoked at least once  
- Achieved by resending requests to mask omission failure  
- Only useful if the operations are idempotent (x = 10, rather than x = x + 10)  
- Inexpensive on server

<mark style="background: #FFF503A6;">At-Most-Once Invocation Semantics</mark>  
- If the invoker receives a result, then it is guaranteed that the method was invoked only once  
- If no result is received, then the method was executed either never or once 
- Achieved by resending requests, and storing and resending responses  
- More expensive on a server / remote object, which must maintain results and recognise duplicate messages

### <mark style="background: #FFF503A6;">Invocation semantics: failure model</mark>

<mark style="background: #FFF503A6;">Maybe:</mark>
- if no reply, the client does not know if method was executed or not 
- <mark style="background: #FFF503A6;">omission failures:</mark> if the invocation or result message is lost  

<mark style="background: #FFF503A6;">At-least-once:</mark>
- the client gets a result (and the method was executed at least once) or an exception (no result)  
- arbitrary failures. If the invocation message is retransmitted, the remote object may execute the method more than once, possibly causing wrong values to be stored or returned.
- if idempotent operations are used, arbitrary failures will not occur.

<mark style="background: #FFF503A6;">At-most-once:</mark> the client gets a result (and the method was executed exactly once) or an exception (instead of a result, in which case, the method was executed once or not at all)

![[Pasted image 20251204104839.png]]

### <mark style="background: #FFF503A6;">Indirect Communication</mark>

The essence - to communicate through an intermediary  

No direct coupling between the sender and the one or more receivers.  

Coupling refers to the degree of direct knowledge that one element has of another.

### <mark style="background: #FFF503A6;">Indirect Communication Usage</mark>

In distributed systems where change is anticipated - in mobile environments where users may rapidly connect to and disconnect from the global network - and must be managed to provide more dependable services.  

For event dissemination in distributed systems where the receivers may be unknown and liable to change - E.g. in managing event feeds in financial systems

### <mark style="background: #FFF503A6;">Indirect communication techniques</mark>
1. <mark style="background: #FFF503A6;">Group communication:</mark> in which communication is via a group abstraction with the sender unaware of the identity of the recipients  
2. <mark style="background: #FFF503A6;">Publish-subscribe systems:</mark> a family of approaches that all share the common characteristic of disseminating events to multiple recipients through an intermediary  
3. <mark style="background: #FFF503A6;">Message queue systems:</mark> messages are directed to the familiar abstraction of a queue with receivers extracting messages from such queues  
4. <mark style="background: #FFF503A6;">Shared memory based approaches:</mark> allows a processor to address a memory location at another computer as if it were local memory

### <mark style="background: #FFF503A6;">Group Communication</mark>

A message is sent to a group and then this message is delivered to all members of the group.  

The sender is not aware of the identities of the receivers.  

Represents an abstraction over multicast communication  

<mark style="background: #FFF503A6;">May be implemented over:</mark>
- IP multicast; or  
- An equivalent <mark style="background: #FFF503A6;">overlay network</mark> adding significant extra value in terms of managing group membership, detecting failures and providing reliability and ordering guarantees.

### <mark style="background: #FFF503A6;">Group Communication: Key areas of application</mark>

An important building block for reliable distributed systems  

<mark style="background: #FFF503A6;">Group Communication:</mark>
- The reliable dissemination of information to potentially large numbers of clients,  
- E.g. in the financial industry, where institutions require accurate and up-to date access to a wide variety of information sources;  

<mark style="background: #FFF503A6;">Support for collaborative applications:</mark>
-  where events must be disseminated to multiple users to preserve a common user view. 
- E.g. in multiuser games;  

<mark style="background: #FFF503A6;">Support for a range of fault-tolerance strategies:</mark>
- E.g. the consistent update of replicated data, or  
- the implementation of highly available (replicated) servers;  

<mark style="background: #FFF503A6;">Support for system monitoring and management:</mark> E.g. load balancing strategies.

### <mark style="background: #FFF503A6;">Group Communication: Programming Model</mark>  

The central concept is that of a group with associated group membership - processes may join or leave the group.  

Processes can then send a message to this group and have it propagated to all members of the group with certain guarantees in terms of reliability and ordering.  

Thus, group communication implements multicast communication - in which a message is sent to all the members of the group by a single operation.  

A process issues only one multicast operation to send a message to each of a group of processes

### <mark style="background: #FFF503A6;">Failure considerations for group communication</mark>

Similar to unicast communication

<mark style="background: #FFF503A6;">Crash failure:</mark> Process stops communicating  

<mark style="background: #FFF503A6;">Omission failure:</mark>
- <mark style="background: #FFF503A6;">Usually due to network:</mark> occurs when a component fails to take an action that it should have taken.  
- <mark style="background: #FFF503A6;">Send omission:</mark> Process fails to send messages  
- <mark style="background: #FFF503A6;">Receive omission:</mark> Process fails to receive messages
 
<mark style="background: #FFF503A6;">Byzantine failure:</mark> arbitrary - some messages are faulty  

<mark style="background: #FFF503A6;">Segmentation due to network:</mark> group divided into two or more unreachable sub-groups

### <mark style="background: #FFF503A6;">Implementation issues: Group membership management</mark> 

<mark style="background: #FFF503A6;">Group membership management - four main tasks:</mark>  
- Providing an interface for group membership changes
- Failure detection
- Notifying members of group membership changes
- Performing group address expansion - can coordinate multicast delivery with membership changes by controlling address expansion.

### <mark style="background: #FFF503A6;">Publish-Subscribe Systems</mark>

<mark style="background: #FFF503A6;">Publish-Subscribe Systems:</mark> Also known as <mark style="background: #FFF503A6;">distributed event-based systems</mark>  

<mark style="background: #FFF503A6;">A publish-subscribe system is a system where:</mark>
- publishers publish structured events to an event service and  
- subscribers express interest in particular events through subscriptions which can be arbitrary patterns over the structured events.  

For example, a subscriber could express an interest in all events related to a book, such as the availability of a new edition or updates to the related web site.  

The task of the publish subscribe system is to match subscriptions against published events and ensure the correct delivery of <mark style="background: #FFF503A6;">event notifications</mark>.  

A given event will be delivered to potentially many subscribers, and hence publish-subscribe is fundamentally a one-to-many communications paradigm.

Used in a wide variety of application domains, particularly those related to the large-scale dissemination of events.

<mark style="background: #FFF503A6;">Examples:</mark>  
- financial information systems;  
- other areas with live feeds of real-time data (including RSS feeds);  
- support for cooperative working, where a number of participants need to be informed of events of shared interest; 
- support for ubiquitous computing, including the management of events emanating from the ubiquitous infrastructure (for example, location events)  
- a broad set of monitoring applications, including network monitoring in the Internet.  

Publish-subscribe is also a key component of Google’s infrastructure, including for example the dissemination of events related to advertisements, such as ‘ad clicks’, to interested parties.

![[Pasted image 20251204134618.png]]

### <mark style="background: #FFF503A6;">The roles of the participating objects in distributed event notification</mark>  

<mark style="background: #FFF503A6;">The object of interest:</mark>  
- Experiences changes of state, as a result of its operations being invoked.
- E.g. events such as a person wearing an active badge entering a room, in which case the room is the object of interest and the operation consists of adding information about the new person to its records of who is in the room.  

<mark style="background: #FFF503A6;">Event:</mark> occurs at an object of interest as the result of the completion of a method execution.  

<mark style="background: #FFF503A6;">Notification:</mark> An object that contains information about an event; it contains the type of the event and its attributes such as the identity of the object of interest, the method invoked, the time of occurrence or a sequence number.

<mark style="background: #FFF503A6;">Subscriber:</mark> An object that has subscribed to some type of events in another object. It receives notifications about such events.  

<mark style="background: #FFF503A6;">Observer objects:</mark> Purpose - to decouple an object of interest from its subscribers. An object of interest can have many different subscribers with different interests.  

<mark style="background: #FFF503A6;">Publisher:</mark> An object that declares that it will generate notifications of particular types of event; it may be an object of interest or an observer.

### <mark style="background: #FFF503A6;">Examples of roles:</mark>

<mark style="background: #FFF503A6;">Forwarding:</mark> A forwarding observer may carry out all the work of sending notifications to subscribers on behalf of one or more objects of interest.

<mark style="background: #FFF503A6;">Filtering of notifications:</mark> 
- Filters may be applied by an observer so as to reduce the number of notifications received according to some predicate on the contents of each notification.
- E.g. an event might relate to withdrawals from a bank account, but the recipient is interested only in those greater than €100.  

<mark style="background: #FFF503A6;">Patterns of events:</mark> When an object subscribes to events at an object of interest, they can specify patterns of events that they are interested in.  

<mark style="background: #FFF503A6;">Notification mailboxes:</mark> notification may need to be delayed until a potential subscriber is ready to receive them. The subscriber should be able to turn delivery on and off as required.

### <mark style="background: #FFF503A6;">Publish-subscribe</mark>

<mark style="background: #FFF503A6;">Issue: how to match events?</mark>  
- Assume events are described by ``(attribute,value)`` pairs  
- <mark style="background: #FFF503A6;">topic-based subscription:</mark> specify a “attribute = value” series
- <mark style="background: #FFF503A6;">content-based subscription:</mark> specify a “attribute ∈ range” series

![[Pasted image 20251204160718.png]]

### <mark style="background: #FFF503A6;">Publish-subscribe: Scalability</mark>  

Scales well for small networks with a small number of publisher and subscriber nodes and low message volume.  

However, for increased number of nodes and messages, the likelihood of instabilities increases - limiting the maximum scalability

### <mark style="background: #FFF503A6;">Message queue systems</mark>

They are <mark style="background: #FFF503A6;">point-to-point</mark> - the sender places the message into a queue, and it is then removed by a single process. Message queues are also referred to as Message-Oriented Middleware.  

A major class of commercial middleware with key implementations - E.g. IBM’s MQ (https://www.ibm.com/products/websphere-mq)  

The main use of such products is to achieve Enterprise Application Integration (EAI) - that is, integration between applications within a given enterprise - a goal that is achieved by the inherent loose coupling of message queues.  

They are also extensively used as the basis for commercial transaction processing systems because of their intrinsic support for transactions

<mark style="background: #FFF503A6;">The message queue paradigm</mark>
![[Pasted image 20251204160858.png]]

### <mark style="background: #FFF503A6;">Message-queuing systems: Lack of standardisation</mark>  

<mark style="background: #FFF503A6;">MQ systems have been developed in part to allow legacy applications to interoperate:</mark>
- When it comes to operations between different message-queuing systems, we often hit a wall.  
- Message-queuing solutions are in large part proprietary solutions.  
- A working group was formed to change this situation, resulted in the specification of the Advanced Message-Queuing Protocol (AMQP)  

<mark style="background: #FFF503A6;">Advanced Message-Queuing Protocol (AMQP):</mark>
- Intended to play the same role as, for example, TCP in networks  
- A protocol for high-level messaging with different implementations.

### <mark style="background: #FFF503A6;">Common Middleware Services</mark>

- Resource management  
- Facilities for interapplication communication  
- Security services - Access control, Authentication  
- Accounting services  
- Masking of and recovery from failures.  
- Naming, Location, Service discovery, Replication  
- Protocol handling, Communication faults, QoS  
- Synchronisation, Concurrency, Transactions, Storage

### <mark style="background: #FFF503A6;">Middleware provides:</mark>

<mark style="background: #FFF503A6;">location transparency:</mark>  
- <mark style="background: #FFF503A6;">RPC:</mark> the client that calls a procedure cannot tell whether the procedure runs in the same process or in a different process, different computer.  
- <mark style="background: #FFF503A6;">RMI:</mark> object making the invocation cannot tell whether the object it invokes is local or not;
- <mark style="background: #FFF503A6;">EBP:</mark> the generating/receiving - not aware of one another's locations

<mark style="background: #FFF503A6;">protocol abstraction:</mark> independent of underlying transport protocols

<mark style="background: #FFF503A6;">OS heterogeneity:</mark> independent of the underlying operating system  

<mark style="background: #FFF503A6;">hardware independence:</mark> approaches to external data representations hide the differences due to hardware architectures, such as byte ordering.  

<mark style="background: #FFF503A6;">multi-language support:</mark> 
- allows clients written in one language to invoke methods in objects that live in server programs written in another language.  
- Achieved by using an interface definition language (IDL) to define interfaces

<mark style="background: #FFF503A6;">Communication:</mark> E.g. RPC - a developer need only to specify the function header expressed in a special programming language, from which the RPC subsystem can then generate the necessary code that establishes remote invocations.  

<mark style="background: #FFF503A6;">Transactions:</mark>
- Many applications make use of multiple services that are distributed among several computers.
- Middleware generally offers special support for executing such services providing <mark style="background: #FFF503A6;">all-or-nothing</mark> feature. 
- The application developer need only specify the remote services involved, and by following a standardised protocol, the middleware makes sure that <mark style="background: #FFF503A6;">every service is invoked</mark>, or <mark style="background: #FFF503A6;">none at all</mark>.

### <mark style="background: #FFF503A6;">Criteria for selecting middleware:</mark>

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

### <mark style="background: #FFF503A6;">Middleware - Types</mark>

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

<mark style="background: #FFF503A6;">Peer-to-peer middleware generations:</mark>  
- 3rd - Pastry, Tapestry, CAN, Chord, Kademlia  
- 2nd - Freenet, Gnutella, Kazaa and BitTorrent  
- 1st - generation: Napster

### <mark style="background: #FFF503A6;">Message-oriented middleware:</mark>

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

Messages can be large (time in minutes) as opposed to sockets, where seconds

### <mark style="background: #FFF503A6;">Message-Oriented Middleware (MOM)</mark>

Communication using <mark style="background: #FFF503A6;">messages</mark>  

Messages stored in <mark style="background: #FFF503A6;">message queues</mark>  

Optional <mark style="background: #FFF503A6;">message server</mark> decouples client and server  

Various assumptions about <mark style="background: #FFF503A6;">message content</mark>

### <mark style="background: #FFF503A6;">MOM/MQ - additional functionalities:</mark>  

<mark style="background: #FFF503A6;">Transactions support:</mark> Support for the sending or receiving of a message to be contained within a transaction  

<mark style="background: #FFF503A6;">Message transformation:</mark>  
- An arbitrary transformation can be performed on an arriving message.
- E.g. - to transform messages between formats to deal with heterogeneity in underlying data representations.  
- Important tool in dealing with heterogeneity  
- <mark style="background: #FFF503A6;">Message broker:</mark> Term often used to denote a service responsible for message transformation.

### <mark style="background: #FFF503A6;">Properties of MOM</mark>

<mark style="background: #FFF503A6;">Asynchronous interaction:</mark>  
- Client and server are only loosely coupled  
- Messages are queued  
- Good for application integration  

<mark style="background: #FFF503A6;">Support for reliable delivery service:</mark> Keep queues in persistent storage  

<mark style="background: #FFF503A6;">Processing of messages by intermediate message server:</mark>
- Filtering, transforming, logging, etc,
- Networks of message servers

Natural for database integration

### <mark style="background: #FFF503A6;">MOM Examples/Toolkits</mark>

A major class of commercial middleware with key implementations including  
- IBM’s MQ (previously WebSphere MQ),  
- Amazon Simple Queue Service  
- RabbitMQ  

<mark style="background: #FFF503A6;">Other Examples:</mark>
- <mark style="background: #FFF503A6;">Jakarta Messaging:</mark> a Java Message Oriented Middleware API. create, send, and receive messages via loosely coupled, reliable asynchronous communication services.  
- Web Services  

The MOM paradigm has had a long history in distributed applications.  

Message Queue Services (MQS) have been in use since the 1980’s.

### <mark style="background: #FFF503A6;">Disadvantages of MOM</mark>

<mark style="background: #FFF503A6;">Poor programming abstracting:</mark>
- Rather low-level (cf. Packets)  
- Results in multi-threaded code  
- Request/reply more difficult to achieve  

<mark style="background: #FFF503A6;">Message formats unknown to middleware:</mark> No type checking  

<mark style="background: #FFF503A6;">Queue abstraction only gives one-to-one communication:</mark> Limits scalability

### <mark style="background: #FFF503A6;">Publish-Subscribe Middleware</mark> 

<mark style="background: #FFF503A6;">Publishers</mark> publish <mark style="background: #FFF503A6;">events</mark> (messages)  

<mark style="background: #FFF503A6;">Subscribers</mark> express interest in events with subscriptions  

<mark style="background: #FFF503A6;">Event Service</mark> notifies interested subscribers of published events  

Events can have arbitrary content or name/value pairs

### <mark style="background: #FFF503A6;">Example: Kafka</mark>

<mark style="background: #FFF503A6;">Apache Kafka:</mark> Process streams of records in real time - huge amounts  

<mark style="background: #FFF503A6;">Open source publish-subscribe messaging system:</mark>
- Allows consumers to subscribe to topics for which they want to receive messages  
- Developed by LinkedIn in 2011 - open-sourced and donated Kafka to the Apache  
- Written in Scala and Java  

<mark style="background: #FFF503A6;">The main functions:</mark>
- Enables applications to publish or subscribe to data or event streams.  
- Stores records in the order in which they occurred in a fault-tolerant and durable way.  
- It processes records in real-time - as they occur

### <mark style="background: #FFF503A6;">Peer-to-peer middleware</mark>

Peer-to-peer middleware systems are designed specifically to meet the need for - the automatic placement and subsequent location of the distributed objects managed by peer-to-peer systems and applications.

### <mark style="background: #FFF503A6;">Peer-to-peer middleware functions</mark> 

To simplify the construction of services that are implemented across many hosts in a widely distributed network.  

It must enable clients to locate and communicate with any individual resource made available to a service, even though the resources are widely distributed amongst the hosts.  

<mark style="background: #FFF503A6;">To have the ability:</mark>  
- to add new resources and to remove them at will, and  
- to add hosts to the service and remove them.

<mark style="background: #FFF503A6;">Non-functional requirements of peer-to-peer middleware:</mark>  
- Global scalability  
- Load balancing  
- Optimisation for local interactions between neighbouring peers  
- Accommodating to highly dynamic host availability  
- Security of data in an environment with heterogeneous trust  
- Anonymity, deniability and resistance to censorship

### <mark style="background: #FFF503A6;">Web Services</mark>

Set of protocols by which services can be published, discovered, and used in a technology neutral form - Language & architecture independent  

Provide a basis where a client program in one organisation may interact with a server in another organisation - without human supervision.  

Based on the ability to use a HTTP request to cause the execution of a program. A result is produced by called program and then returned.

<mark style="background: #FFF503A6;">General principles:</mark> 
- <mark style="background: #FFF503A6;">Payloads are text (XML or JSON):</mark> Technology-neutral  
- <mark style="background: #FFF503A6;">HTTP used for transport:</mark> Use existing infrastructure: web servers, firewalls, load-balancers
- <mark style="background: #FFF503A6;">Web server:</mark> Provides a basic HTPP service
- <mark style="background: #FFF503A6;">Web service:</mark> Provides a service based on the operation defined in its interface.

### <mark style="background: #FFF503A6;">General Principles of Web Services</mark>

<mark style="background: #FFF503A6;">Platform neutral:</mark>
- Messages don’t rely on the underlying language, OS, or hardware  
- Standardised protocols & data formats  
- Payloads are text (XML or JSON)  

<mark style="background: #FFF503A6;">Message-oriented:</mark> Communicate by exchanging messages  

<mark style="background: #FFF503A6;">HTTP often used for transport:</mark>
- Use existing infrastructure: web servers, authentication, encryption, firewalls, load-balancers

### <mark style="background: #FFF503A6;">Web services infrastructure and components</mark>  

Web services and applications may be built on top other web services.  

Some particular web services provide general functionality required for the operation of a large number of other web services:  
- Directory services,  
- Security  

A web service generally provides a service <mark style="background: #FFF503A6;">description</mark>, which includes an interface definition and other information, such as the server’s URL

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
		<td>Stateless computing. State is contained within the documents that are exchanged (e.g., customer ID)</td>  
		<td>Stateful computing. Remote object maintains state</td>  
	</tr>
</table>

### <mark style="background: #FFF503A6;">SOAP Web Services Architecture</mark>

A web service is identified by URI and can be accessed by clients using messages formatted in XML.  

SOAP is used to encapsulate these messages and transmit them over HTTP or another protocol, e.g. TCP or SMTP.  

A web service deploys service descriptions to specify the interface and other aspects of the service for the benefit of potential clients

![[Pasted image 20251204164021.png]]

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
- Uniform Resource Names (URNs) are location independent  
- they rely on a lookup service to map them onto the URLs of resources.

### <mark style="background: #FFF503A6;">Technologies in the Process</mark>
1. client queries UDDI registry for a service - by name, category, identifier or some other criteria stored by registry
2. client then obtains information about location of WSDL doc from UDDI registry  
3. WSDL doc contains info about how to contact service and format of request msg  
4. client creates SOAP msg in accordance with WSDL and sends request to host where service is  
5. service responds with a SOAP msg to indicate results of service request

![[Pasted image 20251204164303.png]]

### <mark style="background: #FFF503A6;">WSDL Service Descriptions</mark>

Interface definitions needed to allow clients to communicate with services - All the information required by the client  

Java Remote Interfaces ~= IDL ~= WSDL  

<mark style="background: #FFF503A6;">WSDL (Web Services Description Language):</mark>
- Describe operations, a set of services  
- Name, operations, parameters, where to send requests  
- Provide URI, Identify Transport Protocol  
- Organisations exchange WSDL documents  

<mark style="background: #FFF503A6;">Describes either:</mark>
- Types of messages it can receive  
- Types of operations it can perform

![[Pasted image 20251204164357.png]]

### <mark style="background: #FFF503A6;">RESTful architectures</mark>

<mark style="background: #FFF503A6;">Essence:</mark> View a distributed system as a collection of resources, individually managed by components. Resources may be added, removed, retrieved, and modified by (remote) applications.  

1. Resources are identified through a single naming scheme  
2. All services offer the same interface  
3. Messages sent to or from a service are fully self-described  
4. After executing an operation at a service, that component forgets everything about the caller  

<mark style="background: #FFF503A6;">Basic operations:</mark> 
![[Pasted image 20251204164448.png]]

### <mark style="background: #FFF503A6;">Representational State Transfer (REST)</mark>

The key characteristic of most web services is that they can process XML formatted SOAP messages - An alternative is the REST approach

<mark style="background: #FFF503A6;">REST is a web standards based architecture:</mark>  
- Uses HTTP Protocol for data communication  
- <mark style="background: #FFF503A6;">Resource-oriented:</mark> every component is a resource. A resource is accessed by a common interface using HTTP standard methods

Clients use URLs and the HTTP operations GET, PUT, DELETE and POST to manipulate resources  

The emphasis is on the manipulation of data resources rather than on interfaces.

### <mark style="background: #FFF503A6;">REST</mark> 

When a new resource is created, it has a new URL by which it can be accessed or updated.  

Clients are supplied with the entire state of a resource instead of calling an operation to get some part of it.  

Amazon web services may be accessed either by SOAP or by REST

### <mark style="background: #FFF503A6;">REST</mark>

<mark style="background: #FFF503A6;">REST Server:</mark> provides access to resources  

<mark style="background: #FFF503A6;">REST client:</mark> accesses and presents the resources  

<mark style="background: #FFF503A6;">REST resources:</mark> 
- each resource is identified by URIs/ Global IDs
- representations of a resource
- Text, JSON and XML
- JSON is now the most popular format

Everything is a resource  

Any interaction of a RESTful API is an interaction with a resource.  

<mark style="background: #FFF503A6;">Resources are sources of information:</mark>
- typically documents or services, or  
- Users (e.g. as a URL of their GitHub)

### <mark style="background: #FFF503A6;">HTTP Methods in a REST based architecture</mark>  

<mark style="background: #FFF503A6;">Basic four operations (CRUD: Create, Read, Update, Delete):</mark>  
- <mark style="background: #FFF503A6;">PUT:</mark> Create, Used to create a new resource.  
- <mark style="background: #FFF503A6;">GET:</mark> Read, Provides a read only access to a resource.  
- <mark style="background: #FFF503A6;">POST:</mark> Update, Used to update an existing resource or create a new resource.  
- <mark style="background: #FFF503A6;">DELETE:</mark> Delete, Used to remove a resource.  

<mark style="background: #FFF503A6;">Fifth operation - determine options associated with a resource:</mark>
- <mark style="background: #FFF503A6;">OPTIONS:</mark> Query, Used to get the supported operations on a resource

### <mark style="background: #FFF503A6;">SOAP vs RESTful Web Services</mark>

<mark style="background: #FFF503A6;">SOAP</mark>
- <mark style="background: #FFF503A6;">A protocol:</mark> comes with strict rules and advanced security features such as built-in ACID compliance and authorisation.  
- Permits XML data format only 
- SOAP can't use REST 
- Has higher complexity, and requires more bandwidth and resources, which can lead to slower page load times.  

<mark style="background: #FFF503A6;">REST</mark>  
- <mark style="background: #FFF503A6;">An architectural style:</mark> not a protocol  
- Can use different messaging formats, such as HTML, CSV, JSON, XML  
- REST can use SOAP web services because it is a concept 
- Can use any protocol like HTTP, SOAP.  
- Consumes fewer resources than SOAP because its messages are typically smaller.- better performance

### <mark style="background: #FFF503A6;">SOAP versus REST:</mark>

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

### <mark style="background: #FFF503A6;">How to choose: SOAP or REST</mark>

<mark style="background: #FFF503A6;">ACID compliance:</mark>
- SOAP has built-in compliance for atomicity, consistency, isolation, and durability (ACID)
- May be a better suited for high data integrity requirements applications, like finance transactions  
- REST APIs may require additional software modules
- REST is not ACID compliant

### <mark style="background: #FFF503A6;">Coordination of web services</mark>

The SOAP infrastructure supports single request-response interactions between clients and web services.  

Many applications involve several requests that need to be done in a particular order. The need for web services as clients to be provided with a description of a particular protocol to follow when interacting with other web services.  

For composite web services, a transactions management protocol such as 2PC is required - WS-Coordination  

<mark style="background: #FFF503A6;">Simpler approach is Web Service choreography:</mark>
- Global description of a set of interactions  
- Defines coordination  
- Enhances interaction

### <mark style="background: #FFF503A6;">Clock synchronisation</mark>  

<mark style="background: #FFF503A6;">Physical clocks:</mark>  
- Keep time of day  
- Consistent across systems, but tend not to be in perfect agreement 
- <mark style="background: #FFF503A6;">Clock drift:</mark> which means that they count time at different rates, and so diverge.  

<mark style="background: #FFF503A6;">Logical clocks:</mark> Keeps track of event ordering

### <mark style="background: #FFF503A6;">Clock drift</mark>

All clocks are based on some harmonic oscillator - an object that resonates at a certain frequency and from which we can subsequently derive time.  

Because their frequency is not perfect and affected by external sources such as temperature, clocks on different machines will gradually start showing different values for time.  

<mark style="background: #FFF503A6;">Clock drift rate:</mark> The difference per unit of time from a perfect  
reference clock.

### <mark style="background: #FFF503A6;">Clock synchronisation algorithms: Cristian’s algorithm</mark>  
  
Suggested the use of a time server, connected to a device that receives signals from a source of UTC, to synchronise computers externally.  

Upon request, the server process S supplies the time according to its clock,  

Attempts to remove delays of accessing a time service by assuming that delays to the server and back are the same.  

Compensate for delays 
![[Pasted image 20251204165957.png]]

### <mark style="background: #FFF503A6;">Clock synchronisation algorithms: NTP</mark>

Network Time Protocol (NTP)  

Provide a service enabling clients across the Internet to be synchronised accurately to UTC

NTP employs statistical techniques for the filtering of timing data and it discriminates between the quality of timing data from different servers to offset delays encountered in Internet communication  

Based on originally proposed algorithm by Cristian

### <mark style="background: #FFF503A6;">NTP</mark>

Internet Standard  

<mark style="background: #FFF503A6;">Reliable:</mark>
- Against lengthy losses of connectivity  
- Provides redundant paths, redundant servers  

<mark style="background: #FFF503A6;">Scalable:</mark>
- Large numbers of clients can synchronise frequently  
- Offsets effects of clock drift  

<mark style="background: #FFF503A6;">Authenticates source of data:</mark>
- Providing protection against interference

### <mark style="background: #FFF503A6;">NTP servers:</mark>

NTP servers are connected in a logical hierarchy called a synchronisation subnet whose levels are called strata.  

<mark style="background: #FFF503A6;">Stratum-1 server:</mark> 
- a server with a reference clock such as a UTC receiver or an atomic clock,  
- The clock itself is said to operate at Stratum 0  
- Stratum 1- they are at the root systems - connected directly to accurate time source  

<mark style="background: #FFF503A6;">Stratum-2 servers:</mark> 
- secondary servers that are synchronised directly with the primary servers  
- systems synchronised from 1st stratum systems  

<mark style="background: #FFF503A6;">Stratum-3 servers:</mark> synchronised with Stratum-2 servers, and so on...  

The lowest-level (leaf) servers execute in users’ workstations, e.g. - Stratum-10: systems synchronised from 9th stratum systems

![[Pasted image 20251204170334.png]]

### <mark style="background: #FFF503A6;">Logical clocks</mark>  

What usually matters is not that all processes agree on exactly what time it is, but - that they agree on the order in which events occur  

Requires a notion of ordering  

A logical clock measures the passing of time in terms of logical operations, not the physical time

<mark style="background: #FFF503A6;">Assign sequence numbers to messages:</mark> All cooperating processes agree on order of events  

<mark style="background: #FFF503A6;">Assumptions:</mark> 
- No central time source
- Each system maintains its own local clock  
- No total ordering of events 
- Multiple processes, each one of them: Has unique IDs, Has its own incrementing counter

<mark style="background: #FFF503A6;">Main types:</mark>
- Lamport’s logical clocks  
- Vector clocks

### <mark style="background: #FFF503A6;">Logical clocks - Lamport logical clocks</mark>

<mark style="background: #FFF503A6;">Lamport clocks:</mark>
- Allow processes to assign sequence numbers, so called <mark style="background: #FFF503A6;">Lamport timestamps</mark>, to messages and other events  
- All cooperating processes can agree on the order of related events.  

<mark style="background: #FFF503A6;">A monotonically increasing software counter:</mark> Whose value does not have particular relationship to any physical clock.

To synchronise logical clocks, Lamport defined a relation called <mark style="background: #FFF503A6;">happens-before</mark>.

<mark style="background: #FFF503A6;">The happened-before relation (denoted by ->):</mark>
1. If a and b are two events in the same process, and a comes before b, then a->b.  
2. If a is the sending of a message, and b is the receipt of that message, then a->b  
3. If a->b and b->c, then a->c  

This introduces a <mark style="background: #FFF503A6;">partial ordering</mark> of events in a system with concurrently operating processes.

### <mark style="background: #FFF503A6;">Lamport Timestamps</mark>

Each process has its own clock, i.e. sequence - Lamport timestamps need a monotonically increasing software counter  

Clock is incremented before each event  

Each message carries a timestamp of the sender’s clock  

<mark style="background: #FFF503A6;">When a message arrives:</mark>  
- if receiver’s clock ≤ message_timestamp, then set system clock to (message_timestamp + 1)  
- set event timestamp to the system's clock  

<mark style="background: #FFF503A6;">Partial ordering:</mark> Lamport timestamps allow to maintain time ordering among related events

### <mark style="background: #FFF503A6;">Happened-before: Events occurring at three processes:</mark>

![[Pasted image 20251204171038.png]]

a->b, since the events occur in this order at process p1 (a->b), and similarly c->d.  

b->c, since these events are the sending and reception of message m1 , and similarly d->f.  

Combining these relations, we may say that, for example, a->f.  

<mark style="background: #FFF503A6;">Happened-before:</mark> relation captures a flow of data intervening between two events.  

Not all events are related by the relation, e.g. a and e , since they occur at different processes, and there is no chain of messages intervening between them. We say that events such as a and e that are not ordered by -> , are concurrent and write this as a||e.

### <mark style="background: #FFF503A6;">Lamport clocks usage</mark>

<mark style="background: #FFF503A6;">Replicated services:</mark> where the replicas are kept consistent by letting them execute the same operations in the same order everywhere.  

<mark style="background: #FFF503A6;">Mutual exclusion:</mark>  
- Mutual exclusion is about agreeing in which order processes are allowed to enter a critical region
- a section of code that can be executed by at most one process at a time  
- Algorithm similar for totally ordered multicasting can be used to establish access to a critical region.  
- <mark style="background: #FFF503A6;">Analogy with totally ordered multicast:</mark> With totally ordered multicast, all processes build identical queues, delivering messages in the same order

### <mark style="background: #FFF503A6;">Lamport’s logical clocks</mark>

<mark style="background: #FFF503A6;">Problem:</mark> How do we maintain a global view on the system’s behaviour that is consistent with the happened-before relation?  

<mark style="background: #FFF503A6;">Attach a timestamp C(e) to each event e, satisfying the following properties:</mark>
- P1: If a and b are two events in the same process, and a->b, then we demand that C(a) < C(b).  
- P2: If a corresponds to sending a message m, and b to the receipt of that message, then also C(a) < C(b).  

<mark style="background: #FFF503A6;">Problem:</mark> How to attach a timestamp to an event when there’s no global clock)?  

<mark style="background: #FFF503A6;">Answer:</mark> maintain a consistent set of logical clocks, one per process.

### <mark style="background: #FFF503A6;">Vector clocks</mark> 

Lamport’s clocks do not guarantee that if C(a)< C(b) that a causally preceded b.  

<mark style="background: #FFF503A6;">Vector clocks:</mark> Developed to overcome the shortcoming of Lamport’s clocks  

A vector clock for a system of N processes is an array of N integers.  

Each process keeps its own vector clock, Vi , which it uses to timestamp local events.  

Processes piggyback vector timestamps on the messages they send to one another

A vector is a logical clock that guarantees that if two operations can be ordered by their logical timestamps, then one must have happened before the other.  

Implemented with an array of counters, one for each process in the system.

A way of identifying which events are causally related  

Guaranteed to get the sequencing correct  

<mark style="background: #FFF503A6;">The problem:</mark>  
- The size of the vector increases with more actors, the entire vector must be stored with the data
- Comparison takes more time than comparing two numbers  
- If messages are concurrent, the application will have to decide how to handle conflicts

### <mark style="background: #FFF503A6;">Security Goals</mark>  

Keep systems, programs, and data secure  

<mark style="background: #FFF503A6;">Three areas:</mark>  
- <mark style="background: #FFF503A6;">Confidentiality:</mark> Keeping data & resources hidden  
- <mark style="background: #FFF503A6;">Integrity:</mark> Protecting against unauthorised changes to the data or resources  
- <mark style="background: #FFF503A6;">Availability:</mark> Ensuring that a system is accessible and capable of working to required performance specifications

### <mark style="background: #FFF503A6;">Security in distributed systems</mark>

<mark style="background: #FFF503A6;">Two specific concerns that centralised systems do not have:</mark> 
- <mark style="background: #FFF503A6;">use of a network:</mark> contents may be seen by other, possibly malicious, parties  
- <mark style="background: #FFF503A6;">use of servers:</mark> That authenticate the client and control access to services
- physical access to the system and the security controls - unknown to the client

### <mark style="background: #FFF503A6;">Security policy</mark>

Simply stating that a system should be able to protect itself against all possible security threats is not the way to actually build a secure system.  

What is first needed is a description of security requirements, that is, a security policy.  

A <mark style="background: #FFF503A6;">security policy</mark> describes precisely which actions the entities in a system are allowed to take and which ones are prohibited.  

<mark style="background: #FFF503A6;">Entities include:</mark> users, services, data, machines, and so on.  

Once a security policy has been laid down, it becomes possible to concentrate on the security mechanisms by which a policy can be enforced.

### <mark style="background: #FFF503A6;">Security mechanisms</mark>

<mark style="background: #FFF503A6;">Encryption:</mark> Transform data to something an attacker cannot understand, or that can be checked for modifications

<mark style="background: #FFF503A6;">Authentication:</mark> Verify a claimed identity  

<mark style="background: #FFF503A6;">Authorisation:</mark> Check an authenticated entity whether it has the proper rights to access resources.  

<mark style="background: #FFF503A6;">Monitoring and auditing:</mark> Continuously trace access to resources

### <mark style="background: #FFF503A6;">Secure distributed systems: design principles</mark>

Secure distributed systems are built around at least five design principles:  

<mark style="background: #FFF503A6;">Fail-safe defaults:</mark>  
- defaults should already provide good protection.  
- Infamous example: the default (user,password) “admin,admin” for edge devices (e.g. routers)  

<mark style="background: #FFF503A6;">Open design:</mark> do not apply security by obscurity: every aspect of a distributed system is open for review.  

<mark style="background: #FFF503A6;">Separation of privilege:</mark> ensure that critical aspects of a system can never be fully controlled by just a single entity.  

<mark style="background: #FFF503A6;">Least privilege:</mark> a process should operate with the fewest possible privileges.  

<mark style="background: #FFF503A6;">Least common mechanism:</mark> if multiple components require the same mechanism, then they should all be offered the same implementation of that mechanism

### <mark style="background: #FFF503A6;">Where to implement security mechanisms</mark>

We are increasingly seeing end-to-end security, meaning that mechanisms are implemented at the level of applications  

<mark style="background: #FFF503A6;">Issue:</mark> which layer do we trust?  

<mark style="background: #FFF503A6;">Trusted Computing Base:</mark> The set of all security mechanisms in a (distributed) computer system that are necessary and sufficient to enforce a security policy.

![[Pasted image 20251204172025.png]]

### <mark style="background: #FFF503A6;">Trusted Computing Base (TCB)</mark>

<mark style="background: #FFF503A6;">The TCB encompasses:</mark> firmware, hardware, software, as well as humans.  

The smaller the TCB, the better.  

The idea is that if the TCB can be clearly identified, we at least know what to concentrate on when scrutinising a computer system to state that it is secure.  

<mark style="background: #FFF503A6;">Identifying the TCB:</mark> identifying the modules that need to be trusted, and those that do not.

### <mark style="background: #FFF503A6;">Security of a distributed system</mark>

<mark style="background: #FFF503A6;">Can be achieved by:</mark>
- Securing processes and communication channels, and  
- Protecting objects (or resources of all types) they encapsulate against unauthorised access.  

<mark style="background: #FFF503A6;">Protecting objects/resources:</mark>
-  Uses access rights - specify who is allowed to perform the operations of an object/resource  
-  E.g., who is allowed to read or to write its state.  
-  A principal (the authority issuing access rights) - may be a user or a process.  
-  Illustrated example: the invocation comes from a user and the result from a server.

![[Pasted image 20251204172259.png]]

### <mark style="background: #FFF503A6;">Security model: Securing processes and communication channels</mark>

<mark style="background: #FFF503A6;">Enemy model:</mark>
-  Eavesdropping via message interception, repeated trials of network access.  
-  <mark style="background: #FFF503A6;">Threats to processes:</mark> inserting and forwarding incorrect IP addresses in message to servers or clients to confuse or disguise the enemy-sender.  
-  <mark style="background: #FFF503A6;">Threats to communication channels:</mark> copying, altering or inserting incorrect data into message streams to deceive or replicate unauthorised transactions (e.g. banking) 

These threats can be defeated by the use of secure channels, which are based on cryptography and authentication

![[Pasted image 20251204172429.png]]

### <mark style="background: #FFF503A6;">Security model: Defeating security threats</mark>

<mark style="background: #FFF503A6;">Cryptography and shared secrets:</mark>
-  <mark style="background: #FFF503A6;">Cryptography:</mark> the science of keeping messages secure  
-  <mark style="background: #FFF503A6;">Encryption:</mark> the process of scrambling a message in such a way as to hide its contents  

<mark style="background: #FFF503A6;">Authentication:</mark>  
-  proving the identities supplied by their senders.  
-  establishing and verifying the identity of a user (or a service, process, or server).  

<mark style="background: #FFF503A6;">Secure channels:</mark> Encryption and authentication are used to build secure channels as a service layer on top of existing comms services. A secure channel is a communication channel connecting a pair of processes, each of which acts on behalf of a principal.

![[Pasted image 20251204172544.png]]

### <mark style="background: #FFF503A6;">Secure Channels:</mark>

Each of the processes knows reliably the identity of the principal on whose behalf the other process is executing. This enables the server to protect its objects correctly and allows the client to be sure that is receiving results from a bona fide server.  

Ensure the privacy and integrity (protection against tampering) of the data transmitted across it.  

Each message includes a physical or logical time stamp to prevent messages from being replayed or reordered.  

<mark style="background: #FFF503A6;">Examples:</mark> Transport Layer Security (TLS) and its predecessor, Secure Sockets Layer (SSL), are cryptographic protocols which provide a secure channel between two communication peers.

### <mark style="background: #FFF503A6;">Confidential group communication</mark>

<mark style="background: #FFF503A6;">All group members share the same secret key:</mark>
-  Used to encrypt and decrypt all messages transmitted between group members.  
-  All members are trusted to indeed keep the key a secret  
-  Vulnerable to attacks compared to two-party secure channels.  

<mark style="background: #FFF503A6;">Use a separate shared secret key between each pair of group members:</mark>
-  As soon as one member turns out to be leaking information, the others can stop sending messages to that member, but still use the keys they were using to communicate with each other.  
- Instead of having to maintain one key, it is now necessary to maintain N(N − 1)/2 keys, which may be a difficult problem by itself.  

Using a <mark style="background: #FFF503A6;">public-key cryptosystem</mark> can improve matters. In that case, each member has its own (public key, private key), pair, in which the public key can be used by all members for sending confidential messages. In this case, a total of N key pairs are needed. If one member ceases to be trustworthy, it is simply removed from the group without having been able to compromise the other keys.

### <mark style="background: #FFF503A6;">Key management:</mark>

<mark style="background: #FFF503A6;">Essence:</mark> How do Alice and Bob get the correct (often shared) keys so that they can set up secure channels?  

Establishing and distributing keys is not a trivial matter.  

One of the more difficult parts in key management is the actual distribution of initial keys.

### <mark style="background: #FFF503A6;">Public Key Infrastructure</mark>

Public Key Infrastructure (PKI) is a term used for a framework that enables secure exchange of information based on public key cryptography.  

It allows identities (of people, organisations, etc.) to be bound to digital certificates and provides a means of verifying the authenticity of certificates.  

<mark style="background: #FFF503A6;">PKI encompasses:</mark>
-  Keys  
-  Certificates  
-  Public key encryption, and  
-  trusted Certification Authorities (CAs) who generate and digitally sign certificates.

### <mark style="background: #FFF503A6;">Fault Tolerance</mark>

<mark style="background: #FFF503A6;">Distributed systems - the notion of partial failure:</mark>
-  part of the system is failing while the remaining part continues to operate  
-  seemingly correctly

### <mark style="background: #FFF503A6;">Types of failures</mark>

<table>
	<tr>
		<th>Type</th>
		<th>Description of server’s behaviour</th>
	</tr>
	<tr>
		<td>Crash failure</td>
		<td>Halts, but is working correctly until it halts</td>
	</tr>
	<tr>
		<td>Omission failure, Receive omission, Send omission</td>
		<td>Fails to respond to incoming requests, Fails to receive incoming messages, Fails to send messages</td>
	</tr>
	<tr>
		<td>Timing failure</td>
		<td>Response lies outside a specified time interval</td>
	</tr>
	<tr>
		<td>Response failure, Value failure, State-transition failure</td>
		<td>Response is incorrect, The value of the response is wrong, Deviates from the correct flow of control</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Distributed Commit Problem</mark>

How to have an operation being performed by each member of a process group, or none at all.  

<mark style="background: #FFF503A6;">In the case of reliable multicasting:</mark> the operation is the delivery of a message.  

<mark style="background: #FFF503A6;">With distributed transactions:</mark> the operation may be the commit of a transaction at a single site that takes part in the transaction.  

<mark style="background: #FFF503A6;">Transaction:</mark> An operation composed of a number of discrete steps.

### <mark style="background: #FFF503A6;">Distributed commit protocols</mark> 

<mark style="background: #FFF503A6;">Problem:</mark> Have an operation being performed by each member of a process group, or none at all.  
-  <mark style="background: #FFF503A6;">Reliable multicasting:</mark> A message is to be delivered to all recipients.  
-  <mark style="background: #FFF503A6;">Distributed transaction:</mark> Each local transaction must succeed.

### <mark style="background: #FFF503A6;">Failure model for the commit protocols</mark>

<mark style="background: #FFF503A6;">Commit protocols are designed to work in an asynchronous system in which</mark>
-  servers may crash  
-  messages may be lost  

It is assumed that an underlying request-reply protocol removes corrupt and duplicated messages.  

<mark style="background: #FFF503A6;">There are no Byzantine faults:</mark> servers either crash or obey the messages they are sent

### <mark style="background: #FFF503A6;">Atomic commit protocols:</mark>

One coordinator and multiple participants  

<mark style="background: #FFF503A6;">One-phase:</mark> the coordinator communicates the commit or abort request to all of the participants in the transaction and keeps on repeating the request until all of them have acknowledged that they have carried it out.  

<mark style="background: #FFF503A6;">Two-phase:</mark> 
- designed to allow any participant to abort its part of a transaction
- can result in extensive delays for participants in the uncertain state.  

<mark style="background: #FFF503A6;">Three-phase:</mark>
- designed to alleviate delays due to participants in the uncertain state.
- more expensive in terms of the number of messages and the number of rounds
- required for the normal (failure-free) case.

### <mark style="background: #FFF503A6;">The two-phase commit protocol</mark>

During the progress of a transaction, the only communication between coordinator and participant is the join request  

<mark style="background: #FFF503A6;">The client request to commit or abort goes to the coordinator:</mark>
- if client or participant request abort, the coordinator informs the participants immediately
- if the client asks to commit, the 2PC comes into use  

<mark style="background: #FFF503A6;">2PC:</mark>
- <mark style="background: #FFF503A6;">voting phase:</mark> coordinator asks all participants if they can commit. if yes, participant records updates in permanent storage and then votes
- <mark style="background: #FFF503A6;">completion phase:</mark> coordinator tells all participants to commit or abort 
- the next slide shows the operations used in carrying out the protocol

<mark style="background: #FFF503A6;">Phase 1 (voting phase):</mark>
1. The coordinator sends a ``canCommit?`` request to each of the participants in the transaction.  
2. When a participant receives a ``canCommit?`` request it replies with its vote (Yes or No) to the coordinator. Before voting Yes, it prepares to commit by saving objects in permanent storage. If the vote is No the participant aborts immediately.  

<mark style="background: #FFF503A6;">Phase 2 (completion according to outcome of vote):</mark>  
3. The coordinator collects the votes (including its own).  
	- (a) If there are no failures and all the votes are Yes the coordinator decides to commit the transaction and sends a ``doCommit`` request to each of the participants.  
	- (b) Otherwise the coordinator decides to abort the transaction and sends ``doAbort`` requests to all participants that voted Yes.  
4. Participants that voted Yes are waiting for a ``doCommit`` or ``doAbort`` request from the coordinator. When a participant receives one of these messages it acts accordingly and in the case of commit, makes a ``haveCommitted`` call as confirmation to the coordinator.

### <mark style="background: #FFF503A6;">Performance of the two-phase commit protocol</mark>  

If there are no failures, the 2PC involving N participants requires - N ``canCommit``? messages and replies, followed by N  ``doCommit ``messages.  
- the cost in messages is proportional to 3N, and the cost in time is three rounds of messages. 
- The ``haveCommitted`` messages are not counted  

There may be arbitrarily many server and communication failures. 2PC is guaranteed to complete eventually, but it is not possible to specify a time limit within which it will be complete  
- delays to participants in uncertain state  
- some 3PCs designed to alleviate such delays. They require more messages and more rounds for the normal case

### <mark style="background: #FFF503A6;">Three-phase commit (3PC) protocol: Phase 1</mark>  

<mark style="background: #FFF503A6;">Phase 1: Voting phase</mark>  
- The coordinator sends a ``canCommit?`` request to each of the participants in the transaction. 
- <mark style="background: #FFF503A6;">Purpose:</mark> Find out if everyone agrees to commit  
- If the coordinator gets a timeout from any participant, or any NO replies are received - Send an abort to all participants  
- If a participant times out waiting for a request from the coordinator. It aborts itself (assume coordinator crashed)  
- Else continue to phase 2

### <mark style="background: #FFF503A6;">Phase 2: Prepare to commit phase</mark>

<mark style="background: #FFF503A6;">The coordinator collects the votes and makes a decision:</mark>
- If it is No, it aborts and informs participants that voted Yes  
- if the decision is Yes, it sends a ``preCommit`` request to all the participants.  
- Participants that voted Yes wait for a ``preCommit`` or ``doAbort`` request.  
- They acknowledge ``preCommit`` requests and carry out ``doAbort`` requests.

### <mark style="background: #FFF503A6;">Phase 3: Finalise phase</mark>  

The coordinator collects the acknowledgements.  

When all are received, it commits and sends ``doCommit`` requests to the participants.  

Participants wait for a ``doCommit`` request.  

When it arrives, they commit.

### <mark style="background: #FFF503A6;">Commit protocols: delays handling</mark>

<mark style="background: #FFF503A6;">Assumptions: communication does not fail:</mark>  

<mark style="background: #FFF503A6;">Two-phase commit protocol:</mark>
- the ‘uncertain/delay’ period occurs because a participant has voted yes but has not yet been told the outcome.
- It can no longer abort unilaterally  

<mark style="background: #FFF503A6;">Three-phase commit protocol:</mark>
- The participants ‘uncertain’ period lasts from when the participant votes yes until it receives the ``preCommit`` request.  
- At this stage, no other participant can have committed. Therefore if a group of participants discover that they are all ‘uncertain’ and the coordinator cannot be contacted, they can decide unilaterally to abort.

### <mark style="background: #FFF503A6;">3PC Weaknesses</mark>

It may result in inconsistent state when a crashed coordinator recovers  

It is not resilient against network partitions  

Consensus based protocols are designed to be resilient against network partitions  - Raft, Paxos

### <mark style="background: #FFF503A6;">Failure: network partitions</mark>

Network connectivity is split between group members - a member in a group cannot communicate with members in other groups  

Serious failure  

<mark style="background: #FFF503A6;">Network partition example:</mark>  
- The failure of a router between two networks  
- May mean that a collection of four processes is split into two pairs  
- Intra-pair communication is possible over their respective networks  
- Inter-pair communication is not possible while the router has failed.

![[Pasted image 20251204180052.png]]

### <mark style="background: #FFF503A6;">Consensus</mark>

<mark style="background: #FFF503A6;">Consensus - distributed agreement:</mark> recurring problem in distributed systems design.  

How to achieve reliability in presence of faulty processes - requires processes to agree on data value needed for computation

### <mark style="background: #FFF503A6;">Consensus - usage</mark>

<mark style="background: #FFF503A6;">Usage:</mark>
- <mark style="background: #FFF503A6;">Decide if to commit a transaction:</mark> agree everyone is done with a set of operations  
- Agree on identity of a leader  
- Distributed locks  
- <mark style="background: #FFF503A6;">Group membership:</mark> everyone agree on the set of group members  
- <mark style="background: #FFF503A6;">Mutual exclusion:</mark> all processes agree on who has exclusive access to a resource  
- <mark style="background: #FFF503A6;">Leader election:</mark> a group of processes has to decide which of them is in charge.  
- Replication

<mark style="background: #FFF503A6;">Distributed Consensus Algorithms:</mark>
- Paxos  
- Raft

### <mark style="background: #FFF503A6;">Paxos: High Overview</mark>

Paxos is a family of protocols providing distributed consensus - lets nodes agree on same value in spite of node failures, network failures, delays  

<mark style="background: #FFF503A6;">Goal:</mark> Agree on a single value even if multiple systems propose different values concurrently  

<mark style="background: #FFF503A6;">Common use:</mark>
- provide a consistent ordering of events from multiple clients  
- All machines running the algorithm agree on a proposed value from a client  
- The value will be associated with an event or action  
- Paxos ensures that no other machine associates the value with another event

### <mark style="background: #FFF503A6;">Raft Distributed Consensus: High Overview</mark>  

Developed in reaction to the inherent intricacies of Paxos - easier to understand  

Uses a fairly straightforward leader-election algorithm  

The current leader operates during the current term.

### <mark style="background: #FFF503A6;">Consistency, availability, and partitioning (CAP) theorem</mark>  

In 2000, Eric Brewer posed an important theorem which was later proven to be correct  

<mark style="background: #FFF503A6;">CAP theorem:</mark> Any networked system providing shared data can provide only two of the following three properties:  
- <mark style="background: #FFF503A6;">C:</mark> consistency, by which a shared and replicated data item appears as a single, up-to-date copy 
- <mark style="background: #FFF503A6;">A:</mark> availability, by which updates will always be eventually executed 
- <mark style="background: #FFF503A6;">P:</mark> Tolerant to the partitioning of process group.  

<mark style="background: #FFF503A6;">Conclusion:</mark> In a network subject to communication failures, it is impossible to realise an atomic read/write shared memory that guarantees a response to every request.

### <mark style="background: #FFF503A6;">CAP Theorem:</mark>

Essentially, when it seems that partitioning is taking place, the preferred option is to proceed
- tolerating partitions in favour of either consistency or availability  
- while simultaneously starting a recovery procedure that can mitigate the effects of potential inconsistencies.

### <mark style="background: #FFF503A6;">CAP Theorem Practical Ramification</mark>

The CAP theorem is all about reaching a trade-off between safety and liveness, based on the observation that obtaining both in an inherently unreliable system cannot be achieved. Practical distributed systems are inherently unreliable.  

One can argue that the CAP theorem moves designers of distributed systems from theoretical solutions to engineering solutions.  

In practical distributed systems, one simply has to make a choice to proceed despite the fact that another process cannot be reached.  
- In other words, we need to do something when a partition manifests itself through high latency
- Exactly deciding on how to proceed is application dependent

### <mark style="background: #FFF503A6;">Introduction to transactions</mark> 

A group of operations often represent a unit of “work”.  

<mark style="background: #FFF503A6;">Transaction:</mark> An operation composed of a number of discrete steps.  

Free from interference by operations being performed on behalf of other concurrent clients  

Either all of the operations must be completed successfully or they must have no effect at all in the presence of server crashes.

### <mark style="background: #FFF503A6;">ACID properties of transactions</mark> 

<mark style="background: #FFF503A6;">Atomicity:</mark> The transaction happens as a single indivisible action. Everything succeeds or else the entire transaction is rolled back. Others do not see intermediate results.  

<mark style="background: #FFF503A6;">Consistency:</mark> 
- A transaction takes the system from one consistent state to another consistent state. 
- A transaction cannot leave the database in an inconsistent state.
- E.g., total amount of money in all accounts must be the same before and after a transfer funds’ transaction

<mark style="background: #FFF503A6;">Isolated (Serialisable):</mark>  
- Each transaction must be performed without interference from other transactions - there must be no observation by other transactions of a transaction's intermediate effects.  
- If transactions run at the same time, the final result must be the same as if they executed in some serial order.

<mark style="background: #FFF503A6;">Durability:</mark> After a transaction has completed successfully, all its effects are saved in permanent storage.

### <mark style="background: #FFF503A6;">Atomicity of transactions</mark>  

Two aspects

<mark style="background: #FFF503A6;">1. All or nothing:</mark>  
- It either completes successfully, and the effects of all of its operations are recorded in the objects, or (if it fails or is aborted) it has no effect at all.  
- <mark style="background: #FFF503A6;">Two further aspects of its own:</mark>
	- <mark style="background: #FFF503A6;">Failure atomicity:</mark> the effects are atomic even when the server crashes; 
	- <mark style="background: #FFF503A6;">Durability:</mark> after a transaction has completed successfully, all its effects are saved in permanent storage.  
	
<mark style="background: #FFF503A6;">2. Isolation:</mark>  
- Each transaction must be performed without interference from other transactions
- There must be no observation by other transactions of a transaction's intermediate effects

### <mark style="background: #FFF503A6;">Transactions</mark>

Transactions are carried out concurrently for higher performance

<mark style="background: #FFF503A6;">Two common problems with transactions:</mark>
- Lost update  
- Inconsistent retrieval  

<mark style="background: #FFF503A6;">Solution:</mark> Serial equivalence

### <mark style="background: #FFF503A6;">Lost Update</mark> 

```
T1: A=read(x), write(x, A*10)  
T2: B=read(x), write(x, B*10)
```  

If not properly isolated, we could get the following interleaving:  
```
A=read(x), B=read(x), write(x, A*10),write(x, B*10)
```  

Executing T1 and T2 should have increased x by ten times twice, but - we lost one of the updates

### <mark style="background: #FFF503A6;">Inconsistent retrieval</mark>

```
T1: withdraw(x, 10), deposit(y, 10)  
T2: sum all accounts
```  

<mark style="background: #FFF503A6;">Improper interleaving:</mark>  
```
(T1)withdraw(x, 10), (T2)sum+=read(x),  
(T2)sum+=read(y), ..., (T1)deposit(y, 10)
```  

<mark style="background: #FFF503A6;">The sum would be incorrect:</mark>
- It doesn’t account for the 10 that are ‘in transit’  
- neither in x nor in y 
- the retrieval is inconsistent

### <mark style="background: #FFF503A6;">Serial equivalence</mark>

A serially equivalent interleaving is one in which the combined effect is the same as if the transactions had been done one at a time in some order  

Does not mean to actually perform one transaction at a time, as this would lead to bad performance  

<mark style="background: #FFF503A6;">The same effect means:</mark>
- the read operations return the same values  
- the instance variables of the objects have the same values at the end

### <mark style="background: #FFF503A6;">Serial equivalence and conflicting operations</mark> 

For two transactions to be serially equivalent, it is necessary and sufficient that all pairs of conflicting operations of the two transactions be executed in the same order at all of the objects they both access  

<mark style="background: #FFF503A6;">Consider:</mark>  T and U access i and j  
```
T: x = read(i); write(i, 10); write(j, 20);  
U: y = read(j); write(j, 30); z = read (i);
```  

<mark style="background: #FFF503A6;">serial equivalence requires that either:</mark> 
- T accesses i before U and T accesses j before U. or  
- U accesses i before T and U accesses j before T.  
- Serial equivalence is used as a criterion for designing concurrency control schemes

### <mark style="background: #FFF503A6;">Aborted transactions</mark>

Two problems associated with aborted transactions:  

<mark style="background: #FFF503A6;">‘Dirty reads’:</mark>
- A transaction observes a write from a transaction that has not completed yet.  
- An interaction between a read operation in one transaction and an earlier write operation on the same object by a transaction that then aborts  
- A transaction committed with a ‘dirty read’ is not recoverable  

<mark style="background: #FFF503A6;">‘Premature writes’:</mark> interactions between write operations on the same object by different transactions, one of which aborts  

Both can occur in serially equivalent executions of transactions

### <mark style="background: #FFF503A6;">Dirty reads</mark>

<mark style="background: #FFF503A6;">T1 reads a value that T2 wrote, then commits and later, T2 aborts:</mark>
- The value is “dirty”, since the update to it should not have happened  
- T1 has committed, so it cannot be undone  

<mark style="background: #FFF503A6;">Handling dirty reads:</mark> Transactions are only allowed to read objects that committed transactions have written

### <mark style="background: #FFF503A6;">Premature writes and Strict executions</mark> 

<mark style="background: #FFF503A6;">Premature writes:</mark> a problem related to the interaction between write operations on the same object belonging to different transactions.

<mark style="background: #FFF503A6;">Strict executions of transactions:</mark> The service delays both read and write operations on an object until all transactions that previously wrote that object have either committed or aborted. Enforces <mark style="background: #FFF503A6;">isolation</mark>

### <mark style="background: #FFF503A6;">Strict executions of transactions</mark>

<mark style="background: #FFF503A6;">Curing premature writes:</mark> if a recovery scheme uses ‘before images’, write operations must be delayed until earlier transactions that updated the same objects have either committed or aborted  

<mark style="background: #FFF503A6;">To avoid both ‘dirty reads’ and ‘premature writes’:</mark> 
- delay both read and write operations  
- If both read and write operations on an object are delayed until all transactions that previously wrote that object have either committed or aborted.  
- Enforces the property of <mark style="background: #FFF503A6;">isolation</mark>  

<mark style="background: #FFF503A6;">Tentative</mark> versions are used during progress of a transaction objects in tentative versions are stored in volatile memory

### <mark style="background: #FFF503A6;">Locks</mark>

Transactions must be scheduled so that their effect on shared data is serially equivalent.  

A server can achieve <mark style="background: #FFF503A6;">serial equivalence</mark> of transactions by serialising access to the objects.  

Serial equivalence requires that all of a transaction’s accesses to a particular object be serialised with respect to accesses by other transactions.  

Example of a serialising mechanism is the use of exclusive locks

### <mark style="background: #FFF503A6;">Exclusive locks</mark> 

Serialising mechanism  

Need an object? Get a lock for it! Read or write locks, or both (exclusive)  

<mark style="background: #FFF503A6;">Exclusive locks:</mark>
- Only one object can read or write at a time.  
- If you can't lock the data you have to wait  
- Server locks object it is about to use for a client  
- If a client requests access to an object that is already locked for another clients, the operation is suspended

### <mark style="background: #FFF503A6;">Two-phase locking</mark>

<mark style="background: #FFF503A6;">Two phase locking:</mark>
- Not permitted acquire a new lock after any release  
- Transactions acquire locks in a growing phase and release locks in a shrinking phase  
- Ensures serial equivalence

### <mark style="background: #FFF503A6;">Strict Two Phase Locking</mark>  

Extension of two-phase locking that prevents - <mark style="background: #FFF503A6;">dirty reads</mark> and <mark style="background: #FFF503A6;">premature writes</mark>  

Any locks acquired are not given back until the transaction completed or aborts - ensures <mark style="background: #FFF503A6;">durability</mark>  

Locks must be held until all the objects it updated have been written to permanent storage.  

Locks are only released upon commit / abort

### <mark style="background: #FFF503A6;">Rules for Strict Two-Phase Locking</mark>

1. <mark style="background: #FFF503A6;">When an operation accesses an object within a transaction:</mark> 
	- (a) If the object is not already locked, it is locked and the operation proceeds. 
	- (b) If the object has a conflicting lock set by another transaction, the transaction must wait until it is unlocked.  
	- (c) If the object has a non-conflicting lock set by another transaction, the lock is shared and the operation proceeds. 
	- (d) If the object has already been locked in the same transaction, the lock will be promoted if necessary and the operation proceeds. (Where promotion is prevented by a conflicting lock, rule (b) is used.)  

2. When a transaction is committed or aborted, the server unlocks all objects it locked for the transaction.

### <mark style="background: #FFF503A6;">Flat and Nested Transactions</mark> 

<mark style="background: #FFF503A6;">Flat transaction:</mark> Performed atomically on a unit of work  

<mark style="background: #FFF503A6;">Nested:</mark> 
- Hierarchical  
- Transactions may be composed of other transactions.  
- Several transactions may be started from within a transaction - we have a top-level transaction and subtransactions which may have their own subtransactions.  
-  To a parent, a subtransaction is atomic with respect to failures and concurrent access.  
-  Transactions at the same level can run concurrently but access to common objects is serialised
- a subtransaction can fail independently of its parent and other subtransactions; - when it aborts, its parent decides what to do, e.g. start another subtransaction or give up.

### <mark style="background: #FFF503A6;">Distributed transactions</mark>

<mark style="background: #FFF503A6;">A distributed transaction refers to a flat or nested transaction that accesses objects managed by:</mark>
- Multiple servers (processes)  
- All servers need to commit or abort a transaction  

<mark style="background: #FFF503A6;">Allows for even better performance:</mark> At the price of increased complexity

### <mark style="background: #FFF503A6;">Committing Distributed Transactions</mark>  

<mark style="background: #FFF503A6;">Transactions may process data at more than one server:</mark>  
- Problem: any server may fail or disconnect while a commit for transaction T is in progress.  
- They must agree to commit or abort
- “Log locally, commit globally.”  

<mark style="background: #FFF503A6;">The atomicity property of transactions:</mark> when a distributed transaction comes to an end, either all of its operations are carried out or none of them.

### <mark style="background: #FFF503A6;">Distributed commit problem</mark>

<mark style="background: #FFF503A6;">The distributed commit problem:</mark> having an operation being performed by each member of a process group, or none at all.  

<mark style="background: #FFF503A6;">With distributed transactions:</mark> the operation may be the commit of a transaction at a single site that takes part in the transaction.

### <mark style="background: #FFF503A6;">Distributed commit protocols</mark>

<mark style="background: #FFF503A6;">One-phase:</mark> the coordinator communicates the commit or abort request to all of the participants in the transaction and keeps on repeating the request until all of them have acknowledged that they have carried it out.  

<mark style="background: #FFF503A6;">Two-phase:</mark>
- designed to allow any participant to abort its part of a transaction  
- can result in extensive delays for participants in the uncertain state.  

<mark style="background: #FFF503A6;">Three-phase:</mark>
- designed to alleviate delays due to participants in the uncertain state.  
- more expensive in terms of the number of messages and the number of rounds  
- required for the normal (failure-free) case.