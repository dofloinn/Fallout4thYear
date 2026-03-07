<mark style="background: #FFF503A6;">Overview:</mark>
- Inter Process Communication (IPC)  
- Message Queues  
- Intro to Shared Memory

### <mark style="background: #FFF503A6;">Message Queues</mark>  

A message queue operates as a linked list of messages  

The messages are stored in the system kernel  

Each queue has a unique identifier (queue ID or name)  

Implementations of message queues can vary for  different types of environments.

### <mark style="background: #FFF503A6;">Different Implementations</mark>

<mark style="background: #FFF503A6;">Source:</mark> Linux Man Pages  

POSIX message queues allow processes to exchange data in the form of messages.  

POSIX API is distinct from that provided by System V message queues ``msgget(2)``, ``msgsnd(2)``, ``msgrcv(2)``, etc.  

Better option unless using on legacy applications etc – more predictable (fixed message size, prioritisation)

### <mark style="background: #FFF503A6;">Creating a Queue</mark>  

A Queue is created using ``mq_open()``  

The return from creating the queue is a file descriptor.  

This needs to be stored as type mqd_t, this will be used to access the queue for all subsequent calls.  

Each queue will be given a unique name.  

This is provided when creating the queue.  

See ``man mq_open`` or ``man mq_overview`` for more details

### <mark style="background: #FFF503A6;">Sending and Receiving Messages with the Queue</mark>  

<mark style="background: #FFF503A6;">With the queue setup:</mark>  
- messages can be sent with mq_send  
- messages can be received with mp_receive

<mark style="background: #FFF503A6;">Example:</mark>
- For the Message Queue we will be creating a server program to manage the operation of the queue.  
- server.c  
- A client program will be created to show the operation of the queue  
- client.c

### <mark style="background: #FFF503A6;">Setup the Server</mark> 

```C
mqd_t mq;  
struct mq_attr queue_attributes;  
char buffer[1024 + 1];  
int terminate = 0;  

/* set queue attributes */  
queue_attributes.mq_flags = 0;  
queue_attributes.mq_maxmsg = 10;  
queue_attributes.mq_msgsize = 1024;  
queue_attributes.mq_curmsgs = 0;

/* create queue */  
mq = mq_open("/dt228_queue", O_CREAT | O_RDONLY, 0644, &queue_attributes);  

do {  
	ssize_t bytes_read;  
	/* receive message */  
	bytes_read = mq_receive(mq, buffer, 1024, NULL);  
	buffer[bytes_read] = '\0';  
	
	if (! strncmp(buffer, "exit", strlen("exit")))  
	{ 
		terminate = 1; 
	}  
	else  
	{ 
		printf("Received: %s\n", buffer); 
	}  
} while (!terminate);
```

### <mark style="background: #FFF503A6;">Shutdown the server</mark>

```C
mq_close(mq);  
mq_unlink("/tu85X_queue");  
return 0;
```

### <mark style="background: #FFF503A6;">Setup the Client</mark>

```C
mqd_t mq;  
char buffer[1024];  

/* open the message queue */  
mq = mq_open("/tu85X_queue", O_WRONLY);

printf("Send message to server (enter 'exit' to terminate):\n");  

do {  
	printf(">> ");  
	fflush(stdout);  
	memset(buffer, 0, 1024);  
	fgets(buffer, 1024, stdin);  
	mq_send(mq, buffer, 1024, 0);  
} while (strncmp(buffer, "exit", strlen("exit")));
```

### <mark style="background: #FFF503A6;">Run</mark>

Compile the files using the following command (note the –lrt)  

```C
gcc -o server server.c –lrt  
gcc -o client client.c –lrt
```
  
-lrt means to link against the realtime lib for timing/synchronisation etc.

Run the client in another terminal with the command:  
``$ ./client``  

Send message before starting server (enter 'exit' to terminate):  
``>> Hello``  

Run the server in one terminal with the command  
``./server``  

Received: Hello

### <mark style="background: #FFF503A6;">Shared Memory</mark> 

Shared memory can be used as a mechanism to pass data between different processes.  

One process will create the memory portion and other process can access the memory portion (if permitted).  

A process creates a shared memory segment using ``shmget()``

### <mark style="background: #FFF503A6;">Shared memory: controlling access</mark>  

The process that setups the shared memory segment can control what other processes can access it.  

Access can be granted using ``mmap()``  

Access can also be removed.  

The two API calls that are used for this are called ``mmap`` and ``shm_open`` – you can do man ``mmap`` or man ``shm_open`` for more info  

See mmap-example.c