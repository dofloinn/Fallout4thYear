### <mark style="background: #FFF503A6;">Distributed Object Model</mark> 

<mark style="background: #FFF503A6;">RMI:</mark> invocations between objects in different processes (either on same or different computers) is remote. Invocations within the same process are local  

Each process contains objects, some of which can receive remote invocations, other only local invocations  

Those that can receive remote invocations are called remote objects  

Objects need to know the remote object reference of an object in another process in order to invoke its methods. How do they get it?  The remote interface specifies which methods can be invoked remotely

### <mark style="background: #FFF503A6;">Java Remote Method Invocation (RMI)</mark>

Java Remote Method Invocation (Java RMI) is a distributed object model for the Java programming language - retains the semantics of the Java platform's object model, making distributed objects easy to implement and to use.  

Java RMI lets you create distributed applications in Java.  

Allows an object to invoke methods of remote Java objects running on another Java Virtual Machine (JVM), possibly on different hosts.  

Remote interfaces are defined in the Java language

### <mark style="background: #FFF503A6;">Java RMI: parameters</mark>

Java RMI Uses object serialization to marshal and unmarshal parameters  

<mark style="background: #FFF503A6;">Does not truncate types:</mark> supporting true object-oriented polymorphism  

<mark style="background: #FFF503A6;">Marshalling</mark> is the process of taking a collection of data items and assembling them into a form suitable for transmission in a message.  

<mark style="background: #FFF503A6;">Marshalling</mark> consists of the translation of structured data items and primitive values into an external data representation.  

<mark style="background: #FFF503A6;">Unmarshalling</mark> is the process of disassembling them on arrival to produce an equivalent collection of data items at the destination.  

<mark style="background: #FFF503A6;">Unmarshalling</mark> consists of the generation of primitive values from their external data representation and the rebuilding of the data structures.

### <mark style="background: #FFF503A6;">Java’s object serialisation</mark> 

Concerned with the flattening and data representation of any single object or tree of objects that may need to be transmitted in a message or stored on a disk.

### <mark style="background: #FFF503A6;">Distributed Object Applications</mark>
 
This illustration depicts an RMI distributed application that uses the registry to obtain references to a remote object  

Uses the registry to obtain a reference to a remote object.  

The server calls the registry to associate (or bind) a name with a remote object.  

The client looks up the remote object by its name in the server's registry and then invokes a method on it.  

<mark style="background: #FFF503A6;">The RMI system uses an existing web server to load class definitions:</mark>
- from server to client and from client to server, for objects when needed.
- RMI can load class bytecodes using any URL protocol (e.g., HTTP, FTP, file, etc.) that is supported by the Java platform.

![[Pasted image 20251117165000.png]]

### <mark style="background: #FFF503A6;">Dynamic Code Loading</mark>

Ability to download the definition of an object's class if the class is not defined in the receiver's Java virtual machine.  

All of the types and behaviour of an object, previously available only in a single Java virtual machine, can be transmitted to another, possibly remote, Java virtual machine.  

RMI passes objects by their actual classes, so the behaviour of the objects is not changed when they are sent to another Java virtual machine.  

This capability enables new types and behaviours to be introduced into a remote Java virtual machine - dynamically extending the behaviour of an application.

RMI uses the object serialization mechanism to transmit data from one virtual machine to another  

To support dynamic class loading, the RMI runtime uses special subclasses of ``java.io.ObjectOutputStream`` and ``java.io.ObjectInputStream`` for the marshal streams that it uses for marshalling and unmarshalling RMI parameters and return values.

### <mark style="background: #FFF503A6;">JAVA RMI: Remote Interfaces, Objects, and Methods</mark>  

A distributed application built by using Java RMI is made up of interfaces and classes - The interfaces declare methods.  

The classes implement the methods declared in the interfaces and, perhaps, declare additional methods as well.  

In a distributed application, some implementations might reside in some Java virtual machines but not others.  

<mark style="background: #FFF503A6;">Remote objects:</mark> Objects with methods that can be invoked across Java virtual machines are called.

### <mark style="background: #FFF503A6;">The Java RMI Object Registry - Directory Service</mark>  

How does a client find a RMI remote service?  

<mark style="background: #FFF503A6;">The RMI API allows a number of directory services to be used for registering a distributed object:</mark>
- One such service is the Java Naming and Directory Interface (JNDI), which is more general than the RMI registry, in the sense that it can be used by applications that do not use the RMI API.  

We will use a simple directory service called the RMI Registry, rmiregistry, which is provided with the Java SE.  

The RMI Registry runs on each machine that hosts remote service objects and accepts queries for services, by default on port 1099.

### <mark style="background: #FFF503A6;">RMI applications</mark>

Often comprise two separate programs - a server and a client.  

<mark style="background: #FFF503A6;">A typical server program:</mark> 
- creates some remote objects,  
- makes references to these objects accessible, and  
- waits for clients to invoke methods on these objects.  

<mark style="background: #FFF503A6;">A typical client program:</mark>
- obtains a remote reference to one or more remote objects on a server; and  
- invokes methods on them.  

RMI provides the mechanism by which the server and the client communicate and pass information back and forth.  

Such an application is sometimes referred to as a <mark style="background: #FFF503A6;">distributed object application</mark>.

### <mark style="background: #FFF503A6;">The Distributed vs Non-distributed Object Model</mark>  

<mark style="background: #FFF503A6;">Similarity:</mark>
- A reference to a remote object can be passed as an argument or returned as a result in any method invocation (local or remote).
- A remote object can be cast to any of the set of remote interfaces supported by the implementation using the syntax for casting built into the Java programming language.
- The built-in instance of operator can be used to test the remote interfaces supported by a remote object.

### <mark style="background: #FFF503A6;">The Distributed vs Non-distributed Object Model</mark>  

Clients of remote objects interact with remote interfaces, never with the implementation classes of those interfaces.  

Non-remote arguments to, and results from, a remote method invocation are passed by copy rather than by reference - References to objects are only useful within a single virtual machine.  

A remote object is passed by reference, not by copying the actual remote implementation.  

The semantics of some of the methods defined by class ``java.lang.Object`` are specialized for remote objects.  

The failure modes of invoking remote objects are inherently more complicated than the failure modes of invoking local objects -clients must deal with additional exceptions that can occur during a remote method invocation.

### <mark style="background: #FFF503A6;">Creating Distributed Applications by Using RMI</mark>

<mark style="background: #FFF503A6;">Steps:</mark>  
- Designing and implementing the components of your distributed application
- Compiling sources
- Making classes network accessible
- Starting the application

### <mark style="background: #FFF503A6;">Designing and Implementing the Application Components</mark>

Defining the remote interfaces - A remote interface specifies the methods that can be invoked remotely by a client.  

<mark style="background: #FFF503A6;">Implementing the remote objects:</mark>
- Remote objects must implement one or more remote interfaces. 
- The remote object class may include implementations of other interfaces and methods that are available only locally.  

<mark style="background: #FFF503A6;">Implementing the clients:</mark> Clients that use remote objects can be implemented at any time after the remote interfaces are defined, including after the remote objects have been deployed.  

<mark style="background: #FFF503A6;">Note:</mark> Since Java version 1.5 (Java 5), the Stub object no longer has to be statically generated

### <mark style="background: #FFF503A6;">The Remote Interface</mark>

A Java interface is a class that serves as a template for other classes - it contains declarations or signatures of methods whose implementations are to be supplied by classes that implements the interface.  

A java remote interface is an interface that inherits from the Java Remote class, which allows the interface to be implemented using RMI syntax. Other than the Remote extension and the Remote exception that must be specified with each method signature, a remote interface has the same syntax as a regular or local Java interface.  

<mark style="background: #FFF503A6;">An object becomes remote by implementing a remote interface, which has the following characteristics:</mark>
- A remote interface extends the interface ``java.rmi.Remote``.
- Each method of the interface declares ``java.rmi.RemoteException`` in its throws clause, in addition to any application-specific exceptions.

### <mark style="background: #FFF503A6;">The Server-side Software</mark> 

An object server is an object that provides the methods of, and the interface to a distributed object. 

<mark style="background: #FFF503A6;">Each object server must:</mark>
- implement each of the remote methods specified in the interface,
- register an object which contains the implementation with a directory service.  

It is recommended that the two parts be provided as separate classes.

### <mark style="background: #FFF503A6;">The Client-side Software</mark> 

The program for the client class is like any other Java class.  

<mark style="background: #FFF503A6;">The syntax needed for RMI involves:</mark>
- locating the RMI Registry in the server host, and
- looking up the remote reference for the server object; the reference can then be cast to the remote interface class and the remote methods invoked.

### <mark style="background: #FFF503A6;">Overview of RMI Interfaces and Classes</mark>

``java.rmi package``

![[Pasted image 20251117170337.png]]

### <mark style="background: #FFF503A6;">Example application - Hello</mark>

Displays a greeting to any client that uses the appropriate interface registered with the naming service to invoke the associated method implementation on the server.

### <mark style="background: #FFF503A6;">Create the interface</mark>

Should import package java.rmi  

Must extend interface Remote - an interface that contains no methods.  

<mark style="background: #FFF503A6;">Hello example:</mark> It declares just one method, sayHello, which returns a string to the caller:  

```java
import java.rmi.Remote;  
import java.rmi.RemoteException;  

public interface Hello extends Remote {  
	String sayHello() throws RemoteException;  
}
```

### <mark style="background: #FFF503A6;">Create the server process</mark>

A "server" class, is the class which has a main method that creates an instance of the remote object implementation, exports the remote object, and then binds that instance to a name in a Java RMI registry.  

The class that contains this main method could be the implementation class itself, or another class entirely.  

In this example, the main method for the server is defined in the class Server which also implements the remote interface Hello.  

<mark style="background: #FFF503A6;">The server's main method does the following:</mark>
- Create and export a remote object  
- Register the remote object with a Java RMI registry

### <mark style="background: #FFF503A6;">Create and export a remote object</mark>

The main method of the server needs to create the remote object that provides the service.  

Additionally, the remote object must be exported to the Java RMI runtime so that it may receive incoming remote calls.  

```java
Server obj = new Server();  
Hello stub = (Hello) UnicastRemoteObject.exportObject(obj, 0);
```

### <mark style="background: #FFF503A6;">Register the remote object with a Java RMI registry</mark>  

For a caller (client, peer) to be able to invoke a method on a remote object, that caller must first obtain a stub for the remote object.  

JAVA RMI provides a registry API for applications to bind a name to a remote object's stub and for clients to look up remote objects by name in order to obtain their stubs.  

Once a remote object is registered on the server, callers can look up the object by name, obtain a remote object reference, and then invoke remote methods on the object.  

```java
Registry registry = LocateRegistry.getRegistry();  
registry.bind("Hello", stub);
```  

The static method ``LocateRegistry.getRegistry`` that takes no arguments returns a stub that implements the remote interface ``java.rmi.registry.Registry`` and sends invocations to the registry on server's local host on the default registry port of 1099.  

The bind method is then invoked on the registry stub in order to bind the remote object's stub to the name "Hello" in the registry.

### <mark style="background: #FFF503A6;">Server code:</mark>
```java 
import java.rmi.registry.Registry;  
import java.rmi.registry.LocateRegistry;  
import java.rmi.RemoteException;  
import java.rmi.server.UnicastRemoteObject;  

public class Server implements Hello {  
	public Server() {}  
	
	public String sayHello() {  
		return "Hello, world!";  
	}  
	
	public static void main(String args[]) {  
		try {  
			Server obj = new Server();  
			Hello stub = (Hello) UnicastRemoteObject.exportObject(obj, 0);  
			// Bind the remote object's stub in the registry  
			Registry registry = LocateRegistry.getRegistry();  
			registry.bind("Hello", stub);  
			System.err.println("Server ready");  
		} catch (Exception e) {  
			System.err.println("Server exception: " + e.toString());  
			e.printStackTrace();  
		}  
	}  
}
```

### <mark style="background: #FFF503A6;">The client process</mark>

The client program obtains a stub for the registry on the server's host, looks up the remote object's stub by name in the registry, and then invokes the sayHello method on the remote object using the stub.  

This client first obtains the stub for the registry by invoking the static LocateRegistry.getRegistry method with the hostname specified on the command line. If no hostname is specified, then null is used as the hostname indicating that the local host address should be used.  

```java
Registry registry = LocateRegistry.getRegistry(host);
```

Next, the client invokes the remote method lookup on the registry stub to obtain the stub for the remote object from the server's registry.

Next, the client invokes the remote method lookup on the registry stub to obtain the stub for the remote object from the server's registry.  

```java
Hello stub = (Hello) registry.lookup("Hello");
```

### <mark style="background: #FFF503A6;">The client process</mark>

Finally, the client invokes the sayHello method on the remote object's stub, which causes the following actions to happen:  

The client-side runtime opens a connection to the server using the host and port information in the remote object's stub and then serialises the call data.  

The server-side runtime accepts the incoming call, dispatches the call to the remote object, and serializes the result (the reply string "Hello, world!") to the client.  

The client-side runtime receives, deserializes, and returns the result to the caller.  

The response message returned from the remote invocation on the remote object is then printed to ``System.out``.

### <mark style="background: #FFF503A6;">Client code</mark>

```java
import java.rmi.registry.LocateRegistry;  
import java.rmi.registry.Registry;  

public class Client {  
	private Client() {}  
	public static void main(String[] args) {  
		String host = (args.length < 1) ? null : args[0];  
		try {  
			Registry registry = LocateRegistry.getRegistry(host);  
			Hello stub = (Hello) registry.lookup("Hello");  
			String response = stub.sayHello();  
			System.out.println("response: " + response);  
		} catch (Exception e) {  
			System.err.println("Client exception: " + e.toString());  
			e.printStackTrace();  
		}  
	}  
}
```

<mark style="background: #FFF503A6;">Steps to Run:</mark>  
1. Compile all the three java files.  
2. Open a Command Prompt where you are going to run Server. – Start Registry with the following command:  
```shell
> start rmiregistry
```
3. Start Server and Client in two separate Command Prompts  
```shell
java Server  
java Client
```  
3. The output of Server will look like: Server ready  
4. The output of Client will look like:  
```shell
response: Hello, world!
```

### <mark style="background: #FFF503A6;">RMI vs. Sockets</mark>

RMI API can be used instead of the socket API in a network application.  

<mark style="background: #FFF503A6;">There are some tradeoffs:</mark> The socket API is closely related to the operating system, and hence has less execution overhead.  

For applications which require high performance, this may be a consideration.  

The RMI API provides the abstraction which eases the task of software development.  

Programs developed with a higher level of abstraction are more comprehensible and hence easier to debug.

### <mark style="background: #FFF503A6;">Testing and Debugging an RMI Application</mark>
1. Build a template for a minimal RMI program. Start with a remote interface with a single signature, its implementation using a stub, a server program which exports the object, and a client program which invokes the remote method. Test the template programs on one host until the remote method can be made successfully.  
2. Add one signature at a time to the interface. With each addition, modify the client program to invoke the added method.  
3. Fill in the definition of each remote method, one at a time. Test and thoroughly debug each newly added method before proceeding with the next one.  
4. After all remote methods have been thoroughly tested, develop the client application using an incremental approach. With each increment, test and debug the programs.

### <mark style="background: #FFF503A6;">RMI Security Recommendations</mark>

Follow Secure Coding Guidelines for Java SE (https://www.oracle.com/java/technologies/javase/seccodeguide.html)  

See more details at: https://docs.oracle.com/en/java/javase/25/rmi/java-remote-method-invocation-api-guide.pdf

### <mark style="background: #FFF503A6;">PYTHON REMOTE PYTHON CALL (RPYC)</mark>  

<mark style="background: #FFF503A6;">Python RPyC</mark> Remote Python Call  

Python RPyC package used for embedding RPCs.  

One of several RPC frameworks available for Python, other RPC – yRO, PyInvoke, RPyC, and ZeroRPC.  

Supports passing objects by value or by reference

### <mark style="background: #FFF503A6;">Python RPyC</mark>

<mark style="background: #FFF503A6;">On the client side:</mark>
- The client creates local proxy objects for remote modules that enables transparent access.
- Operations on the proxy object are delivered to the remote side.  

Supports both synchronous and asynchronous calls.  

Each process exposes a remote service that is responsible for the policy.  

<mark style="background: #FFF503A6;">Policy:</mark> the set of supported operations.  

<mark style="background: #FFF503A6;">Services:</mark> classes that derive from ``rpyc.core.service.Service`` and define exposed methods.

### <mark style="background: #FFF503A6;">GRPC - GOOGLE’S RPC PLATFORM</mark>


<mark style="background: #FFF503A6;">Google’s RPC platform:</mark> now available to all developers  

A client application can directly call a method on a server application on a different machine as if it were a local object – easier to create distributed applications and services.  

Supports python, Java, Python, C++,C#, Go, Swift, Node.js

``gRPC`` based around the idea of defining a service, specifying the methods that can be called remotely with their parameters and return types.  

<mark style="background: #FFF503A6;">Works across OS, hardware and languages:</mark>
- E.g. you can create a gRPC server in Java or
- C++ with clients in Go, Python, or Ruby.

![[Pasted image 20251117174541.png]]

### <mark style="background: #FFF503A6;">References</mark>

https://docs.oracle.com/en/java/javase/25/docs/specs/rmi/  

Chapter 5: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, 5ed, 2012  
- https://pypi.org/project/rpyc/
- https://grpc.io/docs/what-is-grpc/introduction/