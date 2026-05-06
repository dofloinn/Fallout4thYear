<mark style="background: #FFF503A6;">Auditing user actions:</mark>  
- Who is doing what?
- Who modified that file??

### <mark style="background: #FFF503A6;">auditd:</mark>

auditd is the userspace component to the Linux Auditing System  

auditd is short for “Linux Audit Daemon” and its purpose is to write audit records to the disk.  

auditd is a native feature of the linux kernel to collect information on system activity, the main focus of this will be accountability and incident investigation (who did what)  

auditd uses hooks to system calls.

<mark style="background: #FFF503A6;">Difference between auditd & syslog:</mark>
- Syslog and the audit subsystem have different purposes.  
- syslog is a general logging daemon available for any application or the system to use for any reason.  
- The audit daemon's job is to track specific activities or events to determine who did what and when

<mark style="background: #FFF503A6;">Auditd can perform the following:</mark>  
- Monitoring system calls  
- Monitoring File access  
- Monitor auditable events within the kernel  

This will allow us to watch for particular types of events on a given system. We will need to specify what we want to watch (create rules).  

auditd is a logger, it offers no preventative measures. It only brings transparency and accountability.

### <mark style="background: #FFF503A6;">auditd – creating rules</mark>

Auditd offers a basic set of rules that can be used for logging particular events.  

Support is offered to create custom rules  

Rules are contained within rule files on the system.

### <mark style="background: #FFF503A6;">auditd rules & configuration</mark>

The default auditd configuration should be suitable for most environments.  

However, if your environment has to meet the criteria set by the Controlled Access Protection Profile (CAPP), which is a part of the Common Criteria certification, the Audit daemon configuration must abide by a strict set of rules  

An <mark style="background: #FFF503A6;">example of this</mark> is the directory that holds the Audit log files (usually /var/log/audit/) should reside on a separate partition. This prevents other processes from consuming space in this directory, and provides accurate detection of the remaining space for the Audit daemon.  

The CAPP is a Common Criteria security profile that specifies a set of functional and assurance requirements  

CAPP standards provide access controls that are capable of enforcing access limitations on individual users and data objects

### <mark style="background: #FFF503A6;">auditd rules – setup configuration</mark> 

There are auditd pre-defined rules that can be used to offer meaningful logging on a system.  

These will probably need to be setup and configured to suit the systems needs (what do we really need to audit?)  

<mark style="background: #FFF503A6;">Auditd can only audit:</mark>  
- The file system  
- System call rules  
- Other security related evens (logins, network connections, etc)  

For rules created it follows a “first match wins” approach.  

The rest of the rules are not evaluated

### <mark style="background: #FFF503A6;">auditd rules</mark>  

<mark style="background: #FFF503A6;">Rules are written to:</mark>  /etc/audit/audit.rules  

These rules are loaded by the audit daemon when it starts  

auditctl can be used to set rules  

These rules only make temp changes, we need to modify audit.rules to set a rule.  

<mark style="background: #FFF503A6;">Logs can be viewed via:</mark>  
- ausearch  
- aureport

### <mark style="background: #FFF503A6;">auditd reporting</mark>

<mark style="background: #FFF503A6;">ausearch</mark> facilitates a search of the audit logs for specific criteria.  

This can be command names, system calls, events etc...  

<mark style="background: #FFF503A6;">aureport</mark> facilitates the creation of summary reports from the audit logs. This shows less granular detail but offers better reporting via tabular lists etc...

### <mark style="background: #FFF503A6;">Auditing to Syslog</mark> 

It can be beneficial to centralise audit logs.  

The audisp-remote plugin can be used to send logs to a remote Syslog server.  

This takes audit events and writes them to Syslog.

### <mark style="background: #FFF503A6;">auditd</mark>

auditd - Tool for Security Auditing on Linux Server  

auditd or audit daemon, is a userspace component to the Linux Auditing System.  

It’s responsible for writing audit records to the disk.  

<mark style="background: #FFF503A6;">Install:</mark> 
```sh
sudo apt-get update && sudo apt-get install auditd  
sudo service auditd start
```  

<mark style="background: #FFF503A6;">To add a watch to a file or directory:</mark>
```sh
auditctl -w /var/www/html -p rwxa
```  

<mark style="background: #FFF503A6;">Search logs:</mark>  
```sh
ausearch -f /var/www/html/ > accesslog.txt
```

### <mark style="background: #FFF503A6;">auditctl</mark>

auditctl program is used to control the behaviour, get status, and add or delete rules  

See the man pages to view all options  

<mark style="background: #FFF503A6;">Examples:</mark>  
- To see all syscalls made by a specific program:
- ``auditctl -a exit,always -S all -F pid=1234``  
- To see files opened by a specific user:
- ``auditctl -a exit,always -S open -F auid=611``

### <mark style="background: #FFF503A6;">ausearch</mark> 

<mark style="background: #FFF503A6;">ausearch</mark> is a tool that can query the audit daemon logs based for events based on different search criteria

See man pages for options  

<mark style="background: #FFF503A6;">Examples:</mark>  
- Failed login attempts  
- ``ausearch -m USER_LOGIN -sv no``

### <mark style="background: #FFF503A6;">aureport</mark>

aureport is a tool that produces summary reports of the audit system logs  

See man pages for options  

<mark style="background: #FFF503A6;">Examples:</mark>  
- Login Summary Report  
- ``aureport -i --login --summary``  
- Executable Summary Report  
- ``aureport -i --executable --summary``

### <mark style="background: #FFF503A6;">System Startup</mark>

<mark style="background: #FFF503A6;">Booting a Linux installation involves multiple stages and software components:</mark>
- firmware initialisation  
- boot loader  
- loading and startup of a Linux kernel image  
- execution of various startup scripts and daemon processes  

Boot loader will load the kernel into memory. The Kernel will setup system functions such as essential hardware etc. The Kernel will create the init process to run in userspace.  

<mark style="background: #FFF503A6;">init will use one of the following:</mark>  
- scripts that are executed by the shell (sysv, bsd, runit)  
- configuration files that are executed by the binary components (systemd, upstart)

### <mark style="background: #FFF503A6;">System Startup - init process</mark>

Init – Initialisation  

Daemon process which runs in user space as soon as the computer starts.  

This is the first process to start and usually has a PID = 1  

Init is most commonly referred to as System V init.  

If the init daemon cannot start this will result in no processes being started and the system will reach a stage called “kernel panic”

Init begins the entire set of processes and manages this task.  

There are alternatives to init, we will see these later today.  
Init has been in existence since the Unix days (System V and LSB)  

Init operation is linked to a file: /etc/inittab  

The /etc/inittab file is used to set the default run level for the system.  

<mark style="background: #FFF503A6;">Every run level has an entire directory of scripts:</mark>
- S scripts start  
- K scripts finish

<mark style="background: #FFF503A6;">Init run levels</mark> 
- 0 – System halt i.e the system can be safely powered off with no activity.  
- 1 – Single user mode - no network interfaces, daemons  
- 2 – Multiple user mode with no NFS(network file system).  
- 3 – Starts the system normally  
- 4 – User-definable.  
- 5 – Multiple user mode under GUI (graphical user interface) this is basically level 3 with GUI (standard level for Linux)  
- 6 – Reboot