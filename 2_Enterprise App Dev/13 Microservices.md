### <mark style="background: #C900FFA6;">Summary of lecture</mark> 

<mark style="background: #C900FFA6;">Microservices:</mark> Small, independent services that communicate via APIs.  

<mark style="background: #C900FFA6;">Docker:</mark> Lightweight containers used for application deployment.  

<mark style="background: #C900FFA6;">Kubernetes:</mark> A container orchestrator for managing, scaling, and deploying applications.  

<mark style="background: #C900FFA6;">Istio:</mark> A platform for managing microservices-based applications that provides control, security, and observability.

### <mark style="background: #C900FFA6;">What are Microservices?</mark>

Microservices are a collection of small, independent, and self-contained services. They represent a way of designing software where several separate services communicate through simple connections known as APIs.  

Microservices function like building blocks for software; numerous smaller ones collaborate instead of one extensive program.  

Each block performs a specific task and communicates easily with others, simplifying the management and updating of your software.

### <mark style="background: #C900FFA6;">What is a monolithic architecture?</mark>

<mark style="background: #C900FFA6;">Monolithic architecture</mark> is a <mark style="background: #C900FFA6;">single-block software structure</mark> in which all components are <mark style="background: #C900FFA6;">tightly integrated</mark> into one cohesive unit.  

It utilises a <mark style="background: #C900FFA6;">single code base and runtime environment</mark> to create a single-tier architecture application.  

Although it is <mark style="background: #C900FFA6;">quick and inexpensive to deploy for smaller programs</mark>, monolithic architecture lacks flexibility and scalability.

### <mark style="background: #C900FFA6;">Analogy for MS vs Monolithic</mark>

<mark style="background: #C900FFA6;">Swiss Knife:</mark> Monolithic approach 

<mark style="background: #C900FFA6;">Toolbox:</mark> MS approach

![[Pasted image 20260320115130.png]]

![[Pasted image 20260320115144.png]]

### <mark style="background: #C900FFA6;">Some examples of microservices</mark>

![[Pasted image 20260320115202.png]]

### <mark style="background: #C900FFA6;">Monolithic Architecture</mark> 

<mark style="background: #C900FFA6;">Advantages:</mark>  
- <mark style="background: #C900FFA6;">Simple development:</mark> Rapidly develop complete applications, making it ideal for start-ups.  
- <mark style="background: #C900FFA6;">Easy deployment:</mark> Manage and maintain fewer components compared to microservices.  
- <mark style="background: #C900FFA6;">Uncomplicated testing and debugging:</mark> Testing and debugging are more straightforward, thanks to the cohesive nature of the application.  

<mark style="background: #C900FFA6;">Disadvantages:</mark>  
- <mark style="background: #C900FFA6;">Less scalability:</mark> Scaling is challenging because the entire architecture must be changed.  
- <mark style="background: #C900FFA6;">Inability to adapt to new technologies:</mark> Tight coupling restricts the integration of new technologies without requiring the entire app to be rebuilt.  
- <mark style="background: #C900FFA6;">High dependence between functionalities:</mark> The dependency among functions can lead to challenges in software engineering and increased downtime.

### <mark style="background: #C900FFA6;">Microservices Architecture</mark>

<mark style="background: #C900FFA6;">Advantages:</mark>
- <mark style="background: #C900FFA6;">Independent services:</mark> Each service is developed independently, enabling quick and efficient development.  
- <mark style="background: #C900FFA6;">Enables agile development:</mark> Allows flexibility in choosing the best tech stack for each service, leading to faster development.  
- <mark style="background: #C900FFA6;">Scalable and reliable:</mark> Loose coupling makes it easy to optimise, test, debug, and fix functions independently, ensuring reliability and scalability.

<mark style="background: #C900FFA6;">Disadvantages:</mark>  
- <mark style="background: #C900FFA6;">Time and resource-consuming:</mark> Developing and integrating multiple microservices can be time-consuming, requiring substantial resources and expertise.  
- <mark style="background: #C900FFA6;">Complicated deployment:</mark> Integrating microservices into a functional app can be complex, especially for cross-cutting concerns like authorisation.  
- <mark style="background: #C900FFA6;">Complex testing:</mark> Requires individual testing of each service and testing of their integration as a whole, which can be time-consuming.

### <mark style="background: #C900FFA6;">Differences between Microservices and Monolithic architecture</mark>

<table>
	<tr>
		<td>Aspect</td>
		<td>Microservices</td>
		<td>Monolithic Architecture</td>
	</tr>  
	<tr>
		<td>Development</td>
		<td>Enables independent development</td>
		<td>Simpler development process</td>
	</tr>  
	<tr>
		<td>Deployment</td>
		<td>Scalable and reliable</td>
		<td>Easier deployment</td>
	</tr>  
	<tr>
		<td>Testing and Debugging</td>
		<td>Simplified testing and debugging</td>
		<td>Streamlined testing process</td>
	</tr>  
	<tr>
		<td>Scalability</td>
		<td>Achieved by scaling individual services</td>
		<td>Limited scalability</td>
	</tr>  
	<tr>
		<td>Adaptability</td>
		<td>Easy integration of new technologies</td>
		<td>Difficulty in incorporating new technologies</td>
	</tr>  
	<tr>
		<td>Dependency</td>
		<td>Lower dependence between functionalities</td>
		<td>High dependency among functionalities</td>
	</tr>  
	<tr>
		<td>Resource Consumption</td>
		<td>Can be resource-intensive during development</td>
		<td>Generally requires fewer resources</td>
	</tr>  
	<tr>
		<td>Deployment Complexity</td>
		<td>Requires complex integration</td>
		<td>Simplified deployment process</td>
	</tr>  
	<tr>
		<td>Testing Complexity</td>
		<td>Complex testing of individual services</td>
		<td>Testing streamlined</td>
	</tr>  
</table>

### <mark style="background: #C900FFA6;">Building a microservice</mark>

Identify <mark style="background: #C900FFA6;">small units</mark> of functionality for each service.  

Ensure that each service has a <mark style="background: #C900FFA6;">complete and independent technology stack</mark>.  

<mark style="background: #C900FFA6;">Implement separate data stores</mark> for each service to maintain independence.  

<mark style="background: #C900FFA6;">Synchronise with other services</mark> as needed through persistence layers.  

Design <mark style="background: #C900FFA6;">services</mark> to be invoked through <mark style="background: #C900FFA6;">API Request/Response</mark>.  

Typically, we use <mark style="background: #C900FFA6;">REST, HTTP, and JSON to communicate</mark> between services.  

Ensure that each service is <mark style="background: #C900FFA6;">self-contained</mark>, with its inner workings not exposed externally.  

<mark style="background: #C900FFA6;">Allow developers the freedom to select technology</mark> components for each service

![[Pasted image 20260320120437.png]]

### <mark style="background: #C900FFA6;">Gateways in microservices</mark>

A <mark style="background: #C900FFA6;">gateway</mark> for microservices acts as a <mark style="background: #C900FFA6;">single entry point for clients to access various microservices</mark>.  

It serves as an <mark style="background: #C900FFA6;">intermediary between clients and the microservices architecture</mark>.  

<mark style="background: #C900FFA6;">Handles routing requests</mark> from clients to the appropriate microservice.  

It provides <mark style="background: #C900FFA6;">authentication, authorisation, load balancing</mark>, and rate-limiting functionalities.  

Enables <mark style="background: #C900FFA6;">centralised logging and monitoring</mark> for all microservices.  

Helps to <mark style="background: #C900FFA6;">enforce security measures</mark> across the microservices architecture.  

<mark style="background: #C900FFA6;">Facilitates versioning</mark> and <mark style="background: #C900FFA6;">API management</mark> for microservices.  

<mark style="background: #C900FFA6;">Improves performance by caching responses</mark> and optimising network traffic.

![[Pasted image 20260320120753.png]]

### <mark style="background: #C900FFA6;">When should we use Microservices?</mark>

![[Pasted image 20260320120828.png]]

### <mark style="background: #C900FFA6;">Contracts in MS</mark>

Contracts are like the rules that different microservices agree to follow when they communicate with each other. These rules are important for services to work together well and smoothly.

<mark style="background: #C900FFA6;">Interoperability:</mark> Contracts ensure microservices comprehend each other's languages and how they share information. This facilitates collaboration even when they utilise different technologies.  

<mark style="background: #C900FFA6;">Loose Coupling:</mark> Clear contracts allow microservices to interact without being overly connected. Therefore, changes to one service won't disrupt others as long as all parties adhere to the same rules.  

<mark style="background: #C900FFA6;">Scalability:</mark> Contracts enable each microservice to evolve independently. They all understand what to expect from one another, allowing them to be duplicated or replaced without causing significant issues for the entire system.  

<mark style="background: #C900FFA6;">Maintainability:</mark> Contracts simplify updating microservices without leading to unexpected problems. As long as everyone abides by the rules, making modifications is more straightforward.  

### <mark style="background: #C900FFA6;">GraphQL in MS</mark>  

<mark style="background: #C900FFA6;">Efficient and Flexible Data Fetching:</mark> GraphQL allows clients to request only the specific data they need, eliminating unnecessary data transfer and improving performance compared to traditional REST APIs.  

<mark style="background: #C900FFA6;">Precise Data Structure:</mark> Clients can specify the exact structure of the data they require, reducing the need for multiple API calls and data manipulation on the client side.  

<mark style="background: #C900FFA6;">Clear and Intuitive Interaction:</mark> GraphQL schemas define available data types and their relationships, providing a well-documented and easy-to-understand interface for clients and servers.

### <mark style="background: #C900FFA6;">Tools</mark>  

<mark style="background: #C900FFA6;">Frameworks:</mark> 

![[Pasted image 20260320121152.png]]

<mark style="background: #C900FFA6;">API Gateways:</mark>
- Azure API Management 
- Ocelot API Gateway 
- Traefik (traffic)  

![[Pasted image 20260320121211.png]]

### <mark style="background: #C900FFA6;">What are containers?</mark>

The main goal of a container is to allow an application that works in one machine to work on a different machine by including its libraries, bins (binary files), and other dependencies.  

<mark style="background: #C900FFA6;">A container is an independent element</mark> that allows the code to be separated from the machine where it is run.  

First, <mark style="background: #C900FFA6;">apps are developed</mark>, and then they can <mark style="background: #C900FFA6;">go to production</mark> by using a container.

### <mark style="background: #C900FFA6;">Containers are much lighter than the Virtual Machines</mark>

\*Virtual machines need much more space since they need a complete OS for themselves.

![[Pasted image 20260320121406.png]]

### <mark style="background: #C900FFA6;">Advantages of Docker Containers</mark>

<mark style="background: #C900FFA6;">Containers perform similar functions as VMs but use significantly less memory</mark> and operate faster since they do not need to replicate the entire operating system.  

Unlike VMs replicating a complete OS, <mark style="background: #C900FFA6;">containers require minimal memory</mark>, relying only on binaries and libraries.  

<mark style="background: #C900FFA6;">Containers are isolated at the kernel level</mark>, allowing libraries to be shared across all containers, thus eliminating the need for multiple copies.

### <mark style="background: #C900FFA6;">What is Docker?</mark>

Docker is <mark style="background: #C900FFA6;">open-source</mark> and is currently the <mark style="background: #C900FFA6;">most popular container platform</mark>.  

Docker has a <mark style="background: #C900FFA6;">market share of 82.56%</mark> in the containerisation market 2022.  

The <mark style="background: #C900FFA6;">Docker File defines everything needed</mark> to run the image (OS network specifications and file locations.)  

A <mark style="background: #C900FFA6;">Docker Image is a portable static component</mark> that runs on the Docker Engine.

![[Pasted image 20260320121605.png]]

### <mark style="background: #C900FFA6;">Why do we need a container orchestrator?</mark>  

Coordinate and plan all containers.  

Update the applications to the latest version without disrupting the service.  

Monitor the activity in the application.

### <mark style="background: #C900FFA6;">What is Kubernetes?</mark>

Kubernetes (K8s) is an open-source container orchestrator developed by Google and donated to the Cloud Native Computing Foundation.  

K8s leverages Google’s years of expertise in container management to provide a comprehensive system for automating containerised applications' deployment, scheduling, and scaling. It supports various containerisation tools, including Docker.  

Kubernetes is the market leader and the standardised method for orchestrating containers and deploying distributed applications.  

It can be run on a public cloud service or on-premises; Kubernetes is highly modular, open-source, and boasts a vibrant community.

### <mark style="background: #C900FFA6;">What does Kubernetes do?</mark>

Kubernetes <mark style="background: #C900FFA6;">compares the desired state</mark> (e.g. 3 copies of app 1 and 4 copies of app B) to the <mark style="background: #C900FFA6;">actual state</mark>, and if they aren’t the same, it takes steps to correct it.  

Handle a large volume of containers and users.  

<mark style="background: #C900FFA6;">Load-balancing</mark> replaces the chaos with order and efficient resource allocation.  

<mark style="background: #C900FFA6;">Manage service discovery</mark> and <mark style="background: #C900FFA6;">communication between containers and users</mark>.  

<mark style="background: #C900FFA6;">Authentication and security</mark> at the infrastructure (rather than the application) level, and to apply consistent policies across all platforms.  

<mark style="background: #C900FFA6;">Multi-platform deployment:</mark> Orchestration manages the complex task of coordinating container operation, microservice availability, and synchronisation in a multi-platform, multi-cloud environment.

### <mark style="background: #C900FFA6;">What is Kubernetes architecture and its components?</mark>  

Kubernetes is made up of many components that do not know or care about each other. The components all talk to each other through the API server.  

Each component operates its function and then exposes metrics we can collect for monitoring later.  

<mark style="background: #C900FFA6;">We can break down the components into three main parts:</mark> 
- <mark style="background: #C900FFA6;">The Control Plane:</mark> The Master.  
- <mark style="background: #C900FFA6;">Nodes:</mark> Where pods get scheduled.  
- <mark style="background: #C900FFA6;">Pods:</mark> Holds containers

### <mark style="background: #C900FFA6;">Kubernetes Cluster</mark>

![[Pasted image 20260320122018.png]]

### <mark style="background: #C900FFA6;">What is the Kubernetes Control Plane?</mark>

<mark style="background: #C900FFA6;">The control plane is the orchestrator:</mark>
- Etcd for storage  
- API server for communication between components  
- The scheduler decides which node pods should run on
- The controller manager checks the current state against the desired state.  
- Kubelet is part of the worker node. It is responsible for managing pods and their containers and dealing with pod specifications defined in YAML or JSON format.  

Nodes are the physical infrastructure. 

<mark style="background: #C900FFA6;">Together, they are the Kubernetes cluster:</mark>
- Pods are the lowest-level resource in the Kubernetes cluster. They are made up of one container but can have more.  
- When defining your cluster, limits are set for pods, which define what resources, CPU and memory they need to run.

![[Pasted image 20260320122202.png]]
 
### <mark style="background: #C900FFA6;">What is Istio?</mark>  

Istio is an <mark style="background: #C900FFA6;">open-source platform</mark> for <mark style="background: #C900FFA6;">managing microservices-based applications</mark>.  

It provides a <mark style="background: #C900FFA6;">central point of control for all the services</mark> in a distributed application, simplifying the management and troubleshooting of complex systems.  

Istio offers a range of features for <mark style="background: #C900FFA6;">managing traffic, load balancing, service discovery, and observability</mark>.  

It is designed to <mark style="background: #C900FFA6;">integrate with Kubernetes</mark> and other container orchestration systems, offering a comprehensive solution for managing microservices.  

Istio uses Envoy as its data plane, a fast and efficient proxy that handles network traffic between services.

### <mark style="background: #C900FFA6;">What is Istio?</mark>  

Istio provides <mark style="background: #C900FFA6;">advanced security features such as mutual TLS authentication</mark>, authorisation, and encryption to ensure secure service communication.  

It also <mark style="background: #C900FFA6;">offers fault injection and circuit breaking</mark> and tries to <mark style="background: #C900FFA6;">improve application resilience</mark>.  

Istio is <mark style="background: #C900FFA6;">highly customisable</mark> and can be <mark style="background: #C900FFA6;">extended with plugins or additional features</mark>.  

It can be <mark style="background: #C900FFA6;">integrated with other monitoring tools like Prometheus, Grafana, and Jaeger</mark> to provide greater observability and insight into application performance.  

Istio is supported by leading cloud providers, including <mark style="background: #C900FFA6;">Google Cloud, Microsoft Azure, and Amazon Web Services</mark>, making it easy to deploy and manage Istio-based applications in the cloud.

![[Pasted image 20260320122450.png]]

![[Pasted image 20260320122459.png]]

### <mark style="background: #C900FFA6;">The three pillars of security</mark>

<mark style="background: #C900FFA6;">Confidentiality:</mark> Confidentiality involves ensuring that resources are accessible only to authorised individuals.  

<mark style="background: #C900FFA6;">Integrity:</mark> The data remains uncorrupted. There are integrity mechanisms in place to prevent unauthorised users from altering the data or to detect any changes that have been made.  

<mark style="background: #C900FFA6;">Availability:</mark> A system and its data are accessible and functioning properly.

![[Pasted image 20260320122542.png]]

### <mark style="background: #C900FFA6;">Security in distributed systems</mark>

<mark style="background: #C900FFA6;">Security is not an add-on</mark> to a computer. It is present in all aspects of an application, such as <mark style="background: #C900FFA6;">authenticating users</mark>, <mark style="background: #C900FFA6;">hiding data in files</mark>, <mark style="background: #C900FFA6;">encrypting information</mark> over a network, or destroying data.  

<mark style="background: #C900FFA6;">Security in microservices/distributed systems introduces two specific concerns centralised systems do not have:</mark> 
- <mark style="background: #C900FFA6;">The use of a network</mark> which allows malicious parties to intercept the messages.  
- <mark style="background: #C900FFA6;">The use of servers</mark> for running applications. The application, rather than the OS, is responsible for the security.

### <mark style="background: #C900FFA6;">Difference between Authentication and authorisation</mark>  

<mark style="background: #C900FFA6;">Authentication</mark> is the first step in any security process. It validates that users are who they claim to be.  

<mark style="background: #C900FFA6;">Authorisation</mark> in system security gives the user permission to access a specific resource or function. This term is often used interchangeably with access control or client privilege.

![[Pasted image 20260320122749.png]]

### <mark style="background: #C900FFA6;">Operating systems versus network-based systems</mark>  

The <mark style="background: #C900FFA6;">operating system provides security in centralised systems</mark>, including user authentication, app, network, and file permissions.  

In network services, users do not have an account, and the data that flows during interactions with them goes through unsafe networks.  

<mark style="background: #C900FFA6;">Security is not an inbuilt Internet property</mark>, unlike an OS like Linux. The network only directs packages from one point to another.

<mark style="background: #C900FFA6;">Latency:</mark> Difference between processor speed and network speed. RAM (Nanoseconds) < Memory Drive (SSD - Microseconds) < Memory Drive (HDD - Milliseconds) < Network (Milliseconds to Seconds).  

<mark style="background: #C900FFA6;">Memory access:</mark> Accessing <mark style="background: #C900FFA6;">pointers</mark> and <mark style="background: #C900FFA6;">locations</mark>.  

<mark style="background: #C900FFA6;">Partial failures:</mark> There are many different machines and  
processes, only <mark style="background: #C900FFA6;">message parsing</mark>, <mark style="background: #C900FFA6;">unreliable networks</mark> with delays, and the system may suffer from partial failures, unreliable <mark style="background: #C900FFA6;">clocks</mark>, and process pauses.

### <mark style="background: #C900FFA6;">The internet introduces new risks</mark>

<mark style="background: #C900FFA6;">The internet allows attackers to:</mark>  
- <mark style="background: #C900FFA6;">Attack from anywhere</mark> in the world and are anonymous  
- <mark style="background: #C900FFA6;">Use massive power:</mark> Attackers can infect and use many computers maliciously, such as a DOS(Denial of service) attack.  
- The <mark style="background: #C900FFA6;">legislation from each country is different</mark>, and in some countries, it might not be considered an attack.  
- It is <mark style="background: #C900FFA6;">difficult</mark> to distinguish between <mark style="background: #C900FFA6;">actual attacks and users who have forgotten their passwords</mark>, such as when banks freeze your accounts.  
- <mark style="background: #C900FFA6;">Attacking is cheap:</mark> Programmers can create scripts to try to break passwords periodically.

### <mark style="background: #C900FFA6;">Cryptography</mark> 

<mark style="background: #C900FFA6;">Confidentiality:</mark> Encrypting data to avoid others reading the contents of the messages (or files).  

<mark style="background: #C900FFA6;">Authentication:</mark> Provide the origin or the subject of a message  

<mark style="background: #C900FFA6;">Integrity:</mark> Guarantees that messages are not modified (maliciously or accidentally).  

<mark style="background: #C900FFA6;">Non-repudiation:</mark> Senders cannot deny they are the senders of a message.

### <mark style="background: #C900FFA6;">The security problem</mark> 

Restrict access to information and resources to only persons/processes authorised.  

<mark style="background: #C900FFA6;">Broad classes of computer security threats:</mark>  
- <mark style="background: #C900FFA6;">Data Leakage:</mark> Losing control and governance of confidential information  
- <mark style="background: #C900FFA6;">Tampering:</mark> More than just getting access to bank accounts, consider voter fraud, Garda records, etc.  
- <mark style="background: #C900FFA6;">Vandalism:</mark> Making a website more 'attractive’  
- <mark style="background: #C900FFA6;">Eavesdropping</mark> (interception) – listening in to 'conversations’  
- <mark style="background: #C900FFA6;">Masquerading</mark> (identity substitution) – pretending to be a legitimate partner  
- <mark style="background: #C900FFA6;">Message Tampering:</mark> man in the middle  
- <mark style="background: #C900FFA6;">Replaying:</mark> using eavesdropped messages to initiate a session, etc.

### <mark style="background: #C900FFA6;">Some typical Security Attacks</mark>

![[Pasted image 20260320123216.png]]

### <mark style="background: #C900FFA6;">Examples of distributed systems attacks</mark>

<mark style="background: #C900FFA6;">Unauthorised access:</mark> Attackers accessing a network without receiving permission. (weak passwords, \*social engineering, insider threats)  

<mark style="background: #C900FFA6;">Distributed Denial of Service (DDoS) attacks:</mark> Botnets are used to attack at the network level (huge volumes of SYN/ACC packets) or application level (complex SQL queries).  

<mark style="background: #C900FFA6;">Man-in-the-middle attacks:</mark> A man-in-the-middle attack involves attackers intercepting traffic in your network(internal or external).  

\*Social engineering is the term used for a broad range of malicious activities accomplished through human interactions.

### <mark style="background: #C900FFA6;">Examples of some microservices attacks</mark>

<mark style="background: #C900FFA6;">Code and SQL injection attacks:</mark> Attackers fill out a form passing malicious code that is executed in the server instead of the expected data values.  

<mark style="background: #C900FFA6;">Insider threats:</mark> Malicious insiders with privileged access are difficult to detect and protect because they are inside the network.  

<mark style="background: #C900FFA6;">Port scan attacks:</mark> These are hostile searches on the internet for open ports.  

<mark style="background: #C900FFA6;">Cross-site Scripting (XSS):</mark> The attacker injects malicious code that is executed by the victim and supplants other users

### <mark style="background: #C900FFA6;">XSS - CrossSite Scripting Explained</mark>

![[Pasted image 20260320123419.png]]

### <mark style="background: #C900FFA6;">Table summarising security aspects</mark>

<table>
	<tr>
		<td>Security Aspect</td>
		<td>Centralised Systems</td>
		<td>Microservices</td>
	</tr>
	<tr>
		<td>Single point of failure</td>
		<td>More vulnerable to single point of failure, as the failure of the central server can bring down the entire system</td>
		<td>Less vulnerable to single point of failure, as the system is decentralised and failure of one node does not necessarily impact the entire system</td>
	</tr>
	<tr>
		<td>Data confidentiality</td>
		<td>May have stronger security controls in place to protect data, as all data is stored in one location</td>
		<td>May be more vulnerable to breaches as data is distributed across multiple nodes, however, encryption and other security measures can be implemented to mitigate this risk</td>
	</tr>
	<tr>
		<td>Scalability</td>
		<td>May be less scalable due to the limitations of the central server</td>
		<td>More scalable as the workload can be distributed across multiple nodes</td>
	</tr>
	<tr>
		<td>Access control</td>
		<td>Centralised systems may have more control over access to data and resources</td>
		<td>Distributed systems may have more complex access control mechanisms due to the decentralized nature of the system</td>
	</tr>
	<tr>
		<td>Maintenance</td>
		<td>Centralised systems may require less maintenance as all updates can be applied to the central server</td>
		<td>Distributed systems may require more maintenance as updates need to be applied to multiple nodes</td>
	</tr>
</table>

