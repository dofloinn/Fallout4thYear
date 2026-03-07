<mark style="background: #FFF503A6;">Overview:</mark>
- Inter Process Communication (IPC)  
- File Descriptors  
- Pipes  
- Pipes Example  
- Named Pipes (FIFO)

### <mark style="background: #FFF503A6;">IPC</mark>

Inter Process Communication (IPC)  

Facilitating communication between different processes.  

<mark style="background: #FFF503A6;">IPC can be offered between:</mark>  
- Related processes  
- Unrelated processes

### <mark style="background: #FFF503A6;">File Streams and File Descriptors</mark>  

<mark style="background: #FFF503A6;">If we need to perform file operations (IO) to a file, there are 2 options available:</mark> 
- Streams  
- File Descriptors  

Streams are represented as File * objects.  

File descriptors are represented as objects of type int.

### <mark style="background: #FFF503A6;">File Streams</mark>  

A stream offers a high level interface that is layered on top of the file descriptors.  

There are more features and functionality that comes with the stream interface for file IO.

### <mark style="background: #FFF503A6;">File Descriptors</mark> 

File descriptors offer a primitive low lever interface for IO operations.  

A file descriptor can connect to a file, a device (terminal), or a pipe or socket to communicate with another process.  

File descriptors should be used for IO with devices, and for nonblocking IO operations.

### <mark style="background: #FFF503A6;">fopen and fdopen</mark> 

The ``fopen()`` function opens the file whose name is the string pointed to by path and associates a stream with it.  

The ``fdopen()`` function associates a stream with the existing file descriptor, fd. The mode of the stream (one of the values "r", "r+", "w", "w+", "a", "a+") must be compatible with the mode of the file descriptor.

### <mark style="background: #FFF503A6;">fgetc</mark>

``fgetc()`` reads the next character from stream and returns it as an unsigned char cast to an int, or EOF on end of file or error.

### <mark style="background: #FFF503A6;">fstat</mark> 

``stat()`` retrieve information about the file pointed to by pathname; the differences for ``fstatat()`` are described below.  

``fstatat()`` is identical to ``stat()``, except that the file about which information is to be retrieved is specified by the file descriptor fd.

### <mark style="background: #FFF503A6;">What are Pipes</mark>  

A pipe allows processes to communicate with each other (Inter Process Communication - IPC)  

A process can write date to a pipe and this can be read by another process.  

The data passes to the pipe follows the FIFO algorithm.  

The pipe has no name.  

The pipe as created by a parent process and uses it to communicate with a child process.  

Pipe is one-way communication only i.e. we can use a pipe such that one process write to the pipe, and the other process reads from the pipe

### <mark style="background: #FFF503A6;">Pipe Syntax in C</mark>  

```C
int pipe(int fds[2]);
```  

<mark style="background: #FFF503A6;">Parameters:</mark>  

- ``fd[0]`` will be the fd(file descriptor) for the read end of pipe. 
- ``fd[1]`` will be the fd for the write end of pipe.
- <mark style="background: #FFF503A6;">Returns:</mark> 0 on Success. -1 on error.

### <mark style="background: #FFF503A6;">Simple Pipe Architecture Example</mark>

Where fd = file descriptor  

``fd[0]`` for reading  

``fd[1]`` for writing  

The pipe is implemented using kernel memory.  

A pipe is a channel with two ends

![[Pasted image 20260306112210.png]]

### <mark style="background: #FFF503A6;">Process forks</mark>

![[Pasted image 20260306112254.png]]

<mark style="background: #FFF503A6;">After a fork we have to decide in which direction the data should flow:</mark>  
- Parent to child  
- Child to parent

### <mark style="background: #FFF503A6;">Parent to Child</mark>

![[Pasted image 20260306112343.png]]

Parent must close ``fd[0]``  

Child must close ``fd[1]``

### <mark style="background: #FFF503A6;">Child to Parent</mark>

![[Pasted image 20260306112431.png]]

Parent must close ``fd[1]``  

Child must close ``fd[0]``

### <mark style="background: #FFF503A6;">Rules for closing pipes</mark> 

If we read from a pipe that was closed, the return should be 0  

If we write to a pipe with read closed on the other end, the SIGPIPE signal will be sent. This will need to be dealt with.

### <mark style="background: #FFF503A6;">Pipe Example</mark> 

See pipe-example-1.c  

We create a pipe using the command pipe(fd)  

We use the fork command to create a child, this communicates with the parent using the write (to pipe) command  

The parent reads from the pipe buffer

### <mark style="background: #FFF503A6;">Rules for closing pipes</mark>  

If we read from a pipe that was closed, the return should be 0  

If we write to a pipe with read closed on the other end, the ``SIGPIPE`` signal will be sent. This will need to be dealt with

### <mark style="background: #FFF503A6;">Pipe Example 2</mark> 

Create a C program to replicate the following:  
``ps aux | grep login``  

How can pipes be used to solve this problem?  

We will go through the solution next.

### <mark style="background: #FFF503A6;">Need dup library call</mark>  

The dup() system call creates a copy of a file descriptor.  

It uses the lowest-numbered unused descriptor for the new descriptor.  

If the copy is successfully created, then the original and copy file descriptors may be used interchangeably.  

They both refer to the same open file description and thus share file offset and file status flags.

### <mark style="background: #FFF503A6;">Pipes IPC Example </mark> 

two functions that will use the exec command to perform different tasks in the process.  

pid stores the process ID  

pipefd array stores the file descriptors.  

Start the program (main)  

Create a pipe and store the associated file descriptors in pipefd array  
  
```c
void exec1();  
void exec2();  

int main() {  
	int pipefd[2];  
	// Create a pipe
	  
	if (pipe(pipefd) == -1) {  
		perror("Error creating pipe");  
		exit(1);  
	}
	
	...
```

Fork to create a child process  

If the pid is 0, we are dealing with the child process. Call the exec1 function to get the child process to swap to a different task.  

Fork again to create a child process  

If the pid is 0, we are dealing with the child process. Call the exec2 function to get the child process to swap to a different task.  

```C
// Fork for "ps aux"  
pid_t pid = fork();  

if (pid == -1) {  
	perror("Error: fork");  
	exit(1);  
} else if (pid == 0) {  
	exec1(pipefd);  
}  
// Fork for "grep login"  
pid = fork();  

if (pid == -1) {  
	perror("Error: fork");  
	exit(1);  
} else if (pid == 0) {  
	exec2(pipefd);  
}
```

Close pipe descriptors in parent  

Wait for child processes to finish  

Return control to terminal

```C
// Close pipe descriptors in parent  
close(pipefd[0]);  
close(pipefd[1]);  

// Wait for child processes to finish  

for (int i = 0; i < 2; i++)  
{  
	wait(NULL);  
} 

return 0; // Return control to terminal  
}
```

```C
void exec1(int pipefd[2]) {  
	dup2(pipefd[1], 1); // Redirect stdout to pipe  
	close(pipefd[0]);  
	close(pipefd[1]);  
	execlp("ps", "ps", "aux", NULL);  
	perror("Error executing ps");  
	exit(1);  
}  

void exec2(int pipefd[2]) {  
	dup2(pipefd[0], 0); // Redirect stdin from pipe  
	close(pipefd[0]);  
	close(pipefd[1]);  
	execlp("grep", "grep", "login", NULL);  
	perror("Error executing grep");  
	exit(1);  
}
```

### <mark style="background: #FFF503A6;">Remarks on pipe-example-2.c</mark>

Pipes enable independent processes to communicate with each other, forming a pipeline of commands.  

fork creates new child processes that can execute different tasks concurrently.  

``dup2`` redirects file descriptors, allowing processes to read from or write to pipes instead of standard input and output.  

``execlp`` replaces the current process image with a new one, effectively executing the specified command.  

Closing unused pipe ends is crucial for proper resource management and preventing deadlocks.  

Using wait ensures that child processes finish before the parent terminates, preventing zombie processes.

### <mark style="background: #FFF503A6;">Additional Resources on dup2</mark> 

- https://www.youtube.com/watch?v=EqndHT606Tw  
- https://www.youtube.com/watch?v=PIb2aShU_H4

### <mark style="background: #FFF503A6;">Pipes – Making Life Easier</mark>

The ``popen()`` function can be used to automate the creation of the pipe and the forking process.  

```C
fp = popen("ls *", "r");
```  

``popen()`` will set the file descriptors to facilitate the communication between parent and child or child and parent as required.

<mark style="background: #FFF503A6;">popen():</mark>
1. Setup Pipes  
2. Fork()  
3. Child process runs ls * command and returns results to parent  
4. Parent reads with fgets and displays with printf  

```C
#include <stdio.h>

int main() {  
	FILE *fp;  
	int status;  
	char path[1024]; 
	 
	fp = popen("ls *", "r"); 
	 
	while (fgets(path, 1024, fp) != NULL)  
		printf("%s", path);  
	
	status = pclose(fp);  
}
```  

See mypopen.c

### <mark style="background: #FFF503A6;">Named Pipes - FIFO</mark>

A FIFO special file sends data from one process to another so that the receiving process reads the data first-in-first-out (FIFO)  

A FIFO special file is also called a named pipe, or a FIFO  

A named pipe operates like a normal pipe  

The main difference is the named pipe exists as a special file  

The special file is a FIFO file, and doesn't contain any user info  

A FIFO special file can also be shared by a number of processes that were not created by forks.

### <mark style="background: #FFF503A6;">FIFO file for a Named Pipe</mark>  

A named pipe operates like a file  

<mark style="background: #FFF503A6;">We can use the standard file IO system calls to operate a named pipe:</mark>  
- ``int open(const char *pathname, int flags);``  
- ``int read(int fd, void *buf, size_t count);``  
- ``int write(int fd, const void *buf, size_t count);``  
- ``int close(fd);``

### <mark style="background: #FFF503A6;">FIFO Named Pipe using mkfifo:</mark>  

The mkfifo function can be used to create a FIFO file.  
```C
mkfifo(fifoFile, 0666);
```  

Use read and write operations to send information between processes.  

The processes don’t need to be related (ancestors)  

Unlink can be called to remove the file. 
```C
unlink(fifoFile);
```

### <mark style="background: #FFF503A6;">FIFO Named Pipe Example</mark>

Copy the files named-pipes-writeread.c and named-pipes - readwrite.c and compile them in your local directory.  

After you compile both files, open up two terminals side by side.  

See we can communicate between the processes by using a FIFO

![[Pasted image 20260306114410.png]]

### <mark style="background: #FFF503A6;">What file type is it?</mark> 

List the contents of the directory using ls –l  

Note the ’p’ to indicate that it’s a pipe file.  

```shell
ls -l myfifo  
prw-rw-r-- 1 sdo sdo 0 Feb 18 17:21 myfifo
```
