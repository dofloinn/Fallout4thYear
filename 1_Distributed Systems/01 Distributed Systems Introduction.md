### <mark style="background: #FFF503A6;">What is a Distributed System (DS)?</mark>

Multiple computers working together on one task

Computers are connected by a network, and exchange information

A collection of autonomous computing elements that appears to its users as a single system.

<mark style="background: #FFF503A6;">Single system</mark> – users are not aware of distribution

A distributed system is a collection of <mark style="background: #FFF503A6;">autonomous computing elements</mark> that appears to its users as a <mark style="background: #FFF503A6;">single system</mark>.
- No shared operating system
- No shared memory
- No shared clock
- Transparency of independent failure

<mark style="background: #FFF503A6;">Autonomous computing elements:</mark>
- nodes. 
- Hardware devices or software processes

<mark style="background: #FFF503A6;">Single coherent system:</mark>
- Users or applications perceive a single system
- Nodes need to collaborate.

### <mark style="background: #FFF503A6;">Sharing Resources</mark>

Key motivation for DS is sharing resources, e.g. data storage, printers, files, databases, programs/applications, multimedia services: camera video/image, audio/phone data

Peer-to-peer assisted multimedia streaming

File-sharing peer-to-peer networks, e.g. BitTorrent

Cloud-based shared storage and files

Shared mail services, i.e. outsourced mail systems

Shared Web hosting: content distribution networks that offer storage for hosting copies of Web documents allowing Web clients to access pages nearby, and thus to access them
quickly

### <mark style="background: #FFF503A6;">Collection of autonomous nodes</mark>

Independent behaviour. Each node is autonomous and will thus have its own
notion of time: there is no global clock.

How to manage group membership?

How to know that you are indeed communicating with an authorised (non)member?

### <mark style="background: #FFF503A6;">Types of distributed systems</mark>

<mark style="background: #FFF503A6;">High performance distributed computing systems:</mark>
- Started with parallel computing
- Distributed shared memory systems
- Cluster computing - a group of high-end systems connected through a LAN
- Grid computing
- Cloud computing

Distributed information systems: Integrating applications

Distributed systems for pervasive computing

### <mark style="background: #FFF503A6;">Distributed information systems</mark>

Integrating applications

<mark style="background: #FFF503A6;">Situation:</mark> Organisations confronted with many networked applications, but achieving interoperability was painful.

<mark style="background: #FFF503A6;">Basic approach:</mark>
- A networked application is one that runs on a server making its services available to remote clients.
- Simple integration: clients combine requests for (different) applications; send that off; collect responses and present a coherent result to the user.

<mark style="background: #FFF503A6;">Next step:</mark> Allow direct application-to-application communication, leading to Enterprise Application Integration.

### <mark style="background: #FFF503A6;">Distributed pervasive systems</mark>

Distributed systems in which nodes are small, mobile, and often embedded in a
larger system. The system naturally blends into the user’s environment.

Supported/spurred by advances in embedded system design device miniaturisation and wireless networking.

<mark style="background: #FFF503A6;">Three (overlapping) subtypes:</mark>
- <mark style="background: #FFF503A6;">Ubiquitous computing systems:</mark> pervasive and continuously present, i.e., there is a continuous interaction between system and user.
- <mark style="background: #FFF503A6;">Mobile computing systems</mark> pervasive, but emphasis is on the fact that devices are inherently mobile.
- <mark style="background: #FFF503A6;">Sensor (and actuator) networks:</mark> pervasive, with emphasis on the actual (collaborative) sensing and actuation of the environment.

### <mark style="background: #FFF503A6;">Middleware and distributed systems:</mark>

<mark style="background: #FFF503A6;">Middleware - the OS of distributed systems:</mark>
- middleware is the same to a distributed system as what an operating system is to a computer
- a manager of resources offering its applications to efficiently share and deploy those resources across a network.

<mark style="background: #FFF503A6;">What does it contain?</mark> Commonly used components and functions that need not be implemented by applications separately.

# <mark style="background: #FFB8EBA6;">SLIDE 9 DIAGRAM</mark>

### <mark style="background: #FFF503A6;">DS Characteristics:</mark>

<mark style="background: #FFF503A6;">Concurrency:</mark> Collaborative and cooperative problem-solving (interdependencies)

<mark style="background: #FFF503A6;">Independent failures of components:</mark> Autonomous but interdependent - requires coordination, graceful degradation

<mark style="background: #FFF503A6;">Lack of global clocks:</mark>
- Each node is autonomous and will thus have its own notion of time: there is no global clock.
- Leads to fundamental synchronisation and coordination problems.

<mark style="background: #FFF503A6;">Heterogeneity:</mark> Hardware/software (programs, data) variations in component systems

<mark style="background: #FFF503A6;">Openness:</mark> Modularity, architecture and standards allow extensibility

<mark style="background: #FFF503A6;">Security:</mark> Protection (internal and external) against malicious use or attack – integrity

<mark style="background: #FFF503A6;">Scalability:</mark> Accommodation of increased users and resource demands over time

<mark style="background: #FFF503A6;">Transparency:</mark> Hide separation of components (hidden by middleware)

### <mark style="background: #FFF503A6;">Scalability: more performance</mark>

<mark style="background: #FFF503A6;">Our computing needs exceed CPU advances:</mark>
- Movie rendering
- Google search queries (99,000 search queries every second (approximately), Uses hundreds of thousands of servers to do this)

<mark style="background: #FFF503A6;">What if we need more performance than a single CPU?</mark>
- Combine CPUs – multiprocessors, or
- Create distributed systems

### <mark style="background: #FFF503A6;">Examples of Distributed Systems:</mark>

- The Internet
- Multiplayer Games
- Stock markets
- Web Search

<mark style="background: #FFF503A6;">Google – a sophisticated distributed system infrastructure:</mark>
- A very large numbers of networked computers located at data centres all around the world
- A distributed file system designed to support very large files and heavily optimised for the style of usage required by search and other Google applications
- An associated structured distributed storage system with fast access to very large datasets
- A lock service distributed system functions such as distributed locking and agreement.

### <mark style="background: #FFF503A6;">Perspectives on distributed systems:</mark>

Distributed systems are complex

<mark style="background: #FFF503A6;">Different perspectives:</mark>
- <mark style="background: #FFF503A6;">Architecture:</mark> common organisations
- <mark style="background: #FFF503A6;">Process:</mark> what kind of processes, and their relationships
- <mark style="background: #FFF503A6;">Communication:</mark> facilities for exchanging data
- <mark style="background: #FFF503A6;">Coordination:</mark> application-independent algorithms
- <mark style="background: #FFF503A6;">Naming:</mark> how do you identify resources?
- <mark style="background: #FFF503A6;">Consistency and replication:</mark> performance requires of data, which need to be the same
- <mark style="background: #FFF503A6;">Fault tolerance:</mark> keep running in the presence of partial failures
- <mark style="background: #FFF503A6;">Security:</mark> ensure authorised access to resources

### <mark style="background: #FFF503A6;">DS Challenges:</mark>

<mark style="background: #FFF503A6;">Fundamental issue:</mark>
- Different nodes have different knowledge.
- One node does not know the status of other nodes in the network

If each node knew exactly the status at all other nodes in the network, computing would be easy: Impossible, theoretically and practically

### <mark style="background: #FFF503A6;">Theoretical issue: Knowledge cannot be perfectly up to date</mark>

<mark style="background: #FFF503A6;">Information transmission speed:</mark> hardware and software limitations of the nodes & network

New things can happen while information is travelling from node A to node B

B can never be perfectly up to date about the status of A

### <mark style="background: #FFF503A6;">Practical Challenges:</mark>

<mark style="background: #FFF503A6;">Communication is costly:</mark> It is not practical to transmit everything from A to
B all the time

<mark style="background: #FFF503A6;">There are many nodes:</mark> Transmitting updates to all nodes and receiving
updates from all nodes are even more impractical

### <mark style="background: #FFF503A6;">DS Challenges – Heterogeneity I:</mark>

Heterogeneity (variety and difference) applies to:
- <mark style="background: #FFF503A6;">Networks:</mark> differences are masked by the fact that all of the computers use the Internet protocols to communicate.
- <mark style="background: #FFF503A6;">Hardware:</mark> data types, such as integers, may be represented in different ways on different sorts of hardware (byte ordering: big-endian, little-endian)
- <mark style="background: #FFF503A6;">Operating systems:</mark> do not provide the same application API to the Internet protocols.
- <mark style="background: #FFF503A6;">Programming languages:</mark> used different representations for characters and data structures, such as arrays and records.
- <mark style="background: #FFF503A6;">Developers:</mark> representation of primitive data items and data structures needs to be agreed upon (standards)

### <mark style="background: #FFF503A6;">DS Challenges – Heterogeneity I:</mark>

<mark style="background: #FFF503A6;">Middleware:</mark>
- Software layer that provides a programming abstraction as well as masking the heterogeneity of the underlying networks, hardware, operating systems and programming languages
- All middleware deals with the differences in operating systems and hardware.

<mark style="background: #FFF503A6;">Mobile code:</mark>
 - The code that can be sent from one computer to another and run at the destination. Machine code suitable for running on one type of computer hardware is not suitable for running on another
 - <mark style="background: #FFF503A6;">Virtual machines approach:</mark> provides a way of making code executable on any hardware: the compiler for a particular language generates code for a virtual machine instead of a particular hardware order code.

### <mark style="background: #FFF503A6;">DS Challenges - Openness:</mark>

The characteristic that determines whether the system can be extended and re-implemented in various ways.

Can it be extended with new content/services without disruption to the underlying system?

Key interfaces/standards are published

Standards
- Request For Comments (RFC)s
- IETF
- W3C

Everything conforms to a standard!

<mark style="background: #FFF503A6;">Open systems:</mark> key interfaces are published.

Open distributed systems are based on the provision of a uniform communication mechanism and published interfaces for access to shared resources.

They can be constructed from heterogeneous hardware and software - possibly from different vendors.

### <mark style="background: #FFF503A6;">DS Challenges - Security:</mark>

Focuses on how to ensure authorised access to resources.

<mark style="background: #FFF503A6;">Three main issues:</mark>
- <mark style="background: #FFF503A6;">Confidentially:</mark> protection against unauthorised information disclosure
- <mark style="background: #FFF503A6;">Integrity:</mark> protection against unauthorised information modification
- <mark style="background: #FFF503A6;">Availability:</mark> protection against unauthorised denial of use - interference with the means to access the resources

### <mark style="background: #FFF503A6;">DS Challenges - Scalability:</mark>

A system is scalable if it will remain effective if there is a significant increase in the number of resources and the number of users

<mark style="background: #FFF503A6;">Control cost of physical resources:</mark> 
- For a system with n users to be scalable, the quantity of physical resources required to support them should be at most O(n) – that is, proportional to n.
- E.g., if a single file server can support 20 users, then two such servers should be able to support 40 users

<mark style="background: #FFF503A6;">Avoid performance bottle neck:</mark>
- Algorithms should be decentralised to avoid having performance bottlenecks. Predecessor of the Domain Name System (DNS) kept the name table in a single master file that could be downloaded to any computers that needed it - fine with a few hundred computers.
- The DNS removed the bottleneck by partitioning the name table between servers located throughout the Internet and administered locally.

<mark style="background: #FFF503A6;">Scalability techniques:</mark> Replicated data, caching, multiple servers etc.

### <mark style="background: #FFF503A6;">Techniques for scaling:</mark>

<mark style="background: #FFF503A6;">Hide communication latencies:</mark>
- Make use of asynchronous communication
- Have separate handler for incoming response
- <mark style="background: #FFF503A6;">Problem:</mark> not every application fits this model

Facilitate solution by moving computations to client

# <mark style="background: #FFB8EBA6;">SLIDE 27 DIAGRAM</mark>

<mark style="background: #FFF503A6;">Partition data and computations across multiple machines:</mark>
- Move computations to clients (scripts)
- Decentralised naming services (DNS)
- Decentralised information systems (WWW)

<mark style="background: #FFF503A6;">Replication and caching: Make copies of data available at different machines</mark>
- Replicated file servers and databases
- Mirrored Websites
- Web caches (in browsers and proxies)
- File caching (at server and client)

### <mark style="background: #FFF503A6;">Scaling: The problem with replication</mark>

<mark style="background: #FFF503A6;">Applying replication is easy, except for one thing:</mark>
- Having multiple copies (cached or replicated), leads to <mark style="background: #FFF503A6;">inconsistencies</mark>: modifying one copy makes that copy different from the rest.
- Always keeping copies consistent and in a general way requires <mark style="background: #FFF503A6;">global synchronisation</mark> on each modification.
- Global synchronisation precludes large-scale solutions. 

<mark style="background: #FFF503A6;">Observation:</mark> If we can tolerate inconsistencies, we may reduce the need for global synchronisation, but <mark style="background: #FFF503A6;">tolerating inconsistencies is application dependent</mark>.

### <mark style="background: #FFF503A6;">DS Challenges - Failure Handling:</mark>

Failures in distributed systems are mostly partial failures which can make failure handling more difficult

<mark style="background: #FFF503A6;">Detecting failures:</mark> Checksums

<mark style="background: #FFF503A6;">Masking failures:</mark>
- retransmission
- duplicate files

<mark style="background: #FFF503A6;">Tolerating failures:</mark> Web pages (informing users about failure)

<mark style="background: #FFF503A6;">Recovery:</mark> permanent data ‘rolled back’

<mark style="background: #FFF503A6;">Redundancy (use of redundant components):</mark>
- Duplication in routes, hardware,
- DNS – every name table replicated in at least two different servers,
- Databases – replicated in several servers

<mark style="background: #FFF503A6;">Availability</mark> – measure of the proportion of time a system is available for use.

DS provide a high degree of availability regarding hardware faults

### <mark style="background: #FFF503A6;">DS Challenges - Concurrency:</mark>

Resources can be shared by clients in a distributed system. Several clients may access a shared resource at the same time

Not acceptable that each request be processed in turn - must be able to process requests concurrently

<mark style="background: #FFF503A6;">Data consistency:</mark> For each ‘object’ that represents a shared resource, its operations must be synchronised in such a way that its data remains consistent

### <mark style="background: #FFF503A6;">Distribution Transparency:</mark>

<mark style="background: #FFF503A6;">Hide distribution from users and from software:</mark>
- <mark style="background: #FFF503A6;">Access:</mark> Hide differences in data representation and how an object is accessed
- <mark style="background: #FFF503A6;">Location:</mark> Hide where an object is located
- <mark style="background: #FFF503A6;">Relocation:</mark> Hide that an object may be moved to another location while in use
- <mark style="background: #FFF503A6;">Migration:</mark> Hide that an object may move to another location 
- <mark style="background: #FFF503A6;">Replication:</mark> Hide that an object is replicated
- <mark style="background: #FFF503A6;">Concurrency:</mark> Hide that an object may be shared by several independent users
- <mark style="background: #FFF503A6;">Failure:</mark> Hide the failure and recovery of an object

### <mark style="background: #FFF503A6;">DS Challenges – Transparency:</mark>

<mark style="background: #FFF503A6;">Access transparency:</mark>
- Enables local and remote resources to be accessed using identical operations.
- A GUI with folders, which is the same whether the files are local or remote.

<mark style="background: #FFF503A6;">Location transparency:</mark>
- Enables resources to be accessed without knowledge of their location
- Naming - plays an important role in achieving location transparency. E.g. uniform resource locator(URL), https://www.distributed-systems.net/ - does not give the actual location of the Web server where this (DS) book is offered.

<mark style="background: #FFF503A6;">Relocation:</mark>
- supports the mobility of processes and resources initiated by users, without affecting ongoing communication and operations.
- becoming increasingly important in the context of cloud computing: where services are provided by huge collections of remote servers.
- E.g. communication between mobile phones – people walking, moving

<mark style="background: #FFF503A6;">Replication transparency:</mark>
- enables multiple instances of resources to be used; e.g. one can take over when another fails.
- increases reliability and performance without knowledge of the replicas by users or application programmers

<mark style="background: #FFF503A6;">Concurrency transparency:</mark> Enables several processes to operate concurrently using shared resources without interference between them.

<mark style="background: #FFF503A6;">Failure transparency:</mark>
- enables the concealment of faults, allowing users and application programs to complete their tasks despite the failure of hardware or software components.
- Email is eventually delivered, even when servers or communication links fail.

### <mark style="background: #FFF503A6;">Summary:</mark>

A distributed system is a collection of autonomous computing elements that appears to its users as a single coherent system.

Resource sharing is the main motivating factor for constructing distributed systems.

Middleware is a key facility for the building of distributed systems