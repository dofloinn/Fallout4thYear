# <mark style="background: #00ECFFA6;">01 Introduction</mark>

### <mark style="background: #00ECFFA6;">The Definition and Importance of Computer Forensics</mark>

Computer forensics is the retrieval, analysis, and use of digital evidence in a civil or criminal investigation.

Any medium that can store digital files is a potential source of evidence for a computer forensics investigator.

Computer forensics is a science because of the accepted practices used for acquiring and examining the evidence and its admissibility in court.

<mark style="background: #00ECFFA6;">Forensically sound</mark> means that during the acquisition of digital evidence and throughout the investigative process the evidence must remain in its original state.

Moreover, everyone who has been in contact with the evidence must be accounted for and documented in the Chain of Custody form

### <mark style="background: #00ECFFA6;">The Importance of Computer Forensics</mark>

<mark style="background: #00ECFFA6;">Crime Investigation:</mark>
- Helps law enforcement agencies solve cybercrimes such as hacking, fraud, cyberbullying, terrorism, and identity theft.
- Provides digital evidence that can be legally admissible in court.

<mark style="background: #00ECFFA6;">Corporate Security:</mark>
- Detects insider threats, data leaks, and intellectual property theft.
- Investigates policy violations within organisations.

<mark style="background: #00ECFFA6;">Incident Response:</mark>
- Identifies how cyberattacks occurred, the scope of damage, and the techniques used by attackers.
- Helps prevent future incidents by analysing weaknesses.

<mark style="background: #00ECFFA6;">Data Recovery & Integrity:</mark>
- Recovers deleted, hidden, or encrypted files.
- Maintains the chain of custody so evidence remains authentic and un-tampered.

<mark style="background: #00ECFFA6;">Legal and Compliance Needs:</mark>
- Many industries (banking, healthcare, government) require forensic practices for compliance.
- Ensures that organisations meet regulations like GDPR, HIPAA, etc.

<mark style="background: #00ECFFA6;">National Security:</mark>
- Tracks cyber terrorism, espionage, and cross-border cyber threats.
- Provides intelligence for defense and security agencies

### <mark style="background: #00ECFFA6;">Terminology:</mark>

<mark style="background: #00ECFFA6;">U.S. Computer Emergency Response Team (US-CERT):</mark> 
- "...define computer forensics as the discipline that combines elements of law and computer science to collect and analyse data from computer systems, networks, wireless communications, and storage devices in a way that is admissible as evidence in a court of law."
- Source: https://www.cisa.gov/sites/default/files/publications/forensics.pdf

<mark style="background: #00ECFFA6;">NIST Special Publication 800-86, “Guide to Integrating Forensic Techniques into Incident Response”:</mark>
- "Digital forensics, also known as computer and network forensics... is considered the application of science to the identification, collection, examination, and analysis of data while preserving the integrity of the information and maintaining a strict chain of custody for the data."
- Source: https://nvlpubs.nist.gov/nistpubs/legacy/sp/nistspecialpublication800-86.pd

One of the main difficulties in defining computer crime is that situations arise where a computer or network was not directly involved in a crime but still contains digital evidence related to the crime.

As an extreme example, take a suspect who claims that she was using the Internet at the time of a crime. Although the computer played no role in the crime, it contains digital evidence relevant to the investigation.

To accommodate this type of situation, the more general term computer-related is used to refer to any crime that involves computers and networks, including crimes that do not rely heavily on computers.

Notably, some organisations, such as the U.S. Department of Justice and the Council of Europe, use the term cybercrime to refer to a wide range of crimes that involve computers and networks.

In an effort to be inclusive and most useful for practical application, the material in this course covers digital evidence as it applies to any crime and delves into specific computer crimes that are defined by laws in various countries.

The term digital investigation is used throughout this course to encompass any and all investigations that involve digital evidence, including corporate, civil, criminal, and military.

The term <mark style="background: #00ECFFA6;">computer forensics</mark> also means different things to different people.

Computer forensics usually refers to the forensic examination of computer components and their contents such as hard drives, compact disks, and printers.

However, the term is sometimes used more loosely to describe the forensic examination of all forms of digital evidence, including data travelling over networks (a.k.a. network forensics).

To confuse matters, the term computer forensics has been adopted by the information security community to describe a wide range of activities that have more to do with protecting computer systems than gathering evidence.

As the field has developed into several distinct sub disciplines, including malware forensics and mobile device forensics, the more general term digital forensics has become widely used to describe the field as a whole.

### <mark style="background: #00ECFFA6;">Agencies Involved in Computer Forensics Investigations</mark>
- Federal Bureau of Investigation
- U.S. Internal Revenue Service
- United States Secret Service
- Federal Law Enforcement Training Center
- National White Collar Crime Center
- INTERPOL
- High Tech Crime Investigation Association
- Computer Technology Investigators Network
- InfraGard
- An Garda Siochána
- New Scotland Yard

### <mark style="background: #00ECFFA6;">Case Studies</mark>

Digital forensic case studies (Notion Digital Forensics)
https://notiondigitalforensics.com.au/digital-forensics-case-studies

Case studies (NHS Counter Fraud Authority)
https://cfa.nhs.uk/about-nhscfa/digital-forensics-unit/cases

### <mark style="background: #00ECFFA6;">What is File Carving:</mark>

<mark style="background: #00ECFFA6;">File carving</mark> is a process used in digital forensics.

It looks at extracting data from a drive (storage device) without using the file system.

Carving is extracting structured data from a larger set of raw data based on characteristics(patterns) in the raw data.

<mark style="background: #00ECFFA6;">Carving is a powerful process to a digital investigation by:</mark>
- Identifying and recovering from raw, deleted or damaged file systems, memory, or swap space data
- Recovering files not recognised by the OS or the file system

File Carving is a digital forensics technique used to recover files from un-allocated disk space, memory dumps, or corrupted storage when the file system structures (like FAT, NTFS, or ext tables) are missing or damaged.

File carving is the process of reassembling files from raw data fragments on a disk or memory image, based only on file content (signatures, headers/footers, patterns) rather than metadata like filenames, timestamps, or directory paths.

### <mark style="background: #00ECFFA6;">Why Carve?</mark>
- A deleted file may no longer appear in the file system, but its raw data is still present on the disk.
- A forensic tool (e.g., Scalpel, Foremost, Autopsy, X-Ways) can carve that image out by recognising the JPEG header and footer in raw binary data.
- Applications
- Recovering deleted files (photos, videos, documents).
- Data breach investigations (finding hidden or wiped evidence).
- Memory forensics (retrieving executable fragments from RAM dumps).
- Disaster recovery (extracting files from damaged storage devices).

### <mark style="background: #00ECFFA6;">Limitations of Carving:</mark>

Works best for non-fragmented files.

Carved files may lack metadata (filename, creation date).

Highly fragmented files (like large videos) can be partially unrecoverable without context.

### <mark style="background: #00ECFFA6;">File Header:</mark>

A header is a sequence of bytes (in hexadecimal or ASCII) at the beginning of a file.

It usually includes the magic number, and it can identify the file type and sometimes contains metadata (like format version, size, encoding, etc.).

<mark style="background: #00ECFFA6;">Example (in hex):</mark>
- JPEG: starts with FFD8 (FF D8 FF)
- PDF: starts with %PDF (25 50 44 46).
- ZIP: starts with 50 4B 03 04.

Think of the header as the file’s “opening tag”.

<mark style="background: #00ECFFA6;">Magic Number:</mark> A magic number is a specific sequence of bytes at the very beginning of a file. Its main purpose: identify the file type.

### <mark style="background: #00ECFFA6;">File Footer:</mark>

A footer (also called a trailer) is a sequence of bytes that appears at the end of a file.

It indicates the file’s conclusion.

<mark style="background: #00ECFFA6;">Example (in hex):</mark>
- JPEG: ends with FFD9
- PDF: ends with \%%EOF.
- Some file types (like MP3) don’t have a fixed footer — carving those requires structure analysis.

Think of the footer as the file’s “closing tag”.

### <mark style="background: #00ECFFA6;">Headers / Magic Numbers:</mark>

| File Type     | Magic Number (Hex)           | ASCII Equivalent |
| ------------- | ---------------------------- | ---------------- |
| JPEG          | FF D8 FF E0 (or FF D8 FF E1) | —                |
| PNG           | 89 50 4E 47 0D 0A 1A 0A      | ‰PNG….           |
| PDF           | 25 50 44 46                  | %PDF             |
| ZIP           | 50 4B 03 04                  | PK..             |
| GIF           | 47 49 46 38                  | GIF8             |
| EXE (Windows) | 4D 5A                        | MZ               |

### <mark style="background: #00ECFFA6;">Identifying a file on a disk:</mark>
- Each file will have a header and footer distinguishing the beginning and end of the file.
- Each file type will have a unique header/footer
- The header can also be referred to as a magic number.
- On the disk we are trying to identify specific types of file headers and/or footers and carve out blocks between these two markers
- Not all files have standard footers, these can be difficult to work with.
- Depending on the filesystem the data can be in different locations, we will see this in more detail in week 3.

### <mark style="background: #00ECFFA6;">Types of carving:</mark>

<mark style="background: #00ECFFA6;">Header to Footer Carving:</mark>
- Most file types have standard headers and footers
- To recover data an analyst can carve out everything between the JPEG header and footer to recover the image file.
- A hex editor can be used to work with the disk / image.

<mark style="background: #00ECFFA6;">File Structure Based Carving:</mark>
- This uses the internal layout of a file
- This looks at the header, footer and the file metadata
- Popular carvers use this technique (eg. Photorec and Scapel)

<mark style="background: #00ECFFA6;">Content-based carving:</mark>
- This is used to recover file data that has not been recovered from file structure carving.
- This uses machine learning and statistic-based algorithms to look for statistical patterns or signatures indicating language or file content.
- All possible data clusters are gathered that appear to be related to the image. These are used to try extract and find meaningful data/information.

<mark style="background: #00ECFFA6;">Potential Issues:</mark>
- No entry in the File table for a given file
- File just exists in unallocated space.
- File still exists in unallocated space but some sectors have been reused
- Files may be incomplete, e.g. Start, end, middle sectors may have been reused
- Majority of file carving programs will only recover files that are contiguous
- Files on SSDs may be fragmented, e.g. out-of-order and missing sectors

### <mark style="background: #00ECFFA6;">Scalpel:</mark>

Scalpel is a file carving and indexing application that runs on Linux and Windows. The first version of Scalpel, released in 2005, was based on Foremost 0.69. There have been a number of internal releases since the last public release, 1.60, primarily to support our own research.

As of 6/27/2013 Scalpel has been released under the Apache 2.0 License and the source is available at The Sleuth Kit github repository.

Source: https://github.com/sleuthkit/scalpel

### <mark style="background: #00ECFFA6;">PhotoRec:</mark>

PhotoRec is file data recovery software designed to recover lost files including video, documents and archives from hard disks (Mechanical Hard drives, Solid State Drives...), CD-ROMs, and lost pictures (thus the Photo Recovery name) from digital camera memory. PhotoRec ignores the file system and goes after the underlying data, so it will still work even if your media's file system has been severely damaged or reformatted.

Autopsy uses PhotoRec as part of its ingest modules.

Source: https://www.cgsecurity.org/wiki/PhotoRec

# <mark style="background: #00ECFFA6;">02 Intro to Digital Forensics and Models</mark>

<mark style="background: #00ECFFA6;">Overview:</mark>
- What is digital forensics?
- Forensic examination
- Anatomy of an investigation
- Digital Forensic Models
- Chain of Custody
- Incidents and Hacking

### <mark style="background: #00ECFFA6;">Introduction:</mark>

In this module we will look at what computer forensics is and what can be achieved.  

A variety of freely available tools will be used for our practical examples (as proprietary tools can be very expensive – but very feature rich and fit for purpose)  

We can’t cover every type of case. The focus is to show how to implement a forensically sound process to examine digital evidence using forensic tools.

### <mark style="background: #00ECFFA6;">What is Digital Forensics?</mark>

Digital forensics is analysis of digital devices to determine what has happened.  

This could be to determine if a crime has been committed. There are different types of infractions, this could be a civil matter or breach of company policy etc.  

<mark style="background: #00ECFFA6;">Definition:</mark> Computer forensics is the application of investigation and analysis techniques to gather and preserve evidence from a particular computing device in a way that is suitable for presentation in a court of law. The goal of computer forensics is to perform a structured investigation and maintain a documented chain of evidence to find out exactly what happened on a computing device and who was responsible for it. (Source: TechTarget: https://www.techtarget.com/searchsecurity/definition/computer-forensics

### <mark style="background: #00ECFFA6;">Forensic Examinations:</mark>

Digital forensics is the practice of collecting, analysing and reporting on digital data.  

There is usually a specific need for the investigation, i.e. Has a particular event occurred?  

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

<mark style="background: #00ECFFA6;">Open computer systems:</mark> Open computer systems are what most people think of as computers - systems comprised of hard drives, keyboards, and monitors such as laptops, desktops, and servers that obey standards.  

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

<mark style="background: #00ECFFA6;">Includes:</mark>
- Network logs (routers, firewalls, intrusion detection/prevention systems).  
- Server logs (web servers, DNS, email servers).  
- Packet captures (PCAPs) from monitoring tools like Wireshark.  
- Cloud services (Google Drive, iCloud, Dropbox).

<mark style="background: #00ECFFA6;">Examples:</mark> A financial institution reports a suspected cyber intrusion where attackers may have accessed customer data. Forensic investigators analyse the organisation’s network logs.

<mark style="background: #00ECFFA6;">Firewall Logs:</mark> Detected multiple failed login attempts from foreign IPs, followed by a successful login at 3:12 AM.

<mark style="background: #00ECFFA6;">Intrusion Detection System (IDS) Alerts:</mark> Flagged abnormal outbound traffic patterns - large encrypted data transfers to an unknown server.

<mark style="background: #00ECFFA6;">Web Server Logs:</mark>
- Showed exploitation of a vulnerable login form (SQL injection attack).  
- Logs included attacker’s IP address and request payloads.  

<mark style="background: #00ECFFA6;">Packet Capture (PCAP):</mark> Analysis of packet data revealed exfiltration of customer records (names, account numbers).

### <mark style="background: #00ECFFA6;">Internet & Online Services</mark>  

<mark style="background: #00ECFFA6;">Includes:</mark>
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

<mark style="background: #00ECFFA6;">Includes:</mark>
- USB drives, SD cards, external HDDs/SSDs.  
- IoT devices (smart TVs, smart speakers, wearables like Fitbit/Apple Watch). 
- Vehicle infotainment systems (GPS routes, Bluetooth logs).

<mark style="background: #00ECFFA6;">Example:</mark> During a corporate fraud investigation, forensic analysts search an employee’s office and find a USB flash drive hidden in a drawer.  

<mark style="background: #00ECFFA6;">File Storage:</mark>
- Contained encrypted spreadsheets with detailed records of unauthorised financial transfers.  
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

Therefore, in addition to being technically prepared for such incidents, it is important for organisations and system administrators to have clear policies and procedures for responding to these problems

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

In computer intrusions, the attackers will leave multiple traces of their presence throughout the environment, including in the file systems, registry, system logs, and network-level logs.

Furthermore, the attackers could transfer elements of the crime scene back with them, such as stolen user passwords or in a file or database. Such evidence can be useful to link an individual to an intrusion.

In an e-mail harassment case, the act of sending threatening messages via a Web-based e-mail service such as Hotmail can leave a number of traces. The Web browser used to send messages will store files, links, and other information on the sender’s hard drive along with date-time related information.

Forensic analysts may find an abundance of information relating to the sent message on the offender’s hard drive, including the original message contents.

Additionally, investigators may be able to obtain related information from Hotmail, including Web server access logs, IP addresses, and possibly the entire message in the sent mail folder of the offender’s e-mail account.

### <mark style="background: #00ECFFA6;">Evidence Characteristics:</mark>

The exchanges that occur between individual and crime scene produce trace evidence belonging to one of two general categories: 
- evidence with attributes that fit in the group called <mark style="background: #00ECFFA6;">class characteristics</mark>.
- evidence with attributes that fall in the category called <mark style="background: #00ECFFA6;">individual characteristics</mark>.  

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
- An inquiry held within the confines of an organisation (civil or federal) that is not meant for public review  
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

<mark style="background: #00ECFFA6;">Identification:</mark> Recognising potential digital evidence (e.g., cases, anomalies, system artifacts).  

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

<mark style="background: #00ECFFA6;">Includes:</mark>
- General case documentation  
- Procedural documentation  
- Process documentation  
- <mark style="background: #00ECFFA6;">Timelines:</mark> Case timeline, Process timeline 
- Chain of custody

<mark style="background: #00ECFFA6;">Case Documentation:</mark> Contact information for everyone involved  

<mark style="background: #00ECFFA6;">First response documentation:</mark>  
- Notes  
- Photographs  
- Videos  
- All legal authorisations

<mark style="background: #00ECFFA6;">Procedural Documentation</mark>
- Every task that was performed related to the investigation (not process)  
- Summary of events  
- List of equipment seized  
- What steps were taken and what tools were used  
- Detailed analysis of the data

<mark style="background: #00ECFFA6;">Process Documentation:</mark>
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

<mark style="background: #00ECFFA6;">AT&T crash:</mark> The crash occurred due to a software failure, demonstrating the vulnerability of telephone system. It was the result of self-named Legion of Doom, which may or may not have been a hacking menace.

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
- Social engineering, like shoulder surfing, stealing codes while people are dialling  
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

Social engineering takes advantage of people who use technology

Insiders may be the most dangerous, whether by accident or intentionally

Can reduce risks through security awareness training

# <mark style="background: #00ECFFA6;">04 EXIF and Steganography</mark>

A hardware write blocker is <mark style="background: #00ECFFA6;">HARDWARE</mark>

It prevents any writes being made to what's plugged in.

<mark style="background: #00ECFFA6;">Class example:</mark>
- USB is plugged into the "Hardware Write Blocker" (Jonathan's cardboard box)
- "Hardware Write Blocker" is plugged into laptop
- USB appears in laptop
- Cannot make any changes to the USB contents
- This is a forensically sound process

### <mark style="background: #00ECFFA6;">EXIF Metadata</mark>

<mark style="background: #00ECFFA6;">Overview:</mark>
- What is EXIF Data?  
- What does EXIF store?  
- Categories of Data Stored in EXIF  
- Forensic Importance  
- Forensics Usefulness  
- EXIF – What to look for  
- In-Class Demo

### <mark style="background: #00ECFFA6;">What is EXIF Data?</mark>

<mark style="background: #00ECFFA6;">EXIF</mark> stands for Exchangeable Image File Format.  

It’s a metadata standard that stores information about a digital image or media file, usually embedded directly into the file itself.  

Exif is supported by almost all camera manufacturers.  

<mark style="background: #00ECFFA6;">Example:</mark> When you take a photo with a digital camera or smartphone, the device automatically records details about the picture — this is the EXIF metadata.

### <mark style="background: #00ECFFA6;">What does EXIF store</mark>

<mark style="background: #00ECFFA6;">The metadata tags defined in the Exif standard cover a wide range:</mark>
- Camera settings (camera model and make, lens, shutter speed etc...)  
- Image metrics (Pixel dimensions, resolution, colorspace, and filesize)  
- Date and time information  
- Location Information  
- A thumbnail for previewing the picture  
- Description (text)  
- Copyright Info

### <mark style="background: #00ECFFA6;">Categories of Data Stored in EXIF</mark>

<mark style="background: #00ECFFA6;">Camera / Device Information:</mark>
- Camera make and model (e.g., Nikon D3500, iPhone 14 Pro)  
- Lens type and serial number  
- Firmware or software version  

<mark style="background: #00ECFFA6;">Image Capture Settings:</mark>
- Resolution and dimensions (e.g., 4000 × 3000 pixels)  
- Orientation (portrait/landscape)  
- Exposure time (shutter speed)  
- Aperture (f-stop)  
- ISO sensitivity  
- White balance  
- Focal length  
- Flash (on/off, fired/not fired)  

<mark style="background: #00ECFFA6;">Date & Time:</mark>
- Date and time of capture  
- Time zone (sometimes)  

<mark style="background: #00ECFFA6;">Geolocation (if GPS is enabled):</mark>
- Latitude & longitude  
- Altitude  
- GPS timestamp  
- Direction (compass heading)  

<mark style="background: #00ECFFA6;">File & Image Info:</mark>
- File size  
- Compression type (JPEG, RAW, etc.)  
- Colour space (sRGB, Adobe RGB)  
- Thumbnail preview image  

<mark style="background: #00ECFFA6;">Editing / Software Info:</mark>
- Software used to edit/save the photo (e.g., Adobe Photoshop, GIMP, Snapseed)  
- History of edits (sometimes limited)

### <mark style="background: #00ECFFA6;">Forensic Importance</mark>

Identify device used (helps link suspect’s phone/camera to photos).  

Reconstruct events (timestamps, GPS tags).  

<mark style="background: #00ECFFA6;">Detect tampering</mark> (metadata inconsistencies → possible manipulation).  

Chain of evidence (proves authenticity if metadata aligns with logs).

### <mark style="background: #00ECFFA6;">Forensics Usefulness</mark>

<mark style="background: #00ECFFA6;">What can be useful to a forensic investigation:</mark>
- Camera make and model  
- Device name  
- Time when the picture was taken  
- GPS coordinates describing where the picture was taken  
- Serial number of the device that took the picture  
- Name of the person who took the image  
- EXIF data is the information that was available to the device when the picture was taken.
 
### <mark style="background: #00ECFFA6;">EXIF – What to look for</mark>

Some EXIF data features can be turned off.  

When files are uploaded to web platforms the EXIF metadata can be removed.  

For a forensic investigation it is always good to find pictures relating to the case.  

It will be important to determine where, when, and with what device the pictures were taken.

### <mark style="background: #00ECFFA6;">Steganography with Steghide</mark>

<mark style="background: #00ECFFA6;">Steganography:</mark> concealing a message within another message or a physical object

“Steghide is a steganography program that is able to hide data in various kinds of image- and audio-files. The colour- respectively sample-frequencies are not changed thus making the embedding resistant against first-order statistical tests.”

<mark style="background: #00ECFFA6;">Stegdetect</mark> is an automated tool for detecting steganographic content in images. It is capable of detecting several different steganographic methods to embed hidden information in JPEG images.  

<mark style="background: #00ECFFA6;">Machine Learning:</mark>  
- Detection of Image Steganography Using Deep Learning and Ensemble Classifiers  
- Using machine learning to analyse and improve digital images, the practice of steganalysis is gaining in popularity.

<mark style="background: #00ECFFA6;">Command to hide:</mark>
`steghide embed -cf earth.jpg -ef Forensics_Open_Book_Exam_2020.pdf`

<mark style="background: #00ECFFA6;">Breakdown:</mark>
- steghide — The name of the program  
- embed — This is the command  
- -cf - This flag is for the cover file (file used to embed data)  
- filename - This is the name of the cover file (earth.jpg)  
- -ef - This flag is for the embed file (file that will be embedded)  
- filename - This is the name of the embedded file (Forensics_Open_Book_Exam_2020.pdf)

<mark style="background: #00ECFFA6;">Command to extract:</mark>
`steghide extract -sf Clouds.JPG`

# <mark style="background: #00ECFFA6;">05 Case Management & Report Writing and Tools of the Digital Investigator</mark>

### <mark style="background: #00ECFFA6;">What’s the Big Deal?</mark>
- Each case is a project  
- Any misstep will be pounced upon by the opposition  
- Managing the case as a project helps avoid errors in procedure  
- Good reporting allows you to demonstrate good process

### <mark style="background: #00ECFFA6;">Managing a Case</mark>

<mark style="background: #00ECFFA6;">Case flow can be divided into three stages:</mark>
- Preparation  
- Investigation  
- Presentation  

These three stages map well to the Investigative Model

<mark style="background: #00ECFFA6;">Preparation:</mark>
- Done outside the scope of a conventional investigation  
- Involves “creating” the case investigation team/department  
- Policies and procedures are defined  
- Team roles are defined

<mark style="background: #00ECFFA6;">Investigation:</mark>
- Triage  
- First response  
- Scene management  
- Lab preparation  
- Evidence handling  
- Evidence examination

<mark style="background: #00ECFFA6;">Triage:</mark>
- Assess any risks (to people, systems, or data)  
- Mitigate as many risks as possible  
- Determine priorities  
- Is saving the data more important than nabbing the culprit?  
- Is identifying the culprit worth a financial loss?

<mark style="background: #00ECFFA6;">First Response:</mark>
- Use the crime scene first-response protocols whenever possible
- Determine the best method for collecting evidence  
- Perform live-response if necessary  
- Collect evidentiary materials in a forensically sound manner

<mark style="background: #00ECFFA6;">Crime Scene Management:</mark>
- Preserve the scene for other investigators  
- Survey the scene  
- Document the scene (with photos and videos)  
- Search the scene  
- Try to virtually reconstruct the crime

### <mark style="background: #00ECFFA6;">Lab Preparation:</mark> 

<mark style="background: #00ECFFA6;">Steps:</mark>
- Prepare a repository for digital evidence 
- Sufficient storage  
- Sufficient security  
- Ensure proper tools are ready  
- Ensure personnel are ready to receive evidentiary materials

### <mark style="background: #00ECFFA6;">Evidence Handling</mark>
- Prevent environmental contamination  
- Block electromagnetic transmissions  
- Maintain excellent chain of custody logs  
- Have a way to keep devices powered during transport  
- Don’t damage anything!
- Use the right tool for the job  
- Document everything you do  
- Never touch the originals

### <mark style="background: #00ECFFA6;">Presentation Stage</mark>  
- Avoid interpretation of results  
- Present all evidence, both incriminating and exculpatory  
- Be prepared to back up any statements or findings in the reports

### <mark style="background: #00ECFFA6;">Report Writing</mark>

<mark style="background: #00ECFFA6;">Contents of the final report:</mark>
- Case summary  
- Authorisations, warrants, and subpoenas  
- Procedural documentation  
- All case notes  
- All photographs and videos  
- A conclusion

<mark style="background: #00ECFFA6;">Case Summary</mark>
- Who requested the investigation?  
- Who are the principles involved?  
- When did the incident occur?  
- When was the report filed?  
- What allegedly happened?

<mark style="background: #00ECFFA6;">Procedural Documentation:</mark>
- An inventory of items examined  
- A list of tools used  
- A time line of procedures performed  
- A list of people who performed these procedures  
- Before/after hash values of each evidence image

<mark style="background: #00ECFFA6;">Findings:</mark>
- Details of how findings were obtained (tools used, search strings, etc.)  
- Results of each action described in the procedural documentation  
- A time line that puts the activities in perspective

<mark style="background: #00ECFFA6;">Report Conclusion:</mark>
- Ties all of the other parts of the report together  
- Presents evidence either supporting or refuting the initial claim  
- Does NOT support or refute the claim

### <mark style="background: #00ECFFA6;">How to Write a Digital Forensics Report</mark>

<mark style="background: #00ECFFA6;">What is a digital forensics report?</mark>
- A digital forensics report is a formal document that presents the findings of a digital investigation, often related to cybercrime, internal audits, or data breaches.  
- The report must be clear, structured, and contain all relevant details necessary for non-technical readers such as legal professionals or management, as well as technical experts.

<mark style="background: #00ECFFA6;">Structure of a report:</mark> 
- There really isn’t a de-facto standard or format for forensics report writing.  
- Formatting and layout options are up to the examiner/analyst or they may be required to follow a template for organisational policies or jurisdictional court rules.  
- The following slide goes through a sample structure.

<mark style="background: #00ECFFA6;">Structure of a report (sample):</mark>
- Title Page  
- Table of Contents  
- Overview / Case  
- Evidence  
- Objectives  
- Forensic Analysis (Steps Taken)  
- Relevant Findings  
- Conclusion

### <mark style="background: #00ECFFA6;">Structure of a report:</mark>

<mark style="background: #00ECFFA6;">Title Page:</mark> Basic details of the case name, name of report writer / investigators, contact info  

<mark style="background: #00ECFFA6;">Table of Contents:</mark> Apply a structure to the report and offer a ToC at the top of the report. 

<mark style="background: #00ECFFA6;">Overview:</mark> 
- Overview and a summary of the case. 
- What has been asked for with respect to the investigation (what are we doing?)

<mark style="background: #00ECFFA6;">Evidence:</mark>
- Present the details of the evidence in our chain of custody  
- Description of the hardware, make, model, serial numbers, description, condition, hash values etc...  

<mark style="background: #00ECFFA6;">Objectives:</mark> Describe in detail what you were specifically being asked to do for this investigation  

<mark style="background: #00ECFFA6;">Forensic Analysis (Steps Taken):</mark>
- This is what you did as part of your forensics investigation  
- What tools you used (make, model, and version of software etc...).  
- The steps taken, thoroughly documenting what you have done  
- This section is very important, try describe everything in granular detail

### <mark style="background: #00ECFFA6;">Structure of a report</mark>

<mark style="background: #00ECFFA6;">Relevant Findings:</mark>
- This will be a very detailed section of the report  
- Include all artifacts and relevant findings that you found as part of your investigation  

<mark style="background: #00ECFFA6;">Analysis and Interpretation:</mark>  
- <mark style="background: #00ECFFA6;">Data Recovery:</mark> Mention any data recovered (e.g., deleted files, artifacts, chat logs).  
- <mark style="background: #00ECFFA6;">User Actions:</mark> Identify any actions taken by users (e.g., file access, external drive connections).  
- <mark style="background: #00ECFFA6;">Indicators of Compromise (IoCs):</mark> List any signs of compromise, such as malware, unauthorised logins, or suspicious activity.  

Each piece of evidence must offer a description that a layperson would understand

<mark style="background: #00ECFFA6;">Timeline:</mark> Create a timeline based on the forensic analysis (e.g., access times, login attempts, file modifications etc..).  

<mark style="background: #00ECFFA6;">Conclusion:</mark>
- Summary of the investigation, process followed and the findings  
- Any recommendations for further investigation

### <mark style="background: #00ECFFA6;">What’s Soft and What’s Hard?</mark>

<mark style="background: #00ECFFA6;">Hardware tools are physical devices:</mark>
- Computing tools  
- Data capture tools  

<mark style="background: #00ECFFA6;">Software tools run on physical devices:</mark>
- OS utilities  
- Forensic suites  
- Open source tools

### <mark style="background: #00ECFFA6;">Tool Types</mark>
- Media capture and analysis  
- Memory capture and analysis  
- Application analysis  
- Network capture and analysis

### <mark style="background: #00ECFFA6;">Data Abstraction Layers</mark> 

Moving information from thought to electronic impulse and back goes through a number of doors  

On an electronic level, data is not humanly readable  

On the human level, the CPU can’t function  

Abstraction layers move up and down the spectrum

![[Pasted image 20251010102439.png]]

### <mark style="background: #00ECFFA6;">Measuring Suitability of Tools</mark>

<mark style="background: #00ECFFA6;">Four necessary traits:</mark>
- Accuracy  
- Verification capabilities  
- Consistency  
- Usability  

If even one trait is lacking the tool is unsuitable

### <mark style="background: #00ECFFA6;">The Daubert Test</mark>

<mark style="background: #00ECFFA6;">From the court case Daubert v. Merrell Dow Pharmaceuticals:</mark>
- Can the evidence presented be or has it been tested empirically and can it be falsified?  
- Has the approach or technique been the subject of peer review and publication?  
- Is the technique generally accepted within the scientific or professional community?  
- Does the technique or procedure contain a high known or potential rate of error?

### <mark style="background: #00ECFFA6;">OS Utilities</mark>
- Windows  
- Linux/Unix  
- Macintosh (a Unix derivative)

<mark style="background: #00ECFFA6;">Windows Utilities</mark>  
- Regedit (Windows Registry Editor)  
- Event Viewer  
- Task Manager  
- Powershell  
- Command Prompt  
- Windows Sysinternals Suite   
- Prefetch and Superfetch  
- Volume Shadow Copy Service (VSS)  
- File History and System Restore  
- Windows Memory Dump Files  
- Backup Utilities  
- BitLocker Encryption Tools

<mark style="background: #00ECFFA6;">Linux Utilities:</mark>
- Disk Dump (DD)  
- dcfldd: A forensic-enhanced version of dd  
- GREP  
- Linux Disk Editor  
- PhotoRec  
- fdisk, gparted  
- hexdump  
- grep / find  
- stat  
- netstat  
- wireshark / tcpdump  
- auditd  
- Log files  
- Foremost

<mark style="background: #00ECFFA6;">Commercial Suites:</mark>
- EnCase Forensic (by OpenText)  
- FTK (Forensic Toolkit) by Exterro  
- Magnet AXIOM (by Magnet Forensics)  
- X-Ways Forensics  
- Cellebrite UFED  
- OS Forensics  
- Paladin Forensic Suite

<mark style="background: #00ECFFA6;">Open Source Applications:</mark>
- Autopsy  
- Sleuthkit  
- SafeCopy  
- Metaviewer  
- Disk Investigator  
- Directory Snoop 
- WinHex

<mark style="background: #00ECFFA6;">Court Approved Tools:</mark>
- There is no such thing  
- Many tools have been acknowledged by individual courts or precincts  
- National Institute of Standards and Testing performs independent tests  
- To be accepted in court: test, verify, understand, and be able to explain the tool

<mark style="background: #00ECFFA6;">Hardware Tools:</mark>
- A standard tool kit  
- Write-protect interfaces for making images  
- External storage for archiving images  
- Forensic workstations for analysing data

<mark style="background: #00ECFFA6;">Non-Technical Tools:</mark>
- Digital camera  
- Video camera  
- Audio recorder  
- Anti-static bags  
- Faraday shield  
- Evidence bags  
- Labelling material

# <mark style="background: #00ECFFA6;">06 NTFS and MTF</mark>

<mark style="background: #00ECFFA6;">Overview</mark>
- NTFS File System  
- Master File Table Records
- Resident and non-resident files
- NTFS Journaling

### <mark style="background: #00ECFFA6;">NTFS</mark>

<mark style="background: #00ECFFA6;">NTFS:</mark> New Technology File System  

NTFS is the primary file system for recent versions of Windows and Windows Server  

It offers security descriptors, encryption, disk quotas, and rich metadata.  

NTFS can support volumes as large as 8 petabytes on Windows Server 2019 and newer and Windows 10

### <mark style="background: #00ECFFA6;">How NTFS Works</mark>

A hard drive needs to be formatted with to work with a particular file system.  

An operating system will be capable of working with a particular file system to perform storage and retrieval operations.  

Clusters range from 512 bytes to 64 KB

### <mark style="background: #00ECFFA6;">NTFS features</mark>

<mark style="background: #00ECFFA6;">Features:</mark>
- Organisational efficiency - b-tree directory scheme  
- Accessible data - via MFT  
- Capacity for very large files  
- User Permissions  
- File compression  
- Security - place permissions on certain data  
- Logging - extensive logs on the file system operation

### <mark style="background: #00ECFFA6;">How is this useful in Digital Forensics?</mark>

Over the last couple of weeks we have seen how content can be recovered from a file system (carving, Autopsy, headers, footers etc...)  

For a given machine the Hard Drive and File System are the data persistence mechanism. Anything saved or retrieved comes through here.  

The exact operation of a File System can offer information to a digital forensic investigation.

### <mark style="background: #00ECFFA6;">What is available via NTFS</mark>

<mark style="background: #00ECFFA6;">File System Analysis:</mark> <mark style="background: #00ECFFA6;">Master File Table (MFT)</mark> and File metadata  

<mark style="background: #00ECFFA6;">Recovery:</mark> deleted content (carving and unallocated space)  

<mark style="background: #00ECFFA6;">Timestamps:</mark> Analysing timestamps (creation, modification, access)  

<mark style="background: #00ECFFA6;">Journal Analysis:</mark> the journals document the changes made to the file system

### <mark style="background: #00ECFFA6;">Master File Table MFT</mark>

MFT is a relational database  

The new <mark style="background: #00ECFFA6;">Resilient File System (ReFS)</mark> will be the replacement for NTFS  

Every file and folder has a record in the MFT (including the MFT itself and its copy)  

A MFT record contains date/time stamps, the file size, file status and the memory addresses for the file content (even if the file is deleted)

### <mark style="background: #00ECFFA6;">NTFS Reserved Files</mark>

```
• $MFT  
• SMFTMirr  
• $LogFile  
• $Volume  
• $AttrDef  
• Root Directory  
• $Bitmap  
• $Extend/$Quota  
• $Extend/$ObjId  
• SBoot  
• $BadClus  
• $Secure  
• $UpCase  
• $Extend  
• Reserves for $MFT  
• Extension Endties  
• $Extend§Reparse
```

### <mark style="background: #00ECFFA6;">MFT Record</mark>

A MFT record is 1024 bytes in size, in 2 contiguous 512 sectors  

The first sector contains most of the useful forensic data  

The second sector contains file data (if we are dealing with a resident file)  

If the file data (size) is greater than 512 bytes the file is not stored in the MTF record but somewhere on the drive.

### <mark style="background: #00ECFFA6;">Overview of a MFT Record</mark>

The 2 MFT sectors both finish with F7 04  

<mark style="background: #00ECFFA6;">The MFT Records need to deal with:</mark>
- files and folders  
- parent and child relationships

<mark style="background: #00ECFFA6;">Overview:</mark>
- <mark style="background: #00ECFFA6;">Header:</mark> starting with 46 49 4C 45 (spells FILE)
- <mark style="background: #00ECFFA6;">Standard Info:</mark> starting with 10 00 00 00
- <mark style="background: #00ECFFA6;">Filename:</mark> starting with 30 00 00 00
- Additional file name entry
- <mark style="background: #00ECFFA6;">Data:</mark> starting with 80 00 00 00

### <mark style="background: #00ECFFA6;">General Info on NFTS</mark>

It can be difficult to find tutorials online for NTFS digital forensics  

There can be small differences in the operation of NTFS for different OS versions.  

A new reference chart would be needed for each operating system  

A forensics examiner would need to be familiar with the differences.

### <mark style="background: #00ECFFA6;">What is file system journaling?</mark>

The journal is a transactional log of all changes mode to a given volume.  

If there is an issue with the system (eg power off / crash), the operating system can use the journal information to roll back changes or to continue the operation.  

The main focus is to try maintain file system integrity and prevent catastrophic events from occurring.  

Demo: MFTECmd tool by Eric Zimmerman

### <mark style="background: #00ECFFA6;">Why is system journaling relevant?</mark>  

We can use the journal to find evidence of file creations, deletions, changes etc...  

The journal may be the only way to prove if a file existed on a given machine (even if anti-forensics techniques were used)

### <mark style="background: #00ECFFA6;">$UsrJrnl</mark>

Located in $Extend\$UsrJrnl  

Tracks high level changes  

Provides an efficient change monitoring solution, this is used by AV / Backups software to monitor changes to files.  

Typical size is 32MB  

<mark style="background: #00ECFFA6;">Example Operation Codes:</mark> fileCreate, fileDelete, Rename, Data Override etc....

### <mark style="background: #00ECFFA6;">$LogFile</mark>

Located in Root  

Tracks the detailed low level transactional changes for NTFS  

Provides file system integrity and resilience.  

Records actual data that changed  

May only last hours to days on a primary boot drive.  

Typical size is 64MB  

<mark style="background: #00ECFFA6;">Example Operation Codes:</mark>
- ``AddIndexEntryAllocation``  
- ``InitialiseFileRecordSegment``  
- ``DeleteIndexEntryAllocation``  
- Etc...

<mark style="background: #00ECFFA6;">Demo</mark>
- Tools by Eric Zimmerman  
- KAPE  
- MFTECmd  
- Timeline Explorer

### <mark style="background: #00ECFFA6;">NTFS ATTRIBUTES</mark>

<table>
	<tr>
		<th>Code</th>
		<th>Attribute Name</th>
	</tr>
	<tr>
		<td>10 00 00 00</td>
		<td>$Standard_Information</td>
	</tr>
	<tr>
		<td>20 00 00 00</td>
		<td>$Attribute_List</td>
	</tr>
	<tr>
		<td>30 00 00 00</td>
		<td>$File_Name</td>
	</tr>
	<tr>
		<td>40 00 00 00</td>
		<td>$Object_Id</td>
	</tr>
	<tr>
		<td>50 00 00 00</td>
		<td>$Security_Descriptor</td>
	</tr>
	<tr>
		<td>60 00 00 00</td>
		<td>$Volume_Name</td>
	</tr>
	<tr>
		<td>70 00 00 00</td>
		<td>$Volume_Information</td>
	</tr>
	<tr>
		<td>80 00 00 00</td>
		<td>$Data</td>
	</tr>
	<tr>
		<td>90 00 00 00</td>
		<td>$Index_Root</td>
	</tr>
	<tr>
		<td>A0 00 00 00</td>
		<td>$Inde_Allocation</td>
	</tr>
	<tr>
		<td>B0 00 00 00</td>
		<td>$Bitmap</td>
	</tr>
	<tr>
		<td>C0 00 00 00</td>
		<td>$ReparsePoint</td>
	</tr>
	<tr>
		<td>D0 00 00 00</td>
		<td>$Ea_Information</td>
	</tr>
	<tr>
		<td>E0 00 00 00</td>
		<td>$EA</td>
	</tr>
	<tr>
		<td>00 00 00 00</td>
		<td>$Logged_Utility_Stream</td>
	</tr>
</table>

### <mark style="background: #00ECFFA6;">$Data Attribute</mark>  

80 00 00 00 xx xx xx xx yy  

As for all attributes, they come with 4 bytes standing for its length (xx xx xx xx).  

The byte that follows this indicates whether the attribute is resident or not (yy)  

When it is resident its value is 0  

When it is not resident its value is 1

### <mark style="background: #00ECFFA6;">Resident files</mark>

The data for a resident file is contained within the MFT record.

### <mark style="background: #00ECFFA6;">Non-resident files</mark> 

If a file is non-resident, information (data) is stored elsewhere on the disk drive.  

For this to happen the data size will be greater than 512  

The data is stored in groups (data runs). A data run specifies a range of clusters where the file's data is stored, and it includes information about the starting cluster, the number of clusters, and the run's length.  

To retrieve a file, NTFS follows the data runs to retrieve the data from the designated clusters.  

There is no single cut off size for a file to be resident or not, it depends on several factors. Depending on how the file is created (e.g. by the system, there may be more space for it to be a resident file.

### <mark style="background: #00ECFFA6;">Summary</mark> 

Being able to understand MFT records is an important part of drive analysis in digital forensics.  

This offers insights into data recovery and drive analysis.  

It can show what operations were performed and when.  

If offers different attributes within the MFT records  

Its probably best to use specialised tools to work with the MFT, but the investigators understanding of NTFS and MFT may offer something good to the investigation not detected by the tools.

# <mark style="background: #00ECFFA6;">08 Incidence Response</mark>

<mark style="background: #00ECFFA6;">Overview:</mark>
- Types of Crimes  
- Incident Response

### <mark style="background: #00ECFFA6;">Types of Crimes</mark>  

When does digital evidence come into play during digital investigations?  

Digital evidence is present in most types of crimes.  

<mark style="background: #00ECFFA6;">The types of crimes can fall into the following categories:</mark>
- Cybercrime  
- Cyber aided crime  
- Crimes with digital evidence

### <mark style="background: #00ECFFA6;">Cybercrime</mark>

<mark style="background: #00ECFFA6;">Definition of cybercrime:</mark>  
- Sophisticated attacks, or high-tech crimes  
- https://www.interpol.int/content/download/5267/file/Cybercrime.pdf  

A computer is used to perform a crime against another computer or system  

For example, hacking, malware attacks, DDOS extortion  

These types of crimes are usually performed by knowledgeable persons.

<mark style="background: #00ECFFA6;">For this category of crime:</mark>
- The means and opportunity would involve specialised use of tools and knowledge of IT / Systems / Programming etc.  
- This can be important in an investigation when trying to identify suspects and the skills needed to perform a transgression should match the suspects profile.

### <mark style="background: #00ECFFA6;">Cyber Aided Crime</mark>

Also known as Cyber Enabled Crime  

<mark style="background: #00ECFFA6;">Definition:</mark>
- ‘Traditional’ crimes which are facilitated by technology  
- Examples: For example, theft, fraud, even terrorism  
- https://www.interpol.int/content/download/5267/file/Cybercrime.pdf  

Crimes / Offences have been around a long time.  

Criminals do not have to be computer experts to use the tools etc  

They use the computer/tools to commit a transgression

### <mark style="background: #00ECFFA6;">Crimes with Digital Evidence</mark>

A forensic Investigator can look for and expect to find digital evidence  

<mark style="background: #00ECFFA6;">Example (Drugs Trade):</mark>
- Past – two people meet on a street corner and exchange money/product. What evidence of the transgression is left? Very little.  
- Present – If this was online via a social media platform or email what evidence do we have? Even more if the payment is digital.  

In our modern society it is difficult not to leave a digital footprint.

### <mark style="background: #00ECFFA6;">Incidence Response</mark>

Managing incidents in an IT environment  

This process is not particular to digital forensics but it is important to follow process and procedure.

<mark style="background: #00ECFFA6;">Example 1 - Stuxnet:</mark>
- Good example of a cyber warfare case.  
- Stuxnet was malware that targeted specific controllers (Siemens) that were used in an Iranian uranium enrichment plant.  
- It was spread via USB keys  
- It infected local networks and contained a very specific payload to manipulate the controllers  
- The code lay dormant for a long period of time, it was triggered when specific conditions occurred  
- This was clearly targeted and premediated

<mark style="background: #00ECFFA6;">Example 2 - WannaCry:</mark>
- Example of Ransomware (2017)  
- Infected approx. 200k machines  
- Encrypted data on the computer  
- Demanded payment to get data back  
- Is this an example of specific targeting?

### <mark style="background: #00ECFFA6;">Establishing Capabilities</mark>

When an incident occurs for an organisation it can be a very stressful situation to find the cause and offer a solution to remedy the problem.

<mark style="background: #00ECFFA6;">Example - MAERSK:</mark>
- Organisation  
- Hit with Not Petya ransomware (2017)  
- Forced to reinstall approx. 9k computers  
- Large financial loss for downtime  
- For a situation like this it is very important to have careful preparation \ consideration in formulating a solution.  
- Need to be fast and effective in resolving the issues

### <mark style="background: #00ECFFA6;">Dealing with Incidents</mark>

Need to create a <mark style="background: #00ECFFA6;">Computer Incident Response Team (CIRT)</mark>  

Need to develop policies and procedures  

The goal of CIRT is to know exactly what to do when it is required.

### <mark style="background: #00ECFFA6;">Creating a CIRT</mark>

<mark style="background: #00ECFFA6;">Identify all roles and competencies needed:</mark>
- Technical staff  
- Legal expertise  
- Public affairs / media relations  
- HR  
- Management  
- Etc...  

These roles can be key in managing an incident

Developing policy / procedure may contain several steps  

These will give the CIRT team a roadmap to better manage the situation  

The document should outline how to react to an incident.

### <mark style="background: #00ECFFA6;">Content for a CIRT Document</mark>

<mark style="background: #00ECFFA6;">Define the incident:</mark>
- What has transpired and what type of event requires the activation of the CIRT  
- (Some incidents are general and can be handled by the IT Dept)
- A DoS attack may warrant the activation of CIRT  

<mark style="background: #00ECFFA6;">List the members of CIRT:</mark>
- The document needs the names and contact information for each person.  
- The role each person will perform should also be documented. 
- Some people will need to provide ICE (In Case of Emergency) info (eg work mobiles)

<mark style="background: #00ECFFA6;">Business continuity plan:</mark>
- Determine a priority of incidents and functions  
- Need to describe what the most important IT assets are. This will help create a list of priorities when dealing with an incident  
- The plan is trying to identify what can be sacrificed to protect certain IT assets (priority)
- What needs to be performed for certain types of incident (eg cut network connection)

<mark style="background: #00ECFFA6;">Communication Plan:</mark>
- Who to contact and when  
- IT Team members  
- Law enforcement  
- MD / Board of directors  
- Media  
- Specialist Services  
- <mark style="background: #00ECFFA6;">Example:</mark> https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-61r2.pdf

### <mark style="background: #00ECFFA6;">Incident Handling</mark>

<mark style="background: #00ECFFA6;">When something happens, it must be dealt with in a structured way:</mark>  
- Identify  
- Contain, eradicate and recover  
- Post incident tasks

### <mark style="background: #00ECFFA6;">Identify</mark>

Collect information  

<mark style="background: #00ECFFA6;">Identify the nature of the incident (if any):</mark>
- Looking at log/error entries  
- Analysing computers/devices  

Evaluate and determine if CIRT activation is needed  

Gather information from users who experienced the incident  

How it happened, what the user did next  

Information gathered in this phase may be evidence if this goes legal.

### <mark style="background: #00ECFFA6;">Contain, eradicate and recover:</mark>

Incident management  

The goal is to try minimise the effect of the incident  

Try to resume standard operation asap  

<mark style="background: #00ECFFA6;">For containment:</mark> Try to contain infected devices  

Eradication and recovery are the steps to try recover from the incident  

<mark style="background: #00ECFFA6;">Example:</mark> Restore machines disconnected from the network and reintroduce to the network in a controlled/monitored manner

### <mark style="background: #00ECFFA6;">Post Incident</mark>

Document the incident  

Secure all evidence gathered from the Identify Phase  

Write a report  

Determine what further IT intervention is needed for this case  

Determine if legal action is needed  

Consider the GDPR compliance wrt breech (contact data commissioner?)  

Forensic examination of the material gathered in the Identify Phase.

### <mark style="background: #00ECFFA6;">What role does Digital Forensics play in this?</mark>

Offering specific domain knowledge  

Digital forensic knowledge (process to follow)  

Computer security and knowledge of attacks and exploits  

Triage of incident  

Recommend course of action (ie CIRT activation)  

Conduction a post incident forensic investigation  

Preparing reports etc.

# <mark style="background: #00ECFFA6;">09 Digital Evidence in the courtroom</mark>

<mark style="background: #00ECFFA6;">Overview:</mark>
- Hardware and Software Environments  
- Filesystems Evidence  
- Categories  
- Locating Evidence in Filesystems  
- Duty of Experts  
- Admissibility  
- Levels of Certainty in Digital Forensics  
- Direct versus Circumstantial Evidence  
- Scientific Evidence  
- Presenting Digital Evidence

### <mark style="background: #00ECFFA6;">Hardware and Software Environments:</mark>

<mark style="background: #00ECFFA6;">Magnetic hard drives and tapes</mark>  

<mark style="background: #00ECFFA6;">Optical media storage devices</mark> 

<mark style="background: #00ECFFA6;">Random Access Memory (RAM):</mark>
- May be important
- Details of recent activity (keyboard etc)  
- Can be difficult to capture  
- Powering down machine may be an issue (password / encryption)

<mark style="background: #00ECFFA6;">Solid State Drives:</mark> This new mode of operation can thwart forensic recovery  

<mark style="background: #00ECFFA6;">Network stored data:</mark>  
- Data stored on network servers  
- Forensic analyst can be provided with network authentication details  
- External connection to network to access/image datasets. Less frequent, mainly for serious crime.  
- Imaging can be the preferred option for network servers, rather than gathering logical data from OS. Imaging can present challenges.

<mark style="background: #00ECFFA6;">Cloud:</mark>
- Acquiring evidence can be challenging  
- Difficult to create a forensics image  
- Logistics / jurisdictions an issue  
- May need help from third party / vendor

<mark style="background: #00ECFFA6;">Operating systems:</mark>
- Wide variety of different types (Windows, Mac, Unix, Linux, Android, etc...)  
- Software  
- Program Installed  
- Potentially creating new files (CRUD)  
- Recoverable from machine/OS  
- Files may be shared (upload/cloud/email etc)

### <mark style="background: #00ECFFA6;">Filesystems Evidence:</mark> 

This will be stored evidence and will be different for each type of Operating System distribution.  

<mark style="background: #00ECFFA6;">OS can have completely different file systems:</mark>
- Windows (NTFS)  
- Linux (Ext4)
- Mac (APFS)  
- Etc...

Commands received from the operating system are used to read and write files and are stored in a directory structure.  

Windows uses a Master File Table (MTF) and stores data/attributes for every file/directory.  

The filesystem is used to store data.

### <mark style="background: #00ECFFA6;">Filesystem Category</mark>

The filesystem category records the general filesystem info.  

It follows a standard pattern but can be unique for each device.  

It offers a map of the filesystem  

It tells us where to find files.  

Benefits of the filesystem for forensic analysis: Lots of metadata

### <mark style="background: #00ECFFA6;">Filename Category:</mark>

Assigns a name to each file  

Consists of directories and filenames with the corresponding metadata.  

Deleted filenames and their metadata addresses can be used to recover the file content using metadata based recovery.  

The listing of filenames is an important part of forensics analysis.  

Can identify files and parent directories.  

Search for evidence (filename, path, file extension)

### <mark style="background: #00ECFFA6;">Filename Category - filename information schema:</mark>

![[Pasted image 20251024102622.png]]

### <mark style="background: #00ECFFA6;">The Metadata Category:</mark>

Stores properties and attributes for a file  

Gives the history for a file  

Does not store contents of the file name  

Different file types provide basic metadata and the versions of a file, e.g. Windows Properties (screen shot here)

If no forensic protection is offered the act of copying a file to a new location will alter the metadata.  

<mark style="background: #00ECFFA6;">This is a problem for a forensic investigation:</mark> Contamination of the evidentiary state of the file

### <mark style="background: #00ECFFA6;">The Content Category:</mark>

This is the contents of a file  

A file can be recovered from unallocated space  

May have no linked metadata or filename  

Information can be retrieved from file signature and content

### <mark style="background: #00ECFFA6;">Locating Evidence in Filesystems</mark>  

Can be specific to the type of transgression  

<mark style="background: #00ECFFA6;">Locards Exchange Principle:</mark> A conflict between two items will result in an exchange  

Looking for the “Smoking Gun”  

<mark style="background: #00ECFFA6;">Timestamps:</mark> Are they correct? Format / Time zones?  

Who had access to the laptop? Who had access? Passwords?  

Need to locate info/data relevant to the case.  

Investigation approach will be linked to the transgression.

Need to correlate and corroborate the evidence.  

Approach with a vigilant open mind  

<mark style="background: #00ECFFA6;">Trying to determine:</mark>  
- Means  
- Opportunity  
- Motive

### <mark style="background: #00ECFFA6;">Means – how the transgression occurred:</mark>

<mark style="background: #00ECFFA6;">Means or the process followed:</mark> What illegal act was undertaken 

<mark style="background: #00ECFFA6;">How was the transgression carried out?</mark>  
- How was this carried out?  
- Can we reconstruct the transgression?  

Trying to source conclusive information that the transgression was performed by a person on this device/account etc.  

Does the person have the skills to perform this?

### <mark style="background: #00ECFFA6;">Opportunity - chance to perform transgression</mark> 

<mark style="background: #00ECFFA6;">It can be easy to prove opportunity:</mark> Difficult to link suspect to transgression alone.  

Looking to link person to the computer or network in the absence of any corroboration.  

<mark style="background: #00ECFFA6;">Examine audit logs / logins etc:</mark>
- Has another person used this persons computer?  
- Can CCTV or door access help with this?  

Need to establish who really had access

### <mark style="background: #00ECFFA6;">Motive – why transgression occurred</mark>

Not essential to prove motive  

Can be difficult to confirm without a confession  

Data may exist to offer some insights into this  

Need to be aware that false evidence may be generated/planted to implicate a third(innocent) person.

### <mark style="background: #00ECFFA6;">Where to look for Evidence</mark>

<mark style="background: #00ECFFA6;">If a transgression has occurred we have:</mark>
- Means  
- Opportunity  
- Motive  

Operating System / Storage / Files / Logs can help provide some insights  

<mark style="background: #00ECFFA6;">Trying to understand what happened:</mark> The who, why, when, where, what and how

Using Forensic Tools to explore system

Looking for files/data.  

<mark style="background: #00ECFFA6;">Can be in different file categories:</mark>  
- Archives, 
- audio,
- databases,
- emails,
- event logs,
- Internet browser files,
- link files,
- MS Office,
- recycler,
- registry files,
- system files,
- video.  

Can index and search for files

Search for specific files  

<mark style="background: #00ECFFA6;">Can index based on file type and signature:</mark>  
- Filename,
- contents,
- metadata,
- time frame,
- size, 
- etc....

### <mark style="background: #00ECFFA6;">Duty of Experts</mark>

Experts have a duty to present the objective, unbiased truth of the matter before the court.  

It is not their role to advocate for one side; that burden is on the attorneys.  

<mark style="background: #00ECFFA6;">The UK Criminal Procedure Rules (CPR) specifically address this issue with the following statements:</mark>
- An expert must help the court to achieve the overriding objective by giving objective, unbiased opinion on matters within his expertise.
- This duty overrides any obligation to the person from whom he receives instructions or by whom he/she is paid.
- This duty includes an obligation to inform all parties and the court if the expert’s opinion changes from that contained in a report served as evidence or given in a statement.

### <mark style="background: #00ECFFA6;">Duty of Experts – Resisting Influence</mark>

Digital investigators are often pressured, both subtly and overtly, to concentrate on specific areas of inquiry and to reach conclusions that are favourable to a particular party.  

Some cases and the nature of the evidence uncovered (digital or otherwise) will take digital investigators to emotional limits, testing their resolve.  

Members of law enforcement who conducted an investigation to apprehend a defendant may be required to present digital evidence objectively in court and may have the duty to identify weaknesses in a prosecution case.  

Computer security professionals in the private sector often have to investigate longtime co-workers and cases in all sectors can involve brutal abuse of innocent victims, inciting distraught individuals and communities to strike out at the first available suspect.  

The effectiveness of the investigative process depends upon high levels of objectivity applied at all stages. 

A good digital investigator must resist such influences and remain objective in the most trying situations.

A common error is to use a verification methodology, focusing on a likely suspect and trying to the evidence around that individual.  

When a prime suspect has been identified and a theory of the offense has been formed, experienced investigators will try to prove themselves wrong. Implicating an individual is not the job of investigators—this is for the courts to decide and unlike scientific truth, legal truth is judgment based

### <mark style="background: #00ECFFA6;">Avoiding Preconceived Theories</mark>

Trained, experienced investigators will begin by considering whether a crime or infraction has actually occurred.  

When a large amount of data is missing on a computer and an intruder is suspected, digital investigators should determine if the damage is more consistent with disk corruption than an intrusion.  

When an investigator has ruled out innocent explanation, the focus shifts toward determining what happened, where, when, and how, who was involved, and why.  

The process by which digital evidence is uncovered and applied to these issues involves several steps, each employing strict protocols, proven methods, and, in some cases, trusted tools.  

The success of this process depends heavily on the experience and skill of the digital investigators, forensic analysts, and crime scene technicians who must collaborate to piece the evidence together and develop a convincing account of the offense.

### <mark style="background: #00ECFFA6;">Scientific Truth and Legal Judgement:</mark> 

in the prosecutorial environment, theories based upon scientific truth are subordinate to legal judgment and digital investigators must accept the ruling of the court.  

For instance, in common law countries, the standard of proof for criminal prosecutions is <mark style="background: #00ECFFA6;">beyond a reasonable doubt</mark> and for civil disputes it is the <mark style="background: #00ECFFA6;">balance of probabilities</mark>.  

Legal judgment is influenced by ideas like fairness and justice, and the outcome may not conform to the scientific truth.  

In a trial, the object is to assess the case as a whole to determine whether there is sufficient proof of guilt. The decision on the facts is specific to that trial.  

In “science,” we are trying to identify rules that are universally true. In nearly all trials, scientific and technical evidence is only part of the total picture.  

A court may convict an individual even if the case is weak or some evidence suggests innocence.

### <mark style="background: #00ECFFA6;">Admissibility:</mark>

The concept of admissibility is a simple one. Courts need to determine whether evidence is “safe” to put before a jury and will help provide a solid foundation for making a decision in the case. 

In practice, admissibility is a set of legal tests carried out by a judge to assess an item of evidence.  

This assessment process can become complicated, particularly when the evidence was not handled properly or has traits that make it less reliable or more prejudicial.  

Some jurisdictions have rules relating to admissibility that are formal and sometimes inflexible, while other jurisdictions give judges more discretion.

In 2007, a case in Maryland (US) dealt with the admissibility of digital evidence specifically and provided general guidelines for reaching a decision.  

In this case, both parties offered copies of e-mail messages that could not be authenticated properly.  

The magistrate judge would not admit the e-mail messages, noting that unauthenticated e-mails are a form of computer-generated evidence that pose evidential issues.  

<mark style="background: #00ECFFA6;">The magistrate outlined five issues that must be considered when assessing whether digital evidence will be admitted:</mark>
- Relevance  
- Authenticity  
- Not hearsay or admissible hearsay  
- Best evidence  
- Not unduly prejudicial  

Although some of these issues may not be applicable in certain instances, each must be considered

### <mark style="background: #00ECFFA6;">Authentication of Digital Evidence</mark>

Courts generally ask if the recovered evidence is the same as the originally seized data when considering whether digital evidence is admissible.  

To demonstrate that digital evidence is authentic, it is generally necessary to satisfy the court that it was acquired from a specific computer and/ or location, that a complete and accurate copy of digital evidence was acquired, and that it has remained unchanged since it was collected.  

In some cases it may also be necessary to demonstrate that specific information is accurate, such as dates associated with a particular file that is important to the case.  

The reliability of digital evidence clearly plays a critical role in the authentication process

Chain of custody and integrity documentation are important for demonstrating the authenticity of digital evidence.  

Proper chain of custody demonstrates that digital evidence was acquired from a specific system and/or location, and that it was continuously controlled since it was collected.  

Proper chain of custody documentation enables the court to link the digital evidence to the crime.  

Incomplete documentation can result in confusion over where the digital evidence was obtained and can raise doubts about the trustworthiness of the digital evidence.

### <mark style="background: #00ECFFA6;">Reliability of Digital Evidence</mark>

To authenticate digital evidence, it may also be necessary to assess its reliability.  

<mark style="background: #00ECFFA6;">There are two general approaches to assessing whether digital evidence can be relied upon in court.</mark>
- Focus on whether the computer that generated the evidence was functioning normally,  
- Examine the actual digital evidence for evidence of tampering and other damage.  

The majority of legislation in the United States and United Kingdom followed the first approach, instructing courts to evaluate computer generated records on the basis of the reliability of the system and process that generated the records.

The Federal Rules of Evidence 901 (b) (9) titled “Requirement of Authentication or Identification” includes “evidence describing a process or system used to produce a result and showing that the process or system produces an accurate result.”  

In the United Kingdom, under Section 69 of PACE, there was a formal requirement for a positive assertion that the computer systems involved were working properly.  

The rationale for this approach is that, because records of this type are not the counterpart of a statement by a human declarant, which should ideally be tested by cross-examination of that declarant, they should not be treated as hearsay, but rather their admissibility should be determined on the basis of the reliability and accuracy of the process involved

In 1997, the UK Law Commission recommended the repeal of Section 69 of PACE (Law Commission, 1997), noting the difficulties in assessing the reliability of computer systems, and criticising Section 69 of PACE because it required a complex certification of the system even when there is no sign that the evidence might be unreliable, and it failed to address the major causes of inaccuracy in digital evidence.  

Without section 69, a common law presumption comes into play: in the absence of evidence to the contrary, the courts will presume that mechanical instruments were in order at the material time.  

Where a party sought to rely on the presumption, it would not need to lead evidence that the computer was working properly on the occasion in question unless there was evidence that it may not have been in which case the party would have to prove that it was

### <mark style="background: #00ECFFA6;">Best Evidence</mark>

When dealing with the contents of a writing, recording, or photograph, courts sometimes require the original evidence.  

The original purpose of this rule was to ensure that decisions made in court were based on the best available information.  

With the advent of photocopiers, scanners, computers, and other technology that can create effectively identical duplicates, copies became acceptable in place of the original, unless “a genuine question is raised as to the authenticity of the original or the accuracy of the copy or under the circumstances it would be unfair to admit the copy in lieu of the original” (Best Evidence Rule).  

Because an exact duplicate of most forms of digital evidence can be made, a copy is generally acceptable.  

In fact, presenting a copy of digital evidence is usually more desirable because it eliminates the risk that the original will be accidentally altered.

### <mark style="background: #00ECFFA6;">Hearsay</mark>

Digital evidence might not be admitted if it contains hearsay because the speaker or author of the evidence is not present in court to verify its truthfulness.  

For instance, an e-mail message may be used to prove that an individual made certain statements, but cannot be used to prove the truth of the statements it contains.  

For example, although Larry Froistad sent a message to an e-mail list indicating that he killed his daughter, investigators needed a confession and other evidence to prove this fact.

The Canadian case against Pecciarich provides an interesting example of what may be considered hearsay in the context of online activities.  

http://www.nytimes.com/1998/04/30/us/on-line-trail-to-an-off-line-killing.html

### <mark style="background: #00ECFFA6;">Hearsay Exceptions</mark>

There are several exceptions to the hearsay rule to accommodate evidence that portrays events quite accurately and that is easier to verify than other forms of hearsay.  

For instance, the U.S. Federal Rules of Evidence specify that records of regularly conducted activity are not excluded by the hearsay rule:  

A memorandum, report, record, or data compilation, in any form, or acts, events, conditions, opinions or diagnoses, made at or near the time by, or from information transmitted by a person with knowledge, if kept in the course of a regularly conducted business activity, and if it was the regular practice of that business activity to make the memorandum, report, record, or data compilation, all as shown by the testimony of the custodian or other qualified witness, unless the source of the information or the method or circumstances of preparation indicate lack of trust- worthiness the term “business” as used in this paragraph includes business, institution, association, profession, occupation, and calling of every kind, whether or not conducted for profit.

The Irish Criminal Evidence Act (1992), has a similar exception in Section 5(1): ... information contained in a document shall be admissible in any criminal proceedings as evidence of any fact therein of which direct oral evidence would be admissible if the information  

Although some courts evaluate all computer-generated data as business records under the hearsay rule, this approach may be inappropriate when a person was not involved.  

Computer-generated data may not be considered hearsay at all because they do not contain human statements or they do not assert a fact but simply document an act.

### <mark style="background: #00ECFFA6;">Levels of Certainty in Digital Forensics</mark>

Analysis of digital evidence requires interpretation that forms the basis of any conclusions reached.  

Digital investigators should be able to estimate and describe the level of certainty underlying their conclusions to help fact finders determine what weight to attach.  

The field of digital forensics does not currently have formal mathematics or statistics to evaluate levels of certainty associated with digital evidence.  

There is currently a lack of consistency in the way that the reliability or accuracy of digital evidence is assessed, partly because of the complexity and multiplicity of computer systems.  

Furthermore, the level of certainty that digital investigators assign to their findings is influenced by their knowledge and experience.

### <mark style="background: #00ECFFA6;">Direct Versus Circumstantial Evidence</mark>

Direct evidence establishes a fact. Circumstantial evidence may suggest one. It is a common misconception that digital evidence cannot be direct evidence because of its separation from the events it represents. However, digital evidence can be used to prove facts.  

Although digital evidence is generally only suggestive of human activities, circumstantial evidence may be as weighty as direct evidence and digital evidence can be used to firmly establish facts.  

For example, a computer log on record is direct evidence that a given account was used to log in to a system at a given time but is circumstantial evidence that the individual who owns the account was responsible. Somebody else might have used the individual’s account and other evidence would be required to prove that he/she actually logged in to the system.  

It may be sufficient to demonstrate that nobody else had access to the individual’s computer or password. Alternately, other sources of digital evidence such as building security logs may indicate that the account owner was the only person in the vicinity of the computer at the time of the log on.

### <mark style="background: #00ECFFA6;">Scientific Evidence</mark>

In addition to challenging the admissibility of digital evidence directly, tools and techniques used to process digital evidence have been challenged by evaluating them as scientific evidence.  

Because of the power of science to persuade, courts are careful to assess the validity of a scientific process before accepting its results.  

If a scientific process is found to be questionable, this may influence the admissibility or weight of the evidence, depending on the situation.

In most U.S. states, novel scientific evidence is evaluated using four criteria developed in Daubert v. Merrell Dow Pharmaceuticals, Inc. (1993).  

<mark style="background: #00ECFFA6;">These criteria are as follows:</mark>
- Whether the theory or technique can be (and has been) tested.  
- Whether there is a high known or potential rate of error, and the existence and maintenance of standards controlling the technique’s operation.  
- Whether the theory or technique has been subjected to peer review and publication.  
- Whether the theory or technique enjoys “general acceptance” within the relevant scientific community.  

The problems relating to admissibility and understanding of scientific evidence have become sufficiently complicated to require new approaches.  

In the United Kingdom and Ireland, law reform commissions have published recommendations on how to address challenges relating to admissibility of scientific evidence in general, and digital evidence in specific (Irish Law Reform Commission, 2009; UK Law Commission, 2009)

### <mark style="background: #00ECFFA6;">Presenting Digital Evidence</mark>

Digital investigators are commonly asked to testify or produce a written summary of their findings in the form of an affidavit or expert report.  

Testifying or writing a report is one of the most important stages of the investigative process because, unless findings are communicated clearly in writing, others are unlikely to understand or make use of them.

### <mark style="background: #00ECFFA6;">Expert Reports</mark>

Whenever possible, digital investigators should support assertions in their reports with multiple independent sources of evidence to ensure that any potential weakness in one source of digital evidence does not undermine an other- wise valid conclusion.  

They should clearly state how and where all evidence was found, to help decision makers to interpret the report and to enable another competent digital investigator to verify results.  

Including important items of digital evidence as figures or attachments can be useful when testifying in court as it may be necessary to refer to the supporting evidence when explaining findings in the report.  

Presenting alternative scenarios and demonstrating why they are less reasonable and less compatible with the evidence can help strengthen key conclusions.  

Explaining why other explanations are unlikely or impossible demonstrates that the scientific method was applied—that an effort was made to disprove the given conclusion but that it withstood critical scrutiny.

A formal report of forensic findings should give readers all of the information they need to evaluate the evidence and associated conclusions.  

<mark style="background: #00ECFFA6;">The following is a sample report structure:</mark>  
- Introduction  
- Evidence Summary  
- Examination Summary
- File System Examination  
- Forensics Analysis and Findings  
- Conclusions

<mark style="background: #00ECFFA6;">Introduction:</mark>
- Provide an overview of the case, the relevance of the evidential media being examined, who requested the forensic analysis, and what was requested.  
- The introduction should provide the bonafides of those who performed the work, including a summary of relevant experience and training.  
- A full CV can be provided as an attachment to the report.  

<mark style="background: #00ECFFA6;">Evidence Summary:</mark>
- Describe the items of digital evidence that were analyzed, providing details that uniquely identify such as make, model, and serial number.  
- Also consider including MD5 values, photographs, laboratory submission numbers, details of when and where the evidence was obtained, from whom the evidence was obtained and its condition (note signs of damage or tampering), and processing methods and tools.

<mark style="background: #00ECFFA6;">Examination Summary:</mark>
- Provide an overview of the critical findings relating to the investigation. Think of this as the executive summary, with any recommendations or conclusions in short form.  
- This section is intended for decision makers who may not have time to read the full report and just need to know the primary results of the forensic analysis.  
- In certain situations, it is advisable to summarise tools used to perform the examination, how important data were recovered (e.g., decryption and un-deletion), and how irrelevant files were eliminated (e.g., using NSRL hash sets).  
- Whenever feasible, use the same language in the examination summary as is used in the body of the report to avoid confusion and to help the attentive reader associate the summary with the relevant section in the detailed description.

<mark style="background: #00ECFFA6;">File System Examination:</mark>
- When dealing with storage media, provide an inventory of files, directories, and recovered data that are relevant to the investigation with important characteristics such as path names, date- time stamps, MD5 values, and physical sector location on disk.  
- Note any unusual absences of data that may be an indication of data destruction, such as mass deletion, reformatting, or wiping.

<mark style="background: #00ECFFA6;">Forensic Analysis and Findings:</mark>
- Provide a detailed description of the forensic analysis performed and the resulting findings, along with supporting evidence.  
- Any detailed forensic analysis of particular items that requires an extensive description can be provided in a separate subsection.  
- The report should clearly specify the location where each referenced item was found, enabling others to replicate and verify the results in the future. In addition to describing important findings in the report, it can be more clear and compelling to show a photograph, screenshot, or printout of the evidence.  
- Describe and interpret temporal, functional, and relational analysis and other analyses performed such as evaluation of source and digital stratigraphy

<mark style="background: #00ECFFA6;">Conclusions:</mark>
- A summary of conclusions should follow logically from previous sections in the report and should reference supporting evidence.  
- It is important not to jump to conclusions or make statements about innocence or guilt.  
- Conclusions must be objective and be based on fact.  
- Let the evidence speak for itself and avoid being judgmental.

In the United Kingdom, information that must be provided in an expert report is described in the Criminal Procedure Rules and includes the following:  
- The expert’s qualifications, relevant experience, and accreditation.  
- The substance of all facts given to the expert which are material to the opinions expressed in the report or upon which those opinions are based.  
- A summary of conclusions.  

In addition, the UK Criminal Procedure Rule indicates that, where there is a range of opinion on the matters dealt with in the report, the range of opinion should be explained and the basis for the expert’s own opinion should be provided with any necessary caveats

### <mark style="background: #00ECFFA6;">Testimony:</mark> 

When digital investigators first take the stand, they must first be accepted as an expert by the court.  

During this process, called voir dire, digital investigators will generally be asked to provide a summary of their qualifications and experience and, in some cases, will be asked questions about their training, credentials, etc.  

After this process, the court will decide whether to accept the digital investigator as an expert who can testify in the case.  

During cross-examination, attorneys often attempt to point out flaws and details that were overlooked by the digital investigator.  

The most effective response to this type of questioning is to be prepared with clear explanations and supporting evidence.  

In some cases, the goal of the opposing counsel may be to raise doubts about digital forensic findings.

### <mark style="background: #00ECFFA6;">Summary:</mark>

The foundation of any case involving digital evidence is proper evidence handling.  

Therefore, the practice of seising, storing, and accessing evidence must be routine to the point of perfection.

Standard operating procedures with forms are a key component of consistent evidence handling, acting as both memory aids for digital investigators and documentation of chain of custody.  

Also, training and policies should provide digital investigators with a clear understanding of acceptable evidence handling practices and associated laws.  

Verifying that evidence was handled properly is only the first stage of assessing its reliability.  

Courts may also consider whether digital evidence was altered before, during, or after collection, and whether the process that generated the evidence is reliable.  

Claims of tampering generally require some substantiation before they are seriously considered.  

Someone familiar with the system in question, who can testify that the computer was operating normally at the time, can generally address questions regarding the process that generated a given piece of digital evidence

# <mark style="background: #00ECFFA6;">10 Memory Forensics</mark>

<mark style="background: #00ECFFA6;">Overview:</mark>
- Memory Forensics  
- Volatility Framework

### <mark style="background: #00ECFFA6;">Memory Forensics</mark>

We have seen how to take a memory capture and the large amount of data stored could be considered to be a unorganised data blob.  

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

“Volatility development is now supported by The Volatility Foundation, an independent 501(c) (3) non-profit organisation. The foundation was established to promote the use of Volatility and memory analysis within the forensics community, to defend the project's intellectual property (trademarks, licenses, etc.) and  
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

# <mark style="background: #00ECFFA6;">11 OSINT Framework</mark>

<mark style="background: #00ECFFA6;">Overview</mark>  
- Intro to OSINT
- Tools
- Process to follow

### <mark style="background: #00ECFFA6;">OSINT – Open Source Intelligence</mark>

<mark style="background: #00ECFFA6;">OSD:</mark> Open Source Data  

OSINT can be thought of as the process of processing OSD material.  

<mark style="background: #00ECFFA6;">OSINF:</mark> Open Source Information. Secondary and processed data is in the public domain and is legally obtainable.  

<mark style="background: #00ECFFA6;">OSINT-V:</mark> validated. High degree of certainty + trustworthy source

### <mark style="background: #00ECFFA6;">Internet Layers</mark>

![[Pasted image 20251116223411.png]]


### <mark style="background: #00ECFFA6;">OSINT Framework</mark>

The OSINT framework focuses on gathering information from free tools or resources.  

https://osintframework.com  

The intention is to help people find free OSINT resources.  

Some of the sites included might require registration or offer more data for payment  

It should be possible to get some of the required information for no cost.

### <mark style="background: #00ECFFA6;">Who can benefit from using OSINT?</mark>

OSINT is a Cybersecurity Intel Gathering Tool  

It was created to offer a central location to find tools that can be used to gather intel and reconnaissance as part of cybersecurity research  

There are no shortage of free tools that can be used to gather public data, OSINT is a collection of tools to make intel and data collection tasks easier. (Can we name some tools/sources?)  

Used by security researchers and penetration testers for digital footprints/intelligence gathering/reconnaissance.

### <mark style="background: #00ECFFA6;">Digital Forensics with OSINT</mark> 

“The amount of data generated by the current interconnected world is immeasurable, and a large part of such data is publicly available, which means that it is accessible by any user, at any time, from anywhere in the Internet. In this respect, Open Source Intelligence (OSINT) is a type of intelligence that actually benefits from that open nature by collecting, processing and correlating points of the whole cyberspace to generate knowledge. In fact, recent advances in technology are causing OSINT to currently evolve at a diszying rate, providing innovative data-driven and AI-powered applications for politics, economy or society, but also offering new lines of action against cyberthreats and cybercrime.” 

<mark style="background: #00ECFFA6;">source:</mark> https://ieeexplore.ieee.org/abstract/document/8954668

### <mark style="background: #00ECFFA6;">Usage in an Investigation</mark>
- What question are you trying to answer?
- After identifying a user profile, is this a potential catfish?  
- Is there any data or metadata we can gather from this platform
- Based on usernames, is this user on other platforms?
- There are a lot of ways to get data about any target you’re investigating.
- Reverse image lookup for images found etc. 
- By using the OSINT website(framework) this can be a good checklist to see what areas you have left to explore while analysing any individual or company.

### <mark style="background: #00ECFFA6;">OSINT Overview</mark>

![[Pasted image 20251116223738.png]]

<mark style="background: #00ECFFA6;">Source:</mark> https://osintframework.com

<mark style="background: #00ECFFA6;">OSINT Content Categories:</mark>
- Username
- Dating
- Archives
- Encoding / Decoding
- Email Address
- Telephone Numbers
- Language Translation
- Tools
- Domain Name
- Public Records
- Metadata 
- Malicious File Analysis
- IP Address
- Business Records
- Mobile Emulation
- Exploits & Advisories
- Images / Videos / Docs
- Transportation
- Terrorism
- Threat Intelligence
- Social Networks
- Geolocation Tools / Maps
- Dark Web OpSec
- Instant Messaging
- Search Engines
- Digital Currency
- Documentation 
- People Search Engines
- Forums / Blogs / IRC
- Classifieds
- Training

### <mark style="background: #00ECFFA6;">Steps to Perform OSINT</mark>
- Use basic attributes to build a profile
- Define your requirements
- Use OSINT tools and techniques to gather as much info as possible
- Analyse the required info
- Pivot, if needed (if investigative solutions break down)
- Validate the assumptions
- Create the complete profile / report.

### <mark style="background: #00ECFFA6;">OSINT Mind Map</mark>
- https://github.com/WebBreacher/osinttools
- https://www.xmind.net/ 
- https://osintframework.com/

### <mark style="background: #00ECFFA6;">The power of search engines</mark> 
- Google
- Yahoo  
- Bing  
- Badiu (China)  
- Shodan (IoT)  
- Ahmia  
- Yandex (Russia)  
- Etc........

### <mark style="background: #00ECFFA6;">Google Dorking</mark>

Google Dorking is a hacking technique that makes use of Googles advanced search services to locate data or difficult to find content.  
This is also referred to as Google Hacking.  

This is basically filtering a search using operators.

### <mark style="background: #00ECFFA6;">Google Dorking - Operators</mark>

<table>
	<tr>
		<td>-</td>
		<td>Avoid pages that match a term</td>
	</tr>
	<tr>
		<td>+</td>
		<td>Match exactly</td>
	</tr>
	<tr>
		<td>“ “</td>
		<td>Specific phrase</td>
	</tr>
	<tr>
		<td>*</td>
		<td>Wildcard to match any word</td>
	</tr>
	<tr>
		<td>#..#</td>
		<td>Numbers on either side to match a range</td>
	</tr>
	<tr>
		<td>intitle:” ”</td>
		<td>In the title</td>
	</tr>
	<tr>
		<td>allintitle:” “</td>
		<td>Specific phrase</td>
	</tr>
	<tr>
		<td>inurl:” “</td>
		<td>In the url</td>
	</tr>
	<tr>
		<td>allinurl: “ “</td>
		<td>Specific phrase</td>
	</tr>
	<tr>
		<td>intext:” “</td>
		<td>In the text</td>
	</tr>
	<tr>
		<td>allintext:” “</td>
		<td>Specific phrase</td>
	</tr>
	<tr>
		<td>filetype:</td>
		<td>By filetype</td>
	</tr>
	<tr>
		<td>OR</td>
		<td>Logical OR in search. Default in AND</td>
	</tr>
</table>

### <mark style="background: #00ECFFA6;">Google Hacking Database (GHDB)</mark>

The GHDB is a collection of Google hacking search terms that have been found to reveal sensitive data exposed by vulnerable servers and web applications.  

This was launched in 2000 by Johnny Long to serve pen testers.  

Google allows pen testers to query its search engine to help reveal sensitive data: https://www.exploit-db.com/google-hacking-database  

<mark style="background: #00ECFFA6;">Tutorial:</mark> https://www.blackhat.com/presentations/bh-europe-05/BH_EU_05-Long.pd

### <mark style="background: #00ECFFA6;">Shodan</mark>

Search engine for servers, hardware devices in the Internet  

It is the search engine for the Internet of Everything  

Site: https://www.shodan.io/

### <mark style="background: #00ECFFA6;">Reverse Image Lookup</mark>

Google reverse image search, officially called Google Search by Image, is a service provided by Google that allows a user to search for images using an image as the starting point  

https://images.google.com/  

Yandex Search (Russia)

### <mark style="background: #00ECFFA6;">WiGLE.net</mark>

WiGLE (or Wireless Geographic Logging Engine) is a website for collecting information about the different wireless hotspots around the world. Users can register on the website and upload hotspot data like GPS coordinates, SSID, MAC address and the encryption type used on the hotspots discovered. In addition, cell tower data is uploaded and displayed.  

<mark style="background: #00ECFFA6;">Site:</mark> https://wigle.net/

### <mark style="background: #00ECFFA6;">Tor (darknet)</mark>

Tor is a web browser that has a strong focus on privacy.  

It aims to defend users against tracking and surveillance and strengthens your right to publish and your freedom of speech.  

The easiest way to access the dark web is through the Tor Browser.  

It is free to download and install.  

<mark style="background: #00ECFFA6;">Note:</mark> some people hide their Tor Browser download using a VPN  

Some countries have also banned the Tor browser and network. Using Tor in these countries could also land you in trouble.  

Source: https://vpnoverview.com/privacy/anonymous-browsing/is-tor-legal/

### <mark style="background: #00ECFFA6;">Web Snapshots</mark>

Archive.org  

Way Back Machine  

Search and view content on past versions of websites.

### <mark style="background: #00ECFFA6;">Bellingcat</mark>

Bellingcat is a Netherlands-based investigative journalism group that specialises in fact-checking and open-source intelligence (OSINT).  

Bellingcat publishes the findings of both professional and citisen journalist investigations into war zones, human rights abuses, and the criminal underworld. The site's contributors also publish guides to their techniques, as well as case studies.  

Site: https://www.bellingcat.com/

### <mark style="background: #00ECFFA6;">Property Search</mark> 

Land Registry  

Local Authority Planning Records

### <mark style="background: #00ECFFA6;">Social Media Profiles</mark>
- Facebook
- Twitter
- Instagram
- YouTube
- LinkedIn
- Snapchat
- TikTok
- Etc....

### <mark style="background: #00ECFFA6;">Example 1</mark>

https://tryhackme.com/room/ohsint

# <mark style="background: #00ECFFA6;">12 CyberCrime Law</mark>

<mark style="background: #00ECFFA6;">Overview:</mark>
- From a European Perspective
- From an Irish Perspective
- Jurisdiction

<mark style="background: #00ECFFA6;">Note:</mark> 
- We will focus on the Irish and EU Law.
- There will be no exam questions on US Law, this content is just to show how they deal with legislation in their jurisdiction

### <mark style="background: #00ECFFA6;">From a European Perspective</mark>  

Countries in Europe have fundamentally different legal systems, unlike the United States, which at least share a common framework.  

Europe has countries with a common-law system (the United Kingdom and Ireland) as well as countries with a civil-law system (most Continental countries), which have different traditions in the sources of law.  

Several initiatives are under way to increase consistency in legal frameworks among countries in Europe and to support law enforcement involving multiple jurisdictions.  

Fundamental differences between common-law and civil-law criminal justice systems remain.  

Two supranational bodies - the European Union and the Council of Europe (CoE) - influence cybercrime law in European countries, creating unique challenges for harmonisation and for dealing with this topic

### <mark style="background: #00ECFFA6;">European and National Legal Frameworks</mark>

The Council of Europe(CoE) launched the most comprehensive initiative with the Convention on Cybercrime, but the EU moves beyond that in some respects in an effort to better harmonise legislation in its member states  

The CoE is a pan-European international body with 47 member states, focusing on human rights, democracy, and the rule of law. For cybercrime, the Convention on Cybercrime stands out.  

Apart from CoE member states, other countries can accede to this convention as well.  

In addition to the Cybercrime Convention, some other instruments make up the European cybercrime legal framework, such as the Additional Protocol to the Cybercrime Convention on racism through computer systems and the Lanzarote Convention on the protection of children against sexual abuse

### <mark style="background: #00ECFFA6;">CoE Convention on Cybercrime</mark>

In 2001, 26 member countries convened in Budapest and signed the Council of Europe Convention on Cybercrime to create “a common criminal policy aimed at the protection of society against cybercrime, inter alia, by adopting appropriate legislation and fostering international cooperation”  

The COE Convention on Cybercrime represents an aspirational policy document, a country that ratifies the Convention commits to putting in place a legislative framework that deals with cybercrime according to Convention requirements.  

Within this commitment, each country is given discretion in relation to the full scope, say, of a criminal offence, by defining its particular elements of dishonest intent or requiring that serious harm be done before an offence is deemed to have been committed.  

CoE Cybercrime: https://www.coe.int/en/web/conventions/full-list/-/conventions/treaty/185

The Convention on Cybercrime entered into force on July 1, 2004, and its status as of November 2016, is that it has been signed by 50 States and including the United States of America .  

Another 17 from all regions of the world had signed it or been invited to accede.  

Concerned by the risk of misuse or abuse of computer systems to disseminate racist and xenophobic propaganda, the member states of the CoE and other State Parties to the Convention on Cybercrime agreed on an additional protocol to the Convention concerning the criminalisation of acts of a racist and xenophobic nature committed through computer systems on January 28, 2003.  

That protocol entered into force on March 1, 2006, and (as of Feb 2021) has 68 signatories, 65 of whom have ratified it. Source: https://www.coe.int/en/web/conventions/full-list/-/conventions/treaty/185/signatures

The Budapest Convention is a criminal justice treaty that provides States with  
- (i) the criminalisation of a list of attacks against and by means of computers;
- (ii) procedural law tools to make the investigation of cybercrime and the securing of electronic evidence in relation to any crime more effective and subject to rule of law safeguards; and
- (iii) international police and judicial cooperation on cybercrime and e-evidence.  

The Convention on Cybercrime of the Council of Europe (CETS No.185), known as the Budapest Convention, is the only binding international instrument on this issue. It serves as a guideline for any country developing comprehensive national legislation against Cybercrime and as a framework for international cooperation between State Parties to this treaty.  

The Budapest Convention is supplemented by a Protocol on Xenophobia and Racism committed through computer systems.  

https://www.coe.int/en/web/cybercrime/the-budapest-convention

These States that currently amount to 68, together with ten international organisations (such as the Commonwealth Secretariat, European Union, INTERPOL, the International Telecommunication Union, the Organisation of American States, the UN Office on Drugs and Crime and others), participate as members or observers in the Cybercrime Convention Committee.  

This Committee assesses implementation of the Convention by the Parties, and keeps the Convention up-to-date.  

Current efforts focus on solutions regarding law enforcement access to electronic evidence on cloud servers.

### <mark style="background: #00ECFFA6;">Capacity Building</mark>

The need for a broad agreement on capacity building was stated in February 2013 by the United Nations Intergovernmental Expert Group on Cybercrime and by the European Union in its Cybersecurity Strategy.  

In October 2013, it was the focus of the Global Cyber Space Conference in Seoul, Korea.  

The European Union and the Council of Europe followed up immediately and in the very same week signed their agreement on the joint project on 'Global Action on Cybercrime' (GLACY), while at the same time, the Council of Europe decided to establish a Cybercrime Programme Office (C-PROC) for worldwide capacity building in Bucharest, Romania.  

The creation – at the subsequent Global Cyber Space Conference (Netherlands, April 2015) – of the Global Forum on Cyber Expertise was a further logical consequence.  

By August 2016, C-PROC managed a series of projects – including several joint projects with the European Union – covering the Eastern Partnership region (Armenia, Azerbaijan, Belarus, Georgia, Moldova and Ukraine) or South-Eastern Europe and Türkiye (the project 'iPROCEEDS' is targeting proceeds from crime online).

![[Pasted image 20251116231210.png]]

### <mark style="background: #00ECFFA6;">Computer Integrity Crimes</mark>

The Council of Europe Convention on Cybercrime introduces the following five offenses against the confidentiality, integrity, and availability of computer data and systems:  

Illegal access, that is, intentional access to the whole or any part of a computer system without right (Article 2)  

Illegal interception, being the intentional interception without right made by technical means of nonpublic transmissions of computer data to, from, or within a computer system (Article 3)  

Data interference, that is, the intentional damaging, deletion, deterioration, alteration, or suppression of computer data without right (Article 4)  

System interference, being intentionally seriously hindering without right the functioning of a computer system by inputting, transmitting, damaging, deleting, deteriorating, altering, or suppressing computer data (Article 5) and  

Misuse of devices, that is, the production, sale, procurement for use, import, distribution, or otherwise making available of a device or password or access code with the intent that it be used for the purpose of committing any of the offenses established in articles 2-5 (Article 6).

### <mark style="background: #00ECFFA6;">Computer Assisted Crimes</mark>

Computer-assisted crimes are traditional crimes in which the computer is “merely” a tool.  

The EU Council Framework Decision on combating fraud and counterfeiting of noncash means of payment directs member states to take necessary measures to ensure that two types of conduct—relating to computer use—are criminal offenses when committed intentionally, they being 
- offenses related to computers (article 3): performing or causing a transfer of money or monetary value and thereby causing an unauthorised loss of property for another person, with the intention of procuring an unauthorised economic bene t for the person committing the offence or for a third party, by
- introducing, altering, deleting, or suppressing computer data, in particular identification data without right, or 
- interfering with the functioning of a computer programme or system without right.

Offenses related to specifically adapted devices (article 4): the fraudulent making, receiving, obtaining, selling, or transferring to another person or possession of  
- instruments, articles, computer programmes, and any other means particularly adapted for the commission of counterfeiting, or falsification of a payment instrument for it to be used fraudulently;
- computer programmes the purpose of which is the commission of any of the offense described under Article 3.

### <mark style="background: #00ECFFA6;">Content Related Crimes</mark> 

Content Related Crimes are similar to the computer-assisted crimes in that they relate to traditional offenses and that computers are tools rather than targets, but they differ from them in that it is the content of data rather than the result of an action that is the core of the offence.  

The only content-related offence that the parties involved in drafting the Convention could agree upon was child pornography.  
The other major candidate - racism - was not acceptable to the United States to include in the Convention, given the thrust of the First Amendment.  

As a consequence, racism was transferred to an Additional Protocol to the Convention, which parties can decide to sign at their own discretion.

### <mark style="background: #00ECFFA6;">Laws affecting CyberCrime - Irish Perspective</mark>

### <mark style="background: #00ECFFA6;">Irish Legislation - History</mark>

For several years it was noted that the Law in Ireland had limitations in dealing with computer crime.  

<mark style="background: #00ECFFA6;">The main areas were:</mark>  
- Criminal Damage Act 1991
- Criminal Justice (Theft and Fraud Offences) Act 2001  

These were not designed specifically to deal with computer crime. 

This had an impact on policing of computer crimes.

### <mark style="background: #00ECFFA6;">Irish Legislation – History (types of crimes)</mark>

<mark style="background: #00ECFFA6;">Unauthorised access</mark> (Criminal Damage Act 1991)  

The criminal damage act made a distinction between computer hacking (intended to cause damage) and unauthorised access. “Looking around” was not to be considered an offence as it is just a breach of confidentiality. (two exceptions: Official Secrets Act 1963 and Data protection Act 1988)  
- 5. - (1) A person who without lawful excuse operates a computer - accessing of data.
- (a) within the State with intent to access any data kept either within or outside the State, or 
- (b) outside the State with intent to access any data kept within the State, shall, whether or not he accesses any data, be guilty of an offence and shall be liable on summary conviction to a fine not exceeding £500 or imprisonment for a term not exceeding 3 months or both.

<mark style="background: #00ECFFA6;">Dishonest operation</mark> (Criminal Justice (Theft and Fraud Offences) Act 2001)  
- “9.—(1) A person who dishonestly, whether within or outside the State, operates or causes to be operated a computer within the State with the intention of making a gain for himself or herself or another, or of causing loss to another, is guilty of an offence.”

<mark style="background: #00ECFFA6;">Creating a false instrument</mark> (Criminal Justice (Theft and Fraud Offences) Act 2001)  
- 25.—(1) A person is guilty of forgery if he or she makes a false instrument with the intention that it shall be used to induce another person to accept it as genuine and, by reason of so accepting it, to do some act, or to make some omission, to the prejudice of that person or any other person.  

Eg. Username and password entered falsely into a computer system.  

Looking at misuse of verification etc.  

Closely linked to the Electronic Commerce Act 2000

<mark style="background: #00ECFFA6;">Information Theft</mark> (Criminal Justice (Theft and Fraud Offences) Act 2001)  

Historically Irish Law did not specifically deal with any offence of the theft of Information.  
- 4.—(1) Subject to section 5, a person is guilty of theft if he or she dishonestly appropriates property without the consent of its owner and with the intention of depriving its owner of it.

<mark style="background: #00ECFFA6;">Dependent on the interpretation of:</mark>
- Property 
- With the intent of depriving its owner of it.

<mark style="background: #00ECFFA6;">Official Secrets Act (Official Secrets Act 1963):</mark> “official information” means any secret official code word or password, and any sketch, plan, model, article, note, document or information which is secret or confidential or is expressed to be either and which is or has been in the possession, custody or control of a holder of a public office, or to which he has or had access, by virtue of his office, and includes information recorded by film or magnetic tape or by any other recording medium;  

Offers protection to official information that is not available for unofficial information.

<mark style="background: #00ECFFA6;">Data protection offences</mark>
- Data Protection Act 1988 (Data protection act 1988)
- Data Protection Act 2003 (2006 amendment). (2003)  

Relating to the processing of information  

- Unauthorised access
- Scams or advanced fee fraud  
-  Damage to data  
-  Extortion  
-  Passive hacking  
-  Distributed denial of service attacks  
-  Possessing anything with intent to damage property

### <mark style="background: #00ECFFA6;">Criminal Justice Act 2011</mark>

Came into effect 9th August 2011  

Gave Gardai more extensive powers to investigate ”Serious and Complex” Offences

### <mark style="background: #00ECFFA6;">Scope of the 2011 Act</mark>

Section 3(1) of the 2011 Act brings a number of relevant offences within its ambit, among them Section 9 of the Criminal Justice (Theft and Fraud Offences) Act 2001 (the “2001 Act”) and Sections 2, 3 and 4 of the Criminal Damage Act 1991 (the “1991 Act”).  

Section 3(2) provides that the Minister may, by order, specify as a relevant offence, any arrest able offence relating to criminal acts involving the use of electronic communication networks and information systems or against such networks or systems or both it does not solve the problem that an offence has to be rendered arrest able before it can also be designated as reportable, a problem when Irish authorities have historically had difficulty keeping up with the apparently boundless imaginations of cyber criminals when applied to developing new varieties of IT fraud and cybercrime.

### <mark style="background: #00ECFFA6;">Key Provisions of 2011 Act</mark> 

Under Section 15 of the 2011 Act a member of the Garda Síochána may apply to a judge of the District Court for an order to make available particular documents or described documents available or to give information for the purposes of the investigation of a relevant offence.  

In the case of documents being handed over under this section which are illegible or inaccessible, the court order may also stipulate that any relevant access or passwords be given.  

Failure to provide passwords can be punished by a fine or prison term of up to 12 months on summary conviction or 2 years on indictment.

Requiring passwords is a significant power, given that without the key the lock remains unopened. Investigation of cybercrime offences can clearly be substantially frustrated by the lack of access to encrypted documents, as demonstrated, for example, in recent Garda investigations at Anglo Irish Bank.  

This section provides the Gardai with considerable additional leverage.  

The 2001 Act only allowed for penalty of IR£500 or 6 months for failure to disclose passwords and as far as we are aware these penalties were never imposed.

### <mark style="background: #00ECFFA6;">New Legislation</mark>

<mark style="background: #00ECFFA6;">The National Cyber Security Strategy 2015 – 2017:</mark> 
- Promised new legislation
- This is an implementation of EU Directive 2013/40  

<mark style="background: #00ECFFA6;">New Act: The Criminal Justice (offences relating to information systems) Act 2017.</mark>  
-  Took effect 12th June 2017  
-  Creates a number of very specific criminal offences  
-  Strict penalties, aimed at tackling the use of ransomware and other cyber security threats

### <mark style="background: #00ECFFA6;">The Criminal Justice (offences relating to information systems) Act 2017</mark>

Accessing information system without lawful authority, etc.  
- 2. A person who, without lawful authority or reasonable excuse, intentionally accesses an information system by infringing a security measure shall be guilty of an offence.  

Interference with information system without lawful authority so as to hinder or interrupt its functionality  

Interference with data without lawful authority  

Intercepting transmission of data without lawful authority  

Use of computer programme, password, code or data for purpose of the commission of any of the above offences

Act strengthens the power of investigation for the Gardaí.  

District Court can issue search warrants where Gardaí have reasonable grounds to suspect a crime has occurred under this Act.  

The new cybercrime offences are reportable offences under Schedule 1 of the Criminal Justice Act 2011.

### <mark style="background: #00ECFFA6;">Gardaí access to passwords</mark>

“A Garda will only have the power to require someone to provide a password in relation to devices found when carrying out a warrant to search a place for evidence of an offence. A search warrant can only be obtained where there are reasonable grounds to suspect that there is evidence of an offence at the place,”  

Under the GENERAL SCHEME OF GARDA SÍOCHÁNA (POWERS) BILL we can see the exact wording:  
- https://assets.gov.ie/137505/620ea206-de91-4bb3-97b1-0e0209b3ecf8.pdf  (search for password) then (search for encryption)
- https://www.iccl.ie/archive/a-handy-guide-to-the-phone-snooping-powers-of-the-garda-siochana-ombudsman-commission-gsoc-and-an-garda-siochana/
- https://www.thejournal.ie/gardai-phone-bill-password-5780057-Jun2022

### <mark style="background: #00ECFFA6;">Gardaí access to passwords</mark>  

Paragraph (e) of the General Scheme of Garda Síochána (Powers) Bill implements the recommendations of the Law Reform  
Commission that a person executing a search warrant should have certain powers in relation to the persons present at the place. It also includes the power to require a person to give passwords, and to produce material in a visible and legible form.  

Without the password it would be virtually impossible to get access to a device within a reasonable time frame. Some phone devices reset to factory default if the password is entered incorrectly a number of times. eg. iphone: Erase data after 10 failed passcodes (https://support.apple.com/en-au/guide/iphone/iph14a867ae/ios)


# <mark style="background: #00ECFFA6;">13 Windows Registry</mark>

### <mark style="background: #00ECFFA6;">Warning</mark>
- Please take extreme caution when editing the Windows Registry.  
- This can be backed up and examined as needed.  
- Don't launch the Registry Editor and start deleting things etc....
- This requires specific knowledge and shouldn't be edited.  
- We will backup a registry first before our investigative process

### <mark style="background: #00ECFFA6;">WHAT IS THE REGISTRY?</mark>

Hierarchical database, it contains the value of variables in Windows and in the applications and services that run on Windows.  

<mark style="background: #00ECFFA6;">It contains:</mark>
- Configurations and settings used by components, services, applications etc...  
- Registry primarily uses Key / Value pairs.  
- Registry Keys are objects that provides logical structure (kind of like folders)  
- Values store data and they contain the actual settings.  
- “The Registry contains information that Windows continually references during operation, such as profiles for each user, the applications installed on the computer and the types of documents that each can create, property sheet settings for folders and application icons, what hardware exists on the system, and the ports that are being used.”

<mark style="background: #00ECFFA6;">Notable content in the Registry:</mark>
- User Profiles  
- File extensions and installed applications  
- Settings for folders etc  
- System Hardware  
- Port config for I/O comms  
- Instal- Date  
- Time Zone Information  
- Users in the system  
- Registered owner

### <mark style="background: #00ECFFA6;">LAUNCHING THE REGISTRY</mark> 

-  Open a Run Dialog box.  
-  Type: regedit

![[Pasted image 20251121155119.png]]

### <mark style="background: #00ECFFA6;">REGISTRY STRUCTURE</mark>

![[Pasted image 20251121155150.png]]

### <mark style="background: #00ECFFA6;">Run Regedit as System</mark>

Some areas of the registry may be restricted.  

The Registry editor may need to be run with System privilege  

PsExec can be used to launch the registry editor as System  
https://docs.microsoft.com/en-gb/sysinternals/downloads/psexec  

To run:  
``l psexec -i -d -s c:\windows\regedit.exe``

<mark style="background: #00ECFFA6;">What is a Registry Hive</mark>

A Hive is a major section in the Windows Registry.  

It contains a group of keys, subkeys, and values in the registry that has a set of supporting files that contain backups of its data.  

The Hives are a set of files. Each Hive is a hierarchical structure.  

Paths to hives are set in the Configuration Manager (with exception of user profiles)  

The Configuration Manager creates the rook keys and links the hives together in the registry structure.

![[Pasted image 20251121160156.png]]

### <mark style="background: #00ECFFA6;">Registry Hive - Header</mark>

4096 bytes long  

<mark style="background: #00ECFFA6;">Stores info on:</mark>  
- Signature  
- Primary and secondary sequence numbers  
- Last write timestamp  
- Etc...

<mark style="background: #00ECFFA6;">Header:</mark>
- Signature (offset 0x0)
- Primary and Secondary sequence numbers (offset 0x04 and 0x08)
- Last Write (offset 0xC)
- Major and minor version (offset 0x14 and offset 0x18)
- Root cell offset (offset 0x24)
- Length (offset 0x28)
- Internal file name (offset 0x30)

If sequence numbers don’t match the hive is dirty.  

If hive is dirty log files will be needed or data may be missing

![[Pasted image 20251121160341.png]]

### <mark style="background: #00ECFFA6;">Log Files</mark>

Changes are made to the log files before this is reflected in the registry.

### <mark style="background: #00ECFFA6;">Hive Locations</mark>  

<mark style="background: #00ECFFA6;">HKEY_LOCAL_MACHINE\SYSTEM:</mark> ``%SystemRoot%\system32\config\SYSTEM``  

<mark style="background: #00ECFFA6;">HKEY_LOCAL_MACHINE\SAM:</mark> ``%SystemRoot%\system32\config\SAM``  

<mark style="background: #00ECFFA6;">HKEY_LOCAL_MACHINE\SECURITY:</mark> ``%SystemRoot%\system32\config\SECURITY``  

<mark style="background: #00ECFFA6;">HKEY_LOCAL_MACHINE\SOFTWARE:</mark> ``%SystemRoot%\system32\config\SOFTWARE``  

<mark style="background: #00ECFFA6;">HKEY_LOCAL_MACHINE\HARDWARE:</mark> Volatile hive  

<mark style="background: #00ECFFA6;">HKEY_LOCAL_MACHINE\SYSTEM\Clone:</mark> Volatile hive  

<mark style="background: #00ECFFA6;">HKEY_USERS\UserProfile:</mark> ``<profiles folder>\NTUSER.DAT``  

<mark style="background: #00ECFFA6;">HKEY_USERS.DEFAULT:</mark> 
``%SystemRoot%\system32\config\DEFAULT``

### <mark style="background: #00ECFFA6;">Install Date</mark>

The install date will hold information on when the system was installed. This may be relevant to the investigation if a person is saying they only had the machine a few months, but in fact they had it much longer.  

The Software Hive stores the install date.  

The value is a Unix Time Stamp (seconds from 1/1/1970)  

The time stamp is presented with the local time zone and UTC.  

We will talk about time zones later in this session

### <mark style="background: #00ECFFA6;">CurrentVersion:</mark>

``Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion``  

In-Class Demo...  

<mark style="background: #00ECFFA6;">Notable content:</mark>  
- ``InstallDate``  
- ``InstallTime``  
- ``PathName``  
- ``ProductName``  
- ``RegisteredOwner``  
- ``SystemRoo``

### <mark style="background: #00ECFFA6;">Time Zones</mark>

The time zones settings for a computer will affect the displayed time and the time that is noted in time stamps.  

For a forensic investigation it is important to verify the time zone we are dealing with.  

The time zone create an offset from UTC (Coordinated Universal Time)  

The time zone settings are kept in the SYSTEM Hive 
``Computer\HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\TimeZoneInformation``  

The ``TimeZoneKeyName`` holds the time zone info  

Daylight saver info is available here too.

### <mark style="background: #00ECFFA6;">Users in the System</mark>

As part of an investigation we may need to determine all the users for a given computer. A person accused of a transgression may claim another person/user may have done this.  

Our first source for the list of users would be the file system.  

For windows C:\Users, Mac Users Dir, etc...  

The Registry can be a more reliable source of information, the file system can be easily manipulated  

<mark style="background: #00ECFFA6;">The user info is located in:</mark>  
``Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Windows NT\CurrentVersion\ProfileList``  
-  There will be an entry here for each user on the system  
-  The ``ProfileImagePath`` will give the name of the user. The SID is the unique identifier.  
-  In-Class demo....

### <mark style="background: #00ECFFA6;">ROOT KEYS</mark> 

The root keys offer structure to the different types of information stored in the Registry.

![[Pasted image 20251121161613.png]]

<mark style="background: #00ECFFA6;">Interesting Fact:</mark> three of the five items on the root level aren’t here. These are just linked to items further down in one of the other keys.

### <mark style="background: #00ECFFA6;">ROOT KEYS - HKEY_CLASSES_ROOT (HKCR)</mark>

This is used to manage file type associations (mainly file extension associations and COM class registrations)  

 This is a link to HKLM\Software\Classes  

<mark style="background: #00ECFFA6;">content of HKEY_CLASSES_ROOT comes from:</mark>  
-  HKEY_LOCAL_MACHINE\SOFTWARE\Classes  
-  HKEY_CURRENT_USER\SOFTWARE\Classes  
-  Stores data that associates file types with programs.  
-  Subkeys in HKCR have the same name as the file name extension for the file type  
-  The current merged configuration lets the system register program classes independently for each user. This feature is known as per user class registration.  
-  The open with associations are all stored in HKEY_CLASSES_ROOT.  
-  User specific options are in HKEY_CURRENT_USER\SOFTWARE\Classes

### <mark style="background: #00ECFFA6;">HKCR - EXAMPLE</mark>

HKEY_CLASSES_ROOT

![[Pasted image 20251121161800.png]]

### <mark style="background: #00ECFFA6;">ROOTKEYS - HKEY_CURRENT_USER (HKCU)</mark>

-  HKCU contains configuration information for Windows and software specific to the currently logged in user.  
-  The registry keys and values in this hive are used to control user-level settings (wall papers, preferences, shared drives, printers, etc)  
-  Many of the changes a user makes in Control Panel are stored here.  
-  HKCU offers default system-wide file extension association for a file.

![[Pasted image 20251126213416.png]]

### <mark style="background: #00ECFFA6;">HKCU - EXAMPLE</mark>

Change default from notepad to word pad for .txt (Using Windows Explorer)  
  
![[Pasted image 20251126213529.png]]
``Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\OpenWithList``

### <mark style="background: #00ECFFA6;">ROOTKEYS- HKEY_LOCAL_MACHINE (HKLM)</mark> 

HKLM stores configuration information for the software you have installed including the Windows operating system.  

This hive also keeps information on currently detected hardware and device drivers.  

Stores information on boot configuration (Win 7/8/10)

![[Pasted image 20251126213700.png]]

### <mark style="background: #00ECFFA6;">HKEY_LOCAL_MACHINE - BCD00000000</mark>

Stores boot configuration data to boot Windows OS  

<mark style="background: #00ECFFA6;">For UEFI boot the hive is:</mark> ``/EFI/Microsoft/Boot/BCD``  

<mark style="background: #00ECFFA6;">For BIOS boot the hive is:</mark> /boot/BCD  

Note data should be edited with bcdedit.exe, not regedit

### <mark style="background: #00ECFFA6;">ROOT KEYS - HKEY_USERS (HKU)</mark>

Contains user-specific configuration information for all currently active users on the computer  

Each key under HKU is a user on the system and is linked with a security ID (SID)  

This is loaded when user logs on.  

<mark style="background: #00ECFFA6;">Stores info on:</mark>  
- Mapped drives  
- Printers  
- Env variables  
- Etc...

![[Pasted image 20251126213839.png]]

![[Pasted image 20251126213903.png]]

### <mark style="background: #00ECFFA6;">ROOT KEYS – HKEY_CURRENT_CONFIG (HKCC) </mark> 

- This is a pointer to another location in the Registry
- Info in the Hardware Profile currently being used  

<mark style="background: #00ECFFA6;">Shortcut to:</mark>
Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Hardware Profiles\Current

![[Pasted image 20251126215356.png]]

### <mark style="background: #00ECFFA6;">MOST RECENTLY USED (MRU)</mark>

Windows and some applications store the MRU list in the Registry 

Some programs use local text files.  

This is a list of recently used programs or opened files that the Windows operating system saves in the Windows Registry  

This is linked to the drop down lists for programs opened etc. Eg:

![[Pasted image 20251126215523.png]]

![[Pasted image 20251126215557.png]]

### <mark style="background: #00ECFFA6;">BACKUP THE REGISTRY</mark>

In Registry Explorer, right click a key and export.  

This example is HKEY_CLASSES_ROOT

![[Pasted image 20251126215633.png]]

To copy the registry files for examination AccessData FTK Imager created a backup of all registry files.  

In-Class Demo....

### <mark style="background: #00ECFFA6;">Tracing a USB Device</mark>

<mark style="background: #00ECFFA6;">Sequence:</mark>
- <mark style="background: #00ECFFA6;">Plug and Play:</mark> new USB device is connected, the PnP Manager gets the event notification and gets the device information to try source the appropriate driver for this device.
- The new driver for the device is recorded in the setupapi log file, using this the timestamp the device was connected to the computer can be obtained.
- An entry is also created in the Registry
- HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR\ 
- The registry entry will use the device id as the key. 
- Unique id (usually device serial number or system generated id). If the second character of the id is an & it was system generated. 
- The device descriptor is not located in the memory area of the device and this should be retrieved separately from the image acquisition process

The recommendations from CA1 investigation suggested it would be beneficial to examine the desktop computer of Sarah Connor.  

Lets do this now.... In-Class Example....

### <mark style="background: #00ECFFA6;">Get USB Device ID</mark> 

1. Open Windows Explorer 
2. Right Click This PC  
3. Select Manage

![[Pasted image 20251126220050.png]]

4. In Computer Management  
5. Click Device Manager 
![[Pasted image 20251126220128.png]]

6. Expand USB Controllers  
7. Double click the device
![[Pasted image 20251126220152.png]]

8. The USB Mass Storage Device Properties will appear  
9. Click the Event Tab, this Information section contains the Device Info.

![[Pasted image 20251126220416.png]]

```txt
Device USB\VID_26BD&PID_9917\072109A640F15122 was configured.  
Driver Name: usbstor.inf  
Class Guid: {36fc9e60-c465-11cf-8056-444553540000}  
Driver Date: 06/21/2006  
Driver Version: 10.0.19041.1  
Driver Provider: Microsoft  
Driver Section: USBSTOR_BULK.NT  
Driver Rank: 0xFF2000  
Matching Device Id: USB\Class_08&SubClass_06&Prot_50  
Outranked Drivers:  
Device Updated: false  
Parent Device: USB\ROOT_HUB30\5&10c37a43&0&0

The Device ID is: 072109A640F15122
```

### <mark style="background: #00ECFFA6;">FTK Imager to get NTUSER dat</mark>

1. Open FTK Imager
2. Select Obtain Protected Files...
![[Pasted image 20251126220607.png]]

3. Select Password recovery and all registry files  
4. Pick a location to store the files  
5. Click ok
![[Pasted image 20251126220652.png]]

6. The files will be exported to the folder
![[Pasted image 20251126220859.png]]

### <mark style="background: #00ECFFA6;">Examine NTUSER.dat</mark>

AccessData Registry Viewer  

https://accessdata.com/product-download

### <mark style="background: #00ECFFA6;">NirSoft - USBDeview</mark>  

“USBDeview is a small utility that lists all USB devices that currently connected to your computer, as well as all USB devices that you previously used.”  

<mark style="background: #00ECFFA6;">Source:</mark> http://www.nirsoft.net/utils/usb_devices_view.html  

Offers data on device name/description, device type, serial number (for mass storage devices), the date/time that device was added, VendorID, ProductID, etc....

![[Pasted image 20251126221130.png]]

### <mark style="background: #00ECFFA6;">Registry Editor</mark>

https://ericzimmerman.github.io/#!index.md  

Registry viewer with searching, multi-hive support, plugins, and more. Handles locked files.  

“The capabilities of Registry Explorer and RECmd allows for quickly examining multiple hives at once and they can be leveraged to find new places where currently understood data is located in an easy to use and systematic way. It can be used in educational settings to not only understand the Registry from a functional level, but also from a deeply technical perspective.”

“Registry Explorer is a GUI based tool used to view the contents of offline Registry Hives. It can load multiple hives at once, search across all loaded hives using strings or regular expressions, exporting of data, and much more.” Source: Registry Explorer User Guide

![[Pasted image 20251126221243.png]]

# <mark style="background: #00ECFFA6;">14 Email Forensics</mark>

<mark style="background: #00ECFFA6;">Overview</mark>
- Intro to main e-mail components  
- E-mail Headers  
- Walkthrough Example  
- Key identifiers for an e-mail investigation

### <mark style="background: #00ECFFA6;">Why is Email Forensics Important</mark>

Email evidence is an important part of any computer investigation  

Investigator must know how e-mail is processed to examine and interpret the unique content of e-mail messages.  

Focused on the recovery, analysis, and investigation of emails and their associated data to gather evidence for legal, organisational, or cybersecurity purposes.  

Looking at examining email messages, headers, metadata, attachments, and the email system to gather relevant evidence for the investigation.

### <mark style="background: #00ECFFA6;">Case Study Example</mark>

“The Court's expert concluded, in a 147-page detailed report, that the August 3, 2000 e-mail produced by Munshani "is clearly not authentic."  

In short, the expert's conclusion establishes that Munshani took the header from another e-mail sent to him by Mr. Trivedi, altered the substance of that e-mail to provide supporting evidence that would avoid a statute of frauds defense, and then provided the altered e-mail in response to documentary production and urged its authenticity in sworn affidavits in the Federal Court and in this Court.”  

Munshani v. Signal Lake, No, No. 005529BLS, (Mass. Cmmw. Oct. 9, 2001): https://casetext.com/case/munshani-v-signal-lake

### <mark style="background: #00ECFFA6;">Investigating e-mail crimes</mark> 

Investigating e-mail may be criminal or policy violations.  

Goal is to prove or disprove the alleged offence.  

As per a standard investigation, we need to collect evidence, conduct the investigation and present the findings.  

It is important to know the appropriate privacy laws for a given jurisdiction.

### <mark style="background: #00ECFFA6;">Legal Considerations</mark>

General Data Protection Regulation (GDPR)  

Data Protection Act 2018  

Criminal Justice (Offences Relating to Information Systems) Act 2017: Protects against unauthorised access, interception, or alteration of emails.

### <mark style="background: #00ECFFA6;">Basic operation of e-mail</mark>


Where?

<mark style="background: #00ECFFA6;">MUA – Mail User Agent:</mark> Client application ti send and receive mail  

<mark style="background: #00ECFFA6;">MTA – Mail Transfer Agent:</mark> Accepts messages and routes them towards their intended destination  

<mark style="background: #00ECFFA6;">SPF – Sender Policy Framework:</mark> Specify what servers are allowed to send email on the domains behalf. SPF is used as a check to see if an email was send from a listed server (anti spam check)  

<mark style="background: #00ECFFA6;">DKIM – Domain Keys Identified Mail:</mark>
- Cryptographic check to see if a message originated from the sending domain (anti spam an forged mail checks).  

<mark style="background: #00ECFFA6;">MDA – Mail Delivery Agent:</mark> Deliver mail to client inbox

![[Pasted image 20251203212049.png]]

### <mark style="background: #00ECFFA6;">Mail Protocols</mark>

<mark style="background: #00ECFFA6;">SMTP (Simple Mail Transfer Protocol):</mark> sending emails from a client to a server or between servers.  

<mark style="background: #00ECFFA6;">POP3 – Post Office Protocol 3:</mark> Allow a MUA communicate with the MTA  

<mark style="background: #00ECFFA6;">IMAP – Internet Message Access Protocol:</mark> Allow a MUA communicate with the MTA, benefits is emails remain on server, can sync multiple devices etc...  

POP3 has been mainly replaced by IMAP

### <mark style="background: #00ECFFA6;">Email Header</mark>

An email header is a section of an email message that contains metadata about the email, providing detailed technical information about its origins, routing, and handling. It is not typically visible in the main body of the email that users see but can be viewed through advanced settings in email clients.  

Depending on the system, there are different mechanisms to view the full email header for a given email.  

<mark style="background: #00ECFFA6;">The method for viewing headers depends on the email client:</mark>  
- <mark style="background: #00ECFFA6;">Gmail:</mark> Open the email → Click the three-dot menu (top-right) → Select Show Original.  
- <mark style="background: #00ECFFA6;">Outlook:</mark> Open the email → Right-click → Select View Source or Message Options (look for the Internet headers section).  
- <mark style="background: #00ECFFA6;">Apple Mail:</mark> Open the email → Select View → Message → All Headers.  
- <mark style="background: #00ECFFA6;">Thunderbird:</mark> Open the email → Select View → Message Source.

### <mark style="background: #00ECFFA6;">Tool Demo</mark>

<mark style="background: #00ECFFA6;">Email Examiner Software:</mark> https://www.freeviewer.org/email-forensics/  

“Being one of the most trusted Email Examiner Software in the industry, this application permits users to load and ingest data from multiple platforms. A user can load email data files from 25+ desktop based email clients, all IMAP based cloud-based platforms. Moreover, users can also disk image files and Skype to scan its chats and calls.”

![[Pasted image 20251203212438.png]]

![[Pasted image 20251203212456.png]]

### <mark style="background: #00ECFFA6;">Examining e-mail Headers</mark>

Once we have an e-mail header we can begin our investigation.  

To start we will need to have a good understanding of the key header fields in the e-mail header  

<mark style="background: #00ECFFA6;">Example:</mark> Gmail to Gmail demo

<mark style="background: #00ECFFA6;">Received (key header fields)</mark>
- Lists the mail servers the email passed through, from the sender to the recipient.  
- Look at the first "Received" line (closest to the bottom of the header) to identify the sender's originating IP address.  
- Check the timestamps in each "Received" line to trace the email's journey and detect delays or abnormalities.

![[Pasted image 20251203212553.png]]

<mark style="background: #00ECFFA6;">From (key header fields):</mark>
- Shows the sender's email address.  
- Cross-check against the Return-Path and SPF/DKIM results to detect spoofing.

<mark style="background: #00ECFFA6;">To (key header fields):</mark>
- Indicates the recipient's email address. Ensure it matches the intended target.
![[Pasted image 20251203212728.png]]

<mark style="background: #00ECFFA6;">Subject (key header fields):</mark>
- Look for suspicious or deceptive subject lines (e.g., "URGENT" or "Congratulations").
![[Pasted image 20251203212808.png]]

<mark style="background: #00ECFFA6;">Date (key header fields):</mark>
- Confirms when the email was sent. Compare this with other timestamps in the header to detect manipulation.
![[Pasted image 20251203212844.png]]

<mark style="background: #00ECFFA6;">Return-Path (key header fields):</mark>
- indicates where undelivered emails would be sent back. If this doesn't match the "From" address, it may be a red flag
![[Pasted image 20251203212915.png]]

<mark style="background: #00ECFFA6;">Message-ID (key header fields):</mark>
- A unique identifier for the email, generated by the originating mail server.
- If this is missing or unusual (e.g., random strings), it could indicate a forged email.
![[Pasted image 20251203212953.png]]

<mark style="background: #00ECFFA6;">Authentication Results (key header fields)</mark>
- Includes SPF, DKIM, and DMARC results: SPF (Sender Policy Framework): Verifies if the sender's server is authorised to send on behalf of the domain.
- DKIM (DomainKeys Identified Mail): Checks if the email was digitally signed by the sender. 
- DMARC (Domain-based Message Authentication, Reporting, and Conformance): Ensures alignment between SPF/DKIM and the "From" address. 
- Look for "pass" or "fail" in these checks to validate sender authenticity.

### <mark style="background: #00ECFFA6;">Content-Type (key header fields)</mark>

Specifies the format of the email (e.g., plain text, HTML, or multipart).  

HTML emails with embedded scripts or links may indicate phishing.

![[Pasted image 20251203213112.png]]

<mark style="background: #00ECFFA6;">X-Headers (key header fields):</mark>
- Custom headers added by email systems (e.g., spam scores or internal tracking). Look for unusual tags like X-Spam, X-Originating-IP, or X-Mailer.

![[Pasted image 20251203213149.png]]

### <mark style="background: #00ECFFA6;">Identify Key Forensic Information</mark>

<mark style="background: #00ECFFA6;">IP Address:</mark> 
- Extract the originating IP address from the last "Received" entry.  
- Use an IP lookup tool to determine the sender's geographical location or organisation.  
- Beware of private IPs (e.g., 192.168.x.x) as they may indicate an internal server.  

<mark style="background: #00ECFFA6;">Timestamps:</mark>
- Verify if timestamps match the expected sending time.
- Look for discrepancies that may indicate time zone manipulation

### <mark style="background: #00ECFFA6;">MxToolbox Results</mark>

![[Pasted image 20251203213306.png]]

### <mark style="background: #00ECFFA6;">Identify Key Forensic Information</mark>

<mark style="background: #00ECFFA6;">Email Spoofing:</mark>
- Check if the "From" address matches the authenticated domain (SPF/DKIM).  
- Use online tools to validate DKIM signatures and SPF alignment.  

<mark style="background: #00ECFFA6;">Relay Analysis:</mark>
- Trace the path of the email across servers. If unexpected servers appear, it could indicate redirection or tampering.

### <mark style="background: #00ECFFA6;">Forensic Tools</mark>

Specialised tools can simplify header analysis and provide detailed reports:  

<mark style="background: #00ECFFA6;">MxToolbox Email Header Analyser:</mark> Extracts and interprets email header information.  

<mark style="background: #00ECFFA6;">MailXaminer:</mark> A forensic email analysis tool for detailed investigation.  

<mark style="background: #00ECFFA6;">Header Analyser Pro:</mark> Parses headers for quick detection of anomalies.

### <mark style="background: #00ECFFA6;">MxToolbox Email Header Analyzer</mark>

ABOUT EMAIL HEADERS  

"This tool will make email headers human readable by parsing them according to RFC 822. Email headers are present on every email you receive via the Internet and can provide valuable diagnostic information like hop delays, anti-spam results and more. If you need help getting copies of your email headers, just read this tutorial."

https://mxtoolbox.com/EmailHeaders.aspx

![[Pasted image 20251203214106.png]]

<mark style="background: #00ECFFA6;">Results:</mark>
![[Pasted image 20251203214132.png]]

### <mark style="background: #00ECFFA6;">Interpret Findings</mark>

<mark style="background: #00ECFFA6;">Phishing or Spoofing:</mark>
- Failing SPF/DKIM/DMARC checks.  
- "From" address not aligning with return-path or originating server.  

<mark style="background: #00ECFFA6;">Spam Indicators:</mark>
- High spam scores in X-headers.  
- Suspicious subject lines, multiple recipients, or malformed message IDs.  

<mark style="background: #00ECFFA6;">Malware:</mark>  
- Check attachments or links in the email body for malicious content.  
- Investigate the "Content-Type" field for hidden scripts.

### <mark style="background: #00ECFFA6;">Examining an Email</mark>

Email headers contain information about the path that email traversed  

<mark style="background: #00ECFFA6;">The first thing to look at is the following:</mark>
- From: jonathan.mccarthy@tudublin.ie  
- Return path: jonathan.mccarthy@tudublin.ie  

If these don’t match we may have a spoofed email.  

It is easy to spoof the from:, the return path can be spoofed too.  

The Return-Path: field is verified by the Sender Policy Framework (SPF)  

<mark style="background: #00ECFFA6;">SPF / DKIM / DMARC / ARC</mark> data (where available)

### <mark style="background: #00ECFFA6;">Examining an Email</mark>

<mark style="background: #00ECFFA6;">Received Headers:</mark>  
- The received header is the most important part of the email header and is usually the most reliable.  
- They offer a list of all the servers the message visited as it was routed from source to destination.  
- The top-most received header is closest to the destination, the bottom-most received header is closest to the source.  
- The means the last Received: is where the mail originated.  
- This IP can be checked (with dig) to see if this matches the domain name in the senders email address. We can check this by comparing value from the final bottom-most Received: header against the value of DNS entry of the domain

<mark style="background: #00ECFFA6;">SPF:</mark>
- SPF can pass for a spoofed email address if the Return Path has not been spoofed  
- SPF uses the Return Path email address in its check process.  
- If the return path is spoofed SPF will catch this (dig).  
- The result of the verification is detailed in the Authentication-Results: spf=pass

### <mark style="background: #00ECFFA6;">Important Fields</mark>  
- Delivered To:  
- From:  
- Return-Path:  
- Message-ID:  
- Sender Mailer Fingerprints (X-Headers:)  
- headers that are added to messages along with standard headers, can be custom to the mail provider  
- Received:

### <mark style="background: #00ECFFA6;">Suspicious Events</mark>
- Detect spoofed emails  
- Determine source of origin for email  
- Detect modifications  
- Identify the actual sender, recipient, data and time when it was sent, etc.  
- Email found on client can be linked to the originating server via unique ID