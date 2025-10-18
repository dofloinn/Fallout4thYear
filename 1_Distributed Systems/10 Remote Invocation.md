### <mark style="background: #04FF00A6;">Remote Invocation:</mark>

Based on a two-way exchange between communicating entities in a distributed system – resulting in the calling of a remote operation, procedure or method.  

<mark style="background: #04FF00A6;">Remote Procedure Calls (RPC):</mark> – allow programs to call procedures located on other machines.  

<mark style="background: #04FF00A6;">Remote method invocation (RMI):</mark> Essentially the same as an RPC, except that it operates on objects instead of functions.

### <mark style="background: #04FF00A6;">Basic RPC operation:</mark>

Supports client-server computing with servers offering a set of operations through a service interface and clients calling these operations directly as if they were available locally.  

<mark style="background: #04FF00A6;">RPC systems offer (at a minimum):</mark>
- <mark style="background: #04FF00A6;">access transparency:</mark> the calling procedure should not be aware that the called procedure is executing on a different machine or vice versa.  
- <mark style="background: #04FF00A6;">location transparency</mark>

![[Pasted image 20251016090812.png]]

### <mark style="background: #04FF00A6;">Remote method invocation (RMI)</mark>

<mark style="background: #04FF00A6;">RMI:</mark>
- Strongly resembles remote procedure calls  
- Extended into the world of distributed objects.  

A calling object can invoke a method in a remote object.  

Communication among distributed objects via RMI – Recipients of remote invocations are remote objects, which implement remote interfaces for communication  

<mark style="background: #04FF00A6;">Reliability:</mark> Either one or both the invoker and invoked can fail, and status of communication is supported by the interface. e.g.,  
- notification on failures,  
- reply generation,  
- parameter processing – marshalling/unmarshalling  
- Local invocations target local objects, and remote invocations target remote objects

<mark style="background: #04FF00A6;">RMI:</mark>
- Tight coupling  
- The caller and callee both need to be up and running at the time of communication.  
- They need to know exactly how to refer to each other.

### <mark style="background: #04FF00A6;">RMI in Middleware Layers:</mark>

A suite of API software that uses underlying processes and communication (message passing) protocols to provide its abstract protocol – simple RMI request-reply protocol

![[Pasted image 20251016091039.png]]

### <mark style="background: #04FF00A6;">Interfaces</mark>

Interfaces hide the details of modules providing the service; and access to module variables is only indirectly via ‘getter’ and ‘setter’ methods / mechanisms associated with the interfaces – e.g., call by value/reference for local calls through pointers vs. input, output, and input paradigms in RMI through message-data and objects  

<mark style="background: #04FF00A6;">Service interfaces:</mark> client-server model, specification of the procedures offered by a server defining the types of input and output arguments  

<mark style="background: #04FF00A6;">Remote interfaces:</mark> distributed object model, specifies the methods of an object that are available for invocation by objects in other processes defining the types of the input and output arguments of each of them.

### <mark style="background: #04FF00A6;">Interface definition languages (IDLs)</mark>

<mark style="background: #04FF00A6;">IDL:</mark> language that is used to define the interface between a client and server process in a distributed system.  

Each IDL also has a set of associated IDL compilers - one per supported target language  

Provides a notation for defining interfaces in which each of the parameters of a method may be described as for input or output in addition to having its type specified.

### <mark style="background: #04FF00A6;">The principle of generating stubs from an IDL</mark>

An IDL compiler compiles the interface specifications, listed in an IDL input file, into source code (e.g., C/C++, Java) that implements the low-level communication details required to support the defined interfaces.

![[Pasted image 20251016091325.png]]

### <mark style="background: #04FF00A6;">The distributed object model</mark>

<mark style="background: #04FF00A6;">RMI:</mark> invocations between objects in different processes (either on same or different computers) is remote. Invocations within the same process are local  

Each process contains objects, some of which can receive remote invocations, other only local invocations  

Those that can receive remote invocations are called remote objects  

Objects need to know the remote object reference of an object in another process in order to invoke its methods. How do they get it? The remote interface specifies which methods can be invoked remotely

<mark style="background: #04FF00A6;">Remote and local method invocations:</mark>
- Objects receiving remote invocations (service objects) are remote objects, e.g., B and F  
- Object references are required for invocation, e.g., C must have E’s reference or B must have A’s reference  
- B and F must have remote interfaces (of their accessible methods)

![[Pasted image 20251016091547.png]]

### <mark style="background: #04FF00A6;">Implementation of RMI</mark>

Several separate object and modules  

An application-level object A invokes a method in a remote application-level object B for which it holds a remote object reference.  

When a client binds to a distributed object, it loads the interface, i.e. proxy - proxy is analogous to stubs  

Skeleton - server stub

![[Pasted image 20251016091628.png]]

### <mark style="background: #04FF00A6;">RMI: Communication module</mark>

<mark style="background: #04FF00A6;">Two modules:</mark> Transmits ``request`` and ``reply`` messages between client and server;  

Responsible for providing a specified invocation semantics, e.g. at-most-once;

### <mark style="background: #04FF00A6;">RMI: Remote reference module</mark>

<mark style="background: #04FF00A6;">Remote object references:</mark>
- An unique identifier of a remote object, used throughout a distributed system  
- The remote object reference (including the ‘interface’ list of methods) can be passed as arguments or results in rmi.  

<mark style="background: #04FF00A6;">Remote reference module:</mark>
- <mark style="background: #04FF00A6;">Responsible for:</mark> translating between local and remote object references and for creating remote object references.  
- Each module has a <mark style="background: #04FF00A6;">remote object table</mark> that records the correspondence between local object references in that process and remote object references (which are system-wide).

### <mark style="background: #04FF00A6;">RMI: Servants</mark>

An instance of a class which provides the body of a remote object.  

Handle the remote requests passed on by the corresponding skeleton.  

Created when remote objects are instantiated and remain in use until they are no longer needed.

### <mark style="background: #04FF00A6;">Proxy</mark>  

<mark style="background: #04FF00A6;">Proxy:</mark>
- makes remote method invocation transparent to clients by behaving like a local object to the invoker;  
- instead of executing an invocation, forwards it in a message to a remote object;  
- hides the details of the remote object reference, the marshalling of arguments, unmarshalling of results and sending and receiving of messages from the client;  
- one proxy for each remote object for which a process holds a remote object reference. 
- serialises local object parameters – for Java RMI

### <mark style="background: #04FF00A6;">The RMI software:</mark>

Skeletons and Dispatchers  

<mark style="background: #04FF00A6;">Dispatcher:</mark>
- A server has one dispatcher for each class representing a remote object  
- Receives the <mark style="background: #04FF00A6;">request</mark> message from the communication module and selects the appropriate method in the skeleton, passing on the request message.  

<mark style="background: #04FF00A6;">Skeleton:</mark>
- The class of a remote object has a skeleton, which implements the methods in the remote interface.  
- Unmarshalls the arguments in the request message and invokes the corresponding method in the servant; 
- It waits for the invocation to complete and then marshals the result, together with any exceptions, in a <mark style="background: #04FF00A6;">reply</mark> message to the sending proxy’s method.

### <mark style="background: #04FF00A6;">Representation of a remote object reference</mark> 

A remote object reference must be unique in the distributed system and over time. It should not be reused after the object is deleted.  

<mark style="background: #04FF00A6;">Why not?</mark>  
- the first two fields locate the object unless migration or re-activation in a new process can happen  
- the fourth field identifies the object within the process  
- its interface tells the receiver what methods it has (e.g. class Method)  
- a remote object reference is created by a remote reference module when a reference is passed as argument or result to another process  
	- it will be stored in the corresponding proxy  
	- it will be passed in request messages to identify the remote object whose method is to be invoked

![[Pasted image 20251016092548.png]]

<table>
	<tr>
		<th>32 bits</th>
		<th>32 bits</th>
		<th>32 bits</th>
		<th>32 bits</th>
		<th>&nbsp;</th>
	</tr>
	<tr>
		<td>Internet address</td>
		<td>port number</td>
		<td>time</td>
		<td>object number</td>
		<td>interface of remote object</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Distributed Garbage Collection</mark>

Where any process includes remote objects, then it is equipped with both  
- Local garbage collector  
- Distributed garbage collector  

For any remote object O, ``O.holders`` is a list of all the processes that have a remote reference to that object i.e. got a stub for it  

When a client C receives a remote reference for O it makes an ``addRef`` call to O’s garbage collector, resulting in its being added to ``O.holders``  

When C’s local garbage collector attempts to delete the stub object for O, it calls ``removeRef`` on O’s garbage collector, resulting in its being removed from ``O.holders``  

When ``O.holders`` is empty, O can be deleted

<mark style="background: #04FF00A6;">Possible difficulties:</mark> removeRef and addRef sent at same time from different processes  

Possibility that O would be deleted, even though a client <mark style="background: #04FF00A6;">thinks</mark> it has a reference  

Incorporate a delay / temporary reference to solve - ``addRef`` goes missing  

Client must detect, exception returned - ``removeRef`` message goes missing / not sent  

Time based leases are allocated for objects

### <mark style="background: #04FF00A6;">The distributed object model: Remote interfaces</mark>  

Remote objects have a class that implement remote methods (as public).  

Local objects can access methods in an interface plus methods implemented by remote objects  

Remote interfaces can’t be constructed – no constructors

![[Pasted image 20251016093510.png]]

### <mark style="background: #04FF00A6;">RPC Invocation Semantics</mark>

In RPC call semantics, there is a two way interaction between the client and the server with the client sending a request  
- The server executing the (remote) procedure and the server sending a reply back to the client.  
- The semantics are defined over this complete path and not just the delivery of the initial message (the request)  

<mark style="background: #04FF00A6;">Unreliable network:</mark> For all request –reply protocols, messages may get lost  

<mark style="background: #04FF00A6;">Solutions for lost / retransmitted messages:</mark>
- Retry request  
- Filter Duplicates  
- Retransmit results

### <mark style="background: #04FF00A6;">Invocation Semantics</mark>

Remote procedure calls provide a range of invocation semantics  

In local systems all methods are invoked exactly once per request – guaranteed – unless whole process fails  

In distributed systems, we need to know what has happened if we do not hear result from remote object/procedure i.e. did the request go missing, did the response go missing  

3 different types of guarantee (invocation semantics) may be provided – could be implemented in a middleware platform intended to support remote method invocations:  
- Maybe  
- At-Least-Once  
- At-Most-Once

### <mark style="background: #04FF00A6;">Maybe Invocation Semantics</mark>

If the invoker cannot tell whether a remote method has been invoked or not  

Very inexpensive, but only useful if the system can tolerate occasional failed invocations

### <mark style="background: #04FF00A6;">At-Least-Once Invocation Semantics</mark>

If the invoker receives a result, then it is guaranteed that the method was invoked at least once  

Achieved by resending requests to mask omission failure  

Only useful if the operations are idempotent (x = 10, rather than x = x + 10)  

Inexpensive on server

### <mark style="background: #04FF00A6;">At-Most-Once Invocation Semantics</mark>

If the invoker receives a result, then it is guaranteed that the method was invoked only once  

If no result is received, then the method was executed either never or once  

Achieved by resending requests, and storing and resending responses  

More expensive on a server / remote object, which must maintain results and recognise duplicate messages

### <mark style="background: #04FF00A6;">Invocation semantics: failure model</mark>

<mark style="background: #04FF00A6;">Maybe:</mark> if no reply, the client does not know if method was executed or not omission failures - if the invocation or result message is lost  

<mark style="background: #04FF00A6;">At-least-once:</mark>
- the client gets a result (and the method was executed at least once) or an exception (no result)  
- <mark style="background: #04FF00A6;">arbitrary failures:</mark> If the invocation message is retransmitted, the remote object may execute the method more than once, possibly causing wrong values to be stored or returned.  
- if <mark style="background: #04FF00A6;">idempotent</mark> operations are used, arbitrary failures will not occur  

<mark style="background: #04FF00A6;">At-most-once:</mark> the client gets a result (and the method was executed exactly once) or an exception (instead of a result, in which case, the method was executed once or not at all)

![[Pasted image 20251016094228.png]]

<table>
	<tr>
		<th>&nbsp;</th>
		<th>Fault tolerance measures</th>
		<th>&nbsp;</th>
		<th>Invocation semantics</th>
	</tr>
	<tr>
		<td>Retransmit request message</td>
		<td>Duplicate filtering</td>
		<td>Re-execute procedure or retransmit reply</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>No</td>
		<td>Not Applicable</td>
		<td>Not Applicable</td>
		<td>Maybe</td>
	</tr>
	<tr>
		<td>Yes</td>
		<td>No</td>
		<td>Re-execute procedure</td>
		<td>At-least-once</td>
	</tr>
	<tr>
		<td>Yes</td>
		<td>Yes</td>
		<td>Re-transmit reply</td>
		<td>At-most-once</td>
	</tr>
</table>

### <mark style="background: #04FF00A6;">Design Issues of RPC/RMI</mark>

<mark style="background: #04FF00A6;">Local invocations have:</mark>
- at-most-once, or  
- exactly-once semantics  

<mark style="background: #04FF00A6;">Distributed RMI, the alternative invocation semantics are:</mark>
- <mark style="background: #04FF00A6;">Retry request message:</mark> retransmit until reply is received or on server failure – at-least-once semantics;  
- <mark style="background: #04FF00A6;">Duplicate message filtering:</mark> discard duplicates at server (using seq ``#s`` or ``ReqID``);  
- Buffer result messages at server for <mark style="background: #04FF00A6;">retransmission</mark> – avoids redo of requests (even for idempotent ops) – at-most-once semantics.  
- <mark style="background: #04FF00A6;">Idempotent operation:</mark> the one which can be performed repeatedly with the same effect as if it had been performed exactly once.

### <mark style="background: #04FF00A6;">Transparency</mark>

<mark style="background: #04FF00A6;">Remote invocations should be made transparent:</mark>
- the syntax of a remote invocation is the same as that of a local invocation, but  
- the difference between local and remote objects should be expressed in their interfaces.  

<mark style="background: #04FF00A6;">E.g. Java RMI:</mark> Remote objects implement ``Remote`` interface and throw ``RemoteExceptions``  

Remote object should be able to keep its state consistent in the presence of concurrent accesses from multiple clients.

### <mark style="background: #04FF00A6;">Thread Usage in Remote Method Invocations</mark>  
A method dispatched by the RMI runtime to a remote object implementation may or may not execute in a separate thread.  

The RMI runtime makes no guarantees with respect to mapping remote object invocations to threads.  

As remote method invocation on the same remote object may execute concurrently – a remote object implementation needs to make sure its implementation is thread-safe.

### <mark style="background: #04FF00A6;">Distributed garbage collection</mark> 

<mark style="background: #04FF00A6;">Ensures:</mark>
- if a local or remote reference to an object is still held anywhere in a set of distributed objects then the object itself will continue to exist,  
- As soon as no object holds a reference to it – the object is collected and the memory it uses recovered.

### <mark style="background: #04FF00A6;">Summary</mark>

Two most prominent remote invocation techniques for communication in distributed systems:  
- RPC  
- RMI  

<mark style="background: #04FF00A6;">RPC:</mark>
- Extends the common programming abstraction of the procedure call to distributed environments, allowing a calling process to call a procedure in a remote node as if it is local.  

<mark style="background: #04FF00A6;">RMI:</mark>
- Similar to RPC but for distributed objects  
- Added benefits in terms of using object-oriented programming concepts in distributed systems  
- Extending the concept of an object reference to the global distributed environments, and allowing the use of object references as parameters in remote invocations.

### <mark style="background: #04FF00A6;">References</mark>

Chapter 5: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, 5/E  

Chapter 4: Maarten van Steen, Andrew S. Tanenbaum, Distributed Systems, 4th edition (2024)