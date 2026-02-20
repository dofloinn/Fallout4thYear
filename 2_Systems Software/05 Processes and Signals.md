<mark style="background: #FFF503A6;">Overview</mark>
- Basics of Processes
- System Calls
- Exec and Fork
- Signals and Interrupts

### <mark style="background: #FFF503A6;">Processes</mark> 

The running instance of a program is called a process.  

Multiple processes can be used to perform multiple tasks concurrently.  

This can make use of existing programs in the system environment.  

Programmers can make use of this functionality when writing programs

### <mark style="background: #FFF503A6;">Processes in Linux</mark>

In a Linux environment, the functions that are used to manipulate processes are found in the unistd.h header file. 

Have a look at the following for more details: http://pubs.opengroup.org/onlinepubs/7908799/xsh/unistd.h.html

### <mark style="background: #FFF503A6;">Process Ids</mark>

Every process that is running in a Linux environment must be <mark style="background: #FFF503A6;">uniquely identifiable</mark>. Why??  

A <mark style="background: #FFF503A6;">process ID</mark> is used as the unique identifier for a process.  

The process IDs are <mark style="background: #FFF503A6;">16 bit numbers</mark> and are assigned <mark style="background: #FFF503A6;">sequentially</mark> as processes are spawned.  

Every process has a parent, this can be thought of as a tree structure, where the <mark style="background: #FFF503A6;">init process</mark> is root.

The ps command can be used to get the processes that are running on the current system

### <mark style="background: #FFF503A6;">Terminating a Process</mark> 

The kill command is used to kill a process.  

The kill command sends a ``SIGTERM`` signal to the process.  

Other signals can be sent to a process, we will see this later in the slides.

### <mark style="background: #FFF503A6;">Kill Example</mark> 

Open a calculator  

Use the PS command with pgrep to find the process  

Kill the process with: kill 1896 (if 1896 is the process id)

### <mark style="background: #FFF503A6;">System Calls</mark> 

The system call is the fundamental interface between an application and the Linux kernel.  

The following link contains a comprehensive list of system calls: http://man7.org/linux/man-pages/man2/syscalls.2.html

### <mark style="background: #FFF503A6;">Creating a process</mark> 

In Linux there are two main ways to start a process in a C program:  
- System
- Fork and Exec  

There are some overheads associated with using system, so the preferred option should be fork and exec. There are also some security concerns associated with using system.

### <mark style="background: #FFF503A6;">System</mark>

The system function is part of the ``stdlib.h`` library.  

System allows a C program to run a command (similar to one you would run in a terminal window)  

E.g.  
```C
#include <stdlib.h>  

int main() {  
	return system("ls -la");  
}
```

### <mark style="background: #FFF503A6;">Fork</mark>

The fork command can be used to make a <mark style="background: #FFF503A6;">duplicate</mark> copy of its parent process.  

Fork will duplicate a process. The duplicate is referred to as the <mark style="background: #FFF503A6;">child process</mark>.  

Both processes continue executing from the point the programs forked.  

Both have separate and <mark style="background: #FFF503A6;">unique process IDs</mark>.

### <mark style="background: #FFF503A6;">Fork Example</mark>

```C
#include<stdio.h>  
#include<unistd.h>  

int main(int argc, char **argv)  
{  
	printf("Start\n");  
	pid_t pid = fork();  
	printf("\nMy PID is: %d", pid);  
	if (pid == 0)  
	{  
		printf("\nHello from the child process!!\n\n\n");  
	}  
	else if (pid > 0)  
	{  
		printf("\nHello from the parent process!!\n\n\n");  
	}  
	else  
	{  
		printf("Something went wrong!!");  
		return 1;  
	}  
	printf("End");  
	return 0;  
}
```

The returned process ID is of type ``pid_t``  

The fork command will return the pid. The parent will have a ``pid > 0`` and the child will have a pid of 0.  

To get the real pid for the child process use the ``getpid()`` function.

### <mark style="background: #FFF503A6;">exec</mark>

The exec function can be used to replace a program instance currently running in a process.  

When the exec function is called the current process stops and a new program starts executing  

Can be useful to pass over restricted access to executable to original pid with restricted access or to keep pids clean without a hanging parent.  

In shell scripts, it tells the interpreter to replace itself with the program it runs.  

Should only be run at the end of a shell script since nothing will run afterwards.  

Saves a pid and about 1ms of CPU time.

See man exec  

<mark style="background: #FFF503A6;">xecvp and execlp:</mark> Take a program name, doesn’t require full page name  

<mark style="background: #FFF503A6;">execv, execvp, execve:</mark> Accept an argument list for the new program (null terminated array)  

<mark style="background: #FFF503A6;">execve and execle:</mark> Accept an array of null terminated environmental values

### <mark style="background: #FFF503A6;">Exec example</mark>

  
```C
#include <stdio.h>  
#include <stdlib.h>  
#include <unistd.h> /* for fork */  
#include <sys/types.h> /* for pid_t */  
#include <sys/wait.h> /* for wait */  

int{  
	main()  
		char *argv[]={"echo","Echo is running now....",NULL};  
		//argv[0] is the command to run: echo  
		//argv[1] text to be echoed  
		//argv[2] null, needed!!  
		execv("/bin/echo",argv);  
		printf("Im the last thing in this program to output!!");  
		return  
}
```

See execExample.c

### <mark style="background: #FFF503A6;">Using fork and exec together</mark> 
  
```C
#include <stdio.h>  
#include <stdlib.h>  
#include <unistd.h> /* for fork */  
#include <sys/types.h> /* for pid_t */  
#include <sys/wait.h> /* for wait */  

int main()  
{ /*Spawn a child to run the program.*/  
	pid_t pid=fork();  
	if (pid==0) { /* child process */  
		char *argv[]={"echo","Echo is running now....",NULL};  
		sleep(15);  
		execv("/bin/echo",argv);  
		exit(127); /* only if execv fails */  
	}  
	else  
	{ /* pid!=0; parent process */  
		printf("The parent keeps doing whats its doign!!");  
		sleep(3);  
	}  
	return 0;  
}  
```

See execExample-2.c  

Here we fork the program and get exec to run a different process in the fork.  

What do you think happens when we run this?

### <mark style="background: #FFF503A6;">Signals</mark>  

A signal is a software interrupt  

A program needs to be able to handle software interrupts.

A signal can be used to send an asynchronous message to a program.  

Depending on the signal that was sent the program can decide how to proceed.

### <mark style="background: #FFF503A6;">Signals in Linux</mark>

In Linux there are a pre-defined set of Signals that perform specific tasks.  

```shell
kill -l
```

![[Pasted image 20260213093333.png]]

### <mark style="background: #FFF503A6;">Signal Description</mark>

man 7 signal

![[Pasted image 20260213093421.png]]

### <mark style="background: #FFF503A6;">Signals in Linux</mark> 

When a signal is received, the process needs to tell the kernel how to proceed.  

<mark style="background: #FFF503A6;">Potentially, there are 3 possible options:</mark>  
- Ignore the signal  
- Catch the signal  
- Go with the signal default  

Note: The specific signals for kill cannot be ignored or caught (Sigkill and Sigstop). Why? If the kernel or an administrator need to stop a process they should be able to do so.  

The header file that offers signal functionality is ``signal.h``

### <mark style="background: #FFF503A6;">Signal Example</mark> 

```C
#include<stdio.h>  
#include<signal.h>  
#include<unistd.h>  

void sig_handler(int sigNum)  
{  
	if (sigNum == SIGINT)  
		printf("SIGINT Interrupt Received\n");  
	}  

	int main(void)  
	{  
		if (signal(SIGINT, sig_handler) == SIG_ERR) 
		{  
			printf("\nSomething went wrong!!\n");  
		}  
		// Infinite Loop  
		while(1) 
		{  
			sleep(1);  
		}  
	return 0;  
}
``` 

See ``signal.c``  

Compile and run this code  

What do you expect to see when you try and terminate with Ctrl-C?  

Open a second terminal and look for the process using  

```C
ps –aux | grep a.out
```  

Try ``kill <pid>``  

Note that ``kill –n <pid>`` gives increasingly aggressive kill signals

