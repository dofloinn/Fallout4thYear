<mark style="background: #FFF503A6;">Overview:</mark>
- IPC Summary  
- Past Learning: Socket Revision  
- Introduction to Sockets  
- Socket Documentation  
- Server Setup  
- Client Setup  
- In-Class Example  
- Summary

### <mark style="background: #FFF503A6;">Revision – What we covered last week</mark>

<mark style="background: #FFF503A6;">IPC – Communication between processes on the same machine:</mark>
- Unnamed Pipes  
- Named Pipes  
- Message Queue

### <mark style="background: #FFF503A6;">Revision:: Sockets</mark>

Two machines on a network can communicate over a network using a Hostname/IP address and a given port address.

![[Pasted image 20260313151032.png]]

Sockets will provide for communication between a Client program and a server.  

<mark style="background: #FFF503A6;">What services can the server offer?</mark>  
- Processing (business logic)  
- Database functionality  
- Etc...  
- To ensure reliable communication, TCP will be used to establish a connection between the client and the server.

### <mark style="background: #FFF503A6;">Revision:: What is a Socket</mark>

A socket is an end-point that provides for two-way  
communication between a client and a server.  

The program on the server will be assigned a port. This will allow a client to connect to the socket on the server using the server IP address and the assigned port number.  

Syntax:  
```R
int sockfd = socket(int domain, int type, int protocol);
```

int <mark style="background: #FFF503A6;">domain</mark> -> AF_INET for PV4

int <mark style="background: #FFF503A6;">type</mark> -> SOCK_STREAM for TCP

int <mark style="background: #FFF503A6;">protocol</mark> -> 0

### <mark style="background: #FFF503A6;">Revision:: Client Server</mark>

<mark style="background: #FFF503A6;">Socket Communication</mark> 
- With a socket created, both the client and the server can communicate with the help of the socket.  
- Streams will be used both on the client and the server to facilitate two-way communication.

### <mark style="background: #FFF503A6;">Revision:: Sockets - Sequence</mark> 

- <mark style="background: #FFF503A6;">Step 1:</mark> Server creates a socket and starts listening for a client to connect.  
- <mark style="background: #FFF503A6;">Step 2:</mark> Client makes a socket connection to the server.  
- <mark style="background: #FFF503A6;">Step 3:</mark> Sever decides whether to allow the connection (true or false)  
- <mark style="background: #FFF503A6;">Step 4:</mark> Client sets Input and Output streams for the socket. This will be used to send/receive data.  
- <mark style="background: #FFF503A6;">Step 5:</mark> Client usually closes the socket connection.

### <mark style="background: #FFF503A6;">Sockets in Linux</mark>

The socket network Interface in Linux can be used to facilitate communication between different processes, no matter where they reside.  

Socket communication draws on the strength of network communication protocols.  

The examples we cover in this session are using TCP/IP. (It is possible to use other network protocols for socket communication, but TCP/IP is the most widely used standard)

### <mark style="background: #FFF503A6;">Socket Descriptors</mark>

A socket is an abstraction of a communication endpoint.  

In the Linux environment a socket descriptor is used to access sockets.  

Socket descriptors are implemented as file descriptors in the UNIX System.  

Most of the functions used for reading and writing  
work with the socket descriptor.  

As always you can get more information with `man 2 socket`

### <mark style="background: #FFF503A6;">Socket Function</mark> 

```C
#include <sys/socket.h>

int socket(int domain, int type, int protocol);
```  

When a socket is successfully created it will return the file (socket) descriptor.  

The file descriptor will facilitate the communication between the socket endpoints.

### <mark style="background: #FFF503A6;">Domain Argument</mark>  

When using the socket function to create a file descriptor the domain argument must be provided to determines the nature of the communication.  

The domain parameter specifies a communications domain within which communication will take place; this selects the protocol family which should be used. These families are defined in the include file ``<sys/socket.h>`` . 

<mark style="background: #FFF503A6;">Some formats are:</mark>
- ``AF_LOCAL`` Synonym for AF_UNIX
- ``AF_INET`` IPv4 Internet protocols ip(7)  
- ``AF_INET6`` IPv6 Internet protocols ipv6(7)  
- ``AF_KEY`` Key management protocol, originally developed for usage with IPsec  
- ``AF_NETLINK`` Kernel user interface device netlink(7) 
- ``AF_PACKET`` Low-level packet interface packet(7)  
- ``AF_BLUETOOTH`` Bluetooth low-level socket protocol  
- ``AF_ALG`` Interface to kernel crypto API  
- ``AF_VSOCK`` VSOCK (originally "VMWare VSockets") vsock(7) protocol for hypervisor-guest comms

### <mark style="background: #FFF503A6;">Type</mark>

The socket has the indicated type, which specifies the semantics of communication. 

<mark style="background: #FFF503A6;">Some defined types are:</mark>  
- ``SOCK_STREAM``  
- ``SOCK_DGRAM``  
- ``SOCK_RAW``  

A ``SOCK_STREAM`` type provides sequenced, reliable, two-way connection-based byte streams.  

A ``SOCK_DGRAM`` socket supports datagrams (connectionless, unreliable messages of a fixed (typically small) maximum length).  

``SOCK_RAW`` sockets provide access to internal network protocols and interfaces.

### <mark style="background: #FFF503A6;">Lifeline of a Socket Connection</mark> 

Sockets of type ``SOCK_STREAM`` are <mark style="background: #FFF503A6;">full-duplex</mark> byte streams.  

The connection must be set correctly before any data may be sent or received.  

The <mark style="background: #FFF503A6;">connect</mark> function is used to connect to an existing socket.  

When connected data can be send and received using <mark style="background: #FFF503A6;">read</mark> and <mark style="background: #FFF503A6;">write</mark>.  

When the processes are finished communicating, <mark style="background: #FFF503A6;">close</mark> function is called.

### <mark style="background: #FFF503A6;">In Class Example</mark>

See server.c & client.c

### <mark style="background: #FFF503A6;">Sequence</mark>  

<mark style="background: #FFF503A6;">Server:</mark>
- Set Includes  
- Init Variables  
- Create the Socket  
- Init the Socket  
- Bind Init to Socket  
- Listen for Connections  
- Accept Connection  
- Read Data from Client  
- Cleanup and end program  

<mark style="background: #FFF503A6;">Client:</mark>
- Set Includes  
- Init Variables  
- Create the Socket  
- Set Socket Variables  
- Connect to Socket Server  
- Communicate with Server  
- Cleanup and end program

### <mark style="background: #FFF503A6;">server.c - Init Server Variables</mark>  

```C
int s; // socket descriptor  
int cs; // Client Socket  
int connSize; // Size of struct  
int READSIZE; // Size of  
sockaddr_in for client  
connection  
struct sockaddr_in server ,  
client;  
char message[500];
```

### <mark style="background: #FFF503A6;">server.c – Create the Socket</mark>  
 
```C
//Create socket  
s = socket(AF_INET , SOCK_STREAM , 0);  
if (s == -1)  
{  
printf("Could not create socket");  
} else {  
printf("Socket Successfully Created!!");  
}
```

### <mark style="background: #FFF503A6;">server.c – Init the Socket</mark>  

```C
// set sockaddr_in variables  
server.sin_port = htons( 8082 ); // Set the prot  
for communication  
server.sin_family = AF_INET; // Use IPV4 protocol  
server.sin_addr.s_addr = INADDR_ANY;  
// When INADDR_ANY is specified in the bind call,  
the socket will be bound to all local interfaces.
```

### <mark style="background: #FFF503A6;">server.c – Bind Configuration to the Socket</mark> 

```C
//Bind  
if( bind(s,(struct sockaddr *)&server , sizeof(server)) < 0)  
{  
	perror("Bind issue!!");  
	return 1;  
} else {  
	printf("Bind Complete!!");  
}  
```

<mark style="background: #FFF503A6;">NOTE:</mark>

``sockaddr_in:`` IPv4 address structure  

``sockaddr:`` generic socket address wrapper used by the API

### <mark style="background: #FFF503A6;">server.c - Set to listen for connection</mark>  

```C
Listen for a conection  
listen(s,3);  
//Accept and incoming connection  
printf("Waiting for incoming connection from Client>>");  
connSize = sizeof(struct sockaddr_in);
```

### <mark style="background: #FFF503A6;">server.c - Accept a Connection</mark>
  
```C
//accept connection from an incoming client  
cs = accept(s, (struct sockaddr *)&client,(socklen_t*)&connSize);  

if (cs < 0)  
{  
	perror("Can't establish connection");  
	return 1;  
} else {  
	printf("Connection from client accepted!!");  
}
```

### <mark style="background: #FFF503A6;">server.c - Read data from Client</mark> 
  
```C
while(1) {  
	memset(message, 0, 500);  
	//READSIZE = read(cs,message,500);  
	READSIZE = recv(cs , message , 2000 , 0);  
	printf("Client said: %s\n", message);  
	//puts(message);  
	write(cs , "What ??" , strlen("What ??"));  
}
```

### <mark style="background: #FFF503A6;">server.c - Clean up on client disconnect</mark>  

```C
if(READSIZE == 0)  
{  
	puts("Client disconnected");  
	fflush(stdout);  
}  
else if(READSIZE == -1)  
{  
	perror("read error");  
}
```

### <mark style="background: #FFF503A6;">client.c - Initialise</mark>  

```C
// init client variables  
int SID;  
struct sockaddr_in server;  
char clientMessage[500];  
char serverMessage[500];
```

### <mark style="background: #FFF503A6;">client.c - Create the socket</mark>  

```C
//Create socket  
SID = socket(AF_INET , SOCK_STREAM , 0);  

if (SID == -1)  
{  
	printf("Error creating socket");  
} {  
	printf("socket created");  
}
```

### <mark style="background: #FFF503A6;">client.c -Set Socket Variables</mark> 
  
```C
// set sockaddr_in variables  
server.sin_port = htons( 8082 ); // Port to connect on  
server.sin_addr.s_addr = inet_addr("127.0.0.1"); //  
Server IP  
server.sin_family = AF_INET; // IPV4 protocol
```

### <mark style="background: #FFF503A6;">client.c - Connect to Socket Server</mark>  
 
```C
//Connect to server  
if (connect(SID , (struct sockaddr *)&server, sizeof(server)) < 0)  
{  
	printf("connect failed. Error");  
	return 1;  
}
```

### <mark style="background: #FFF503A6;">client.c - Communicate with Server</mark>  

```C
//keep communicating with server  
while(1)  
{  
	printf("\nEnter message : ");  
	scanf("%s" , clientMessage);  
	//Send some data  
	if( send(SID , clientMessage ,  
	strlen(clientMessage) , 0) < 0)  
	{  
		printf("Send failed");  
		return 1;  
	}  

	//Receive a reply from the server  
	if( recv(SID , serverMessage , 500 , 0) <  
	1)  
	{  
	printf("IO error");  
	//break;  
	}  
	puts("\nServer sent: ");  
	puts(serverMessage);  
}
```

### <mark style="background: #FFF503A6;">Run the Programs</mark>

<mark style="background: #FFF503A6;">Server first:</mark>
```shell
./server  
Socket Successfully Created.  
Bind Complete.  
Waiting for incoming connection from Client>>  
Connection from client accepted!!  
Client said: hello
```

<mark style="background: #FFF503A6;">Then client:</mark>
```shell
$ ./client  
socket created  
Connected to server ok!!  
Enter message : hello
```

### <mark style="background: #FFF503A6;">How can I tell what activity is happening on a given port</mark>  

```shell
lsof –i tcp:8802  

COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME  
server 2090649 sdo 3u IPv4 64029694 0t0 TCP *:8082 (LISTEN)  
server 2090649 sdo 4u IPv4 64029695 0t0 TCP localhost:8082->localhost:48616 (ESTABLISH)
client 2090691 sdo 3u IPv4 64032803 0t0 TCP localhost:48616->localhost:8082 (ESTABLISHED)
```

### <mark style="background: #FFF503A6;">Control Flow in Client-Server Connection</mark>

![[Pasted image 20260313155057.png]]

### <mark style="background: #FFF503A6;">Summary</mark> 

Socket Programming can be used to facilitate IPC.  

The main benefits is that the processes don’t have to be on the same machine.  

Networks and Internet Protocols can be used to facilitate communication.  

Sockets offers full duple communications.
