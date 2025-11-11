<mark style="background: #00ECFFA6;">Overview:</mark>
- Memory Forensics  
- Volatility Framework

### <mark style="background: #00ECFFA6;">Memory Forensics</mark>

We have seen how to take a memory capture and the large amount of data stored could be considered to be a unorganized data blob.  

The memory capture does have a structure and this can be analysed using digital forensic tools.  

As previously discussed, the processes and files currently open on the computer are residing in memory.

### <mark style="background: #00ECFFA6;">Memory Analysis</mark>

When working with a computer the data must be in its real form when it resides in memory.  

This may not always be true due to memory encryption techniques but the majority of items are in their true form in memory.  

Malware, encryption etc will be in it true unencrypted form. This offers the opportunity to analyse what we find to make sense of its operation and view its content.

### <mark style="background: #00ECFFA6;">Processes</mark>

In the RAM capture we will be able to get a list of the processes currently running in memory.  

This is a list of the OS processes and the process of the applications opened by the user.  

We can get the PID and PPID of the processes and the process name.  

When looking at malware and intrusions we will be looking at processes to see what is currently happening. (Trying to identify hijacked processes)  

Analysing processes is also a rich source of information to see what applications are open and what tasks they are performing etc.

### <mark style="background: #00ECFFA6;">Forensic Techniques</mark>  

Looking at using digital forensic tools to find interesting things in memory.  

For a digital investigator they would need to be very familiar of the operating system files and structure of a clean machine. Why?  

By knowing what the common files are and their names / ports etc we can eliminate items from our investigation.  

<mark style="background: #00ECFFA6;">Whitelisting</mark> can be used as a technique to use a set of hash values of files from a clean machine to see if they match the files on our target machine.  

Another approach to this is <mark style="background: #00ECFFA6;">Indicators of compromise (IoC)</mark>, these are definitions of past incidences that are incorporated into a software tool that analyses the system to try match patterns etc.

### <mark style="background: #00ECFFA6;">Memory Tools - Volatility</mark>

https://www.volatilityfoundation.org/  

“In 2007, the first version of The Volatility Framework was released publicly at Black Hat DC. The software was based on years of published academic research into advanced memory analysis and forensics. Up until that point, digital investigations had focused primarily on finding contraband within hard drive images. Volatility introduced people to the power of analyzing the runtime state of a system using the data found in volatile storage (RAM). It also provided a cross-platform, modular, and extensible platform to encourage further work into this exciting area of research. Another major goal of the project was to encourage the collaboration, innovation, and accessibility to knowledge that had been common within the offensive software communities.” - https://www.volatilityfoundation.org/about

### <mark style="background: #00ECFFA6;">Volatility</mark>

“Volatility development is now supported by The Volatility Foundation, an independent 501(c) (3) non-profit organization. The foundation was established to promote the use of Volatility and memory analysis within the forensics community, to defend the project's intellectual property (trademarks, licenses, etc.) and  
longevity, and, finally, to help advance innovative memory analysis research.” - https://www.volatilityfoundation.org/about

### <mark style="background: #00ECFFA6;">Volatility – Basic Usage</mark> 

<mark style="background: #00ECFFA6;">Typical command components:</mark>
```bash
vol.py -f [image] --profile=[profile] [plugin]
```  

<mark style="background: #00ECFFA6;">Display profiles, address spaces, plugins:</mark>  
```bash
vol.py –info
```  

<mark style="background: #00ECFFA6;">Display global command-line options:</mark> 
```bash
vol.py --help
```

<mark style="background: #00ECFFA6;">Load plugins from an external directory:</mark>
```bash
vol.py –f example.mem --plugins=[path] [plugin]
```  

Where example.mem is the RAM capture. We will use this for the remainder of our examples

### <mark style="background: #00ECFFA6;">Volatility – Working with the Image</mark>

<mark style="background: #00ECFFA6;">Identify the specific profile (operating system version):</mark>
```bash
vol.py –f example.mem imageinfo
```

### <mark style="background: #00ECFFA6;">Volatility – Working with processes</mark>

<mark style="background: #00ECFFA6;">Get the process list:</mark>  
```bash
Vol.py –f example.mem --profile=WinXP pslist
```  

<mark style="background: #00ECFFA6;">Identify hidden processes:</mark>  
```bash
Vol.py –f example.mem --profile=WinXP pscan
```  

<mark style="background: #00ECFFA6;">Cross reference processes with various lists:</mark>  
```bash
Vol.py –f example.mem --profile=WinXP psxview
```  

<mark style="background: #00ECFFA6;">Process tree:</mark>  
```bash
Vol.py –f example.mem --profile=WinXP pstree
```  

Where WinXP is the profile for the RAM capture

### <mark style="background: #00ECFFA6;">Volatility – Working with processes</mark>

<mark style="background: #00ECFFA6;">Show command line arguments:</mark>  
```bash
Vol.py –f example.mem --profile=WinXP cmdline  
```

<mark style="background: #00ECFFA6;">Dump all valid pages to a single file:</mark>  
```bash
Vol.py –f example.mem --profile=WinXP memdump –p 2001 --dump-dir=PATH 
``` 

Where 2001 is the process id and PATH is the path on your machine  

<mark style="background: #00ECFFA6;">Dump a process:</mark>  
```bash
Vol.py –f example.mem --profile=WinXP procdump –p 2001 --dump-dir=PATH
```  

Where 2001 is the process id and PATH is the path on your machine

### <mark style="background: #00ECFFA6;">Volatility – Logs Histories</mark> 

(Recover command history)
<mark style="background: #00ECFFA6;">cmdscan and consoles:</mark>  
```bash
Vol.py –f example.mem --profile=WinXP cmdscan  
Vol.py –f example.mem --profile=WinXP cmdline
```  

<mark style="background: #00ECFFA6;">Recover IE cache/Internet history:</mark>  
- Vol.py –f example.mem --profile=WinXP iehistory –p 2001  
- Where 2001 is the process id  

note there are other plugins we can get for other browsers

### <mark style="background: #00ECFFA6;">Volatility – Networking Information</mark>  

<mark style="background: #00ECFFA6;">Check TCP connections</mark>  
```bash
Vol.py –f example.mem --profile=WinXP connscan
```

<mark style="background: #00ECFFA6;">Check UDP and TCP connections:</mark>
```bash
Vol.py –f example.mem --profile=WinXP sockets  
```

<mark style="background: #00ECFFA6;">Current versions of Windows:</mark>
```bash
Vol.py –f example.mem --profile=WinXP netscan
```

### <mark style="background: #00ECFFA6;">Volatility – Registry</mark>

<mark style="background: #00ECFFA6;">Display cached hives:</mark>
```bash
./vol.py -f example.mem --profile=WinXP hivelist  
```

<mark style="background: #00ECFFA6;">Print a key’s values and data:</mark>  
```bash./vol.py -f example.mem --profile=WinXP printkey -K

"Software\Microsoft\Windows\CurrentVersion\Run" | more
```  

Where "Software\Microsoft\Windows\CurrentVersion\Run” is a reg entry

### <mark style="background: #00ECFFA6;">Volatility – Strings</mark>

We can use strings to parse a memory or process dump i.e. we need the dump file first.  

Strings - We will use a program named strings to parse the memory process dump. This scans file for unicode or ascii content. This should(might) be preinstalled on Linux and can be downloaded for Windows (from Microsoft).  
- strings example.dmp  
- Where example.dmp is our mempry/process dump

### <mark style="background: #00ECFFA6;">Identifying Malware with Volatility</mark>

We will demo this in our lecture session this week.