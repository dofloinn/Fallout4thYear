<mark style="background: #00ECFFA6;">Overview</mark>
- What is a digital forensics?
- Forensic examination
- Anatomy of an investigation
- Digital Forensic Models
- Chain of Custody
- Incidents and Hacking

### <mark style="background: #00ECFFA6;">Introduction:</mark>

In this module we will look at what computer forensics is and what can be achieved.  

A variety of freely available tools will be used for our practical   examples (as proprietary tools can be very expensive – but very feature rich and fit for purpose)  

We can’t cover every type of case. The focus is to show how to implement a forensically sound process to examine digital evidence using forensic tools.

### <mark style="background: #00ECFFA6;">What is Digital Forensics?</mark>

Digital forensics is analysis of digital devices to determine what has happened.  

This could be to determine if a crime has been committed. There are different types of infractions, this could be a civil matter or breach of company policy etc.  

<mark style="background: #00ECFFA6;">Definition:</mark> Computer forensics is the application of investigation and analysis techniques to gather and preserve evidence from a particular computing device in a way that is suitable for presentation in a court of law. The goal of computer forensics is to perform a structured investigation and maintain a documented chain of evidence to find out exactly what happened on a computing device and who was responsible for it. (Source: TechTarget: https://www.techtarget.com/searchsecurity/definition/computer-forensics

### <mark style="background: #00ECFFA6;">Forensic Examinations:</mark>

Digital forensics is the practice of collecting, analyzing and reporting on digital data.  

There is usually a specific need for the investigation, ie. Has a particular event occurred?  

Usually a forensic examiner is tasked with performing an examination, the outcome of the investigation needs to be reported back.  

<mark style="background: #00ECFFA6;">Question:</mark> what could be examples of what could be investigated?

<mark style="background: #00ECFFA6;">Collecting:</mark>
- This is the process of collecting the digital evidence  
- This can be the specific sourcing of a device for examination  
- Data needs to be collected in a forensically sound matter and the order of volatility needs to be carefully considered.  

<mark style="background: #00ECFFA6;">Analysing:</mark> This phase is looking at discovering what has happened or what task was performed using a digital device. This is looking to fully understand the transgression and the timeline of the events. The how/when things happened.

<mark style="background: #00ECFFA6;">Reporting:</mark>
- Creating a document to report our findings to the third party who requested the investigation.  
- This will offer answers to the reason why the third party wanted the investigation.  
- The report needs to be very specific with the process followed.  
- It is important that the conclusions drawn are supported by the results from the investigative process followed.

### <mark style="background: #00ECFFA6;">Questions / Discussion (in-class):</mark>

What are the consequences of not following the collecting, analysing and reporting on digital data?  

What do we need to know before starting the collecting, analysing and reporting phase?

### <mark style="background: #00ECFFA6;">Sources of Digital Evidence:</mark> 

<mark style="background: #00ECFFA6;">Open computer systems:</mark> Open computer systems are what most people think of as computers—systems comprised of hard drives, keyboards, and monitors such as laptops, desktops, and servers that obey standards.  

These systems, with their ever increasing amounts of storage space, can be rich sources of digital evidence.  

A simple file can contain incriminating information and can have associated properties that are useful in an investigation.  

For example, details such as when a it was created, who likely created it, or that it was created on another computer can all be important.

### <mark style="background: #00ECFFA6;">Computer Systems:</mark>
- Hard drives, SSDs, removable media (USB, CDs, DVDs).  
- Operating system artifacts (Windows Registry, system logs, event logs).  
- Application data (email clients, word processors, browsers).

<mark style="background: #00ECFFA6;">Examples:</mark>
- A company suspects an employee of stealing confidential design files and sending them to a competitor. Investigators seize the employee’s workstation for analysis.

<mark style="background: #00ECFFA6;">Hard Drive (Primary Storage):</mark>
- Recovered deleted CAD files using file carving.  
- Located compressed .zip archives with sensitive documents.  

<mark style="background: #00ECFFA6;">Operating System Artifacts:</mark>  
- Windows Event Logs showed multiple USB device connections late at night.  
- Recent files list confirmed access to confidential project folders.  
<mark style="background: #00ECFFA6;">Application Data:</mark>
- Email client (Outlook/Thunderbird) contained draft emails with attachments to an external address.  
- Browser history showed visits to a competitor’s employee portal.

### <mark style="background: #00ECFFA6;">Mobile Devices:</mark>
- Smartphones and tablets.  
- Call logs, SMS/MMS, contacts.  
- App data (WhatsApp, Telegram, Signal, etc.).  
- GPS and location history.  
- Photos, videos, audio recordings.

<mark style="background: #00ECFFA6;">Examples:</mark> 
- Police are investigating a drug trafficking case. A suspect’s smartphone is seized during an arrest.
- Evidence Found on the Mobile Device  

<mark style="background: #00ECFFA6;">Call Logs & Contacts:</mark>
- Recovered call history showing frequent late-night calls to a known dealer.  
- Contacts list contained aliases matching code names from surveillance.  

<mark style="background: #00ECFFA6;">Messaging Apps:</mark>
- WhatsApp chats revealed discussions about “deliveries” with timestamps matching observed movements.  
- Deleted Telegram messages were partially recovered from the device’s database files.  

<mark style="background: #00ECFFA6;">Location Data:</mark>
- GPS history showed repeated visits to a warehouse used as a stash location.  
- Google Maps “Timeline” confirmed travel routes consistent with drug drop-offs.  

<mark style="background: #00ECFFA6;">Multimedia Evidence:</mark>
- Photos of packaged substances stored in the gallery.  
- A voice memo discussing transaction amounts.

### <mark style="background: #00ECFFA6;">Network Sources:</mark>
- Network logs (routers, firewalls, intrusion detection/prevention systems).  
- Server logs (web servers, DNS, email servers).  
- Packet captures (PCAPs) from monitoring tools like Wireshark.  
- Cloud services (Google Drive, iCloud, Dropbox).

<mark style="background: #00ECFFA6;">Examples:</mark> A financial institution reports a suspected cyber intrusion where attackers may have accessed customer data. Forensic investigators analyse the organization’s network logs.  

<mark style="background: #00ECFFA6;">Firewall Logs:</mark> Detected multiple failed login attempts from foreign IPs, followed by a successful login at 3:12 AM.  

<mark style="background: #00ECFFA6;">Intrusion Detection System (IDS) Alerts:</mark> Flagged abnormal outbound traffic patterns — large encrypted data transfers to an unknown server.  

<mark style="background: #00ECFFA6;">Web Server Logs:</mark>
- Showed exploitation of a vulnerable login form (SQL injection attack).  
- Logs included attacker’s IP address and request payloads.  

<mark style="background: #00ECFFA6;">Packet Capture (PCAP):</mark> Analysis of packet data revealed exfiltration of customer records (names, account numbers).


### <mark style="background: #00ECFFA6;">Internet & Online Services</mark>  
- Social media platforms  (Facebook, Instagram, Twitter/X, TikTok).  
- Messaging services (Slack, Discord, Teams).  
- Forums, blogs, websites.  
- Cloud-hosted virtual machines or SaaS platforms.

<mark style="background: #00ECFFA6;">Example:</mark> Investigators are looking into an online harassment case where a victim reported receiving threatening messages on Twitter/X and Discord.  

Evidence Found Online

<mark style="background: #00ECFFA6;">Social Media (Twitter/X):</mark>
- Threatening posts traced back to an account using a pseudonym.  
- Metadata analysis (IP logs from Twitter) showed login locations matching the suspect’s home Wi-Fi.  

<mark style="background: #00ECFFA6;">Messaging Service (Discord):</mark>
- Private chat logs revealed the suspect coordinating with others about targeted harassment.  
- Deleted messages were recovered from Discord’s database export, provided via legal request.  

<mark style="background: #00ECFFA6;">Cloud Storage (Google Drive):</mark>
- Investigators found stored documents containing screenshots of planned attacks and doxxing material.  
- File timestamps confirmed they were created on the suspect’s Google account

### <mark style="background: #00ECFFA6;">Removable & External Devices</mark>
- USB drives, SD cards, external HDDs/SSDs.  
- IoT devices (smart TVs, smart speakers, wearables like Fitbit/Apple Watch). 
- Vehicle infotainment systems (GPS routes, Bluetooth logs).

<mark style="background: #00ECFFA6;">Example:</mark> During a corporate fraud investigation, forensic analysts search an employee’s office and find a USB flash drive hidden in a drawer.  

<mark style="background: #00ECFFA6;">File Storage:</mark>
- Contained encrypted spreadsheets with detailed records of unauthorized financial transfers.  
- File names matched projects the employee had access to internally.  

<mark style="background: #00ECFFA6;">Timestamps:</mark>
- Metadata showed the files were last modified outside of office hours.  
- "Date accessed" entries matched days when suspicious transactions occurred.  

<mark style="background: #00ECFFA6;">Deleted Data:</mark> Forensic carving recovered deleted PDFs with company bank account details.  

<mark style="background: #00ECFFA6;">Connection History:</mark> Windows registry on the suspect’s workstation confirmed the same USB drive was plugged into their computer multiple times.

### <mark style="background: #00ECFFA6;">Peripheral Devices</mark>  
- Printers (spool files, cached documents).  
- Scanners, copiers (stored images).  
- Surveillance cameras/DVRs.

<mark style="background: #00ECFFA6;">Example:</mark> A law enforcement team is investigating an intellectual property theft case. The suspect works in a design firm and frequently prints confidential blueprints.  

<mark style="background: #00ECFFA6;">Printers & Copiers:</mark>
- Analysis of the printer’s internal storage (spool files and logs) revealed copies of sensitive blueprints.  
- Metadata in the print job showed the username of the suspect’s workstation and timestamps.  

<mark style="background: #00ECFFA6;">Scanners:</mark>
- Scanned PDFs stored on a shared network scanner contained confidential documents.  
- Logs showed the scanner was accessed at odd hours when office staff were absent.  

<mark style="background: #00ECFFA6;">Other Peripherals (e.g., Smart Cameras, USB Devices):</mark>
- Surveillance cameras confirmed the suspect accessing restricted areas.  
- A connected USB drive to the copier contained drafts of sensitive design files.

### <mark style="background: #00ECFFA6;">Practitioners Tip</mark>

System administrators who find child pornography on computers in their workplace are in a perilous position.  

Simply deleting the contraband material and not reporting the problem may be viewed as criminally negligent.  

A system administrator who did not muster his employer’s support before calling the police to report child pornography placed on a server by another employee was disavowed by his employer, had to hire his own lawyer, testify on his own time, and ultimately find a new job.  

Well-meaning attempts to investigate child pornography complaints have resulted in the system administrator being prosecuted for downloading and possessing illegal materials themselves.  

Therefore, in addition to being technically prepared for such incidents, it is important for organizations and system administrators to have clear policies and procedures for responding to these problems

### <mark style="background: #00ECFFA6;">Principles of Digital Forensics</mark>

Forensic Science provides a large body of proven investigative techniques and methods for achieving the ends that are referenced extensively in this text.  

By <mark style="background: #00ECFFA6;">forensic</mark> we mean a characteristic of evidence that satisfies its suitability for admission as fact and its ability to persuade based upon proof (or high statistical confidence).

### <mark style="background: #00ECFFA6;">Evidence Exchange</mark>

The main goals in any investigation are to follow the trails that offenders leave during the commission of a crime and to tie perpetrators to the victims and crime scenes.  

Although witnesses may identify a suspect, tangible evidence of an individual’s involvement is usually more compelling and reliable.  

Forensic analysts are employed to uncover compelling links between the offender, victim, and crime scene.  

According to <mark style="background: #00ECFFA6;">Locard’s Exchange Principle</mark>, contact between two items will result in an exchange.  

This principle applies to any contact at a crime scene, including between an offender and victim, between a person with a weapon, and between people and the crime scene itself.  

There will always be evidence of the interaction, although in some cases it may not be detected easily (note that absence of evidence is not evidence of absence).  

This transfer occurs in both the physical and digital realms and can provide links between them

### <mark style="background: #00ECFFA6;">Evidence Exchange (example)</mark>

In computer intrusions, the attackers will leave multiple traces of their presence throughout the environment, including in the le systems, registry, system logs, and network-level logs.  

Furthermore, the attackers could transfer elements of the crime scene back with them, such as stolen user passwords or in a file or database. Such evidence can be useful to link an individual to an intrusion.  

In an e-mail harassment case, the act of sending threatening messages via a Web-based e-mail service such as Hotmail can leave a number of traces. The Web browser used to send messages will store les, links, and other information on the sender’s hard drive along with date-time related information.  

Forensic analysts may find an abundance of information relating to the sent message on the offender’s hard drive, including the original message contents.  

Additionally, investigators may be able to obtain related information from Hotmail, including Web server access logs, IP addresses, and possibly the entire message in the sent mail folder of the offender’s e-mail account.

### <mark style="background: #00ECFFA6;">Evidence Characteristics:</mark>

The exchanges that occur between individual and crime scene produce trace evidence belonging to one of two general categories: 
- (i) evidence with attributes that fit in the group called <mark style="background: #00ECFFA6;">class characteristics</mark> and 
- (ii) evidence with attributes that fall in the category called <mark style="background: #00ECFFA6;">individual characteristics</mark>.  

Class characteristics are common traits in similar items whereas individual characteristics are more unique and can be linked to a specific person or activity with greater certainty.  

Consider the physical world example of a shoe print left under a window at a crime scene.  

Forensic analysis of those impressions might only reveal the make and model of the shoe, placing it in the class of all shoes of the same make and model.  

If a suspect was found to be in possession of a pair of the same make and model, a tenuous circumstantial link can be made between the suspect and the wrongdoing. If forensic analysis uncovers detailed wear patterns in the shoe prints and finds identical wear of the suspect’s soles, a much stronger link is possible.  

The margin of error is significantly reduced by the discovery of an individual characteristic, making the link much less circumstantial and harder to refute

### <mark style="background: #00ECFFA6;">Forensics Soundness</mark> 

In order to be useful in an investigation, digital evidence must be preserved and examined in a forensically sound manner.  

Some practitioners of digital forensics think that a method of preserving or examining digital evidence is only forensically sound if it does not alter the original evidence source in any way. This is simply not true. Traditional forensic disciplines such as DNA analysis show that the measure of forensic soundness does not require the original to be left unaltered.  

When samples of biological material are collected, the process generally scrapes or smears the original evidence.  

Forensic analysis of the evidential sample further alters the sample because DNA tests are destructive. Despite the changes that occur during preservation and processing, these methods are considered forensically sound and DNA evidence is regularly admitted as evidence.

### <mark style="background: #00ECFFA6;">Forensics Soundness (example)</mark>

In digital forensics, the routine task of acquiring data from a hard drive, even when using a hardware write-blocker, alters the original state of the hard drive.  

Such alterations can include making a hidden area of the hard drive accessible, or updating information maintained by Self-Monitoring, Analysis, and Reporting Technology (S.M.A.R.T.) on modern hard drives.  

Furthermore, most methods of acquiring the contents of memory on live computer systems and mobile devices alter or overwrite portions of memory, but this is a generally accepted practice in digital forensics.  

In fact, courts are starting to compel preservation of volatile computer data in some cases, which requires digital investigators to preserve data on live systems.  

In Columbia Pictures Indus. v. Bunnell, for example, the court held that random access memory (RAM) on a Web server could contain relevant log data and was therefore within the scope of discoverable information in this case.

### <mark style="background: #00ECFFA6;">Types of Investigation</mark>

<mark style="background: #00ECFFA6;">Criminal:</mark> 
- Government agency is the plaintiff  
- Accused is the defendant  

<mark style="background: #00ECFFA6;">Civil:</mark>
- A dispute between two entities (public or private)  
- Either side can be the plaintiff or defendant

<mark style="background: #00ECFFA6;">Internal:</mark>
- An inquiry held within the confines of an organization (civil or federal) that is not meant for public review  
- May or may not be civil or criminal, but assume it could

### <mark style="background: #00ECFFA6;">Frameworks / Models:</mark>

<mark style="background: #00ECFFA6;">The following models will be discussed:</mark>
- DFRWS Digital Forensics Model: Evidence Handling Framework  
- The Basic Model (Kruse and Heiser)  
- The Casey Mode

### <mark style="background: #00ECFFA6;">DFRWS Digital Forensics Model: Evidence Handling Framework</mark> 

<mark style="background: #00ECFFA6;">Origin & Definition:</mark> The DFRWS model, introduced in 2001 by Gary Palmer at the inaugural DFRWS, provides a structured, technology-neutral process for digital forensic investigations. It outlines seven core phases:  
- Identification  
- Preservation  
- Collection  
- Examination  
- Analysis  
- Presentation  
- Decision

### <mark style="background: #00ECFFA6;">DFRWS phases:</mark>

<mark style="background: #00ECFFA6;">Identification:</mark> Recognizing potential digital evidence (e.g., cases, anomalies, system artifacts).  

<mark style="background: #00ECFFA6;">Preservation:</mark> Safeguarding integrity via imaging, chain-of-custody, timestamp synchronisation.  

<mark style="background: #00ECFFA6;">Collection:</mark> Acquiring evidence using approved methods and tools, and ensuring legal authority.  

<mark style="background: #00ECFFA6;">Examination:</mark> Applying pattern matching, hidden-data recovery, validation, and filtering techniques.  

<mark style="background: #00ECFFA6;">Analysis:</mark> Interpreting the extracted evidence using statistical methods, data mining, or timelines.  

<mark style="background: #00ECFFA6;">Presentation:</mark> Documenting findings, offering expert testimony, and suggesting responses.  

<mark style="background: #00ECFFA6;">Decision:</mark> Enabling final determination by legal or management authorities

### <mark style="background: #00ECFFA6;">DFRWS</mark>

The importance of this model.  

The DFRWS model remains a cornerstone in digital forensics, ensuring that investigations are conducted in a systematic, repeatable, and legally-defensible manner.  

It was the first formal, academic forensic process model, widely referenced across academic and practical domains.  

Serves as a foundation for many modern standards, including ISO, NIST, and forensic methodologies used in criminal and corporate contexts.

### <mark style="background: #00ECFFA6;">The Basic Model (Kruse and Heiser) </mark>
- Assess  
- Acquire  
- Analyse  
- Report

### <mark style="background: #00ECFFA6;">The Casey Model</mark>

<mark style="background: #00ECFFA6;">Revision of the basic model by Eoghan Casey:</mark>
- Identification/Assessment  
- Collection/Acquisition  
- Preservation  
- Examination  
- Analysis  
- Reporting

![[Pasted image 20250926105458.png]]

<mark style="background: #00ECFFA6;">Identification/Assessment:</mark>
- Define the scope of the examination  
- Collect all legal documentation needed  
- Get any permissions required for resources not covered by warrants  
- Identify the tools required  
- Identify the personnel needed  
- Identify the stakeholders

<mark style="background: #00ECFFA6;">Collection/Acquisition methods must assure</mark>
- Data is authentic  
- Sources of data are reliable  
- Nothing was modified throughout the process  
- All tools used are valid  
- Personnel are qualified to do their jobs  
- Enough evidence exists to prove a point  
- Conclusions are valid

<mark style="background: #00ECFFA6;">Preservation:</mark>
- NEVER work on original data sources 
- Forensically sound copies must be identical to originals 
- Media used to store copies must be uncontaminated  
- A chain of custody must be maintained

<mark style="background: #00ECFFA6;">Examination:</mark>
- All possible sources of data must be examined  
- File system  
- Slack space  
- Unallocated space  
- Hidden partitions  
- All tools used must be tested and verified

<mark style="background: #00ECFFA6;">Analysis:</mark>
- People other than the investigator may be called upon to examine data 
- Technique is as critical as the tools used  
- Exculpatory evidence is as critical as incriminating evidence

<mark style="background: #00ECFFA6;">Reporting:</mark>
- Actually begins when the assignment is accepted  
- First response documentation  
- Case documentation  
- Process documentation  
- Analysis and conclusion

### <mark style="background: #00ECFFA6;">Understanding Scope:</mark>

Defines precisely what can be searched and what is being looked for  

Can vary with the type of investigation  

Must never be exceeded

<mark style="background: #00ECFFA6;">Internal Investigations</mark>

<mark style="background: #00ECFFA6;">Civil Investigations:</mark>
- Intrusions  
- DOS Attacks  
- Malicious Code  
- Malicious Communication  
- Misuse of Resources

### <mark style="background: #00ECFFA6;">Possible Computer Crimes:</mark> 
- Auction or online retail fraud  
- Child Pornography  
- Child Endangerment  
- Counterfeiting  
- Cyberstalking  
- Forgery  
- Identity Theft  
- Piracy  
- Prostitution  
- Theft of Services

### <mark style="background: #00ECFFA6;">The Stakeholders</mark>  
- Principles (accused and accuser)  
- Decision makers  
- Mediator  
- Regulators  
- Management  
- Process owners

### <mark style="background: #00ECFFA6;">Documentation</mark>
- General case documentation  
- Procedural documentation  
- Process documentation  
- <mark style="background: #00ECFFA6;">Timelines:</mark> Case timeline, Process timeline 
- Chain of custody

### <mark style="background: #00ECFFA6;">Case Documentation:</mark>

Contact information for everyone involved  

<mark style="background: #00ECFFA6;">First response documentation:</mark>  
- Notes  
- Photographs  
- Videos  
- All legal authorisations

### <mark style="background: #00ECFFA6;">Procedural Documentation</mark>
- Every task that was performed related to the investigation (not process)  
- Summary of events  
- List of equipment seized  
- What steps were taken and what tools were used  
- Detailed analysis of the data

### <mark style="background: #00ECFFA6;">Process Documentation:</mark>
- User manuals  
- Installation manuals 
- README files  
- Update history logs  
- Results of testing

### <mark style="background: #00ECFFA6;">Timeline:</mark>

<mark style="background: #00ECFFA6;">Case timeline:</mark>
- Systematic analysis of what transpired  
- Times and dates of related events  
- MAC data of files involved  

<mark style="background: #00ECFFA6;">Procedural timeline:</mark>
- Detailed list of steps taken  
- Times and dates each step began and ended

### <mark style="background: #00ECFFA6;">Chain of Custody:</mark>  

<mark style="background: #00ECFFA6;">Begins when evidentiary materials are first seized:</mark>
- Time and date taken  
- From whom and where  
- Complete description of each item  

Every time an item changes hands, time, date and people involved  

There can be no gaps in history

### <mark style="background: #00ECFFA6;">Three Incidents</mark>

<mark style="background: #00ECFFA6;">MILNET:</mark> Via independent data carrier (Tymnet), a KGB-employed hacker seemed to have easily entered MILNET. It was discovered by chance in 1986 by a programmer at UC Berkeley.  

<mark style="background: #00ECFFA6;">Morris Worm:</mark> In 1988, Cornell student Robert Morris released the worm (self-replicating computer program), which quickly spread to over 6000 computers, causing millions in damages. Convicted for violating Computer Fraud and Abuse Act  

<mark style="background: #00ECFFA6;">AT&T crash:</mark> The crash occurred due to a software failure, demonstrating the vulnerability of  
telephone system. It was the result of self-named Legion of Doom, which may or may not have  
been a hacking menace.

Secret Service investigated, getting leads from the bragging of some and disclosure of a critical safety document by one.  

Federal law enforcement believed that the business, Steve Jackson’s Games, was a critical player in these actions, but it was only one employee. Their overreaction embarrassed the agency.  

<mark style="background: #00ECFFA6;">Early hackers included:</mark>  
- Kevin Mitnick (perhaps the most famous)  
- cOmrade (first teen to be incarcerated for hacking)  
- Terminus (Unix programmer & AT&T minicomputer expert)  
- Shadowhawk (breaking and entering into U.S. Missile Command)

### <mark style="background: #00ECFFA6;">Phreakers: Yesterday’s Hackers </mark> 

<mark style="background: #00ECFFA6;">Phreaking:</mark> Manipulation of telecommunications carriers to gain knowledge of telecommunications, and/or theft of applicable services: 
- Illegal use, 
- manipulation of access codes, 
- access tones, 
- PBXs, 
- or switches  

<mark style="background: #00ECFFA6;">Methods:</mark>
- Social engineering, like shoulder surfing, stealing codes while people are dialing  
- Use of blue boxes, devices that deceived switching system to put through a call for free  
- Some approaches became dated due to changes in phone equipment. New strategies were constantly developed, such as with the theft and sale of stolen access codes ("call-sell" operations).

### <mark style="background: #00ECFFA6;">Evolution in the Hacking Community</mark>

In the 1960s, “hacking” by MIT students was more benign. Hackers would look for computer shortcuts, engage in clever pranks; would "hack" a way at a problem until solution was found. 
- Those with criminal intentions were initially called "crackers."  
- “Hacking” now refers to both benign and criminal activities.  

<mark style="background: #00ECFFA6;">Initially:</mark>
- Hacking was conducted via role-playing games, by young, socially inept individuals fascinated with computer technology. 
- Some advocated anti-establishment ideology, but others were motivated to hack telephone exchanges because of the costs associated with downloading.

### <mark style="background: #00ECFFA6;">Contemporary Hacking Communities</mark> 

Most of the original ideology is gone.  

<mark style="background: #00ECFFA6;">Contemporary motivation includes:</mark>  
- Profit, economic goals (like theft)  
- Revenge (for example, by insiders such as disgruntled employees)  
- Personal notoriety  
- Relief from boredom  
- Informational voyeurism (what's there to see?)  
- Intellectual challenge (hacking as a way to mine for knowledge) 
- Sexual gratification (stalking, harassment)  
- Political goals (the aims of terrorists and spies)

### <mark style="background: #00ECFFA6;">Hierarchy of Contemporary Cyber-Criminals</mark>


<mark style="background: #00ECFFA6;">Script kiddies:</mark>
- Inexperienced hackers who use others' programs (like scripts) to exploit vulnerabilities and compromise computer systems, but they don't understand these programs  
- Also known as skidiots, skiddie, or Victor Skill Deficiency (VSD)  
<mark style="background: #00ECFFA6;">Cyberpunks:</mark>
- Name used by law enforcement for those who wreak havoc on the Internet  
- Not its original, more benign meaning  

<mark style="background: #00ECFFA6;">Hackers/Crackers:</mark> Sophisticated computer criminals  

<mark style="background: #00ECFFA6;">Cyber-criminal organisations:</mark> Greater threat

### <mark style="background: #00ECFFA6;">Social Engineering</mark> 

Social engineering takes advantage of people who use technology.  
- Insiders may be the most dangerous, whether by accident or intentionally
- Can reduce risks through security awareness training