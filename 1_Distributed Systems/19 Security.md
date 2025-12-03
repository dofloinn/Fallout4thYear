### <mark style="background: #FFF503A6;">Security Goals</mark>  

Keep systems, programs, and data secure  

<mark style="background: #FFF503A6;">Three areas:</mark>
- <mark style="background: #FFF503A6;">Confidentiality:</mark> Keeping data & resources hidden
- <mark style="background: #FFF503A6;">Integrity:</mark> Protecting against unauthorized changes to the data or resources
- <mark style="background: #FFF503A6;">Availability:</mark> Ensuring that a system is accessible and capable of working to required performance specifications

<mark style="background: #FFF503A6;">Confidentiality</mark>  
- Information is disclosed only to authorised parties.
- Often you need to conceal the existence of data or communication

### <mark style="background: #FFF503A6;">Integrity</mark> 

Alterations to a system’s assets can be made only in an authorised way, ensuring accuracy and completeness.  

<mark style="background: #FFF503A6;">Three types of integrity</mark>  
- <mark style="background: #FFF503A6;">Data:</mark> Modification an unauthorised or accidental way
- <mark style="background: #FFF503A6;">Origin:</mark> Ensures authentication
- <mark style="background: #FFF503A6;">System operation:</mark> Intended functioning

### <mark style="background: #FFF503A6;">Availability</mark>

Ability to use the data or resources  

Systems should be accessible and capable of working as specified

### <mark style="background: #FFF503A6;">Authentication and Authorisation: Difference</mark>  

<mark style="background: #FFF503A6;">Authentication:</mark> Get and verify user’s identity  

<mark style="background: #FFF503A6;">Authorisation:</mark> 
- deciding if to allow access to the service or its resources 
- what type of access is permitted

### <mark style="background: #FFF503A6;">Security in distributed systems</mark>

<mark style="background: #FFF503A6;">Two specific concerns that centralised systems do not have:</mark>
- <mark style="background: #FFF503A6;">use of a network:</mark> contents may be seen by other, possibly malicious, parties
- <mark style="background: #FFF503A6;">use of servers:</mark> That authenticate the client and control access to services. Physical access to the system and the security controls - unknown to the client

### <mark style="background: #FFF503A6;">Dependability</mark>

Security in a computer system is strongly related to the notion of dependability – a separation between dependability and security may at times be quite difficult to make.  

<mark style="background: #FFF503A6;">A dependable system provides:</mark>  
- <mark style="background: #FFF503A6;">Availability:</mark> the system is operating correctly at any given moment, and is available to perform its functions on behalf of its users.
- <mark style="background: #FFF503A6;">Reliability:</mark> system can run continuously without failure
- <mark style="background: #FFF503A6;">Safety:</mark> when a system temporarily fails to operate correctly, no catastrophic event happens
- <mark style="background: #FFF503A6;">Maintainability:</mark> how easily a failed system can be repaired. 
- Confidentiality
- Integrity

### <mark style="background: #FFF503A6;">Security policy</mark>

Simply stating that a system should be able to protect itself against all possible security threats is not the way to actually build a secure system.  

What is first needed is a description of security requirements, that is, a security policy.  

A security policy describes precisely which actions the entities in a system are allowed to take and which ones are prohibited.  

<mark style="background: #FFF503A6;">Entities include:</mark> users, services, data, machines, and so on.  

Once a security policy has been laid down, it becomes possible to concentrate on the security mechanisms by which a policy can be enforced.

### <mark style="background: #FFF503A6;">Security mechanisms</mark>

<mark style="background: #FFF503A6;">Encryption:</mark> Transform data to something an attacker cannot understand, or that can be checked for modifications  

<mark style="background: #FFF503A6;">Authentication:</mark> Verify a claimed identity  

<mark style="background: #FFF503A6;">Authorisation:</mark> Check an authenticated entity whether it has the proper rights to access resources.  

<mark style="background: #FFF503A6;">Monitoring and auditing:</mark> Continuously trace access to resources

### <mark style="background: #FFF503A6;">Secure distributed systems: design principles</mark> 

Secure distributed systems are built around at least five design principles:  

<mark style="background: #FFF503A6;">Fail-safe defaults:</mark>
- defaults should already provide good protection.
- Infamous example: the default (user,password) “admin,admin” for edge devices (e.g. routers)  

<mark style="background: #FFF503A6;">Open design:</mark> do not apply security by obscurity: every aspect of a distributed system is open for review.  

<mark style="background: #FFF503A6;">Separation of privilege:</mark> ensure that critical aspects of a system can never be fully controlled by just a single entity.  

<mark style="background: #FFF503A6;">Least privilege:</mark> a process should operate with the fewest possible privileges.  

<mark style="background: #FFF503A6;">Least common mechanism:</mark> if multiple components require the same mechanism, then they should all be offered the same implementation of that mechanism.

### <mark style="background: #FFF503A6;">Where to implement security mechanisms</mark>

We are increasingly seeing end-to-end security, meaning that mechanisms are implemented at the level of applications  

<mark style="background: #FFF503A6;">Issue:</mark> which layer do we trust?  

<mark style="background: #FFF503A6;">Trusted Computing Base:</mark> The set of all security mechanisms in a (distributed) computer system that are necessary and sufficient to enforce a security policy.

![[Pasted image 20251120100635.png]]

### <mark style="background: #FFF503A6;">Trusted Computing Base (TCB)</mark>

<mark style="background: #FFF503A6;">The TCB encompasses:</mark> firmware, hardware, software, as well as humans.  

The smaller the TCB, the better.  

The idea is that if the TCB can be clearly identified, we at least know what to concentrate on when scrutinising a computer system to state that it is secure.  

<mark style="background: #FFF503A6;">Identifying the TCB:</mark> identifying the modules that need to be trusted, and those that do not.

### <mark style="background: #FFF503A6;">Privacy</mark>

<mark style="background: #FFF503A6;">Privacy and confidentiality are closely related, yet are different:</mark>
- Privacy can be <mark style="background: #FFF503A6;">invaded</mark> 
- Confidentiality can be <mark style="background: #FFF503A6;">breached</mark>
- Ensuring confidentiality is <mark style="background: #FFF503A6;">not</mark> enough to guarantee privacy.  

<mark style="background: #FFF503A6;">Right to privacy:</mark>
- “a right to appropriate flow of personal information.”
- Control who gets to see what, when, and how a person should be able to stop and revoke a flow of personal information.  

Distributed systems need to provide privacy where needed.

### <mark style="background: #FFF503A6;">General Data Protection Regulation (GDPR)</mark>  

<mark style="background: #FFF503A6;">The GDPR:</mark> A comprehensive set of regulations aiming to  
protect personal data.  

<mark style="background: #FFF503A6;">The European’s GDPR:</mark> without explicit consent, no data set should allow for the identification of an individual - technically a very demanding task

### <mark style="background: #FFF503A6;">Security models</mark>

The security model provides the basis for the analysis and design of secure systems in which these costs are kept to a minimum.  

<mark style="background: #FFF503A6;">This analysis involves the construction of a threat model:</mark>
- listing all the forms of attack to which the system is exposed;
- an evaluation of the risks and consequences of each.

### <mark style="background: #FFF503A6;">Security of a distributed system</mark>

<mark style="background: #FFF503A6;">Can be achieved by:</mark>  
- Securing processes and communication channels, and
- Protecting objects (or resources of all types) they encapsulate against unauthorised access.  

<mark style="background: #FFF503A6;">Protecting objects/resources:</mark>
- Uses access rights - specify who is allowed to perform the operations of an object/resource
- E.g., who is allowed to read or to write its state.
- A principal (the authority issuing access rights) - may be a user or a process.
- Illustrated example: the invocation comes from a user and the result from a server.

![[Pasted image 20251120101521.png]]

### <mark style="background: #FFF503A6;">Security model: Securing processes and communication channels</mark>  

<mark style="background: #FFF503A6;">Enemy model:</mark>  
- Eavesdropping via message interception, repeated trials of network access.  
- <mark style="background: #FFF503A6;">Threats to processes:</mark> inserting and forwarding incorrect IP addresses in message to servers or clients to confuse or disguise the enemy-sender.
- <mark style="background: #FFF503A6;">Threats to communication channels:</mark> copying, altering or inserting incorrect data into message streams to deceive or replicate unauthorized transactions (e.g. banking)

These threats can be defeated by the use of secure channels – which are based on cryptography and authentication

![[Pasted image 20251120101629.png]]

### <mark style="background: #FFF503A6;">Security model: Defeating security threats</mark>

<mark style="background: #FFF503A6;">Cryptography and shared secrets:</mark>
- Cryptography – the science of keeping messages secure 
- Encryption – the process of scrambling a message in such a way as to hide its contents  

<mark style="background: #FFF503A6;">Authentication:</mark>
- proving the identities supplied by their senders. 
- establishing and verifying the identity of a user (or a service, process, or server).  

<mark style="background: #FFF503A6;">Secure channels:</mark> Encryption and authentication are used to build secure channels as a service layer on top of existing comms services. A secure channel is a communication channel connecting a pair of processes, each of which acts on behalf of a principal.

![[Pasted image 20251120101738.png]]

### <mark style="background: #FFF503A6;">Security model</mark>

<mark style="background: #FFF503A6;">Other possible threats from an enemy:</mark>  
- <mark style="background: #FFF503A6;">Denial of service:</mark> excessive and pointless invocations on services or message transmissions in a network, resulting in overloading of physical resources (network bandwidth, server processing capacity).
- <mark style="background: #FFF503A6;">Mobile code:</mark> a Trojan horse role, purporting to fulfil an innocent purpose, but in fact including code that accesses or modifies resources that are legitimately available to the host process, but not to the originator of the code.

### <mark style="background: #FFF503A6;">Secure Channels:</mark>

Each of the processes knows reliably the identity of the principal on whose behalf the other process is executing. This enables the server to protect its objects correctly and allows the client to be sure that is receiving results from a bona fide server.  

Ensure the privacy and integrity (protection against tampering) of the data transmitted across it.  

Each message includes a physical or logical time stamp to prevent messages from being replayed or reordered.  

<mark style="background: #FFF503A6;">Examples:</mark> Transport Layer Security (TLS) and its predecessor, Secure Sockets Layer (SSL), are cryptographic protocols which provide a secure channel between two communication peers.

### <mark style="background: #FFF503A6;">Symmetric and asymmetric cryptosystems</mark>  

<mark style="background: #FFF503A6;">Symmetric cryptosystem:</mark> the same key is used to encrypt and decrypt a message  

<mark style="background: #FFF503A6;">Asymmetric cryptosystem:</mark> the keys for encryption and decryption are different, but together form a unique pair.

### <mark style="background: #FFF503A6;">Confidential group communication</mark> 

<mark style="background: #FFF503A6;">All group members share the same secret key:</mark>
- Used to encrypt and decrypt all messages transmitted between group members.
- All members are trusted to indeed keep the key a secret
- Vulnerable to attacks compared to two-party secure channels.  

Use a <mark style="background: #FFF503A6;">separate</mark> shared secret key between each pair of group members:
- As soon as one member turns out to be leaking information, the others can stop sending messages to that member, but still use the keys they were using to communicate with each other.
- Instead of having to maintain one key, it is now necessary to maintain N(N − 1)/2 keys, which may be a difficult problem by itself.  
- Using a <mark style="background: #FFF503A6;">public-key cryptosystem</mark> can improve matters. In that case, each member has its own (public key, private key), pair, in which the public key can be used by all members for sending confidential messages. In this case, a total of N key pairs are needed. If one member ceases to be trustworthy, it is simply removed from the group without having been able to compromise the other keys.

### <mark style="background: #FFF503A6;">Key management</mark>

<mark style="background: #FFF503A6;">Essence:</mark> How do Alice and Bob get the correct (often shared) keys so that they can set up secure channels?  

Establishing and distributing keys is not a trivial matter.  

One of the more difficult parts in key management is the actual distribution of initial keys.

### <mark style="background: #FFF503A6;">Public key cryptography</mark> 

Does not require the parties to share a secret key.  

A message encrypted with your private key can be decrypted only with your public key. Anyone can perform the decryption - you are the only one who could do the encryption - authentication  

A message encrypted with your public key can be decrypted only with your private key. Anyone can do the encryption - you are the only one that is able to decrypt the message confidentiality and secure communication.  

<mark style="background: #FFF503A6;">Public key encryption algorithms examples:</mark> 
- RSA (Rivest–Shamir–Adleman)
- ECC (Elliptic Curve Cryptography).

### <mark style="background: #FFF503A6;">Public Key Authentication</mark>  

Demonstrate we can encrypt or decrypt a <mark style="background: #FFF503A6;">nonce</mark> - a random set of bits. This shows we know the key.

<mark style="background: #FFF503A6;">Alice wants to authenticate herself to Bob:</mark>
- Bob: generates nonce, S
- Sends it to Alice
- Alice: encrypts S with her private key (signs it)  
- Sends result to Bob

<mark style="background: #FFF503A6;">Bob:</mark>  
1. Look up “Alice” in a database of public keys  
2. Decrypt the message from Alice using Alice’s public key  
3. If the result is S, then Bob is sure that he is talking with Alice

<mark style="background: #FFF503A6;">For mutual authentication:</mark>
Alice has to present Bob with a nonce that Bob will encrypt with his private key and return

### <mark style="background: #FFF503A6;">Public key authentication</mark>

<mark style="background: #FFF503A6;">Public key authentication:</mark>
- Binding identity = to a public key
- Identities can be created by generating random [private, public] key pairs  

<mark style="background: #FFF503A6;">How do you know it really is Alice’s public key?</mark>  
- <mark style="background: #FFF503A6;">One option:</mark> Get keys from a trusted source 
- <mark style="background: #FFF503A6;">Problem:</mark> requires always going to the source 
- Can not pass keys around
- <mark style="background: #FFF503A6;">Another option:</mark>  Sign the public key – that protects it  
- Create digital certificate

### <mark style="background: #FFF503A6;">Digital certificates</mark>

<mark style="background: #FFF503A6;">Data structure that contains:</mark>
- user information
- the user’s public key 
- a signature of the certification authority

<mark style="background: #FFF503A6;">Certificate standards and certificate authorities</mark>
- X.509 is the most widely used standard format for public key certificates  
- X509 Certificate format:
- ![[Pasted image 20251120102939.png]]

### <mark style="background: #FFF503A6;">Reminder</mark>

<mark style="background: #FFF503A6;">Digital signature:</mark> Hash of a message encrypted with the signer’s private key  

<mark style="background: #FFF503A6;">A hash function:</mark>
- used to only verify the message integrity
- takes an input (or 'message') and returns a fixed-size string of bytes
- the string is called the 'hash value', 'message digest', 'digital fingerprint', 'digest' or 'checksum'. 
- if a message changes, the <mark style="background: #FFF503A6;">hash</mark> of a message will change

### <mark style="background: #FFF503A6;">Public Key Infrastructure</mark> 

Public Key Infrastructure (PKI) is a term used for a framework that enables secure exchange of information based on public key cryptography.  

It allows identities (of people, organizations, etc.) to be bound to digital certificates and provides a means of verifying the authenticity of certificates.  

<mark style="background: #FFF503A6;">PKI encompasses:</mark>
- Keys
- Certificates
- Public key encryption, and
- trusted Certification Authorities (CAs) who generate and digitally sign certificates.

### <mark style="background: #FFF503A6;">What Applications use Certificates?</mark>  

<mark style="background: #FFF503A6;">Web browsers:</mark> 
- X.509 certificates with Transport Layer Security (TLS)
- <mark style="background: #FFF503A6;">Code-signing schemes:</mark> signed Java ARchives, and Microsoft Authenticode.
- <mark style="background: #FFF503A6;">Secure E-Mail standards:</mark> Privacy Enhanced Mail (PEM) and Secure/Multipurpose internet Mail Extensions (S/MIME).

### <mark style="background: #FFF503A6;">How do I Get a Certificate?</mark>

Create one yourself – using the right tools, such as keytool  

Ask a Certification Authority to issue you one

### <mark style="background: #FFF503A6;">Transport Layer Security (TLS)</mark>  

Provides authentication, integrity, and encrypted communication  

Secure communication without prior negotiation or help from 3rd parties  

Free choice of crypto algorithms by client and server  

Communication in each direction can be authenticated, encrypted or both  

Most widely used to secure HTTP interactions for use in Internet commerce and other security-sensitive applications.

### <mark style="background: #FFF503A6;">TLS main features</mark>

<mark style="background: #FFF503A6;">Negotiable encryption and authentication algorithms:</mark> algorithms negotiated during the initial handshake.  

<mark style="background: #FFF503A6;">Bootstrapped secure communication:</mark> Unencrypted communication is used for the initial exchanges, then public key-key cryptography and finally switching to secret-key cryptography once a shared key has been established.  

<mark style="background: #FFF503A6;">Protocol prefix https:</mark> in URLs initiates the establishment of an TLS secure channel between a browser and a web server.

### <mark style="background: #FFF503A6;">TLS Protocols</mark> 

<mark style="background: #FFF503A6;">1. Authenticate & establish key:</mark>  
- <mark style="background: #FFF503A6;">Authentication:</mark> Public keys (X.509 certificates and RSA or Elliptic Curve cryptography)
- <mark style="background: #FFF503A6;">Key exchange options:</mark> 
	- Ephemeral Diffie-Hellman keys (generated for each session)  
	- RSA public key, Elliptic Curve public key Pre-shared key  
<mark style="background: #FFF503A6;">2. Communicate:</mark>
- Data encryption options – symmetric cryptography 
- AES GCM, AES CBC, ARIA (GCM/CBC), ChaCha20-Poly1305, ...
- Data integrity options – message authentication codes  
- HMAC-SHA1, HMAC-SHA256/384, ...

### <mark style="background: #FFF503A6;">TLS Layers</mark>

<mark style="background: #FFF503A6;">Two layers:</mark>  
- <mark style="background: #FFF503A6;">Record Protocol layer:</mark> which implements a secure channel, encrypting and authenticating messages transmitted through any connection-oriented protocol
- <mark style="background: #FFF503A6;">Handshake layer:</mark> containing the SSL handshake protocol and two other related protocols that establish and maintain an SSL session (that is, a secure channel).

![[Pasted image 20251120103848.png]]

### <mark style="background: #FFF503A6;">TLS handshake protocol</mark>

![[Pasted image 20251120103919.png]]

### <mark style="background: #FFF503A6;">TLS record protocol</mark>  

A message for transmission is first fragmented into blocks of manageable size.  

Then the blocks are optionally compressed.  

The encryption and message authentication (MAC) transformations deploy the algorithms specified in the agreed cipher suite.  

The signed and encrypted block is transmitted to the partner through associated TCP connection, where the transformations are reversed to produce the original data block.

![[Pasted image 20251120104008.png]]

### <mark style="background: #FFF503A6;">TLS</mark>

A practical implementation of a hybrid encryption scheme with authentication and key exchange based on public keys.  

Because the ciphers are negotiated in the handshake, it does not depend upon the availability of any particular algorithms, nor any secure services at the time of session establishment.  

The only requirement is for public-key certificates issued by an authority that is recognized by both parties.

### <mark style="background: #FFF503A6;">TLS</mark>

<mark style="background: #FFF503A6;">Advantages:</mark>
- Validates the authenticity of the server – if you trust the CA
- Protects integrity of communications 
- Protects the privacy of communications  

<mark style="background: #FFF503A6;">Disadvantages:</mark>
- Latency for session setup
- Older protocols had weaknesses
- Attackers also use TLS

### <mark style="background: #FFF503A6;">Open Authorization (OAuth)</mark>  

Delegation protocol  

Used by Amazon, Google, Facebook, Microsoft, and Twitter  

<mark style="background: #FFF503A6;">Main purpose:</mark>
- to grant an application access to resources that are normally accessible to a user only through a Web interface; 
- e.g. using a local mail client 
- allows you to specify what access you allow to use the service and for how long.  

<mark style="background: #FFF503A6;">Design:</mark>
- Allow users to control what data or services one service can access from another service
- <mark style="background: #FFF503A6;">Token credentials:</mark> used instead of the resource owner’s username and password for gaining access to the service.

### <mark style="background: #FFF503A6;">References</mark>

Chapter 11 - Security: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design  

Chapter 9: Maarten van Steen, Andrew S. Tanenbaum, Distributed Systems, 4th edition (2023)