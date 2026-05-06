<mark style="background: #FFF503A6;">Overview:</mark>
- Logging 
- Syslog

### <mark style="background: #FFF503A6;">Linux System Logs</mark>  

Linux gathers a large amount of log files automatically.  

These log files can be used to see how a given process is performing and if any issues have occurred. If the process has an issue with any aspect of the tasks it performs it should place an entry in the log files.  

<mark style="background: #FFF503A6;">Log files typically held in:</mark>
``/var/log``

### <mark style="background: #FFF503A6;">Types of logs (varies)</mark>  

<table>
	<tr>
		<td>File Name</td> 
		<td>Description</td>
	  </tr>
	  <tr>
		<td>/var/log/user.log</td> 
		<td>All user level logs</td>
	  </tr>
	  <tr>
		<td>/var/log/kern.log</td> 
		<td>Info logged by the kernel. May be useful with issues in rebuilding the kernel.</td>
	  </tr>
	  <tr>
		<td>/var/log/daemon.log</td> 
		<td>Holds info on processes running in the background</td>
	  </tr>
	  <tr>
		<td>/var/usr/cron</td> 
		<td>When a schedule task is launched, it is logged here</td>
	  </tr>
	  <tr>
		<td>/var/log/audit/</td> 
		<td>Dir containing all log info for the auditd daemon</td>
	  </tr>
	  <tr>
		<td>/var/log/boot.log</td> 
		<td>Log files for system boot process</td>
	  </tr>
</table>

### <mark style="background: #FFF503A6;">syslog</mark>

The syslog daemon is used to centralise error messages for processes running on system.  

The syslog files can be kept of the same server or centralised on a different server.

### <mark style="background: #FFF503A6;">syslog Protocol</mark>

The syslog protocol specifies how information is propagated over a network.  

It defines a data format definition for its messages.  

This has been standardised in RFC-5424 (also called the IETF-syslog protocol), it uses port 514 for plaintext logs and 6514 for encrypted logs.

### <mark style="background: #FFF503A6;">syslog messages</mark>  

Events from processes will be logged to syslog via messages.  

The message is made up of a header and a number of different fields.

### <mark style="background: #FFF503A6;">openlog</mark>

openlog opens a connection to the system logger.  

The connection is associated to the program currently running.  

``void openlog(const char *ident, int option, int facility);``  

Identity string is added to the start of each log entry.  

If ident is null the program name will be used.

### <mark style="background: #FFF503A6;">option argument of openlog</mark>
 
The option argument to ``openlog()`` is a bit mask constructed by ORing (bitwise OR |) together any of the following values:  
- <mark style="background: #FFF503A6;">LOG_CONS:</mark> Write directly to the system console if there is an error while sending to the system logger.
- <mark style="background: #FFF503A6;">LOG_NDELAY:</mark> Open the connection immediately (normally, the connection is opened when the first message is logged). This may be useful, for example, if a subsequent ch‐root(2) would make the pathname used internally by the logging facility unreachable.
- <mark style="background: #FFF503A6;">LOG_NOWAIT:</mark> Don't wait for child processes that may have been created while logging the message. (The GNU C library does not create a child process, so this option has no effect on Linux.)
- <mark style="background: #FFF503A6;">LOG_ODELAY:</mark> The converse of LOG_NDELAY; opening of the connection is delayed until syslog() is called. (This is the default, and need not be specified.)
- <mark style="background: #FFF503A6;">LOG_PERROR:</mark> (Not in POSIX.1-2001 or POSIX.1-2008.) Also log the message to stderr. 
- <mark style="background: #FFF503A6;">LOG_PID:</mark> Include the caller's PID with each message.

### <mark style="background: #FFF503A6;">facility argument of openlog</mark>  

The facility argument is used to specify what type of program is logging the message. This lets the configuration file specify that messages from different facilities will be handled differently.  
- <mark style="background: #FFF503A6;">LOG_AUTH:</mark> security/authorization messages 
- <mark style="background: #FFF503A6;">LOG_AUTHPRIV:</mark> security/authorization messages (private) 
- <mark style="background: #FFF503A6;">LOG_CRON:</mark> clock daemon (cron and at) 
- <mark style="background: #FFF503A6;">LOG_DAEMON:</mark> system daemons without separate facility value 
- <mark style="background: #FFF503A6;">LOG_FTP:</mark> ftp daemon 
- <mark style="background: #FFF503A6;">LOG_KERN:</mark> kernel messages (these can't be generated from user processes) 
- <mark style="background: #FFF503A6;">LOG_LOCAL0:</mark> through LOG_LOCAL7 reserved for local use 
- <mark style="background: #FFF503A6;">LOG_LPR:</mark> line printer subsystem  
- <mark style="background: #FFF503A6;">LOG_MAIL:</mark> mail subsystem  
- <mark style="background: #FFF503A6;">LOG_NEWS:</mark> USENET news subsystem

### <mark style="background: #FFF503A6;">level argument of syslog</mark>  

``void syslog(int priority, const char *format, ...);``  
  
<mark style="background: #FFF503A6;">Values for level:</mark> This determines the importance of the message. 

<mark style="background: #FFF503A6;">The levels are, in order of decreasing importance:</mark>  
- <mark style="background: #FFF503A6;">LOG_EMERG:</mark> system is unusable  
- <mark style="background: #FFF503A6;">LOG_ALERT:</mark> action must be taken immediately
- <mark style="background: #FFF503A6;">LOG_CRIT:</mark> critical conditions
- <mark style="background: #FFF503A6;">LOG_ERR:</mark> error conditions
- <mark style="background: #FFF503A6;">LOG_WARNING:</mark> warning conditions
- <mark style="background: #FFF503A6;">LOG_NOTICE:</mark> normal, but significant, condition
- <mark style="background: #FFF503A6;">LOG_INFO:</mark> informational message
- <mark style="background: #FFF503A6;">LOG_DEBUG:</mark> debug-level message

### <mark style="background: #FFF503A6;">Example: syslog1.c</mark>

```C
#include <syslog.h>  
#include <stdio.h>  
#include <stdlib.h>  

int main() {  
	// LOG_CONS: Write console if an error occurs sending to logger.  
	// LOG_PID: Include the PID with each message  
	// facility is LOG_USER indicating a user-level message  
	openlog("example_program", LOG_CONS | LOG_PID, LOG_USER);  
	// LOG_INFO => normal, informational message.  
	syslog(LOG_INFO, "Test message from example_program.");  
	closelog();  
	return EXIT_SUCCESS;  
}
```

```shell
$ ./a.out &  
[3] 828239  
$ tail -1 /var/log/syslog  
Mar 14 15:31:48 soc-DZY0LX3-SOS example_program[828239]: Test message from example_program.
```

