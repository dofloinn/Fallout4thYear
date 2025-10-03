### <mark style="background: #FFF503A6;">Concurrency in distributed systems</mark>

Fundamental to distributed systems is the concurrency and collaboration among multiple processes.  

<mark style="background: #FFF503A6;">Concurrency in distributed systems:</mark>
- Concurrent requests to its resources  
- Each resource must be designed to be safe in a concurrent environment

### <mark style="background: #FFF503A6;">Concurrency vs. Parallelism</mark>

Concurrency is related to how an application handles <mark style="background: #FFF503A6;">multiple</mark> tasks. It may process one task at a time (sequentially) or work on multiple tasks at the same time - concurrently.  

Parallelism is related to how an application handles each <mark style="background: #FFF503A6;">individual</mark> task.  

The task may be processed serially from start to end, or split it up into subtasks which can be completed in parallel.  

<mark style="background: #FFF503A6;">Parallelism:</mark> To achieve parallelism your application must have more than one thread running, or at least be able to schedule tasks for execution in other threads, processes, CPUs.

### <mark style="background: #FFF503A6;">Concurrent programming</mark>

Systems can do more than one thing at a time  

<mark style="background: #FFF503A6;">Examples:</mark>
- Streaming audio application must simultaneously read the digital audio off the network, decompress it, manage playback, and update its display.  
- The word processor should always be ready to respond to keyboard and mouse events, no matter how busy it is reformatting text or updating the display.  

Software that can do such things is known as <mark style="background: #FFF503A6;">concurrent</mark> software.

### <mark style="background: #FFF503A6;">Mutual exclusion</mark>

In many cases, processes will need to simultaneously access the same resources.  

To prevent that such concurrent accesses corrupt the resource, or make it inconsistent, solutions are needed to grant mutual exclusive access by processes.  

<mark style="background: #FFF503A6;">Mutual exclusion:</mark> making sure that only one process or thread accesses a resource at a time.  

<mark style="background: #FFF503A6;">For example:</mark>
- One process may have to wait for another  
- Critical sections of shared resource may require exclusive access

<mark style="background: #FFF503A6;">Mutual exclusion examples:</mark> 
- Update a fields in database tables  
- Modify a shared file  
- Modify file contents that are replicated on multiple servers

### <mark style="background: #FFF503A6;">Process</mark>

<mark style="background: #FFF503A6;">Computer program:</mark> collection of instructions

<mark style="background: #FFF503A6;">Process:</mark> the actual execution of those instructions  

<mark style="background: #FFF503A6;">An executing instance of a program:</mark>
- Has a self-contained execution environment  
- Has a complete, private set of basic run-time resources  
- Each process has its own memory space  

To facilitate communication between processes, most operating systems support <mark style="background: #FFF503A6;">Inter Process Communication (IPC)</mark> resources – such as pipes and sockets  

IPC is used not just for communication between processes on the same system, but processes on different systems


### <mark style="background: #FFF503A6;">Threads</mark>

Sometimes called <mark style="background: #FFF503A6;">lightweight</mark> processes  

A <mark style="background: #FFF503A6;">thread</mark> is a single sequential flow of execution that runs through a program.  

Threads exist within a process – every process has at least one  

Unlike a process, a thread does not have a separate allocation of memory, but shares memory with other threads created by the same application.  

Thread context switching can be done entirely independent of the operating system.

### <mark style="background: #FFF503A6;">Threads vs Processes</mark>

<mark style="background: #FFF503A6;">Processes:</mark>
- Composed of 1 or more threads  
- Have their own address space  
- Communicate via message passing  

<mark style="background: #FFF503A6;">Threads:</mark>
- Share common memory and resources  
- Can communicate via shared memory

### <mark style="background: #FFF503A6;">Threads</mark> 

Threads share the process's resources, including memory and open files.  

This makes for efficient, but potentially problematic, communication  

<mark style="background: #FFF503A6;">Multithreading:</mark> You can have more than one thread running at the same time inside a single program which means it shares memory with other threads created by the same application.  

Every application has at least one thread (started with ``main()`` in Java) — or several, – if you count "system" threads that do things like memory management and signal handling.  

Retain the idea of sequential processes with blocking system calls, but still achieve parallelism

### <mark style="background: #FFF503A6;">Why use threads?</mark>

<mark style="background: #FFF503A6;">Threads can help in creating better applications, e.g.:</mark>  
- print in the ‘background’ (while editing);  
- scrolling through web pages texts while the browser is busy fetching the images;  
- a typical search engine would normally include many concurrent threads of execution, some serving its clients and others running web crawlers.  

<mark style="background: #FFF503A6;">Threads can quicken calculations:</mark> having different threads executing sub-tasks

### <mark style="background: #FFF503A6;">Concurrent execution and context switching:</mark>

Two types of phases:  
- Compute bound phases - CPU is utilised for various calculations.  
- I/O bound phases – require the various input and output devices (printers, hard-disks, network cards etc.), CPU is mostly idle, waiting for the I/O device to do its task.  

<mark style="background: #FFF503A6;">Interleaving of phases:</mark>
- <mark style="background: #FFF503A6;">Context switch:</mark> the process when one thread relinquish the CPU and another thread starts running it.  
- <mark style="background: #FFF503A6;">Thread context:</mark> each running thread has its own point of execution and private view of the values of local variables.

### <mark style="background: #FFF503A6;">Context switching</mark>

<mark style="background: #FFF503A6;">Context switching is expensive:</mark> Try to avoid process switching  

Thread context switching may be faster than process context switching

![[Pasted image 20251002100308.png]]

### <mark style="background: #FFF503A6;">Why use threads?</mark>

<mark style="background: #FFF503A6;">Avoid needless blocking:</mark>  
- a single-threaded process will block when doing I/O;  
- in a multithreaded process, the operating system can switch the CPU to another thread in that process.  

<mark style="background: #FFF503A6;">Exploit parallelism:</mark> the threads in a multithreaded process can be scheduled to run in parallel on a multiprocessor or multicore processor.  

<mark style="background: #FFF503A6;">Avoid process switching:</mark> structure large applications not as a collection of processes, but through multiple threads.

### <mark style="background: #FFF503A6;">Why not use threads?</mark>

Context switch is costly  

Threads use the same address space: more prone to errors  

No support from OS/HW to protect threads using each other’s memory  

<mark style="background: #FFF503A6;">Extra CPU tasks:</mark> ‘freeze’ and ‘de-freeze’ state of threads  

Single CPU multithreading can take more time than having linear code to return the same result

### <mark style="background: #FFF503A6;">Single processor threading:</mark>

Threads with the same priority are each given an equal <mark style="background: #FFF503A6;">time-slice</mark> or <mark style="background: #FFF503A6;">time quantum</mark> for execution on the processor;  

<mark style="background: #FFF503A6;">Pre-emption</mark> (more urgent attention) – if thread is assigned higher priority.

### <mark style="background: #FFF503A6;">Interrupts</mark>

An interrupt is an indication to a thread that it should stop what it is doing and do something else.  

It's up to the programmer to decide exactly how a thread responds to an interrupt, but it is very common for the thread to terminate.  

A thread sends an interrupt by invoking interrupt on the Thread object for the thread to be interrupted.

### <mark style="background: #FFF503A6;">Thread usage in distributed systems</mark>

Provide a way of allowing blocking system calls without blocking the entire process in which the thread is running  

Allows maintaining multiple logical connections at the same time.

### <mark style="background: #FFF503A6;">Multithreaded clients</mark>

<mark style="background: #FFF503A6;">Multithreaded web client:</mark> hiding network latencies  

The usual way to hide communication latencies is to initiate communication and immediately proceed with something else.  

<mark style="background: #FFF503A6;">E.g. developing the browser as a multithreaded client:</mark> 
- Web browser scans an incoming HTML page, and finds that more files need to be fetched (e.g. images)  
- Each file is fetched by a separate thread, each doing a (blocking) HTTP request.  
- As files come in, the browser displays them.  
- Some browsers start displaying data while it is still coming in.  
- While the text is made available to the user, including the facilities for scrolling and such, the browser continues with fetching other files that make up the page (e.g. images)  
- The user need thus not wait until all the components of the entire page are fetched before the page is made available.

### <mark style="background: #FFF503A6;">Using threads at the client side</mark>

<mark style="background: #FFF503A6;">Multiple request-response calls to other machines (RPC):</mark>
- A client does several calls at the same time, each one by a different thread.  
- It then waits until all results have been returned

### <mark style="background: #FFF503A6;">Using threads at the server side</mark>

<mark style="background: #FFF503A6;">Improve performance:</mark>
- Starting a thread is cheaper than starting a new process.  
- Having a single-threaded server prohibits simple scale-up to a multiprocessor system.  
- As with clients: hide network latency by reacting to next request while previous one is being replied.  

<mark style="background: #FFF503A6;">Better structure:</mark>
- Most servers have high I/O demands. Using simple, well-understood blocking calls simplifies the overall structure.  
- Multithreaded programs tend to be smaller and easier to understand due to simplified flow of control.

### <mark style="background: #FFF503A6;">Why multithreading is popular</mark>

<mark style="background: #FFF503A6;">Organisation - dispatcher/worker model:</mark>
- One thread, the dispatcher, waits for requests (e.g. for a file operation).  
- For each request, the server chooses an idle worker thread and hands it the request  
- This thread proceeds by performing a blocking read on the local file system

![[Pasted image 20251002101413.png]]

### <mark style="background: #FFF503A6;">Threads usage - multiple servers:</mark>

<mark style="background: #FFF503A6;">Example:</mark>
- Web servers replicated across multiple machines, where each server provides exactly the same set of Web documents.  
- When a request for a Web page comes in, the request is forwarded to one of the servers  
- When using a multithreaded client, connections may be set up to different server replicas - allowing data to be transferred in parallel, effectively establishing that the entire Web document is fully displayed in a much shorter time than with a nonreplicated server.  
- This approach is possible only if the client can handle parallel streams of incoming data 
- Threads are ideal for this purpose.

### <mark style="background: #FFF503A6;">Multi-threaded Servers</mark>

Threads are used for concurrent processing  

One thread per request  

For each new request start new thread to process request  

<mark style="background: #FFF503A6;">Pros:</mark> 
- New requests do not wait
- concurrently processed  

<mark style="background: #FFF503A6;">Cons:</mark> frequent creation (and deletion) of threads

### <mark style="background: #FFF503A6;">Thread Pools:</mark>

<mark style="background: #FFF503A6;">Thread Pool is used:</mark>
- <mark style="background: #FFF503A6;">Fixed thread pools:</mark> A pool of threads is created with N threads 
- One thread is <mark style="background: #FFF503A6;">dispatcher</mark>, others are <mark style="background: #FFF503A6;">worker</mark> threads  

For each incoming request, an idle worker thread is found and the request assigned  

Normally, if a thread is somehow terminated while it is still in use, it is automatically replaced with a new thread.  

Tasks are submitted to the pool via an internal queue, which holds extra tasks whenever there are more active tasks than threads.

<mark style="background: #FFF503A6;">Pros:</mark> Thread creation overhead for each request is avoided  

<mark style="background: #FFF503A6;">Cons:</mark>
- Correct pool size – how to choose it?  
- What if more than N (the pools size) requests arrive at the same time?

### <mark style="background: #FFF503A6;">Dynamic Thread Pools</mark>

Optimal size of thread pool depends on request rate  

<mark style="background: #FFF503A6;">Dynamic thread pool:</mark>
- The number of threads varies in pool based on workload  
- Different algorithms used to optimize pool size

### <mark style="background: #FFF503A6;">Multithreading - Overview:</mark>

| Model                   | Characteristics                       |
| ----------------------- | ------------------------------------- |
| Multithreading          | Parallelism, blocking system calls    |
| Single-threaded process | No parallelism, blocking system calls |

### <mark style="background: #FFF503A6;">Virtualisation</mark>

Having a single CPU and being able to pretend there are more.  

Allow us to build (pieces of) programs that appear to be executed simultaneously.  

Virtualisation deals with extending or replacing an existing interface to mimic the behaviour of another system  

<mark style="background: #FFF503A6;">Left figure:</mark> General organization between a program, interface, and system.  

<mark style="background: #FFF503A6;">Right figure:</mark> General organization of virtualizing system A on top of B.

![[Pasted image 20251002102348.png]]

### <mark style="background: #FFF503A6;">Containers</mark>

A special form of virtualisation - they do not need to replicate the whole OS again.  

Allow an application that works in one computer system to be able to work on a different one by including its libraries, binary files, and other dependencies.  

Allow different applications to run side-by-side – yet each uses its own environment of support software without even noticing that there be other applications with a different environment.  

Application layers of a container can be shared across multiple containers.  

Applications can be built as containerized microservices – distributed microservice architecture

### <mark style="background: #FFF503A6;">Example - PlanetLab:</mark>

Different organisations contribute machines, which they subsequently share for various experiments – closed down in 2020  

Collaborative distributed system in which different organisations each donated one or more computers, adding up to a hundreds of nodes. These computers formed a 1-tier server cluster, where access, processing, and storage could all take place on each node individually.  

<mark style="background: #FFF503A6;">Problem:</mark> How to ensure that different distributed applications do not get into each other’s way. Virtualisation and containers were used

### <mark style="background: #FFF503A6;">Example: Docker</mark>

Allows to build, share, and run containerized applications and microservices.  

Container-based technology where containers are running as processes in the user space of the operating system  

The containers running share the host OS kernel.  

https://www.docker.com/

### <mark style="background: #FFF503A6;">Container orchestration</mark>

Tasks required to deploy, run, and manage containers.  

Coordination and planning of all the containers  

<mark style="background: #FFF503A6;">Container orchestration systems:</mark>
- manage the deployment of containerised applications across multiple machines.  
- manage the lifecycle of containers, load balancing, scaling.

### <mark style="background: #FFF503A6;">Example: Kubernetes</mark>

Container orchestration tool for large-scale distributed systems.  

Open source system for automating deployment, scaling, and management of containerised applications.  

It groups containers that make up an application into logical units for easy management and discovery.  

Allow controls how and where containers will run.

### <mark style="background: #FFF503A6;">Example: EdgeNet</mark>  

<mark style="background: #FFF503A6;">Distributed edge cloud for Internet researchers:</mark> Uses Docker for containerisation and Kubernetes for deployment and node management.  

Distributed systems testbed  

Supports experiments deployed concurrently by independent groups - nodes are hosted by multiple institutions across the world.  

Similar to PlanetLab  

https://www.edge-net.org/

### <mark style="background: #FFF503A6;">Virtual Machines vs Containers</mark> 

<mark style="background: #FFF503A6;">Benchmarking difficult:</mark>
- Mainly looking at accessing disks and network I/O  
- Host operating system caches results in main memory, which means that when actually performing I/O operations, many subsequent operations are performed on in-memory data instead of data that is stored on disk.  

The differences between the two may often be close to negligible, even when looking at disk and network I/O.  

<mark style="background: #FFF503A6;">The overall conclusion:</mark> Virtual machines do impose more overhead in comparison to containers

### <mark style="background: #FFF503A6;">Summary:</mark>

Processes play a fundamental role in distributed systems as they form a basis for communication between different machines.  

Threads in distributed systems are useful to continue using the CPU when a blocking I/O operation is performed.  

It then becomes possible to build highly-efficient servers that run multiple threads in parallel, of which several may be blocking to wait until disk I/O or network communication completes.  

In general, threads are preferred over the use of processes when performance is at stake.

### <mark style="background: #FFF503A6;">Reference</mark>

Chapter 3: Maarten van Steen, Andrew S. Tanenbaum Distributed Systems, 4th edition (2023)  

Chapter 7: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, 5/E