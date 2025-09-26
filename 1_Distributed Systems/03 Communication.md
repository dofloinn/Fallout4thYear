### <mark style="background: #FFF503A6;">Foundations:</mark>

<mark style="background: #FFF503A6;">Network communication protocols:</mark>
- the basis for any distributed system
- protocols developed for the Internet

<mark style="background: #FFF503A6;">An adapted network layering scheme:</mark>

![[Pasted image 20250925090759.png]]

### <mark style="background: #FFF503A6;">Middleware layer:</mark>

Middleware is invented to provide common services and protocols that can be used by many different applications
- A rich set of communication protocols
- (Un)marshaling of data, necessary for integrated systems
- Naming protocols, to allow easy sharing of resources
- Security protocols for secure communication
- Scaling mechanisms, such as for replication and caching

The rest are truly <mark style="background: #FFF503A6;">application-specific</mark> protocols

### <mark style="background: #FFF503A6;">Middleware protocols:</mark>

<mark style="background: #FFF503A6;">Domain Name System (DNS):</mark>
- Distributed service that is used to look up a network address associated with a name.
- Offering a general-purpose, application-independent service -forms part of the middleware.

<mark style="background: #FFF503A6;">Authentication protocols:</mark>
- provide proof of a claimed identity.

<mark style="background: #FFF503A6;">Distributed commit protocols:</mark> establish that in a group of processes, possibly spread out across a number of machines, either all processes carry out a particular operation, or that the operation is not carried out at all.

<mark style="background: #FFF503A6;">Distributed locking protocols:</mark> a resource can be protected against simultaneous access by a collection of processes that are distributed across multiple machines.

### <mark style="background: #FFF503A6;">Internet Protocol:</mark>

A set of protocols designed to handle the interconnection of a large number of local and wide-area networks that comprise the Internet

IPv4 & IPv6 (network layer)

<mark style="background: #FFF503A6;">IP-based protocols:</mark> TCP, UDP, etc.

<mark style="background: #FFF503A6;">IP is connectionless:</mark> No state needs to be saved at each router

<mark style="background: #FFF503A6;">Support multiple paths for data:</mark> packet delivery is not guaranteed 

### <mark style="background: #FFF503A6;">Internet Services, URLs and DNS:</mark>

<mark style="background: #FFF503A6;">Protocol:</mark> governs the communication that takes place between server and client

<mark style="background: #FFF503A6;">Each end of the dialogue must know:</mark>
- what may/must be sent to the other,
- the format in which it should be sent,
- the sequence in which it must be sent (if sequence matters),
- for ‘open-ended’ dialogues: how the dialogue is to be terminated

### <mark style="background: #FFF503A6;">Domain Name System (DNS):</mark>

A <mark style="background: #FFF503A6;">domain name</mark>, or <mark style="background: #FFF503A6;">host name</mark>, is the user-friendly equivalent of an IP address.

The individual parts of a domain name do not correspond to the individual parts of an IP address.

Domain names do not always have four parts (as IPv4 addresses must have).

The Domain Name provides a mapping between IP addresses and domain names and is held in a distributed database.

The IP address systems and the DNS are governed by ICANN (Internet Corporation for Assigned Names and Numbers) – non- profit making organization.

When a URL is submitted to a browser, the DNS converts the domain name part into its numeric IP equivalent.

### <mark style="background: #FFF503A6;">Uniform Resource Locator (URL)</mark>

Unique identifier for any resource located on the Internet

<mark style="background: #FFF503A6;">Structure:</mark>
``<protocol>://<hostname>[:port>]/[<pathname>][/<filename>[<section>]]``

Port may be omitted – for a well-known protocol, and the default port will be assumed.

If the file name is omitted, then the sever sends default file from the directory specified in the path name. This default file is commonly called index.html or default.html.

The ‘section’ part of the URL (not often specified, a name preceded by ‘#’) indicates a named ‘anchor’ in an HTML document.

### <mark style="background: #FFF503A6;">Processes:</mark>

<mark style="background: #FFF503A6;">Computer program:</mark>
- Collection of instructions
- process is the actual execution of those instructions

An executing instance of a program.

To facilitate communication between processes, most operating systems support Inter Process Communication (IPC) resources – such as pipes and sockets

IPC is used not just for communication between processes on the same system, but processes on different systems

### <mark style="background: #FFF503A6;">Interprocess communication</mark>

At the heart of all distributed systems

<mark style="background: #FFF503A6;">To communicate:</mark>
- one process sends a message (a sequence of bytes) to a destination
- another process at the destination receives the message.

This activity involves the communication of data from the sending process to the receiving process – may involve the synchronisation of the two processes.

### <mark style="background: #FFF503A6;">Types of communication:</mark>

<mark style="background: #FFF503A6;">Transient versus persistent communication:</mark>
- <mark style="background: #FFF503A6;">Transient communication:</mark> Comm. server discards message when it cannot be delivered at the next server, or at the receiver.
- <mark style="background: #FFF503A6;">Persistent communication:</mark> A message is stored at a communication server as long as it takes to deliver it.

<mark style="background: #FFF503A6;">Asynchronous versus synchronous communication:</mark>
- <mark style="background: #FFF503A6;">Asynchronous:</mark> a sender continues immediately after it has submitted its message for transmission. This means that the message is (temporarily) stored immediately by the middleware upon submission.
- <mark style="background: #FFF503A6;">Synchronous communication:</mark> the sender is blocked until its request is known to be accepted.

### <mark style="background: #FFF503A6;">Client/Server:</mark>

<mark style="background: #FFF503A6;">Client/Server computing is generally based on a model of transient synchronous communication:</mark>
- Client and server have to be active at the time of communication
- Client issues request and blocks until it receives reply
- Server essentially waits only for incoming requests, and subsequently processes them

<mark style="background: #FFF503A6;">Drawbacks of synchronous communication:</mark>
- Client cannot do any other work while waiting for reply
- Failures have to be handled immediately: the client is waiting
- The model may simply not be appropriate: mail, news

### <mark style="background: #FFF503A6;">Message-oriented communication</mark>

<mark style="background: #FFF503A6;">Message-oriented middleware:</mark>
- Aims at high-level persistent asynchronous communication:
- Processes send each other messages, which are queued
- Sender need not wait for immediate reply, but can do other things
- Middleware often ensures fault tolerance

<mark style="background: #FFF503A6;">Transient messaging with sockets:</mark>
- <mark style="background: #FFF503A6;">Socket:</mark> a communication end point to which an application can write data that are to be sent out over the underlying network, and from which incoming data can be read.
- <mark style="background: #FFF503A6;">Socket interface:</mark> introduced in the 1970s in Berkeley Unix, and has been adopted as a POSIX standard (with only very few adaptations).

### <mark style="background: #FFF503A6;">Types of communication:</mark>

<mark style="background: #FFF503A6;">Remote procedure call (RPC):</mark>
- Allow programs to call procedures located on other machines.
- When a process on machine A calls a procedure on machine B, the calling process on A is suspended, and execution of the called procedure takes place on B.
- No message passing at all is visible to the programmer.
- <mark style="background: #FFF503A6;">Inherently synchronous</mark> - by which a client is blocked until its request has been processed

<mark style="background: #FFF503A6;">Message-oriented communication:</mark> Allow processes to exchange information, even if the other party is not executing at the time communication is initiated.

<mark style="background: #FFF503A6;">Multicast communication:</mark> Supports sending data to multiple receivers.

### <mark style="background: #FFF503A6;">Ports and Sockets</mark>

Closely associated with the hardware communication links between computers within a network

Not themselves hardware elements.

Abstract concepts that allow the programmer to make use of those communication links.

### <mark style="background: #FFF503A6;">Sockets</mark>

Normally, there are multiple clients wanting the same service at the same time. E.g., multiple browsers wanting Web pages from the same server.

The server needs some way of distinguishing between clients and keeping their dialogues separate. This is achieved via the use of sockets.

It is used to indicate one of the two end points of a communication link between two processes.

Support different protocols and naming conventions – It is not just for the IPs.

### <mark style="background: #FFF503A6;">Ports</mark>

The number of available ports will normally greatly exceed the number that is actually used.

1 to 1023 port range normally set aside for the use of specified standard services (‘well-known’ services).
- E.g. port 80 is normally used by Web servers.

Application programs wishing to use ports for non-standard services should use a range of 1024 to 65 535.

![[Pasted image 20250925092441.png]]

| Protocol Name | Port Name | Nature of Service                                                                |
| ------------- | --------- | -------------------------------------------------------------------------------- |
| Echo          | 7         | The server echoes the data sent to it                                            |
| Daytime       | 13        | Provides the ASCII representation of the current date<br>and time on the server. |
| FTP-data      | 20        | Transferring files                                                               |
| FTP           | 21        | Sending FTP commands like PUT and GET                                            |
| Telnet        | 23        | Remote login and command line interaction                                        |
| SMTP          | 25        | E-mail                                                                           |
| HTTP          | 80        | The World Wide Web protocol                                                      |
| NNTP          | 119       | Usenet                                                                           |

### <mark style="background: #FFF503A6;">Transient messaging with sockets</mark>

<mark style="background: #FFF503A6;">Berkeley socket interface:</mark> introduced in the 1970s in Berkeley Unix, adopted as a POSIX standard

| Operation | Description                                                                               |
| --------- | ----------------------------------------------------------------------------------------- |
| socket    | Create a new communication end point                                                      |
| bind      | Attach a local address to a socket                                                        |
| listen    | Tell operating system what the maximum number of pending connection<br>requests should be |
| accept    | Block caller until a connection request arrives                                           |
| connect   | Actively attempt to establish a connection                                                |
| send      | Send some data over the connection                                                        |
| receive   | Receive some data over the connection                                                     |
| close     | Release the connection                                                                    |

### <mark style="background: #FFF503A6;">Advanced transient messaging</mark>

Sockets are rather low level and programming mistakes are easily made. However, the way that they are used is often the same, such as in a client-server setting

<mark style="background: #FFF503A6;">Sockets essentially support only TCP or UDP:</mark> any extra facility for messaging needs to be implemented separately by an application programmer.

We do often need more advanced approaches for message- oriented communication to make network programming easier
- to expand beyond the functionality offered by existing networking protocols,
- to make better use of local resources, etc.

### <mark style="background: #FFF503A6;">Making sockets easier to work with</mark>

Many messaging applications, or their components, can be effectively organized according to a few simple communication patterns.

By subsequently providing enhancements to sockets for each of these patterns, it may become easier to develop a networked, distributed application.

Alternative: ZeroMQ
- Provides a higher level of expression by pairing sockets: one for sending messages at process P and a corresponding one at process Q for receiving messages.
- ZeroMQ https://zeromq.org/

### <mark style="background: #FFF503A6;">Example: ZeroMQ sockets</mark>

Provides sockets through which all communication takes place.

<mark style="background: #FFF503A6;">Message transmission generally takes place over TCP connections:</mark>
- all communication is essentially connection-oriented
- setting up, and maintaining connections is kept mostly under the hood
- an application programmer need not bother with those issues.

All communication is asynchronous

### <mark style="background: #FFF503A6;">Using messaging patterns: ZeroMQ sockets</mark>

A socket may be bound to multiple addresses, effectively allowing a server to handle messages from very different sources through a single interface.

For example, a server can listen to multiple ports using a single blocking receive operation.

<mark style="background: #FFF503A6;">Support:</mark>
- <mark style="background: #FFF503A6;">Many-to-one communication:</mark> instead of just one-to-one communication as is the case with standard Berkeley sockets.
- One-to-many communication, i.e., multicasting.

### <mark style="background: #FFF503A6;">Using messaging patterns: ZeroMQ sockets:</mark>

ZeroMQ establishes a higher level of abstraction in socket-based communication by <mark style="background: #FFF503A6;">pairing sockets</mark> 
- a specific type of socket used for sending messages is paired with a corresponding socket type for receiving messages.
- Each pair of socket types corresponds to a communication pattern.

<mark style="background: #FFF503A6;">Three patterns:</mark>
- Request-reply
- Publish-subscribe
- Pipeline

### <mark style="background: #FFF503A6;">Message-oriented middleware:</mark>

Asynchronous persistent communication through support of middleware-level queues.

Queues correspond to buffers at communication servers.

<mark style="background: #FFF503A6;">Example: IBM’s MQ</mark>
- Application-specific messages are put into, and removed from queues
- Queues reside under the regime of a queue manager
- Processes can put messages only in local queues, or through an RPC mechanism

### <mark style="background: #FFF503A6;">Multicast Communication:</mark>

The basic idea is to disseminate information from <mark style="background: #FFF503A6;">one</mark> sender to <mark style="background: #FFF503A6;">multiple</mark> receivers.

An operation that sends a single message from one process to each of the members of a group of processes -usually in such a way that the membership of the group is transparent to
the sender.

Can span multiple physical networks

There is a range of possibilities in the desired behaviour of a multicast.

The simplest multicast protocol provides no guarantees about message delivery or ordering.

For many years a major issue in all solutions was setting up the communication paths for information dissemination.
- Involved a huge management effort, often requiring human intervention.
- ISPs have shown to be reluctant to support multicasting

With the advent of peer-to-peer technology, and notably structured overlay management, it became easier to set up communication paths.

As peer-to-peer solutions are typically deployed at the application layer, various application level multicasting techniques have been introduced.

Multicast communication can also be accomplished in other ways than setting up explicit communication paths, e.g. gossip-based information dissemination

### <mark style="background: #FFF503A6;">Multicast:</mark>

One-to-many or many-to-many distribution

<mark style="background: #FFF503A6;">In computer networking:</mark> Group communication where information is addressed to a group of destination computers simultaneously

<mark style="background: #FFF503A6;">Group communication, either:</mark>
- application layer multicast
- network assisted multicast - makes it possible for the source to efficiently send to the group in a single transmission

<mark style="background: #FFF503A6;">Network assisted multicast:</mark> May be implemented at the Internet layer using IP multicast

### <mark style="background: #FFF503A6;">Multicast: different ways</mark>

Multicast communication can also be accomplished in other ways than setting up explicit communication paths:
- Application-level multicasting
- Flooding-based multicasting
- Gossip-based data dissemination

### <mark style="background: #FFF503A6;">Application-level multicasting</mark>

Organize nodes of a distributed system into an overlay network and use that network to disseminate data:
- Often as a tree, leading to unique paths
- Alternatively, also mesh networks, requiring a form of routing

### <mark style="background: #FFF503A6;">Flooding:</mark>

Process ``P`` simply sends a message ``m`` to each of its neighbours.
- Each neighbour will forward that message, except to P, and only if it had not seen m before.
- The more edges, the more expensive

Flooding messages across the network is extremely robust, but – requires special attention if we want to avoid severe waste of resources as nodes may see messages multiple times.

### <mark style="background: #FFF503A6;">Gossip-based data dissemination</mark>

Gossip-based information dissemination provides ways for multicasting -Often less efficient

Deploys <mark style="background: #FFF503A6;">epidemic</mark> protocols

<mark style="background: #FFF503A6;">Epidemic protocols:</mark>
- The main goal of these protocols is to rapidly propagate information among a large collection of nodes using only local information.
- There is no central component by which information dissemination is coordinated.

### <mark style="background: #FFF503A6;">IP Multicast Protocol</mark>

Built on top the Internet Protocol

An implementation of multicast communication

IP packets are addressed to computers – ports belong to the TCP and UDP levels

IP multicast allows the sender to transmit a single IP packet to a set of computers that form a multicast group.

### <mark style="background: #FFF503A6;">IP multicasting:</mark>

Designed to span multiple physical networks.

No central coordinator and no restriction on the number of hosts that can be in a group

<mark style="background: #FFF503A6;">Provides network efficiency:</mark>
- Packets in a multicast stream only need to be replicated when a router needs to send them to multiple network links.
- Only one stream of packets is needed on any network segment regardless of the number of receivers

<mark style="background: #FFF503A6;">At the application programming level:</mark>
- IP multicast is available only via UDP.
- An application program performs multicasts by sending UDP datagrams with multicast addresses and ordinary port numbers.
- It can join a multicast group by making its socket join the group, enabling it to receive messages to the group

<mark style="background: #FFF503A6;">At the IP level:</mark>
- A computer belongs to a multicast group when one or more of its processes has sockets that belong to that group.
- When a multicast message arrives at a computer, copies are forwarded to all of the local sockets that have joined the specified multicast address and are bound to the specified port number.

Multicast addresses may be permanent or temporary.

Permanent groups exist even when there are no members – their addresses are assigned by IANA

The remainder of the multicast addresses are available for use by temporary groups, which must be created before use and cease to exist when all the members have left.

When a temporary group is created, it requires a free multicast address to avoid accidental participation in an existing group.

### <mark style="background: #FFF503A6;">Multicasting</mark>

<mark style="background: #FFF503A6;">Broader than unicast:</mark> one sender and one receiver, point-to-point communication

Narrower and more targeted than broadcast communication.

Sends data from one host to many different hosts, but not to everyone: The data only goes to clients that have expressed an interest by joining a particular multicast group.

<mark style="background: #FFF503A6;">Used for ‘public meetings’ on the Internet:</mark>
- a multicast socket sends a copy of the data to a location close to the parties that have declared an interest in the data;
- the data is duplicated only when it reaches the local network serving the interested clients;
- the data crosses the Internet only once.

Most multicast data is audio or video or both (relatively large and robust against data loss).

<mark style="background: #FFF503A6;">Multicast data is sent via UDP:</mark> unreliable – but can be as much as three times faster than data sent via connection-oriented TCP.

A multicast group is specified by a class D IP address and by a standard UDP port number.

Class D IP addresses are in the range 224.0.0.0 to 239.255.255.255, inclusive.

The address 224.0.0.0 is reserved and should not be used (the address of the Network Time Protocol distributed service– assigned the name ``ntp.mcast.net``)

Better than broadcast where everyone receives traffic – And broadcasting is limited.

With multicasting, data duplicated only where necessary

Routers typically form trees to efficiently distribute information

The IP multicast protocol is relying on a few routers that support IP multicast routing to determine the routes, but transmitting IP packets through other routers using standard IP addresses.

### <mark style="background: #FFF503A6;">Multicast Group</mark>

A set of Internet hosts that share a multicast address.

<mark style="background: #FFF503A6;">Dynamic membership:</mark> Machine can join or leave at any time

Any data sent to the multicast address is relayed to all the members of the group. Membership in a multicast group is open; hosts can enter or leave the group at any time.

<mark style="background: #FFF503A6;">Groups can be either permanent or transient:</mark>
- Permanent groups have assigned addresses that remain constant, whether or not there are any members in the group; typically given names
- Most multicast groups are transient – exist only as long as they have members (in the 255 -- 238 range).

### <mark style="background: #FFF503A6;">IP multicasting</mark>

No restriction on number of hosts in a group

Machine does not need to be a member to send messages

<mark style="background: #FFF503A6;">Efficient:</mark> Packets are replicated only when necessary

### <mark style="background: #FFF503A6;">IP Multicast Addresses</mark>

Internet Assigned Numbers Authority
- IPv4 addresses: https://www.iana.org/assignments/multicast-addresses/multicast-addresses.xml
- IPv6 addresses: https://www.iana.org/assignments/ipv6-multicast-addresses/ipv6-multicast-addresses.xhtml

<mark style="background: #FFF503A6;">For multicast:</mark>
- 224.0.0.0: reserved 
- 224.0.0.1 (all-hosts group): contains all multicast-capable hosts on this subnet
- 224.0.0.2 (all-routers group): contains all multicast routers on this subnet
- 224.0.12.0-63: Microsoft & MSNBC
- FF02:0:0:0:0:0:0:9: RIP routers

### <mark style="background: #FFF503A6;">Internet Group Management Protocol (IGMP):</mark>

Allows a router to determine to which network to forward IP multicast traffic: multicast-aware router

Employed between a host and its attached router

<mark style="background: #FFF503A6;">Note:</mark>
- When IP packets flow through multiple physical networks, they go through routers, which bridge one network to another.
- <mark style="background: #FFF503A6;">A multicast-aware router:</mark> knows if there are any hosts on a physical network that belong to a multicast group.

### <mark style="background: #FFF503A6;">IP Multicast Use:</mark>

Initially Internet radio, NASA shuttle missions, collaborative gaming

<mark style="background: #FFF503A6;">IPTV (Internet Protocol Television)</mark>
- Cable TV networks are moving to IP delivery
- Multicast allows one stream of data to be sent to multiple subscribers using a single address

<mark style="background: #FFF503A6;">Reduces:</mark>
- number of servers
- number of duplicate network streams

### <mark style="background: #FFF503A6;">References</mark>

Chapter 4: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, 5/E

Chapter 4: Maarten van Steen, Andrew S. Tanenbaum, Distributed Systems, 3rd edition (2017)