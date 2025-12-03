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

Criminal Justice (Offences Relating to Information Systems) Act 2017: Protects against unauthorized access, interception, or alteration of emails.

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
- Includes SPF, DKIM, and DMARC results: SPF (Sender Policy Framework): Verifies if the sender's server is authorized to send on behalf of the domain.
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