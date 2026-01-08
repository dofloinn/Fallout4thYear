
<mark style="background: #00ECFFA6;">Purpose of Investigation:</mark>
- Theft of intellectual property  
- Misuse of company resources  
- Stalking  
- Possession or distribution of contraband

### <mark style="background: #00ECFFA6;">Internet Addressing</mark>

Uniform Resource Locator (URL) points to a specific object with Internet availability  

Scheme identifies protocol used to access the resource (http, https, ftp, etc.)  

Domain name points to the specific network  

Suffix (.com, .edu, etc.) points to top level domain  

All together, they make the fully qualified domain name

### <mark style="background: #00ECFFA6;">Browsers</mark>

Uses markup language to open web pages  

Hyperlinks redirect user to specific resources  

Content can be either web pages or files that are the targets of hyperlinks

<mark style="background: #00ECFFA6;">Function of Browsers:</mark>
- An address bar (manual mapping to URL)  
- Forward and Back buttons  
- Bookmarking capabilities  
- Intrapage search capabilities  
- Configuration utilities

<mark style="background: #00ECFFA6;">Artifacts of Browsing:</mark>
- Internet history  
- Cookies  
- Temporary Internet files  
- Registry entries

![[Pasted image 20260107175837.png]]

<mark style="background: #00ECFFA6;">Deleting Temporary Files:</mark>
- Browser settings can be adjusted to automatically delete files upon closing the browser  
- Temporary files can be recovered the same as any other deleted file  
- Cookies may or may not be included, depending on the browser and its configuration  
- Internet history files and cache files are not the same

<mark style="background: #00ECFFA6;">Browser History:</mark>
- A database of recently visited sites  
- Cache files are stored separately  
- Each operating system/browser combination has a different default location for history and cache files  
- Some utilities that analyse Internet usage can automatically detect browser settings

### <mark style="background: #00ECFFA6;">Browser History Analysis Tools</mark>

Nirsoft (www.nirsoft.net) makes available a number of different browser analysis tools as open source freeware. These include specialized history tools for IE, Firefox, Safari, Chrome, and Opera.  

The Linux forensic application The Sleuth Kit does an excellent job of analyzing Internet history on most browsers.  

Web Historian is useful whenever the investigator is unsure which browser may have been used. This utility scans the directory structure of the computer and identifies valid history files for IE, Mozilla, Netscape, Safari, and Opera.  

Web Historian analyses the files it finds and has the ability to output data into Excel format, HTML, or a comma-delimited text file that can be imported into virtually any database application. When data is output to a spreadsheet or database, an investigator can sort information in a variety of ways. Sorting by timestamp and then by URL is a good way to generate a timeline of activity.

![[Pasted image 20260107180225.png]]

### <mark style="background: #00ECFFA6;">Browser History</mark>

Internet Explorer stores information useful to the investigator in at least three different places. 

<mark style="background: #00ECFFA6;">Users Windows 2000 and earlier:</mark>
- C:\Documents and Settings\@user:\Local Settings\Temporary Internet Files\Content.IE5\. This is the default location IE uses for putting pages and images viewed by that particular user.  
- C:\Documents and Settings\@user:\Local Settings\History\History.IE5\ stores a noncached history without the actual pages and images.  
- Cookies are generally stored in C:\Documents and Settings\@user:\Cookies\.  

<mark style="background: #00ECFFA6;">Windows 7 , 8, 8.1 and 10:</mark>
- C:\Users\@user:\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5.  
- Cookies: C:\Users\@user:\AppData\Roaming\Microsoft\Windows\Cookies  
<mark style="background: #00ECFFA6;">Analyzing User Activity:</mark>
- Cookies generally identify the website from whence they came  
- History records are a database file that shows user activity (may be deleted periodically)  
- Temporary Internet files can be recovered by file recovery utilities even if automatically deleted

### <mark style="background: #00ECFFA6;">History Files</mark>

<mark style="background: #00ECFFA6;">Contain:</mark>
- URL  
- File Name: as it exists on the local system  
- Record Type: browsed or redirected  
- Access Time: time the file was last accessed  
- Modified Time: time the file was last changed  
- Directory Name: local directory in which the file is stored  
- HTTP Headers: as originally received

### <mark style="background: #00ECFFA6;">Finding “Stuff” is Not Enough</mark>

The defendant has knowledge of possession of contraband  

The defendant took specific actions to obtain the contraband  

The defendant had control over the contraband  

If deleted, the defendant took active measures to destroy the actual materials  

There was sufficient quantity of contraband to justify prosecution

### <mark style="background: #00ECFFA6;">Knowledge of Possession</mark>

<mark style="background: #00ECFFA6;">“Present Possession” concept:</mark> The user must know that it is there  

Redirected sites will store temporary files and images without notifying the user  

Any attempt to manipulate or manually delete the file suggests knowledge of possession  

But what user was logged on when these actions took place?

### <mark style="background: #00ECFFA6;">Knowledge of Possession (Case Example)</mark>

Evidence of deleted files has been accepted as evidence that the user knew of the material’s existence.  

In The United States v. Tucker , the defendant claimed that he had no knowledge of possession because the computer automatically stored the images in cache without any intervention on his part.  

The court finding disagreed with that argument, stating in its decision that possession “is not only evidenced by his showing and manipulation of the images, but also by the telling fact that he took the time to delete the image links from his computer cache file.”  

This demonstrated knowledge of existence and the ability to control the image.

### <mark style="background: #00ECFFA6;">Establishing User Actions</mark>

Repeated searches suggest intent  

Innocent searches can bring up unexpected content  

Popups are not under the control of the user  

Meta-refresh will automatically redirect the user against their will  

The ``TypedURL`` registry entry proves that a website was accessed intentionally

### <mark style="background: #00ECFFA6;">Establishing User Actions (Case Example)</mark>

It is true that many Web sites launch obnoxious pop-up windows that the user did not wish to see and had no intention of launching; however, repeated searches can reveal intent.  

In The State of Florida v. Casey Marie Anthony (2008), the digital investigators were able to demonstrate that Anthony had performed numerous searches for chloroform and its effects.  

This was in spite of the fact that Anthony had made a concerted effort to erase her browser’s history.  

Prosecutors used the searches as the foundation for showing premeditation in the act.  

While the defendant was found not guilty in this particular case, it is still a good illustration of how this type of evidence is used in real-life situations.

### <mark style="background: #00ECFFA6;">Establishing Control of Material</mark>

<mark style="background: #00ECFFA6;">The Trojan Horse defense (the Devil made me do it):</mark> 
- A malware analysis can prove or disprove this claim  
- But rootkits can foil the malware analysis  

Accessing a file a significant time after the original create date suggests control  

Manually deleting or editing a file suggests control

### <mark style="background: #00ECFFA6;">Determining Active Measure</mark>  

<mark style="background: #00ECFFA6;">Intentional deletion:</mark> Many document management solutions automatically audit file deletions and indicate what user initiated the action, along with an exact time and date  

<mark style="background: #00ECFFA6;">Examples:</mark>
- Modify dates after the create date  
- Moving a file from one location to another  
- Renaming a file

### <mark style="background: #00ECFFA6;">Determining Sufficient Quantity</mark>

That’s not your job – leave it to the legal team  

Your job is only to ascertain the quantity

### <mark style="background: #00ECFFA6;">Tools for Browser Analysis</mark>

![[Pasted image 20260107181339.png]]

### <mark style="background: #00ECFFA6;">Investigating Web Servers:</mark>

<mark style="background: #00ECFFA6;">Server log files:</mark> 
- Access logs  
- Error logs  

Proxy Servers

### <mark style="background: #00ECFFA6;">Web Server Log Files</mark>

<mark style="background: #00ECFFA6;">IIS Log Files:</mark> These files are generally the most interesting to the investigator, as they contain information about all client requests against the Web server. By default, these files are located in the c:\%system%\system32\LogFiles\W3SVC1 directory. The files have a conventional naming system of EXxxxxxx.log, where xxxxxx is a number generated by IIS.  

<mark style="background: #00ECFFA6;">IISMSID:</mark> Logs Mobile Station Identifiers. A mobile station identifier is a number associated with a wireless service provider that identifies a particular unit on the network. This log is only present on a Microsoft Web server if the MSIDFILT or CLOGFILT functions are enabled.  

<mark style="background: #00ECFFA6;">HTTPERR: HTTPERR</mark> logs record all invalid requests made to the Web server. These files are stored in the %systemroot%\System32\LogFiles\HTTPERR directory.  

<mark style="background: #00ECFFA6;">URLSCAN:</mark> The URLSCAN tool is a utility that can be installed on a Microsoft Web server that allows the administrator to block specific HTTP requests. If the tool is installed on the Web server (and unless logging is disabled), a log file records all denied requests. By default the file is located in the directory %systemroot%\inetsrv\urlscan\logs.

### <mark style="background: #00ECFFA6;">Analysing Log Files</mark>

The server logs provide a large amount of information about any given HTTP transaction that the investigator can use in determining what happened and the order of events.  

While each type of Web server differs somewhat in how it records its log files, Microsoft Internet Information Service is fairly typical of most server logs. The next slide lists the significant fields recorded in an IIS server log.  

It should be noted that since IIS uses W3C format, the content contained by the files may be customized by the Webmaster.  

Some of these fields may be absent.

![[Pasted image 20260107181813.png]]

### <mark style="background: #00ECFFA6;">Searching the Network</mark>

<mark style="background: #00ECFFA6;">Purpose of Investigation:</mark>
- Internal investigations  
- Misuse of company resources  
- Penetration analysis  
- Intrusion detection

 <mark style="background: #00ECFFA6;">Scope of the Investigation:</mark>
- Local area networks  
- Application Service Providers (ASP)  
- Cloud computing

<mark style="background: #00ECFFA6;">Initial Response</mark> 
- Identify the actual problem  
- <mark style="background: #00ECFFA6;">Decide on an action:</mark> Should the connections be broken or back-traced? Is conviction worth the risk of data loss?  
- Lock down a time frame  
- Isolate the source of the nefarious activity  
- Identify the potential suspect(s)

<mark style="background: #00ECFFA6;">Point of a Response Plan:</mark>
- Have a list of IT personnel available  
- Have tools in place for analysing network activity  
- Prepare secure lines of communication that can’t be tapped  
- Create and test a plan of action for returning systems to normal  
- Have a good review process in place

### <mark style="background: #00ECFFA6;">Proactive Collection:</mark>

<mark style="background: #00ECFFA6;">When to do Proactive Collection</mark>
- Current and ongoing intrusions  
- Ongoing theft of data  
- Misuse of company resources  
- Suspicion of data export  
- Internal systems may have been compromised  
- When ascertaining whether malicious software has been embedded in the system  
- To determine how the intrusion was accomplished

<mark style="background: #00ECFFA6;">Keyloggers:</mark>
- Can be hardware or software based  
- May be subject to legal challenge  

<mark style="background: #00ECFFA6;">System auditing:</mark>
- Know what to audit and how  
- Collect audit logs before they are automatically deleted

### <mark style="background: #00ECFFA6;">Keyloggers</mark>

Keyloggers, whether software or hardware based, fall under the category of interception devices.  

This is based on a court decision that “interception occurs when a communication is captured or redirected in any way” (U.S. v. Rodriguez 1992). As such, their use is governed by federal and state law.  

In the corporate environment, it generally will not be a problem to insert keystroke loggers into any computer system owned by the company. To be safe, the company should have each employee read and sign a standard policy document that defines what rights the company reserves in this regard.  

United States v. Simons established that the presence of an established company policy, combined with a legitimate business interest in monitoring employee conduct, dispelled any perceived expectation of privacy  

In United States v. Nicodema S. Scarfo, et al., the court held that the use of a keystroke logger did not violate the ECPA. However, in this case, the software was designed specifically to work only when the computer was not hooked up to the modem.

### <mark style="background: #00ECFFA6;">Network Capture</mark>

<mark style="background: #00ECFFA6;">Determining authenticity:</mark>  
- Proxy servers alter IP addresses  
- Onion routing encapsulates original packets  
- IP spoofing rewrites the originating IP address  

<mark style="background: #00ECFFA6;">Identifying traffic:</mark>
- Narrow the range of targeted traffic  
- Identify a specific acquisition window

<mark style="background: #00ECFFA6;">Performing a Network Capture:</mark>
- Put network interface into promiscuous mode  
- Configure utility (such as Wireshark) to collect packets  
- Identify and configure a storage pool for captured traffic

<mark style="background: #00ECFFA6;">Analysing the Capture:</mark>  
- Protocol identification  
- IP address inventory  
- Message sessionising (A to B, B to A, A or B to any)

### <mark style="background: #00ECFFA6;">Collecting Live Connection Data:</mark>

<mark style="background: #00ECFFA6;">A small batch file can collect:</mark>
- Time/data information  
- NetBIOS connections  
- User statistics  
- File shares open  
- Open sessions  

Collect information only as it currently exists

### <mark style="background: #00ECFFA6;">Post Incident Collection</mark>

<mark style="background: #00ECFFA6;">Event logs:</mark>
- Application log  
- Security log  
- System log  

Application logs (not Windows)

### <mark style="background: #00ECFFA6;">Router and Switch Forensics</mark>

<mark style="background: #00ECFFA6;">Basics:</mark>
- Don’t analyse device over network  
- Enable logging before connecting to the device  
- Record all volatile information first  
- Record time-date stamps

<mark style="background: #00ECFFA6;">Router Data to Collect:</mark>
- Router OS  
- Router logs  
- Startup and running configurations  
- Routing tables  
- Access lists  
- NAT translation tables  
- List of interfaces