### <mark style="background: #FFF503A6;">Indirect Communication</mark> 

The essence – to communicate through an intermediary  

No direct coupling between the sender and the one or more receivers. Coupling refers to the degree of direct knowledge that one element has of another.

### <mark style="background: #FFF503A6;">Coupling Approaches for Distributed Systems</mark>

<mark style="background: #FFF503A6;">Direct coupling:</mark>  
- Interaction through a stable interface  
- API call is hard coded  

<mark style="background: #FFF503A6;">Loose coupling:</mark>
- Resilient relationship between two or more systems or organizations with some kind of exchange relationship  
- Each end of the transaction makes its requirements explicit, e.g.  as an interface description, and makes few assumptions about the other end.  

<mark style="background: #FFF503A6;">Decoupled:</mark>
- De-coupled in space and time using (event) messages e.g. via Message-oriented Middleware (MoM), publish-subscribe  
- Often asynchronous stateless indirect communication e.g. publish-subscribe or complex event processing systems)

<mark style="background: #FFF503A6;">Direct coupling:</mark> Hard to change since subsequent changes in implementation are needed  

Loose coupling Enhanced flexibility; a change in one module will not require a change in the implementation of another module  

<mark style="background: #FFF503A6;">Example:</mark> (Web) Services, which are called via interface; service behind interface might be replaced  

<mark style="background: #FFF503A6;">Decoupled:</mark>
- Asynchronous communication  
- Parallel processing  
- Difficult to ensure transactional integrity  
- Issues in maintaining synchronisation  

<mark style="background: #FFF503A6;">Example:</mark> Event-driven Publish/Subscribe; events are received and sent

### <mark style="background: #FFF503A6;">Indirect Communication Usage:</mark>

In distributed systems where change is anticipated – in mobile environments where users may rapidly connect to and disconnect from the global network – and must be managed to provide more dependable services.  

For event dissemination in distributed systems where the receivers may be unknown and liable to change  

E.g. in managing event feeds in financial systems

### <mark style="background: #FFF503A6;">Relationship with asynchronous communication</mark> 

<mark style="background: #FFF503A6;">Asynchronous communication:</mark>
- A sender sends a message and then continues (without blocking)  
- there is no need to meet in time with the receiver to communicate  

<mark style="background: #FFF503A6;">Time uncoupling:</mark> 
- The sender and the receiver(s) can have independent existence  
- for example, the receiver may not exist at the time communication is initiated

### <mark style="background: #FFF503A6;">Indirect communication techniques</mark>

1. <mark style="background: #FFF503A6;">Group communication:</mark> in which communication is via a group abstraction with the sender unaware of the identity of the recipients  
2. <mark style="background: #FFF503A6;">Publish-subscribe systems:</mark> a family of approaches that all share the common characteristic of disseminating events to multiple recipients through an intermediary  
3. <mark style="background: #FFF503A6;">Message queue systems:</mark> messages are directed to the familiar abstraction of a queue with receivers extracting messages from such queues  
4. <mark style="background: #FFF503A6;">Shared memory–based approaches:</mark> allows a processor to address a memory location at another computer as if it were local memory

### <mark style="background: #FFF503A6;">Group Communication</mark>

A message is sent to a group and then this message is delivered to all members of the group.  

The sender is not aware of the identities of the receivers.  

Represents an abstraction over multicast communication  

<mark style="background: #FFF503A6;">May be implemented over:</mark>
- IP multicast; or  
- An equivalent <mark style="background: #FFF503A6;">overlay network</mark> adding significant extra value in terms of managing group membership, detecting failures and providing reliability and ordering guarantees.

### <mark style="background: #FFF503A6;">Overlay networks</mark>

A virtual network consisting of nodes and virtual links, which sits on top of an underlying network (such as an IP network) and offers something that is not otherwise provided:  
- a service that is tailored towards the needs of a class of application or a particular <mark style="background: #FFF503A6;">higher-level service:</mark> for example, multimedia content distribution;
- more efficient operation in a given networked environment for example routing in an ad hoc network;
- an <mark style="background: #FFF503A6;">additional feature</mark> for example, multicast or secure communication.  

<mark style="background: #FFF503A6;">Example:</mark> – Skype

### <mark style="background: #FFF503A6;">Group Communication: Key areas of application</mark>

An important building block for reliable distributed systems  

The reliable dissemination of information to potentially large numbers of clients, e.g. in the financial industry, where institutions require accurate and up-to date access to a wide variety of information sources;  

Support for collaborative applications, where events must be disseminated to multiple users to preserve a common user view e.g. in multiuser games;  

Support for a range of fault-tolerance strategies
- E.g. the consistent update of replicated data, or
- the implementation of highly available (replicated) servers;  

Support for system monitoring and management e.g. load balancing strategies.

### <mark style="background: #FFF503A6;">Group Communication: Programming Model</mark>

The central concept is that of a group with associated group membership - processes may join or leave the group.  

Processes can then send a message to this group and have it propagated to all members of the group with certain guarantees in terms of reliability and ordering.  

Thus, group communication implements multicast communication – in which a message is sent to all the members of the group by a single operation.  

A process issues only one multicast operation to send a message to each of a group of processes.

### <mark style="background: #FFF503A6;">Group Communication: Other Key Distinctions</mark>  

A wide range of group communication services has been developed, and they vary in the assumptions they make:  
- Closed and open groups  
- Overlapping and non-overlapping groups  
- Synchronous and asynchronous systems

### <mark style="background: #FFF503A6;">Closed and open groups</mark>
  
<mark style="background: #FFF503A6;">Closed group:</mark>
- if only members of the group may multicast to it.  
- A process in a closed group delivers to itself any message that it multicasts to the group.  
- Useful for delivering events to groups of interested processes.  

<mark style="background: #FFF503A6;">Open group:</mark>
- if processes outside the group may send to it.  
- The categories ‘open’ and ‘closed’ also apply with analogous meanings to mailing lists.  
- Useful for cooperating servers to send messages to one another that only they should receive.
 
![[Pasted image 20251106101655.png]]

### <mark style="background: #FFF503A6;">Overlapping and non-overlapping groups</mark>  

<mark style="background: #FFF503A6;">In overlapping groups:</mark> entities (processes or objects) may be members of multiple groups  

<mark style="background: #FFF503A6;">Non-overlapping groups:</mark>
- Imply that membership does not overlap  
- that is, any process belongs to at most one group.  

In real-life systems, it is realistic to expect that group membership will overlap.

### <mark style="background: #FFF503A6;">Implementation issues: Reliability in multicast</mark>  

<mark style="background: #FFF503A6;">Reliability in one-to-one communication:</mark>
- <mark style="background: #FFF503A6;">Integrity:</mark> the message received is the same as the one sent, and no messages are delivered twice  
- <mark style="background: #FFF503A6;">Validity:</mark> any outgoing message is eventually delivered  

<mark style="background: #FFF503A6;">Reliable Multicast:</mark>
- <mark style="background: #FFF503A6;">Integrity:</mark> delivering the messages correctly at most once  
- <mark style="background: #FFF503A6;">Validity:</mark> guaranteeing that a message sent will eventually be delivered  
- <mark style="background: #FFF503A6;">Agreement:</mark> Stating that if the message is delivered to one process, then it is delivered to all processes in the group#

### <mark style="background: #FFF503A6;">Failure considerations for group communication</mark> 

Similar to unicast communication  

<mark style="background: #FFF503A6;">Crash failure:</mark> Process stops communicating  

<mark style="background: #FFF503A6;">Omission failure:</mark>
- <mark style="background: #FFF503A6;">Usually due to network:</mark> occurs when a component fails to take an action that it should have taken.  
- <mark style="background: #FFF503A6;">Send omission:</mark> Process fails to send messages
- <mark style="background: #FFF503A6;">Receive omission:</mark> Process fails to receive messages

<mark style="background: #FFF503A6;">Byzantine failure:</mark> arbitrary - some messages are faulty  

<mark style="background: #FFF503A6;">Segmentation due to network:</mark> group divided into two or more unreachable sub-groups

### <mark style="background: #FFF503A6;">Implementation issues: Ordering in multicast</mark>

<mark style="background: #FFF503A6;">FIFO ordering:</mark>
- Concerned with preserving the order from the perspective of a sender process  
- If a process sends one message before another, it will be delivered in this order to all processes in the group.  

<mark style="background: #FFF503A6;">Causal ordering:</mark>
- Takes into account causal relationships between the messages 
- If a message happens before another message in the distributed system this is so-called causal relationship will be preserved in the delivery of the associated message at all processes.  

<mark style="background: #FFF503A6;">Total ordering:</mark> If a message is delivered before another message at one process, then the same order will be preserved at all processes.

### <mark style="background: #FFF503A6;">Implementation issues: Group membership management</mark>

<mark style="background: #FFF503A6;">Group membership management - four main tasks:</mark>
- Providing an interface for group membership changes  
- Failure detection  
- Notifying members of group membership changes  
- Performing group address expansion – can coordinate multicast delivery with membership changes by controlling address expansion.

### <mark style="background: #FFF503A6;">The role of group membership management</mark>

![[Pasted image 20251106102850.png]]

### <mark style="background: #FFF503A6;">JGroups toolkit</mark> 

JGroups is a toolkit for reliable group communication written in Java  

<mark style="background: #FFF503A6;">JGroups supports process groups in which processes are able to</mark>
- join or leave a group,  
- send a message to all members of the group, or indeed to a single member, and  
- receive messages from the group.  

The toolkit supports a variety of reliability and ordering guarantees  

Offers a group membership service.

### <mark style="background: #FFF503A6;">Publish-Subscribe Systems</mark>

<mark style="background: #FFF503A6;">Publish-Subscribe Systems:</mark> Also known as <mark style="background: #FFF503A6;">distributed event-based systems</mark>  

<mark style="background: #FFF503A6;">A publish-subscribe system is a system where:</mark>
 - publishers publish structured events to an event service and  
 - subscribers express interest in particular events through  
 - subscriptions which can be arbitrary patterns over the structured events.  

For example, a subscriber could express an interest in all events related to a book, such as the availability of a new edition or updates to the related web site.  

The task of the publish subscribe system is to match subscriptions against published events and ensure the correct delivery of event notifications.  

A given event will be delivered to potentially many subscribers, and hence publish-subscribe is fundamentally a one-to-many communications paradigm.

### <mark style="background: #FFF503A6;">Publish-subscribe systems:</mark>

Used in a wide variety of application domains, particularly those related to the large-scale dissemination of events.  

<mark style="background: #FFF503A6;">Examples:</mark>  
- financial information systems;  
- other areas with live feeds of real-time data (including RSS feeds);
- support for cooperative working, where a number of participants need to be informed of events of shared interest;  
- support for ubiquitous computing, including the management of events emanating from the ubiquitous infrastructure (for example, location events)  
- a broad set of monitoring applications, including network monitoring in the Internet.  

Publish-subscribe is also a key component of Google’s infrastructure, including for example the dissemination of events related to advertisements, such as ‘ad clicks’, to interested parties.

### <mark style="background: #FFF503A6;">Publish-subscribe systems: The programming model</mark>  

Publishers disseminate an event e through a ``publish(e)`` operation and subscribers express an interest in a set of events through subscriptions.  

They achieve this through a ``subscribe(f)`` operation where f refers to a filter  
- that is, a pattern defined over the set of all possible events.  
- The expressiveness of filters (and hence of subscriptions) is determined by the subscription model  

Subscribers can later revoke this interest through a corresponding ``unsubscribe(f)`` operation.  

When events arrive at a subscriber, the events are delivered using a ``notify(e)`` operation

### <mark style="background: #FFF503A6;">The publish-subscribe paradigm</mark>

![[Pasted image 20251106103606.png]]

### <mark style="background: #FFF503A6;">Publish-subscribe systems: Centralised versus distributed implementations</mark>

<mark style="background: #FFF503A6;">Centralised:</mark>  
- The simplest approach is to centralize the implementation in a single node with a server on that node acting as an event broker.  
- Publishers then publish events (and optionally send advertisements) to this broker, and subscribers send subscriptions to the broker and receive notifications in return.  
- Interaction with the broker is then through a series of point-to-point messages; – this can be implemented using message passing or remote invocation.
- lacks resilience and scalability  
- the centralised broker represents a single point for potential system failure and a performance bottleneck.

<mark style="background: #FFF503A6;">Distributed implementations:</mark>
- The centralized broker is replaced by a network of brokers that cooperate to offer the desired.  
- Such approaches have the potential to survive node failure and have been shown to be able to operate well in Internet-scale deployments.

![[Pasted image 20251106133519.png]]

### <mark style="background: #FFF503A6;">Different implementation strategies:</mark>

<mark style="background: #FFF503A6;">Peer-to-peer implementation:</mark>
- In this approach, there is no distinction between publishers, subscribers and brokers  
- All nodes act as brokers, cooperatively implementing the required event routing functionality  
- <mark style="background: #FFF503A6;">Centralized implementation:</mark> relatively straightforward, with the central with the central service maintaining a repository of subscriptions and matching event notifications with this set of subscriptions
- <mark style="background: #FFF503A6;">The distributed implementation:</mark> More complex

### <mark style="background: #FFF503A6;">Distributed event-based systems</mark>

Allow multiple objects at different locations to be notified of events taking place at an object.  

Use <mark style="background: #FFF503A6;">publish-subscribe</mark> paradigm – an object that generates events publishes the type of events that it will make available for observation by other objects;  
- Objects that want to receive notifications from an object that has published its events <mark style="background: #FFF503A6;">subscribe</mark> to the types of events that are of interest to them.  
- Objects that represent events are called <mark style="background: #FFF503A6;">notifications</mark> – may be stored, sent in a message, queried; 
- Subscribing to a particular type of event is also called <mark style="background: #FFF503A6;">registering interest</mark> in that type of event.

### <mark style="background: #FFF503A6;">Events & Notification</mark>

<mark style="background: #FFF503A6;">Events use idea:</mark>
- One object can react to a change occurring in another object.  
- Notification of events are asynchronous and determined by their receiver.  

Actions by users are seen as events changing the objects that represent the state of the application  

Other objects can react to such events – <mark style="background: #FFF503A6;">notifications</mark> of such events are asynchronous and determined by the receivers  

Distributed event-based systems extend this model to allow objects at different locations to be notified of events

<mark style="background: #FFF503A6;">Main characteristics:</mark>
- <mark style="background: #FFF503A6;">Heterogeneous:</mark> components in a distributed system that were not designed to interoperate can be made to work together (when using event notifications)
- <mark style="background: #FFF503A6;">Asynchronous:</mark> notifications are sent asynchronously by event-generating objects to all the objects that have subscribed to them to prevent publishers needing to synchronise with subscribers - publishers and subscribers need to be decoupled  

<mark style="background: #FFF503A6;">Event types:</mark>  
- <mark style="background: #FFF503A6;">Attributes:</mark> specify information about an event, such as the name or identifier of the object that generated it, the operation, its parameters and the time (or a sequence number).  
- When subscribing to an event, the type of event is specified, sometimes modified with a criterion as to the value of the attribute.

### <mark style="background: #FFF503A6;">Dealing room example:</mark>

<mark style="background: #FFF503A6;">Task:</mark> Allow dealers using computers to see the latest information about the market prices of the stock they deal in. The market price for a single named stock is represented by an object with several instance variables. The information arrives in the dealing room from several different external sources in the form of updates to some or all of the instance variables of the object representing the stock and is collected by process we call information providers. Dealers are typically interested only in their specialist stocks.

<mark style="background: #FFF503A6;">Could be modelled by processes with two different tasks:</mark>
- An information provider process continuously receives new trading information from a single external source and applies it to the appropriate stock objects. Each of the updates to a stock object is regarded as an event. The stock object experiencing such events notifies all of the dealers who have subscribed to the corresponding stock.  
- A dealer process creates an object to represent each named stock that the user asks to have displayed. This local object subscribes to the object representing that stock at the relevant information provider. It then receives all the information sent to it in notifications and displays it to the user.

![[Pasted image 20251106134226.png]]

### <mark style="background: #FFF503A6;">The roles of the participating objects in in distributed event notification</mark>

<mark style="background: #FFF503A6;">The object of interest:</mark>
- Experiences changes of state, as a result of its operations being invoked.  
- e.g. events such as a person wearing an active badge entering a room, in which case the room is the object of interest and the operation consists of adding information about the new person to its records of who is in the room.  

<mark style="background: #FFF503A6;">Event:</mark> occurs at an object of interest as the result of the completion of a method execution.  

<mark style="background: #FFF503A6;">Notification:</mark> An object that contains information about an event; it contains the type of the event and its attributes such as the identity of the object of interest, the method invoked, the time of occurrence or a sequence number.

<mark style="background: #FFF503A6;">Subscriber:</mark> An object that has subscribed to some type of events in another object. It receives notifications about such events.  

<mark style="background: #FFF503A6;">Observer objects:</mark> Purpose – to decouple an object of interest from its subscribers. An object of interest can have many different  subscribers with different interests.  

<mark style="background: #FFF503A6;">Publisher:</mark> An object that declares that it will generate notifications of particular types of event; it may be an object of interest or an observer.

### <mark style="background: #FFF503A6;">Architecture for distributed event notification</mark>
1. An object of interest inside the event service without an observer. It sends notifications directly to the subscribers.  
2. An object of interest inside the event service with an observer. The object of interest sends notifications via the observer to the subscribers.  
3. An object of interest outside the event service. In this case, an observer queries the object of interest in order to discover when events occur. The observer sends notifications to the subscribers.

![[Pasted image 20251106134534.png]]

### <mark style="background: #FFF503A6;">Roles for observers</mark>

Examples of roles 

<mark style="background: #FFF503A6;">Forwarding:</mark> A forwarding observer may carry out all the work of sending notifications to subscribers on behalf of one or more objects of interest.  

<mark style="background: #FFF503A6;">Filtering of notifications:</mark> Filters may be applied by an observer so as to reduce the number of notifications received according to some predicate on the contents of each notification – e.g. an event might relate to withdrawals from a bank account, but the recipient is interested only in those greater than €100.  

<mark style="background: #FFF503A6;">Patterns of events:</mark> When an object subscribes to events at an object of interest, they can specify patterns of events that they are interested in.  

<mark style="background: #FFF503A6;">Notification mailboxes:</mark> notification may need to be delayed until a potential subscriber is ready to receive them. The subscriber should be able to turn delivery on and off as required.

### <mark style="background: #FFF503A6;">Publish-subscribe</mark>

<mark style="background: #FFF503A6;">Issue: how to match events?</mark>  
- Assume events are described by (attribute,value) pairs  
- <mark style="background: #FFF503A6;">topic-based subscription:</mark> specify a “attribute = value” series  
- <mark style="background: #FFF503A6;">content-based subscription:</mark> specify a “attribute ∈ range” series

![[Pasted image 20251106134919.png]]

### <mark style="background: #FFF503A6;">Publish-subscribe: Scalability</mark> 

Scales well for small networks with a small number of publisher and subscriber nodes and low message volume.  

However, for increased number of nodes and messages, the likelihood of instabilities increases – limiting the maximum scalability

### <mark style="background: #FFF503A6;">Publish-subscribe: scalability solutions</mark>

Restrict to topic-based pub-sub systems  

Set up different infrastructures, per topic – e.g. a single server per topic that handles all publications and subscriptions for that topic  

<mark style="background: #FFF503A6;">For content-based pub-sub:</mark>
- Scalability problem: The specified attribute is expected to take on values within a specified range. Descriptions can sometimes be given using all kinds of predicates formulated over the attributes, very similar in nature to SQL-like queries in the case of relational databases.  
- No real scalable solutions readily available

### <mark style="background: #FFF503A6;">Apache Kafka : Publish-subscribe example</mark>

Open-source, distributed, fault-tolerant, publish-subscribe messaging system.  

Messages can be anything – Logs, alerts, IoT (Internet of Things) reports, user activities  

<mark style="background: #FFF503A6;">Used by:</mark>
- AirBnB, Uber, Netflix, Salesforce, Spotify, LinkedIn, Tinder, many banks (e.g. Rabobank, Barkleys, GoldmanSach), etc...  
- https://kafka.apache.org/powered-by  
- https://kafka.apache.org

### <mark style="background: #FFF503A6;">Apache Kafka</mark>

<mark style="background: #FFF503A6;">Distributed:</mark> Each message queue is divided among multiple servers  

<mark style="background: #FFF503A6;">Scalable:</mark> Splitting a topic into multiple partitions across many systems - servers  

<mark style="background: #FFF503A6;">Durable:</mark> 
- Store streams of records in the order in which records were generated 
- Records written to disk using large streaming writes  
- Provides durable message logs  
- Messages are not lost if the system crashes and restarts  

<mark style="background: #FFF503A6;">Fault tolerant:</mark>
- Messages are written to disk for a configurable time period  
- Partitions can be replicated onto multiple servers  
- a leader & followers per partition also provide support for redundancy

Runs as a cluster on one or more servers

Each server is called a broker - ranges from 1 to 1000s of brokers  

<mark style="background: #FFF503A6;">Kafka usage:</mark>
- Real-time systems, such as Spark Streaming  
- Batch processing  

<mark style="background: #FFF503A6;">For example store to Amazon S3 & then use MapReduce:</mark>
- Netflix  
- LinkedIn  
- Uber  
- Tinder  
- AirBnB  
- Apache technologies (e.g. Apache Hadoop)

<mark style="background: #FFF503A6;">The main functions:</mark>
- Enables applications to publish or subscribe to data or event streams.  
- Stores records in the order in which they occurred in a fault-tolerant and durable way.  
- It processes records in real-time - as they occur.

### <mark style="background: #FFF503A6;">Message queue systems</mark>

They are point-to-point – the sender places the message into a queue, and it is then removed by a single process. Message queues are also referred to as Message-Oriented Middleware.  

A major class of commercial middleware with key implementations – E.g. IBM’s MQ (https://www.ibm.com/products/websphere-mq)  

The main use of such products is to achieve Enterprise Application Integration (EAI) – that is, integration between applications within a given enterprise – a goal that is achieved by the inherent loose coupling of message queues.  

They are also extensively used as the basis for commercial transaction processing systems because of their intrinsic support for transactions.

<mark style="background: #FFF503A6;">The message queue paradigm:</mark>
![[Pasted image 20251106140140.png]]

### <mark style="background: #FFF503A6;">Message-queuing systems: Lack of standardisation</mark>  

<mark style="background: #FFF503A6;">MQ systems have been developed in part to allow legacy applications to interoperate:</mark>
- When it comes to operations between different message-queuing systems, we often hit a wall.  
- Message-queuing solutions are in large part proprietary solutions.  
- A working group was formed to change this situation, resulted in the specification of the Advanced Message-Queuing Protocol (AMQP)  

<mark style="background: #FFF503A6;">Advanced Message-Queuing Protocol (AMQP):</mark>  
- Intended to play the same role as, for example, TCP in networks  
- A protocol for high-level messaging with different implementations.

### <mark style="background: #FFF503A6;">Advanced Message-Queuing Protocol (AMQP)</mark>

Intended to play the same role as, for example, TCP in networks, a protocol for high-level messaging with different implementations.  
<mark style="background: #FFF503A6;">Basic model:</mark> Client sets up a (stable) <mark style="background: #FFF503A6;">connection</mark>, which is a container for several (possibly ephemeral) <mark style="background: #FFF503A6;">one-way channels</mark>. Two one-way channels can form a <mark style="background: #FFF503A6;">session</mark>. A <mark style="background: #FFF503A6;">link</mark> is akin to a socket, and maintains state about message transfers.

![[Pasted image 20251106140726.png]]

### <mark style="background: #FFF503A6;">AMQP</mark>

Supports persistent messaging  

AMQP - https://www.amqp.org/  

<mark style="background: #FFF503A6;">RabbitMQ:</mark>
- Implementation of AMQP  
- Free and open source  
- https://www.rabbitmq.com/

### <mark style="background: #FFF503A6;">Summary</mark>

The main indirect communication techniques  

<mark style="background: #FFF503A6;">Group communication:</mark> communication is via a group abstraction with the sender unaware of the identity of the recipients.  

<mark style="background: #FFF503A6;">Publish-subscribe systems:</mark> a family of approaches that all share the common characteristic of disseminating events to multiple recipients through an intermediary.  

<mark style="background: #FFF503A6;">Message queue systems:</mark> messages are directed to the familiar abstraction of a queue with receivers extracting messages from such queues.

### <mark style="background: #FFF503A6;">References</mark>

Chapter 6: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, 5/E