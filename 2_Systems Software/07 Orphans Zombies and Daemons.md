<mark style="background: #FFF503A6;">Overview:</mark>
- Orphan Processes  
- Zombie Processes  
- Daemons  
- Steps to create a daemon  
- Init, Upstart and systemd  
- Required Reading

### <mark style="background: #FFF503A6;">Process Groups</mark>

Every process running is part of a unique process group (PGID)  

When a process is created, it becomes a member of the group its parent is in.  

The first process member in the group sets the PGID to be equal to its PID.  

The first member in the group is referred to as the Group Leader  

A process group is a group of related process which may be collectively running in the foreground

### <mark style="background: #FFF503A6;">Process Groups – System Calls</mark> 

Useful Process Group commands (see man for more details)  
- ``getpgrp()``  
- ``getpgid(0)``  
- ``getpgid(PID)``  

<mark style="background: #FFF503A6;">Shell Commands:</mark> To list the PGID with the ps command use the –j flag

### <mark style="background: #FFF503A6;">Session and Session Groups</mark> 

A session group is a collection of process groups, often linked to a terminal, with one process group taking input at a time (foreground).  

All processes are grouped by sessions  

Try: ``ps axo pid,ppid,pgid,sid | sort –k 4n``  

These are linked to types of groups, eg. A user logs in, all processes the user has running are in its Session Group.  

When a user logs out, the kernel will terminate all processes in the users session group.  

The session's ID is the same as the pid of the process that created the session through the ``setsid()`` system call.  

This session is referred to as the Session Leader.  

The ``setsid()`` system call takes no parameters and will return the new session id.

### <mark style="background: #FFF503A6;">Controlling Terminal</mark>

Every session is associated with a terminal  

Processes in the session get Input and Output from the terminal  

A session is linked to a terminal (this is called the Controlling Terminal or Controlling tty)  

A terminal can be the controlling terminal for only one session at a time.  

An individual process disconnects from its controlling terminal when it calls ``setsid`` to become the leader of a new session

One of the attributes of a process is its controlling terminal.  

Child processes created with fork inherit the controlling terminal from their parent process.  

In this way, all the processes in a session inherit the controlling terminal from the session leader.  

A session leader that has control of a terminal is called the controlling process of that terminal.  

Try ``example_setsid.c``  

An individual process disconnects from its controlling terminal when it calls ``setsid`` to become the leader of a new session  

<mark style="background: #FFF503A6;">Source:</mark> https://www.gnu.org/software/libc/manual/html_node/Controlling-Terminal.html

### <mark style="background: #FFF503A6;">File Descriptor</mark>

Each time a file is opened, the OS creates a record to represent the file.  

This information is stored in the system kernel.  

An integer value is assigned to each record/entry.  

This integer value is the file descriptor. If a process has opened 5 files, there will be 5 file descriptors associated with the process.  

See example_filed.c [Note std i/o/err may occupy 0/1/2]

### <mark style="background: #FFF503A6;">Orphan Processes</mark>

An orphan process is a process whose parent has terminated.  

The orphan will default back to init as its parent (PPID of 1).  

<mark style="background: #FFF503A6;">The orphan will continue to run until it is killed:</mark> 
- Kill -9 PID  
- Where PID is the process ID of the orphan

### <mark style="background: #FFF503A6;">Orphan Processes Example</mark>  

Trial ``example_orphan.c``  

Note when running that the parent terminates after 5 seconds and the child is orphaned  

Orphans are adopted by init (pid=1), or system –user if managing user services in a user session  

Need to kill the orphan

### <mark style="background: #FFF503A6;">Zombie Processes</mark> 

When a process terminates, it isn't removes straight away from memory.  

The process status becomes ``EXIT_ZOMBIE`` and its parent is notified via ``SIGCHLD`` signal.  

The parent should execute the wait() system call to read the child processes exit status.  

Once the parent has processed this information from the child, the terminated process can be removed from memory.  

If the parent is unable to process this information the child process becomes a Zombie Process  

The zombie doesn’t get the signal to leave the memory.

### <mark style="background: #FFF503A6;">Zombie Example</mark>  

Try out example_zombie.c  

Note the process state codes - Defunct (‘zombie’) process, terminated but not cleaned up.  

This means that a dead process isn’t immediately removed and continues to hog the system’s memory, hence becoming a zombie  

```bash
ps -wax |grep a.out  
559488 pts/1 S+ 0:00 ./a.out  
559489 pts/1 Z+ 0:00 [a.out] <defunct>
```

### <mark style="background: #FFF503A6;">Daemons</mark> 

A daemon is a process that runs in the background not under the control of a user.  

A daemon usually has a Parent PID of 1. They are usually started when the system is booted and will only terminate on shutdown.  

<mark style="background: #FFF503A6;">Example:</mark> ``crond, ftpd, rlogind, mysqld, apache``

### <mark style="background: #FFF503A6;">Steps to create example daemon</mark>  
1. <mark style="background: #FFF503A6;">Forking:</mark> It creates two child processes from the main process (parent). The parent exits, leaving the first child to run independently. This child becomes the session leader.  
2. <mark style="background: #FFF503A6;">Ignoring Signals:</mark> It ignores certain signals like SIGCHLD (child process termination) and SIGHUP (terminal hangup) to prevent unexpected behavior.  
3. <mark style="background: #FFF503A6;">Second Fork:</mark> Another fork happens, ensuring the session leader process exits. The remaining child becomes the actual daemon process.  
4. <mark style="background: #FFF503A6;">Environment Setup:</mark> The daemon changes its working directory to the root (/) and sets permissions using umask.  
5. <mark style="background: #FFF503A6;">Closing Files:</mark> It closes all open file descriptors to prevent resource leaks.  
6. <mark style="background: #FFF503A6;">Logging:</mark> It opens a log file named "firstdaemon" and logs a message indicating startup.  
7. <mark style="background: #FFF503A6;">Main Loop:</mark> The daemon enters an infinite loop, logging every 20 seconds that it's running. Finally, it logs its termination and closes the log file.

### <mark style="background: #FFF503A6;">Daemon example</mark>  

Compile the code: gcc -o mydaemon example_daemon.c  

Start the daemon: ./mydaemon  

<mark style="background: #FFF503A6;">See it running:</mark>  
```bash
ps –aux | head -1  
ps -aux| grep mydaemon
```

### <mark style="background: #FFF503A6;">Daemon example results</mark> 

The output should be similar to this:  
```shell
F UID PID PPID PRI NI VSZ RSS WCHAN STAT TTY TIME COMMAND  
1 1001 594869 3060 20 0 2776 1280 hrtime S ? 0:00 ./mydaemon
```  

<mark style="background: #FFF503A6;">What you should see here is:</mark>  
- The daemon has no controlling terminal (TTY = ?)  
- The parent process ID (PPID) is 1 (The init process), or else a system –user process  
- The PID != SID which means that our process is NOT the session leader (because of the second fork())  
- Because PID != SID our process can't take control of a TTY again  

<mark style="background: #FFF503A6;">Reading the syslog:</mark>  
- Locate your syslog file. Mine is here: /var/log/syslog  
- Do a: grep –a mydaemon /var/log/syslog  
- The output should be similar to this:  

```shell
Feb 15 17:41:46 soc-DZY0LX3-SOS mydaemon[596450]: mydaemon started  

Feb 15 17:42:06 soc-DZY0LX3-SOS mydaemon[596450]: mydaemon terminated
```

### <mark style="background: #FFF503A6;">Error Logging</mark>  

How can a daemon deal with error messages?  

It doesn’t have access to standard_error, as it doesn’t have a controlling terminal.  

One option could be to write the error messages to a file, but this could get messy if there were loads of daemons writing to loads of files.  

A central solution would be best  

Most daemons use the syslog function to generate log messages.  

We seen an example of this in the daemon code.

### <mark style="background: #FFF503A6;">Process Status Codes</mark>  

<table>
	<tr>
		<td>D</td>
		<td>uninterruptible sleep (usually IO)</td>
	</tr>
	<tr>
		<td>R</td>
		<td>running or runnable (on run queue)</td>
	</tr>
	<tr>
		<td>S</td>
		<td>interruptible sleep (waiting for an event to complete)</td>
	</tr>
	<tr>
		<td>T</td>
		<td>stopped, either by a job control signal or because it is being traced</td>
	</tr>
	<tr>
		<td>W</td>
		<td>paging (not valid since the 2.6.xx kernel)</td>
	</tr>
	<tr>
		<td>X</td>
		<td>dead (should never be seen)</td>
	</tr>
	<tr>
		<td>Z</td>
		<td>defunct ("zombie") process, terminated but not reaped by its parent</td>
	</tr>
</table>

<mark style="background: #FFF503A6;">Note:</mark> you can view these by typing `man ps`

### <mark style="background: #FFF503A6;">ps – available info</mark>  
- PPID – Parent Process ID 
- PID – Process ID  
- PGID – Process Group ID  
- SID – Session ID  
- TTY – Controlling Terminal  
- TPGID – Controlling tty process group ID  
- STAT – Process Status Codes  
- UID – Effective User Id

### <mark style="background: #FFF503A6;">Required Reading</mark>  

How To Write a UNIX Daemon by Dave Lennert (Hewlett-Packard Company) - http://cjh.polyplex.org/software/daemon.pdf  

Advanced Programming in the Unix Environment – Second Edition – W. Richard Stevens and Stephen A. Rago - Chapter 13. Daemon Processes

