### <mark style="background: #00ECFFA6;">Enterprise Architectures</mark>  

<mark style="background: #00ECFFA6;">Where functionality resides</mark>  
- How networks are used? 
- What machines/devices are used, servers, clients, mainframes, virtual servers, “cloud”?  

<mark style="background: #00ECFFA6;">How the functionality is designed:</mark>  
- <mark style="background: #00ECFFA6;">Individual programs:</mark> tightly coupled
- <mark style="background: #00ECFFA6;">Enterprise systems:</mark> loosely coupled

Add Mobile Devices, Rich Web Applications, IoT & Middleware - gives rise to a variety of viable architectures

![[Pasted image 20260324174544.png]]

### <mark style="background: #00ECFFA6;">IBM’s Z Series</mark>

![[Pasted image 20260324174659.png]]

### <mark style="background: #00ECFFA6;">N-Tier Architecture</mark>

Multi-Tier / Layered

<mark style="background: #00ECFFA6;">Software Layers:</mark>
- Access
- Presentation  
- Business  
- Persistence 
- Data Repository  
- Component/Service based  

Multiple client devices / systems  

Multiple datastores

### <mark style="background: #00ECFFA6;">A Basic Enterprise Architecture Example</mark>

![[Pasted image 20260324174939.png]]

### <mark style="background: #00ECFFA6;">Advantages of N-Tier Architecture</mark>  

<mark style="background: #00ECFFA6;">Separation of concerns:</mark>
- Functionality is separated into its responsible parts
- E.g. web page rendering vs business functions  

<mark style="background: #00ECFFA6;">Maintainability:</mark>
- Identifying relevant implementation code easier 
- Testing specific functional concerns easier  
- Separation of developer skills possible  

<mark style="background: #00ECFFA6;">Extendibility:</mark> Adding new code / refactoring existing code is made easier and less error prone  

<mark style="background: #00ECFFA6;">Loose coupling:</mark>  
- <mark style="background: #00ECFFA6;">Design-time:</mark> Implementation can change with minimised impact on dependant functionality  
- <mark style="background: #00ECFFA6;">Run-Time:</mark> Time/Location/Protocol independence of the functions gives a more robust system  

<mark style="background: #00ECFFA6;">Functionality Access:</mark> Different client devices can access the same business functionality

### <mark style="background: #00ECFFA6;">Frameworks</mark>

Sets of foundation software that provide core functionality allowing developers to concentrate on the business requirements.  

<mark style="background: #00ECFFA6;">Frameworks:</mark>
- presentation (e.g. Template Tools / Angular / React)  
- business logic (e.g. Spring / NodeJS / Django)  
- persistence (e.g. Hibernate)

### <mark style="background: #00ECFFA6;">JEE – Java Enterprise Edition</mark>  

<mark style="background: #00ECFFA6;">JEE Technologies:</mark>
- Access / Presentation Layer – Java Servlets / View templates / JSP / JSF  
- Business Layer  
- Java - POJO / EJB  
- Web Services – JAX-RS  
- Persistence Layer - JPA  
- Integration Layer  
- Java Messaging Specification (JMS) (Integration Technology)  
- XML API’s

### <mark style="background: #00ECFFA6;">Loose Coupling</mark>  

When two systems are tightly coupled there are a set of requirements that are forced into play

![[Pasted image 20260324175316.png]]

<mark style="background: #00ECFFA6;">Requirements:</mark>
- Data encoding used by both systems has to be the same
- The location of the system to communicate with is known  
- The system that needs to be communicated with is currently up and running  
- The two systems communicate using a common protocol/format  

To change from a tightly coupled situation to a loosely coupled situation we need to remove the these requirements.  

<mark style="background: #00ECFFA6;">Location:</mark> introduce a level of indirection so that systems can be located / moved without the need for the other system to be aware.

![[Pasted image 20260324175439.png]]
 
<mark style="background: #00ECFFA6;">Time:</mark> introduce a temporary storage mechanism so that systems can send / receive content asynchronously. Receiving system does not need to up and running at the time of the request but it will still be processed without error

![[Pasted image 20260324175554.png]]

<mark style="background: #00ECFFA6;">Format:</mark> introduce a mechanism to allow systems use their own data formats. Each system uses their own format but content is transformed / validated as needed without the systems themselves being aware.

![[Pasted image 20260324175645.png]]

<mark style="background: #00ECFFA6;">Loose Coupling:</mark>
- Reduces brittleness
- Allows scalability 
- Can allow additional processing without the need for systems development  

<mark style="background: #00ECFFA6;">Provide Location Time Format independence:</mark>
- Customer Mgt.
- Warehouse Mgt.
- Accounts 
- Customs
- Helpdesk
- Freight Forwarder
- Order Mgt.

### <mark style="background: #00ECFFA6;">Message Oriented Middleware</mark>

![[Pasted image 20260324175821.png]]

### <mark style="background: #00ECFFA6;">Messaging Domains</mark> 

<mark style="background: #00ECFFA6;">Point to Point:</mark>
- Built around the concept of message queues  
- Each message has only one consumer  
- Can have multiple clients sending messages  
- Can have multiple clients as consumers  
- Only one consumer will receive the message

![[Pasted image 20260324175907.png]]

### <mark style="background: #00ECFFA6;">Publish - Subscribe</mark>

- Uses a topic to send and receive messages  
- Each message has multiple consumers  
- A Topic is a type of message destination  
- Can have multiple clients publishing messages  
- Each subscriber receives the message

![[Pasted image 20260324180337.png]]

### <mark style="background: #00ECFFA6;">Java Messaging Specification</mark>  

Provides a <mark style="background: #00ECFFA6;">standard java API</mark> to Message Oriented Middleware (MOM)  

A <mark style="background: #00ECFFA6;">specification</mark> that describes a common way for Java programs to create, send, receive and read distributed enterprise messages  

Java <mark style="background: #00ECFFA6;">clients</mark> that connect to the message broker are abstracted from the specific software implementation  

<mark style="background: #00ECFFA6;">Loosely coupled</mark> communication  

<mark style="background: #00ECFFA6;">Asynchronous</mark> messaging  

<mark style="background: #00ECFFA6;">Reliable delivery</mark> - A message is guaranteed to be delivered once and only once.

### <mark style="background: #00ECFFA6;">Messaging – Message Oriented Middleware (MOM) & JMS</mark>

![[Pasted image 20260324180543.png]]

### <mark style="background: #00ECFFA6;">Message Consumptions</mark>  

<mark style="background: #00ECFFA6;">Synchronously:</mark>  
- A subscriber or a receiver explicitly fetches the message from the destination by calling the receive method. 
- The receive method can block until a message arrives or can time out if a message does not arrive within a specified time limit.  

<mark style="background: #00ECFFA6;">Asynchronously:</mark>
- A client can register a message listener with a consumer.
- Whenever a message arrives at the destination, the JMS provider delivers the message by calling the listener's ``onMessage()`` method.

### <mark style="background: #00ECFFA6;">JMS API Programming Model</mark>

![[Pasted image 20260324180652.png]]

### <mark style="background: #00ECFFA6;">Enterprise Integration Patterns</mark>

<mark style="background: #00ECFFA6;">Request - Reply:</mark>
- A request <mark style="background: #00ECFFA6;">message</mark> is sent from <mark style="background: #00ECFFA6;">requestor</mark> to <mark style="background: #00ECFFA6;">replier</mark>
- Replier responds with a separate reply message
- Communication is <mark style="background: #00ECFFA6;">asynchronous</mark> with two <mark style="background: #00ECFFA6;">point-to-point</mark> channels involved

![[Pasted image 20260324181126.png]]

<mark style="background: #00ECFFA6;">Return Address:</mark>  
- Multiple Requestors, each with their own reply queue
- Single Replier, How does it know which requestor to send reply to?  
- The requestor specifies a <mark style="background: #00ECFFA6;">return address</mark> (reply channel) as part of the message.  
- The replier sends its response via the specified reply channel.

![[Pasted image 20260324181308.png]]

<mark style="background: #00ECFFA6;">Correlation Identifier:</mark>
- Multiple requests sent. How does requestor know which reply is for which request (e.g. replies could be out of order)
- Requestor stamps unique (correlation) id and replier copies to the reply message

![[Pasted image 20260324181353.png]]

<mark style="background: #00ECFFA6;">Correlation ID for Load Balancing:</mark> Could also be used in a load balancing scenario where there are multiple repliers in a point-to-point setup (only one of the repliers gets the request)

![[Pasted image 20260324181427.png]]

<mark style="background: #00ECFFA6;">Content Based Router:</mark> The router passes messages to different channels based on some information within the message

![[Pasted image 20260324181512.png]]

<mark style="background: #00ECFFA6;">Splitter:</mark> The splitter breaks a composite message into individual messages 
![[Pasted image 20260324181549.png]]

<mark style="background: #00ECFFA6;">Combining the Splitter and Route:</mark>
![[Pasted image 20260324181657.png]]

<mark style="background: #00ECFFA6;">Message Translator:</mark> Translate a message from one format to another (while in transit from one system/component to another)

![[Pasted image 20260324181739.png]]

<mark style="background: #00ECFFA6;">Recipient List:</mark>
- Multiple recipients will each receive a copy of the message
- Note, this could be implemented using a publish and subscribe solution also
![[Pasted image 20260324181821.png]]

<mark style="background: #00ECFFA6;">Aggregator:</mark>
- Aggregator combines separate but related messages
- The aggregator must have a mechanism for determining when to stop combining messages and to send the final result

![[Pasted image 20260324181908.png]]

<mark style="background: #00ECFFA6;">Scatter - Gather:</mark>
- Here, we want to broadcast via publish and subscribe and receive a response via point-to-point
- Can be done by combining Recipient List with Aggregator

![[Pasted image 20260324181948.png]]