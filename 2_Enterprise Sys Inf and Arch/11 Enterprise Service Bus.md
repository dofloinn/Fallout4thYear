### <mark style="background: #00ECFFA6;">Recall... Loose Coupling</mark>

<mark style="background: #00ECFFA6;">Provide Location Time Format independence:</mark>
- Customer Mgt.
- Warehouse Mgt.  
- Accounts
- Customs  
- Helpdesk
- Freight Forwarder
- Order Mgt.

### <mark style="background: #00ECFFA6;">Enterprise Service Bus (ESB)</mark>

<mark style="background: #00ECFFA6;">Enterprise Service Bus:</mark> 
- HR  
- Finance  
- Legacy / Custom  
- ERP  
- CRM  
- SCM  

<mark style="background: #00ECFFA6;">More than just a message broker:</mark>
- Different Protocols
- Different Data Types

### <mark style="background: #00ECFFA6;">Enterprise Service Bus</mark>

An Architecture  

Integrate various applications over a bus-like infrastructure

Decouple applications from each other by providing middleware to handle communication paths and workflows

### <mark style="background: #00ECFFA6;">Integration Principles</mark>  

<mark style="background: #00ECFFA6;">Orchestration:</mark> Composing several existing fine-grained components into a single higher order composite service. This can be done to achieve appropriate "granularity" of services and promote reuse and manageability of the underlying components.  

<mark style="background: #00ECFFA6;">Transformation:</mark> Data transformation between canonical data formats and specific data formats required by each ESB connector. An example of this would be transforming between CSV, Cobol copybook or EDI formats to either SOAP/XML or JSON. Canonical data formats can greatly simplify the transformation requirements associated with a large ESB implementation where there are many consumers and providers, each with their own data formats and definitions.  

<mark style="background: #00ECFFA6;">Transportation:</mark> Transport protocol negotiation between multiple formats (such as HTTP, JMS, JDBC). Note: Mule treats databases like another "service" by making JDBC just another transport (or endpoint) where data can be accessed.  

<mark style="background: #00ECFFA6;">Mediation:</mark> Providing multiple interfaces for the purpose of a) supporting multiple versions of a service for backwards compatibility or alternatively, b) to allow for multiple channels to the same underlying component implementation. This second requirement may involve providing multiple interfaces to the same component, one legacy interface (flat file) and one standards compliant (SOAP/XML) interface.  

<mark style="background: #00ECFFA6;">Non-functional consistency:</mark> For a typical ESB initiative, this can include consistency around the way security and monitoring policies are applied and implemented. Additionally the goals of scalability and availability can be achieved by using multiple instances of an ESB to provide increased throughput (scalability) and eliminate single-points-of-failure (SPOFs), which is the key objective for highly available systems.

### <mark style="background: #00ECFFA6;">Architectures</mark>

![[Pasted image 20260505100528.png]]
![[Pasted image 20260505100543.png]]

![[Pasted image 20260505100553.png]]

<mark style="background: #00ECFFA6;">Microservice Architecture:</mark>
![[Pasted image 20260505100731.png]]

### <mark style="background: #00ECFFA6;">Enterprise Architecture - Monolith versus Microservices</mark> 

<mark style="background: #00ECFFA6;">Monolith Advantages:</mark>
- Simple to develop (once developers familiar with codebase)  
- Simple to deploy  
- Simple to scale (though data volumes might cause issues)  

<mark style="background: #00ECFFA6;">Monolith Disadvantages:</mark>
- Steep learning curve for new developers can exist  
- Overloaded containers can impact developers  
- Continuous deployment is difficult  

<mark style="background: #00ECFFA6;">Microservice Advantages:</mark>
- Highly maintainable / testable  
- Loose coupling  
- Independent deployment  

<mark style="background: #00ECFFA6;">Microservice Disadvantages:</mark>
- Complexity of a distributed system  
- Data consistency  
- Query’s that span data managed by multiple services

### <mark style="background: #00ECFFA6;">Moving from Monolith to Microservices</mark> 

<mark style="background: #00ECFFA6;">Decompose by domain-driven</mark> design subdomain.  

<mark style="background: #00ECFFA6;">Decompose by verb or use case</mark> and define services that are responsible for particular actions. e.g. a Shipping Service that’s responsible for shipping complete orders.  

<mark style="background: #00ECFFA6;">Decompose by nouns</mark> or resources by defining a service that is responsible for all operations on entities/resources of a given type. e.g. an Account Service that is responsible for managing user accounts

### <mark style="background: #00ECFFA6;">ESB Products</mark>

<mark style="background: #00ECFFA6;">Example ESB Products:</mark>  
- IBM App Connect Enterprise (ACE)
- Microsoft Azure Integration Services
- Oracle Service Bus
- Sonic ESB
- Red Hat - JBoss Fuse  
- Mule ESB (Community Enterprise Edition)

<mark style="background: #00ECFFA6;">Example ESB from MuleSoftTM:</mark>
![[Pasted image 20260505101234.png]]

<mark style="background: #00ECFFA6;">Anypoint Studio IDE:</mark>
- Eclipse based development tool from Mulesoft
- Embedded Mule Server 
- Visual & XML application editor

![[Pasted image 20260505101318.png]]

<mark style="background: #00ECFFA6;">Anypoint Visual & XML Editor:</mark>
![[Pasted image 20260505101342.png]]

<mark style="background: #00ECFFA6;">Anypoint Connectors:</mark>
![[Pasted image 20260505101407.png]]

### <mark style="background: #00ECFFA6;">Example Scenario - Online Ordering</mark>

![[Pasted image 20260505101443.png]]

### <mark style="background: #00ECFFA6;">Demonstration Scenario - Supplier Invoicing</mark>

![[Pasted image 20260505101508.png]]