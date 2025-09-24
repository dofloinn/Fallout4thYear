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

File carving is a process used in digital forensics.

It looks at extracting data from a drive (storage device) without using the file system.

Carving is extracting structured data from a larger set of raw data based on characteristics(patterns) in the raw data.

Carving is a powerful process to a digital investigation by:
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

Each file will have a header and footer distinguishing the beginning and end of the file.

Each file type will have a unique header/footer

The header can also be referred to as a magic number.

On the disk we are trying to identify specific types of file headers and/or footers and carve out blocks between these two markers

Not all files have standard footers, these can be difficult to work with.

Depending on the filesystem the data can be in different locations, we will see this in more detail in week 3.

### <mark style="background: #00ECFFA6;">Header to Footer Carving:</mark>

Most file types have standard headers and footers

To recover data an analyst can carve out everything between the JPEG header and footer to recover the image file.

A hex editor can be used to work with the disk / image.

### <mark style="background: #00ECFFA6;">File Structure Based Carving:</mark>

This uses the internal layout of a file

This looks at the header, footer and the file metadata

Popular carvers use this technique (eg. Photorec and Scapel)

### <mark style="background: #00ECFFA6;">Content-based carving:</mark>

This is used to recover file data that has not been recovered from file structure carving.

This uses machine learning and statistic-based algorithms to look for statistical patterns or signatures indicating language or file content.

All possible data clusters are gathered that appear to be related to the image. These are used to try extract and find meaningful data/information.

### <mark style="background: #00ECFFA6;">Potential Issues:</mark>

No entry in the File table for a given file

File just exists in unallocated space.

File still exists in unallocated space but some sectors have been reused

Files may be incomplete, e.g. Start, end, middle sectors may have been reused

Majority of file carving programs will only recover files that are contiguous

Files on SSDs may be fragmented, e.g. out-of-order and missing sectors

### <mark style="background: #00ECFFA6;">Scalpel:</mark>

Scalpel is a file carving and indexing application that runs on Linux and Windows. The first version of Scalpel, released in 2005, was based on Foremost 0.69. There have been a number of internal releases since the last public release, 1.60, primarily to support our own research.

As of 6/27/2013 Scalpel has been released under the Apache 2.0 License and the source is available at The Sleuth Kit github repository.

Source: https://github.com/sleuthkit/scalpel

### <mark style="background: #00ECFFA6;">PhotoRec:</mark>

PhotoRec is file data recovery software designed to recover lost files including video, documents and archives from hard disks (Mechanical Hard drives, Solid State Drives...), CD-ROMs, and lost pictures (thus the Photo Recovery name) from digital camera memory. PhotoRec ignores the file system and goes after the underlying data, so it will still work even if your media's file system has been severely damaged or reformatted.

Autopsy uses PhotoRec as part of its ingest modules. We will see this hext week.

Source: https://www.cgsecurity.org/wiki/PhotoRec