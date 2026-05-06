<mark style="background: #FFF503A6;">Overview:</mark>
- Threading  
- Synchronisation and Concurrency  
- POSIX Threading  
- Thread Example  
- Mutex file locking  
- Locking Example

### <mark style="background: #FFF503A6;">Introduction to Threading</mark>

A thread is a unit of execution within a process.  

Lightweight process that shares the same memory and resources as the main process, but it can execute instructions independently.  

The programs that we have seen to date all ran in a single thread.  

If we are dealing with a large problem, this can be sub-divided into smaller parts and executed in different threads concurrently. This is known as multithreading.  

A <mark style="background: #FFF503A6;">multi-threaded</mark> program has more than one point of execution  

Share the same address space and thus can access the same data.

The state of a single thread is similar to that of a process.  

Program counter (PC) tracks where program fetches instructions from.  

Each thread has its own private set of registers it uses for computation.  

If there are two threads that are running on a single processor; when switching from running one (T1) to running the other (T2), a <mark style="background: #FFF503A6;">context switch</mark> must take place.  

The context switch between threads is similar to the context switch between processes, as the register state of T1 must be saved and the register state of T2 restored before running T2. (With processes, you save state to a <mark style="background: #FFF503A6;">process control block (PCB)</mark>.)  

Require one or more <mark style="background: #FFF503A6;">thread control blocks (TCBs)</mark> to store the state of each thread of a process.

### <mark style="background: #FFF503A6;">Why Use Threads?</mark>

<mark style="background: #FFF503A6;">There are two main reasons why you should use threads:</mark>
- Parallelism  
- To Avoid Blocking

### <mark style="background: #FFF503A6;">Parallelism</mark>

Suppose a program that performs operations on very large arrays, for example, adding two large arrays together.  

If you are running on just a single processor, the task is straightforward: just perform each operation and be done.  

However, if you are executing the program on a system with multiple processors, you have the potential of speeding up this process considerably by using multiple processors to perform the work.  

The task of transforming your standard single-threaded program into a program that does this sort of work on multiple CPUs is called parallelization, and using a thread per CPU to do this work is a natural and typical way to make programs run faster on modern hardware.

### <mark style="background: #FFF503A6;">To Avoid Blocking</mark>

The second reason is to avoid blocking program progress due to slow I/O.  

Suppose a program that performs different types of I/O: either waiting to send or receive a message, for an explicit disk I/O to complete.  

Instead of waiting, your program may wish to do something else, including utilizing the CPU to perform computation or even issuing further I/O requests.  

Using threads is a natural way to avoid getting stuck; while one thread in your program waits (i.e., is blocked waiting for I/O)  

The CPU scheduler can switch to other threads, which are ready to run and do something useful.  

Threading enables overlap of I/O with other activities within a single program, much like <mark style="background: #FFF503A6;">multiprogramming</mark> did for processes across programs; as a result, many modern server-based applications (web servers, database management systems, and the like) make use of threads in their implementations.

### <mark style="background: #FFF503A6;">Threading in C</mark>

C programming has multithreading support.  

A multithreaded program contains two or more parts that will run concurrently in separate threads.  

Each thread has a separate path of execution.  

Multithreading could be described as multitasking.

### <mark style="background: #FFF503A6;">Types of Multitasking</mark>

<mark style="background: #FFF503A6;">Two main types of multitasking:</mark>
- Process Based 
- Thread Based  

Process based multitasking allows a computer to run multiple applications at the same time (eg. Word and PowerPoint etc..)  

Thread based multitasking allows a C program to perform two or more tasks at once. This can make good use of the hardware the program is running on (eg. multicore CPU).

### <mark style="background: #FFF503A6;">User Threads</mark>

User level threads are mostly at the application level where an application creates these threads to sustain its execution in the main memory.  

User threads work in isolation with kernel threads.  

These are easier to create since they do not have to refer to any registers and context switching is much faster than at kernel level thread.  

User level threads, mostly can cause changes at the application level and has no impact on kernel threads.

### <mark style="background: #FFF503A6;">Kernel Threads</mark> 

Kernel threads are mostly independent of the ongoing user-level processes and are executed by the operating system.  

Kernel threads are used by the Operating System for management tasks etc  

Kernel threads are more expensive to create and manage - context switching.  

Most of the kernel level threads can generally not be pre-empted (interrupted) by the user level threads.

### <mark style="background: #FFF503A6;">Multithreading Fundamentals</mark>

![[Pasted image 20260321124427.png]]
![[Pasted image 20260321124443.png]]

### <mark style="background: #FFF503A6;">POSIX threads - pthreads</mark>

Linux Programmer's Manual

```
PTHREADS(7)  
NAME  
	pthreads - POSIX threads  

DESCRIPTION
```  

POSIX.1 specifies a set of interfaces (functions, header files) for threaded programming commonly known as POSIX threads, or Pthreads.  

A single process can contain multiple threads, all of which are executing the same program.  

These threads share the same global memory (data and heap segments), but each thread has its own stack (automatic variables).  

pthreads are kernel threads implemented as lightweight processes

### <mark style="background: #FFF503A6;">Shared attributes within a process</mark>  

<mark style="background: #FFF503A6;">POSIX.1 also requires that threads share a range of attributes (process-wide rather per-thread):</mark> 
- process ID  
- parent process ID  
- process group ID and session ID  
- controlling terminal  
- user and group IDs  
- open file descriptors  
- record locks (see fcntl(2))  
- signal dispositions  
- file mode creation mask (umask(2))  
- current directory (chdir(2)) and root directory (chroot(2))  
- interval timers (setitimer(2)) and POSIX timers (timer_create(2))  
- nice value (setpriority(2))  
- resource limits (setrlimit(2))  

Not shared: measurements of the consumption of CPU time (times(2)) and resources (getrusage(2))

### <mark style="background: #FFF503A6;">Thread Primitives</mark>  

<table>
	<tr>
		<td>Process Primitive</td>
		<td>Thread Primitive</td>
		<td>Description</td>
	</tr>
	<tr>
		<td>fork</td>
		<td>pthread_create</td>
		<td>Create a new flow of control</td>
	</tr>
	<tr>
		<td>waitpid</td>
		<td>pthread_join</td>
		<td>Get exit status</td>
	</tr>
	<tr>
		<td>exit</td>
		<td>pthread_exit</td>
		<td>Exit current code execution</td>
	</tr>
	<tr>
		<td>getpid</td>
		<td>pthread_self</td>
		<td>Get ID</td>
	</tr>
	<tr>
		<td>abort</td>
		<td>pthread_cancel</td>
		<td>Request abort of execution</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Introduction to the Thread API</mark>

The following slides cover the main portions of the thread API.  

The crux of these APIs that we will investigate are how we create and control threads.

### <mark style="background: #FFF503A6;">mypthreads.c</mark>

```C
#include <stdio.h>  
#include <stdlib.h>  
#include <unistd.h>  
#include <pthread.h>  
#include <sys/types.h>  
#include <sys/wait.h>  

void *thread_function(void *arg) {  
	printf("Thread ID (pthread_self): %lu\n", pthread_self());  
	sleep(1); // Simulate some work  
	printf("Thread exiting...\n");  
	pthread_exit((void *)42); // Return value  
}  

int main() {  
	pid_t child_pid;  
	pthread_t thread; 
	 
	printf("Main process ID (getpid): %d\n", getpid());

	// **pthread_create** example  
	int ret = pthread_create(&thread, NULL, thread_function, NULL);  
	if (ret != 0) {  
		perror("pthread_create failed");  
		exit(1);  
	}  
// **pthread_join** example (wait for thread to finish)  
	void *thread_result;  
	ret = pthread_join(thread, &thread_result);  
	if (ret != 0) {  
		perror("pthread_join failed");  
		exit(1);  
	}  
	printf("Thread joined, return value: %ld\n", (long)thread_result);  
	//pthread_cancel(thread); // Not used  
	printf("Main process exiting...\n");  
	exit(0);  
}
```

### <mark style="background: #FFF503A6;">Creating a thread</mark>

The first thing you have to be able to do to write a multi-threaded program is to create new threads, and thus some kind of thread creation interface must exist.  

In POSIX, a thead is is created and starts using the function pthread_create().  

It takes four parameters:

<table>
	<tr>
		<td>Name</td>
		<td>Type</td>
		<td>Description</td>
	</tr>
	<tr>
		<td>ID</td>
		<td>pthread_t *</td>
		<td>Reference (or pointer) to the ID of the thread.</td>
	</tr>
	<tr>
		<td>Attributes</td>
		<td>pthread_attr_t *</td>
		<td>Used to set the attributes of a thread(e.g., the stack size, scheduling policy, etc.) Passing NULL suffices for most applications.</td>
	</tr>
	<tr>
		<td>Starting routine</td>
		<td>void *</td>
		<td>The name of the function that the thread starts to execute. If the function’s return type is void *, then its name is simply written; otherwise, it has to be type-cast to void *.</td>
	</tr>
	<tr>
		<td>Arguments</td>
		<td>void *</td>
		<td>This is the argument that the starting routine takes. If it takes multiple arguments, a struct is used.</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Creating a thread</mark> 

```C
pthread_create(&id[0], NULL, printNumber, &arg);
```  

E.g. ``int ret = pthread_create(&thread, NULL, thread_function, NULL);``

### <mark style="background: #FFF503A6;">Thread Join – Waiting for a thread to complete</mark>  

What happens when we want to wait for a thread to complete?  

In this case, a parent thread is made to wait for a child thread using ``pthread_join()``.  

The two parameters of this function are:  
  
<table>
	<tr>
		<td>Name</td>
		<td>Type</td>
		<td>Description</td>
	</tr>
	<tr>
		<td>Thread ID</td>
		<td>pthread_t</td>
		<td>The ID of the thread that the parent thread waits for.</td>
	</tr>
	<tr>
		<td>Reference to return</td>
		<td>value void **</td>
		<td>The value returned by the exiting thread is caught by this pointer</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Thread Join</mark>

```C
int* ptr;  
pthread_join(id, &ptr);
```

### <mark style="background: #FFF503A6;">Thread Termination</mark> 

<mark style="background: #FFF503A6;">There are three options for a thread to terminate:</mark>
- The thread can return from the start routine. This can return the threads exit code.  
- The thread can be stopped by another thread in the same pool/process.  
- The thread can call ``pthread_exit()``

``pthread_exit()`` is used to exit a thread. This function is usually written at the end of the <mark style="background: #FFF503A6;">starting routine</mark>.  

If a value is returned by a thread upon ending, its reference is passed as an argument.  

Since a thread’s local variables are destroyed when they exit, <mark style="background: #FFF503A6;">only</mark> references to global or dynamic variables are returned.

### <mark style="background: #FFF503A6;">Thread Termination</mark>

```C
// Global variable:  
int i = 1;  
// Starting routine:  
void* foo(void* p){  
	int i = *(int*) p;  
	printf("Received value: %i", i);  
	// Return reference to global variable:  
	pthread_exit(&i);  
}
```

### <mark style="background: #FFF503A6;">Second Thread Example</mark>

C program to demonstrate three threads running concurrently  

See thread1.c  

Linking with pthread may be necessary [-lpthread]

### <mark style="background: #FFF503A6;">Program Output</mark>  
```shell
./a.out  
Hello From Thread 3  
Goodbye From Thread 3  
Hello From Thread 2  
Goodbye From Thread 2  
Hello from Thread 1  
Goodbye From Thread 1
```

### <mark style="background: #FFF503A6;">Non-deterministic behaviour</mark>

```shell
./a.out  
Hello from Thread 1  
Goodbye From Thread 1  
Hello From Thread 3  
Goodbye From Thread 3  
Hello From Thread 2  
Goodbye From Thread 2
```

### <mark style="background: #FFF503A6;">Like a function call</mark>

As you seen in example on previous slide, one way to think about the thread is that it is a bit like making a function call.  

However, instead of first executing the function and then returning to the caller, the system instead creates a new thread of execution for the routine that is being called.  

The routine runs independently of the caller, perhaps before returning from the create, but perhaps much later.  

What runs next is determined by the OS scheduler, and although the scheduler likely implements some sensible algorithm, it is hard to know what will run at any given moment in time.  

Outputs are not deterministic.

<mark style="background: #FFF503A6;">Thread use requires some care:</mark> As you also might be able to tell from this example, threads can make life complicated: e.g. non-concurrency.

### <mark style="background: #FFF503A6;">Thread Synchronisation</mark>

If a program is using more than one thread, the threads may be sharing the same resources which can lead to inconsistencies in the program.  

See ``threadasync.c`` for disastrous behaviour

### <mark style="background: #FFF503A6;">threadasync.c</mark>

```C
#include <stdio.h>  
#include <stdlib.h>  
#include <pthread.h>  

int counter = 0; // Shared resource  

void* increment(void* arg) {  
	for (int i = 0; i < 1000000; i++)  
		counter++; // Increment counter (shared resource)  
	return NULL;  
}  

int main() {  
	pthread_t thread1, thread2; // Create two threads  
	pthread_create(&thread1, NULL, increment, NULL);  
	pthread_create(&thread2, NULL, increment, NULL);  
	pthread_join(thread1, NULL); // Wait for both threads to finish  
	pthread_join(thread2, NULL);  
	printf("Final counter value: %d [Should be 2000000]\n", counter);  
	return 0;  
}
```

<mark style="background: #FFF503A6;">Problem:</mark> 
```shell
Final counter value: 1262171 [Should be 2000000]  
Final counter value: 1009841 [Should be 2000000]  
Final counter value: 1011191 [Should be 2000000]  
Final counter value: 1152326 [Should be 2000000]  
Final counter value: 1080933 [Should be 2000000]  
Final counter value: 1008048 [Should be 2000000]  
Final counter value: 1052204 [Should be 2000000]  
Final counter value: 1342317 [Should be 2000000]  
Final counter value: 1244293 [Should be 2000000]
```

### <mark style="background: #FFF503A6;">The heart of the problem – Uncontrolled Scheduling:</mark>  

Imagine one of the two threads (Thread 1) is about to increment counter by one. It loads the value of counter (let’s say it’s 50, to begin with) into its register ie eax. Thus, eax=50 for Thread 1.  

Then it adds one to the register; thus eax=51.  

Next suppose a timer interrupt goes off.  

Thus, the OS saves the state of the currently running thread (its PC, its registers including eax, etc.) to the thread’s TCB.

Next, Thread 2 is chosen to run, and it enters this same piece of code.  

It also executes the first instruction, getting the value of counter and putting it into its eax (remember: each thread when running has its own private registers).  

The value of counter is still 50 at this point, and thus Thread 2 has eax=50.  

Thread 2 increments eax by 1 (thus eax=51), and then saves the value of eax register (51) into global variable.  

Thus, the global variable counter now has the value 51.

Finally, another context switch occurs, and Thread 1 resumes running.  

Recall that it had just executed the mov and add, and is now about to perform the final instruction.  

Recall also that eax=51. Thus, the final instruction executes, and saves the value to memory; the counter is set to 51 again.

The code to increment counter has been run twice, but counter, which started at 50, is now only equal to 51.  

A “correct” version of this program should have resulted in the variable counter equal to 52.

### <mark style="background: #FFF503A6;">Race Condition</mark> 

This is called a <mark style="background: #FFF503A6;">race condition</mark> (or, more specifically, a <mark style="background: #FFF503A6;">data race</mark>).  

The results depend on the timing execution of the code.  

Sometimes (i.e., when context switches that occur at untimely points in the execution), the wrong result occurs.  
This may yield a different result each time; thus, instead of a nice <mark style="background: #FFF503A6;">deterministic</mark> computation (which you are used to from computers), you call this result <mark style="background: #FFF503A6;">indeterminate</mark>.  

Because multiple threads executing this code can result in a race condition, this code is called a <mark style="background: #FFF503A6;">critical section</mark>.

### <mark style="background: #FFF503A6;">How do we fix this?</mark>

What you really want for this code is what is called mutual exclusion.  

This property guarantees that if one thread is executing within the critical section, the others will be prevented from doing so.  

Virtually all of these terms, by the way, were coined by Edsger Dijkstra, who was a pioneer in the field and indeed won the Turing Award because of this and other work.  

See his 1968 paper on “Cooperating Sequential Processes” for a clear description of the problem.

### <mark style="background: #FFF503A6;">Introduction to Locks</mark>

We have seen that we need to protect critical sections.  

We do this using locks.  

In particular, we annotate source code with locks, putting them around critical sections, and thus ensure that any such critical section executes as if it were a single atomic instruction

### <mark style="background: #FFF503A6;">Solution: mutex</mark>

A mutex, short for Mutual Exclusion, is a synchronisation primitive used in multithreaded programming. It acts as a lock to ensure that only one thread can access a shared resource at a time.  

This prevents race conditions and data inconsistencies that can occur when multiple threads try to modify the same data concurrently.

### <mark style="background: #FFF503A6;">Locks: The Basic Idea</mark>

As an example, assume some critical section looks like this, the canonical update of a shared variable:  
``balance = balance + 1;``  

To use a lock, you add some code around the critical section like this:  
```C
lock_t mutex; // some globally-allocated lock ’mutex’  
lock(&mutex);  
balance = balance + 1;  
unlock(&mutex);
```

A lock is just a variable, and thus to use one, you must declare a lock variable of some kind (such as mutex above).  

This lock variable (or just “lock” for short) holds the state of the lock at any instant in time.  

It is either <mark style="background: #FFF503A6;">available</mark> (or <mark style="background: #FFF503A6;">unlocked</mark> or <mark style="background: #FFF503A6;">free</mark>) and thus no thread holds the lock, or <mark style="background: #FFF503A6;">acquired</mark> (or <mark style="background: #FFF503A6;">locked</mark> or <mark style="background: #FFF503A6;">held</mark>), and thus exactly one thread holds the lock and presumably is in a critical section.  

You could store other information in the data type as well, such as which thread holds the lock, or a queue for ordering lock acquisition, but information like that is hidden from the user of the lock.

### <mark style="background: #FFF503A6;">Locks: Semantics</mark>

The semantics of the lock() and unlock() routines are simple.  

Calling the routine lock() tries to acquire the lock; if no other thread holds the lock (i.e., it is free), the thread will acquire the lock and enter the critical section.  

This thread is sometimes said to be the <mark style="background: #FFF503A6;">owner</mark> of the lock. 

If another thread then calls lock() on that same lock variable (mutex in this example), it will not return while the lock is held by another thread; in this way, other threads are prevented from entering the critical section while the first thread that holds the lock is in there.

Once the owner of the lock calls unlock(), the lock is now available (free) again.  

If no other threads are waiting for the lock (i.e., no other thread has called lock() and is stuck therein), the state of the lock is simply changed to free.  

If there are waiting threads (stuck in lock()), one of them will (eventually) notice (or be informed of) this change of the lock’s state, acquire the lock, and enter the critical section.

Locks provide some minimal amount of control over scheduling to programmers.  

In general, threads are viewed as entities created by the programmer but scheduled by the OS, in any fashion that the OS chooses.  

Locks yield some of that control back to the programmer; by putting a lock around a section of code, the programmer can guarantee that no more than a single thread can ever be active within that code.  

Thus locks help transform the chaos that is traditional OS scheduling into a more controlled activity.

### <mark style="background: #FFF503A6;">Pthread Locks</mark>

Beyond thread creation and join, probably the next most useful set of functions provided by the POSIX threads library are those for providing mutual exclusion to a critical section via <mark style="background: #FFF503A6;">locks</mark>.  

<mark style="background: #FFF503A6;">The most basic pair of routines to use for this purpose is provided by the following:</mark>
```C
int pthread_mutex_lock(pthread_mutex_t *mutex);
int pthread_mutex_unlock(pthread_mutex_t *mutex);
```

### <mark style="background: #FFF503A6;">Lock and unlock routines</mark>

The routines should be easy to understand and use. When you have a region of code that is a critical section and thus needs to be protected to ensure correct operation, locks are quite useful.  

If no other thread holds the lock when ``pthread_mutex_lock()`` is called, the thread will acquire the lock and enter the critical section.  

If another thread does indeed hold the lock, the thread trying to grab the lock will not return from the call until it has acquired the lock (implying that the thread holding the lock has released it via the unlock call).  

Of course, many threads may be stuck waiting inside the lock acquisition function at a given time; only the thread with the lock acquired, however, should call unlock.  

```C
pthread_mutex_t lock;  
pthread_mutex_lock(&lock);  
x = x + 1; // or whatever your critical section is pthread_mutex_unlock(&lock);
```

### <mark style="background: #FFF503A6;">threadsync.c</mark>

```C
#include <stdio.h>  
#include <stdlib.h>  
#include <pthread.h>  

int counter = 0; // Shared resource  
// Mutex for synchronization  
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;  

void* increment(void* arg) {  
	for (int i = 0; i < 1000000; i++) {  
		// Lock the mutex before accessing the shared resource  
		pthread_mutex_lock(&mutex);  
		counter++; // Increment counter  
		// Unlock the mutex after accessing the shared resource  
		pthread_mutex_unlock(&mutex);  
	}  
	return NULL;  
}

int main() {  
	pthread_t thread1, thread2;  
	// Create two threads  
	pthread_create(&thread1, NULL, increment, NULL);  
	pthread_create(&thread2, NULL, increment, NULL);  
	// Wait for both threads to finish  
	pthread_join(thread1, NULL);  
	pthread_join(thread2, NULL);  
	printf("Final counter value: %d [Should be 2000000]\n", counter);  
	// Destroy the mutex after use  
	pthread_mutex_destroy(&mutex);  
	return 0;  
}
```

### <mark style="background: #FFF503A6;">Deterministic output</mark> 

```shell
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]
```

