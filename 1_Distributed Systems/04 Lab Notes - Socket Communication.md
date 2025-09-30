A communication link created via TCP sockets is a <mark style="background: #FFF503A6;">connection-oriented</mark> link: the connection between server and client remains open throughout the duration of the dialogue between the two and is only broken when one end of the dialogue formally terminates the exchanges (via an agreed protocol).

Since there are two separated types of process involved (client and server), we will examine them separately.

### <mark style="background: #FFF503A6;">Setting up a TCP Server and Client TCP Sockets</mark>

The example program implements a TCP Client, that connects to a TCP Server. The TCP Server receives data from and sends data to its clients.

<mark style="background: #FFF503A6;">Step 1: Create a ServerSocket object:</mark>

The ``java.net.ServerSocket`` class implements server sockets. A server socket waits for requests to come in over the network. It performs some operation based on that request, and then possibly returns a result to the requester.

``ServerSocket servSock = new ServerSocket(1234);``

Above: the server waits (‘listens for’) a connection from a client on port 1234.

<mark style="background: #FFF503A6;">2. Put the server into a waiting state:</mark>

The server waits indefinitely for a client to connect. (Use the java.net.Socket class)

``Socket link = servSock.accept();``

<mark style="background: #FFF503A6;">3. Set up input and output streams:</mark>

Use ``getInputStream`` and ``getOutputStream`` of the java.net.Socket class to get references to streams associated with the socket set up in step 2. (Use ``java.io.BufferedReader`` and ``java.io.PrintWriter`` classes).  

```Java
BufferedReader in =  
	new BufferedReader(  
		new InputStreamReader(link.getInputStream()));  
		
PrintWriter out = new  
	PrintWriter(link.getOutputStream(), true());
```  

The second argument (true) of the ``PrintWriter`` constructor causes the output buffer to be flushed for every ``println()`` call.

<mark style="background: #FFF503A6;">4. Send and receive data:</mark>

Use the ``BufferedReader readLine`` method for receiving data and the ``PrintWriter println`` method for sending data. E.g.  

```java
out.println(“Awaiting data...”);  
String inpuit = in.readLine();
```

<mark style="background: #FFF503A6;">5. Close the connection</mark> 

After completion of the dialogue, use the class Socket method close. e.g.  

```java
link.close()
```

### <mark style="background: #FFF503A6;">Setting up a TCP Client:</mark>

<mark style="background: #FFF503A6;">1. Establish a connection to the server:</mark>

Use the ``class java.net.Socket`` following constructor: 

```java
Socket(InetAddress address, int port)
```

which creates a stream socket and connects it to the specified port number at the specified IP address.  

<mark style="background: #FFF503A6;">Note:</mark> The port number for server and client programs must be the same.  

```Java
Socket link = new Socket(host, 1234);
```

<mark style="background: #FFF503A6;">2. Set up input and output streams:</mark>

The same way as for the server.

<mark style="background: #FFF503A6;">3. Send and receive data:</mark>

The client’s ``BufferedReader`` object will receive messages sent by the server’s ``PrintWriter`` object.  

The client’s ``PrintWriter`` object will send messages to be received by the ``BufferedReader`` object at the server end.

<mark style="background: #FFF503A6;">4. Close the connection:</mark>

Using the ``java.net.Socket`` close method.  

```java
link.close();
```

### <mark style="background: #FFF503A6;">The Datagram Communication Protocol</mark>

<mark style="background: #FFF503A6;">Connectionless:</mark>
- The connection between client and server is not maintained throughout the duration of the dialogue.  
- Instead, each datagram packet is sent as an isolated transmission whenever necessary.

### <mark style="background: #FFF503A6;">Setting up a UDP Server and Client Introduction</mark>

<mark style="background: #FFF503A6;">Connectionless:</mark>
- The connection between client and server is not maintained throughout the duration of the dialogue.
- Instead, each datagram packet is sent as an isolated transmission whenever necessary.

Let's look at a simple example that illustrates how a server can continuously receives datagram packets over a datagram socket.

When the server receives a datagram packet, it replies by sending a datagram packet that contains a response back to the client

### <mark style="background: #FFF503A6;">Setting up a UDP server</mark>

<mark style="background: #FFF503A6;">1. Create a java.net.DatagramSocket object:</mark>

The ``DatagramSocket`` class represents a socket for sending and receiving datagram packets. A datagram socket is the sending or receiving point for a packet delivery service. Each packet sent or received on a datagram socket is individually addressed and routed. Multiple packets sent from one machine to another may be routed differently, and may arrive in any order.  

E.g., the constructor  
```Java
DatagramSocket dgramSocket = new DatagramSocket(1234);
```  
constructs a datagram socket and binds it to the specified port (1234) on the local host machine.

<mark style="background: #FFF503A6;">2. Create a buffer for incoming datagrams:</mark>
```java
byte[] buffer = new byte[256]
```

<mark style="background: #FFF503A6;">3. Create a java.net.DatagramPacket object for the incoming datagrams:</mark>

E.g., the constructor  
```java
DatagramPacket inPacket = new DatagramPacket(buffer, buffer.length);
```  
constructs a ``DatagramPacket`` for receiving packets of length ``length`` in the previously created byte array (<mark style="background: #FFF503A6;">buffer</mark>).

<mark style="background: #FFF503A6;">4. Accept an incoming datagram:</mark>

Use the receive method of created ``DatagramSocket`` object.  

```java
public void receive(DatagramPacket p)  
throws IOException
```  

E.g.  
```java
dgramSocket.receive(inPacket);
```  

When this method returns, the ``DatagramPacket``'s buffer (``inPacket``) is filled with the data received. The datagram packet also contains the sender's IP address, and the port number on the sender's machine.

<mark style="background: #FFF503A6;">5. Get the sender’s address and port from the packet:</mark>

Use the ``getAddress`` and ``getPort`` methods of created ``DatagramObject``.  

E.g.,  
```java
InetAddress clientAddress = inPacket.getAddress();  
int clientPort = inPacket.getPort();
```

<mark style="background: #FFF503A6;">6. Retrieve the data from the buffer:</mark>

The data will be retrieved as a ``java.lang.String`` using the constructor:  
```Java
String(byte[] bytes, int offset, int length)
```  
that constructs a new String by decoding the specified sub-array of bytes using the platform's default charset.  

E.g.  
```java
String message = new String(inPacket.getData(), 0, inPacket.getLength());
```

<mark style="background: #FFF503A6;">7. Create the response datagram:</mark>

Create a ``DatagramPacket`` object using the constructor: 
```Java
DatagramPacket(byte[] buf, int length, InetAddress address, int port)
```  
that constructs a datagram packet for sending packets of length ``length`` to the specified (client’s) port number on the specified (client’s) host. The first argument is returned by the ``getBytes`` method of the String class invoked on the retrieved message string.  

E.g.  
```Java
DatagramPacket outPacket = new DatagramPacket(  
response.getBytes(),  
response.length(),  
clientAddress,  
clientPort);
```  
where the response is a String variable holding the return message.

<mark style="background: #FFF503A6;">8. Send the response datagram:</mark>

Call the method send of the DatagramSocket object. 

```java
public void send(DatagramPacket p) 
throws IOException
```  

E.g.  
```java
dgramSocket.send(outPacket);
```

<mark style="background: #FFF503A6;">9. Close the DatagramSocket:</mark>

Call method close of created ``DatagramSocket`` object.  

E.g. 
```java
dgramSocket.close();
```


### <mark style="background: #FFF503A6;">Setting up a UDP Client</mark>

<mark style="background: #FFF503A6;">1. Create a DatagramSocket object:</mark>

Important difference with the server code: the constructor that requires no argument is used, since a default port (at the client end) will be used.

E.g. 
```Java
DatagramSocket dgramSocket = newDatagramSocket();
```

<mark style="background: #FFF503A6;">2. Create the outgoing datagram.</mark> 

Exactly the same as for step 7 of the server program. E.g.  
```java
DatagramPacket outPacket = new DatagramPacket(  
message.getBytes(,  
message.length(),  
host, PORT);
```  
where, message is a String variable holding the required message.

<mark style="background: #FFF503A6;">3. Send the datagram message:</mark> 

Call method send of the DatagramSocket object, supplying the outgoing ``DatagramPacket`` object as an argument.  

E.g.  
```java
dgramSocket.send(outPacket);
```

<mark style="background: #FFF503A6;">4. Create a buffer for incoming datagrams:</mark>

```java
byte[] buffer = new byte[256]
```

<mark style="background: #FFF503A6;">5. Create a java.net.DatagramPacket object for the incoming datagrams:</mark>

E.g., the constructor  
```java
DatagramPacket inPacket = new  
DatagramPacket(buffer, buffer.length);
```  
constructs a ``DatagramPacket`` for receiving packets of length ``length`` in the previously created byte array (buffer).

<mark style="background: #FFF503A6;">6. Accept an incoming datagram:</mark>

Use the receive method of created ``DatagramSocket`` object.

E.g. 
```java
dgramSocket.receive(inPacket);
```

When this method returns, the ``DatagramPacket``'s buffer (``inPacket``) is filled with the data received.

<mark style="background: #FFF503A6;">7. Retrieve the data from the buffer:</mark>

The data will be retrieved as a  
``java.lang.String`` using the constructor:  

E.g.  
```Java
String response = new String(inPacket.getData(), 0,  
inPacket.getLength());
```  

Steps 2-7 may be repeated as many times as required.

<mark style="background: #FFF503A6;">8. Close the DatagramSocket:</mark>

```java
dgramSocket.close();
```


### <mark style="background: #FFF503A6;">Java API to IP multicast</mark>

The Java API provides a datagram interface to IP multicast through the class ``MulticastSocket``, which is a subclass of

``DatagramSocket`` with the additional capability of being able to join multicast groups.

A process can leave a specified group by invoking the ``leaveGroup`` method of its multicast socket.


### <mark style="background: #FFF503A6;">MulticastSocket</mark> 

A ``MulticastSocket`` is a datagram socket for sending and receiving IP multicast datagrams.  

The ``MulticastSocket`` constructors create a socket with appropriate socket options enabled that make it suitable for receiving multicast datagrams.  

Joining one or more multicast groups makes it possible to receive multicast datagrams sent to these groups.  

<mark style="background: #FFF503A6;">To join a multicast group:</mark>
- create a ``MulticastSocket`` with the desired port,  
- invoke the ``joinGroup`` method specifying the group address and the network interface through which multicast datagrams will be received

When one sends a message to a multicast group, all subscribing recipients to that host and port receive the message – within the time-to-live range of the packet.  

The socket needn't be a member of the multicast group to send messages to it.  

When a socket subscribes to a multicast group/port, it receives datagrams sent by other hosts to the group/port, as do all other members of the group and port.  

A socket relinquishes membership in a group by calling 
```java
leaveGroup(SocketAddress mcastaddr,  
NetworkInterface netIf)
``` 
method.  

Multiple ``MulticastSockets`` may subscribe to a multicast group and  
port concurrently, and they will all receive group datagrams.

### <mark style="background: #FFF503A6;">java.net.MulticastSocket</mark>

java.net includes a class called ``MulticastSocket``  

https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/net/MulticastSocket.html  

This kind of socket is used on the client-side to listen for packets that the server broadcasts to multiple clients


### <mark style="background: #FFF503A6;">Python Networking</mark>

Python's standard library consists of various built-in modules that support inter-process communication and networking.  

Two levels of access to the network services.  

<mark style="background: #FFF503A6;">Low-Level Access:</mark>
- Allows use and access the basic socket support for the operating system using Python's libraries  
- Can implement both connection-less and connection-oriented protocols for programming. 
- TCP, UDP  

<mark style="background: #FFF503A6;">High-Level Access:</mark>
- Application-level network protocols can also be accessed using high-level access provided by Python libraries.  
- HTTP, FTP, etc.

### <mark style="background: #FFF503A6;">Python Socket Programming</mark>

In Python, the socket module is used for socket programming – the standard library that includes functionality required for communication between server and client at hardware level.  

This socket module provides access to the BSD socket interface.  

Available on all operating systems such as Linux, Windows, MacOS.

### <mark style="background: #FFF503A6;">References</mark>

Chapters 1 and 2, Introduction to Network Programming in Java by Jan Graba  
- https://docs.oracle.com/javase/tutorial/networking  
- https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/net/package-summary.html  
- https://www.tutorialspoint.com/python/python_network_programming.htm