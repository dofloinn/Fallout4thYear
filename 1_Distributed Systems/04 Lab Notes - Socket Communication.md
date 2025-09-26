A communication link created via TCP sockets is a <mark style="background: #FFF503A6;">connection-oriented</mark> link: the connection between server and client remains open throughout the duration of the dialogue between the two and is only broken when one end of the dialogue formally terminates the exchanges (via an agreed protocol).

Since there are two separated types of process involved (client and server), we will examine them separately.

### <mark style="background: #FFF503A6;">Setting up a TCP Server and Client TCP Sockets</mark>

The example program implements a TCP Client, that connects to a TCP Server. The TCP Server receives data from and sends data to its clients.

<mark style="background: #FFF503A6;">Step 1: Create a ServerSocket object:</mark>

The ``java.net.ServerSocket`` class implements server sockets. A server socket waits for requests to come in over the network. It performs some operation based on that request, and then possibly returns a result to the requester.

``ServerSocket servSock = new ServerSocket(1234);``

Above: the server waits (‘listens for’) a connection from a client on port 1234.

<mark style="background: #FFF503A6;">2. Put the server into awaiting state:</mark>

The server waits indefinitely for a client to connect. (Use the java.net.Socket class)

``Socket link = servSock.accept();``

SLIDE 6