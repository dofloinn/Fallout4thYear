### <mark style="background: #04FF00A6;">What is replication?</mark>

Process of copying or updating data from one location to  another  
Often in real-time or near real-time

![[Pasted image 20251002160806.png]]

### <mark style="background: #04FF00A6;">Why?</mark>

<mark style="background: #04FF00A6;">If we store all our data in a single database and that database crashes:</mark>  
- Without replication data would at minimum become unavailable and applications unusable  
- At its most catastrophic data could be lost

<mark style="background: #04FF00A6;">If we operate in multiple geographic locations</mark>
- If we have a single database that is located in a single region, other regions will experience latency and our application performance will be impacted

We operate applications that generate millions of queries to a database at the same time. A single database would not be able to cope

### <mark style="background: #04FF00A6;">Use Cases</mark>  

<mark style="background: #04FF00A6;">High Availability:</mark> 
- Helps ensure data availability and minimize downtime.  
- By maintaining copies of data in multiple locations or systems, organisations can continue operations even if one system fails.  
- Critical for businesses that require uninterrupted access to their data, such as e-commerce websites, financial institutions, and healthcare providers.  

<mark style="background: #04FF00A6;">Fault Tolerance:</mark>  
- If one server or data centre experiences a hardware failure, a natural disaster, or any other catastrophic event, data can still be retrieved from another location.  
- Helps in preventing data loss and maintaining business continuity

<mark style="background: #04FF00A6;">Scaling and Performance:</mark>
- Can improve system performance by distributing read operations across multiple replicas, reducing the load on the primary source.  
- Particularly beneficial for read-intensive workloads and large-scale applications.  

<mark style="background: #04FF00A6;">Load Balancing:</mark>  
- Can distribute read and write requests across multiple servers or locations, thereby balancing the load on the system.  
- Particularly important for high-traffic websites and applications, as it can improve performance and reduce response times.  

<mark style="background: #04FF00A6;">Real-time Analytics:</mark>  
- Replicating data to a separate system or data warehouse allows organisations to run real-time analytics and reporting without impacting the performance of their primary operational database

<mark style="background: #04FF00A6;">Compliance and Data Governance:</mark>
- Replicating data can assist organizations in meeting compliance requirements, as it provides redundancy and data security. It also enables the implementation of data retention policies and auditing capabilities.  

<mark style="background: #04FF00A6;">Geographic Distribution:</mark>  
- Organisations with a global presence may use data replication to ensure that users in different regions have low-latency access to data.  
- Common in content delivery networks (CDNs) and cloud services, where data is replicated to servers in multiple geographic locations.

<mark style="background: #04FF00A6;">Data Backup and Archiving:</mark>
- Replicating data to secondary systems or storage media provides a means for data backup and archiving. This helps in protecting against data loss due to accidental deletion, corruption, or malicious actions, and it allows for long-term data retention.  

<mark style="background: #04FF00A6;">Disaster Recovery:</mark>  
- Data replication is a key component of disaster recovery strategies. By keeping data copies offsite or in geographically dispersed locations, organisations can recover their data and systems in the event of a disaster, such as fires, floods, or cyberattacks.

<mark style="background: #04FF00A6;">Database Maintenance:</mark>
- During maintenance or upgrades of a database system, data replication can ensure that the application remains operational.
- Organisations can route traffic to a secondary database while performing maintenance on the primary one.  

<mark style="background: #04FF00A6;">Migrating Data:</mark>  
- Data replication is useful when migrating data from one system to another, ensuring that both systems remain synchronized during the transition period.

<mark style="background: #04FF00A6;">Group Question 1</mark>

Consider the industry you have been assigned.  

Pick the two most critical replication use case for that domain.  

Discuss for 5 mins and be prepared to feedback to the class.  

<mark style="background: #04FF00A6;">Use Cases:</mark>  
- High Availability  
- Fault Tolerance  
- Scaling and Performance  
- Load Balancing  
- Real-time Analytics  
- Compliance and Data Governance  
- Geographic Distribution  
- Data Backup and Archiving  
- Disaster Recovery  
- Database Maintenance  
- Data Migration


### <mark style="background: #04FF00A6;">Replication Models/Architecture: Leader → Follower (AKA Primary → Replica, or Single Leader)</mark>

Allows data to be stored on multiple nodes/centres.  

But only one node (leader/primary) can update the data.  

The other node (follower/replica) have copies of the data and can be queried.  

When an update occurs on the Leader, the data on the slaves is also updated.

![[Pasted image 20251002162408.png]]

### <mark style="background: #04FF00A6;">Leader → Follower</mark>

When a client wants to execute a write query it is sent to the Leader/Primary node who executes it and stores the result to its local store.  

The Leader/Primary then sends data changes to the Followers/Replicas.  

The Follower/Replica applies the change to its own local data.  

If a Follower/Replica goes offline, another Follower/Replica can replace it.  

If a Leader/Primary goes offline one of the Followers/Replicas is promoted to become leader/primary.

![[Pasted image 20251002162506.png]]

<mark style="background: #04FF00A6;">Benefits:</mark>
- Spread the read load  
- Followers take the read load off the leader

![[Pasted image 20251002162557.png]]

When the leader executes the change, it forwards the change immediately to the followers.  

Replication can then happen

<mark style="background: #04FF00A6;">Synchronously:</mark>  
- The write is not considered complete until all followers have executed it.  
- The client that made the request has to wait for the Leader to inform it that the change has been made to all followers  
- <mark style="background: #04FF00A6;">Disadvantages:</mark> if one follower doesn’t respond the write won’t be completed 
- <mark style="background: #04FF00A6;">Advantage:</mark> Followers are guaranteed an up-to-date copy of the data  

<mark style="background: #04FF00A6;">Asynchronously:</mark>
- Once the leader write is complete, the client is notified that the request is complete. The follower updates will eventually be executed.  
- <mark style="background: #04FF00A6;">Disadvantage:</mark> if the leader fails before the update is sent, the changes to followers is lost and they will be perpetually inconsistent. As such the write is not durable even though the leader has successfully executed it.  
- <mark style="background: #04FF00A6;">Advantage:</mark> Speeds up performance.

### <mark style="background: #04FF00A6;">Replication Models/Architecture: Multi-leader (AKA Multi-Primary, Active to Active)</mark>

All the nodes are primary/leaders.  

All the nodes can process read and write requests.  

Clients can send read/write requests to any nodes.  

Each node propagates its changes to every other node so that the system stays consistent.  

Each primary/leader node is a follower of primary/leader node.  

But each primary/leader node will have its own followers (which may be just followers).

![[Pasted image 20251002163011.png]]

Conflicts may arise if two nodes received conflicting write requests.  

Need a conflict resolution mechanism to allow data to come to a stable state.  

Usually this involves the nodes communicating with each other and using a consensus algorithm or using a more brute force mechanism of timestamps to resolve.  

Once resolution is reached, the latest update is kept, and the rest are discarded.

More flexible than the Primary-Follower model.  

Even if one of the databases goes down the other primaries can be used to update the database.  

If the system is asynchronous then if one of the databases goes down, it can lead to an inconsistent state.  

The need for conflict resolution complicates things.  

This complication increases as more databases become involved.

<mark style="background: #04FF00A6;">Benefits:</mark>
- <mark style="background: #04FF00A6;">High availability:</mark> Because data is replicated across multiple nodes, if one node goes down, clients can still access the database through the other nodes.  
- <mark style="background: #04FF00A6;">Load balancing:</mark> By spreading read and write traffic across multiple nodes, multi-leader replication can help distribute the load on the database system.  
- <mark style="background: #04FF00A6;">Geographic distribution:</mark> Can improve performance particularly when dealing with geographic distribution

### <mark style="background: #04FF00A6;">Leaderless/Peer-to-Peer</mark>

No concept of a primary/leader.  

Nodes in the leaderless setting are considered peers and all of them accept writes and reads from the client.  

Without a leader that handles all write requests, leaderless replication offers better availability

![[Pasted image 20251002163310.png]]

<mark style="background: #04FF00A6;">For a write request:</mark>
- The client broadcasts the request to all replicas instead of a special node (the leader)
- It then waits for a certain number of acknowledgments from other nodes.  

<mark style="background: #04FF00A6;">For a read request:</mark>
- The client contacts all replicas and waits for a set number of responses  
- Because the client waits for many responses, this approach is also called a quorum

<mark style="background: #04FF00A6;">Benefits:</mark>
- <mark style="background: #04FF00A6;">Scalability:</mark> Allows for easy horizontal scaling - new nodes can be added to the system without the need for a central leader node to coordinate the process 
- <mark style="background: #04FF00A6;">Fault tolerance:</mark> With no central leader, the system is more resilient to node failures - the absence of a single point of failure means that the system can continue to operate even if some nodes go down. 
- <mark style="background: #04FF00A6;">Load Distribution:</mark> Load can be distributed across nodes in a balanced manner - each node is capable of handling both reads and writes, distributing the processing load and improving overall system performance.

### <mark style="background: #04FF00A6;">Types/Approaches</mark>

<mark style="background: #04FF00A6;">Leader → Follower:</mark>
- Only one node (leader) can update the data.  
- The other nodes (followers) have copies of the data and can be queried.  

<mark style="background: #04FF00A6;">Multi-Leader:</mark>
- All the nodes are leaders.  
- All the nodes can process read and write requests.  
- Each node propagates its changes to every other node so that the system stays consistent.  
- Each node may have its followers which are part of a leader->follower replication.  

<mark style="background: #04FF00A6;">Leaderless/Peer-to-Peer:</mark>
- No concept of a primary/leader.  
- Nodes are considered peers and all of them accept writes and reads from the client.  
- For a write request, the client broadcasts the request to all replicas instead of a special node and waits for a certain number of acknowledgments from other nodes.  
- For a read request, the client contacts all replicas and waits for a set number of responses

### <mark style="background: #04FF00A6;">Question</mark>

You are Netflix — evaluate each of the models and identify pros and cons of each  

Discuss in your groups for 5 mins and prepare to feed back to the class

<mark style="background: #04FF00A6;">Leader–Follower (Primary–Replica):</mark> 
- How would a single leader affect performance with millions of global users?  
- What happens if the leader goes down? 
- Are reads and writes well balanced for Netflix’s workload?  

<mark style="background: #04FF00A6;">Multi-Leader (Active–Active):</mark>
- How does this help with writes from users in different regions (e.g. Europe, US, Asia)?  
- What kind of conflicts might arise (e.g., two updates to the same user profile)?  
- How complex is conflict resolution in this scenario?  

<mark style="background: #04FF00A6;">Leaderless (Peer-to-Peer):</mark>
- How would this model improve availability if a data center fails?  
- What consistency issues might show up (e.g., user sees outdated watch history)?  
- Is eventual consistency acceptable for Netflix’s main use cases?

### <mark style="background: #04FF00A6;">Some Questions to consider for Netflix:</mark>

Which replication model(s) provide the lowest latency for streaming video?  

Where do you need strong consistency?  

Where can you accept eventual consistency ?  

How do the replications models support scaling to hundreds of millions of users?  

What happens during a regional outage — does the model recover quickly?

### <mark style="background: #04FF00A6;">Managing Consistency - Approaches</mark> 

<mark style="background: #04FF00A6;">Synchronous Replication:</mark>
- Update each replica as part of a single atomic transaction  
- Also called eager replication  
- Consensus algorithms apply this approach to achieve strong consistency on a replicated data set  
- Minimal risk of data inconsistency across replicas.  
- Slows performance: There is higher latency for write operations - the primary node has to wait for acknowledgments from all replicas. If any replica is slow or experiences network delays.

<mark style="background: #04FF00A6;">Asynchronous Replication (Lazy Replication):</mark>
- Execute updates as separate transactions  
- Aims to strike a balance between consistency and performance by delaying the propagation of updates to replicas until they are actually needed  
- Provides eventual consistency: All replicas will eventually converge to the same state given enough time and absence of new updates.  
- Need to employ a conflict resolution strategy for when concurrent writes occur.  
- Can tolerate failures without impacting the overall performance.  
- Lower latency for write operations as the primary node doesn't wait for acknowledgments from replicas.  
- Data inconsistency is a real potential problem - Particularly if replicas fail before the update is replicated. 
- Read operations on secondary nodes may return slightly stale data until replication catches up.

<mark style="background: #04FF00A6;">Time-based or Version Based Conflict Resolution:</mark>
- Each update is assigned a timestamp or version  
- Replicas are updated based on a predefined schedule or time intervals.  
- Where conflicts arise, such as updates with the same timestamp or updates arriving out of order, a conflict resolution mechanism is needed  
- Could involve comparing timestamps, applying predetermined rules, or involving a central authority to resolve conflicts.

<mark style="background: #04FF00A6;">Monitoring and Alerts for Inconsistencies:</mark>
- Implement a monitoring system that constantly checks the data across replicas for any deviations or discrepancies.  
- When inconsistencies are detected, automated alerts can notify administrators/trigger an automatic response - Facilitates investigation and resolution of issues.  
- This helps maintain data consistency by identifying and addressing problems as they arise.  
- Introduces complexity and an overhead which may impact performance  
- Requires extensive knowledge and a comprehensive strategy to be effective  
- Reactive rather than preventative  
- May waste time if other approaches are employed - by the time issue is investigated it may be resolved

### <mark style="background: #04FF00A6;">Consider this scenario:</mark>

You are working as database engineers for a global e-commerce company (think Amazon).  

The company uses a Multi-Leader (Active–Active) replication model to support operations in different regions (e.g., Europe, US, and Asia).  

Each regional data centre can accept both reads and writes, and updates are asynchronously replicated between leaders.  

<mark style="background: #04FF00A6;">This setup is chosen to:</mark>  
- Reduce latency (customers write to the nearest data centre).  
- Improve availability (if one region goes offline, others can continue processing).  

A customer updates their shipping address in Europe at the same time as a customer service agent in the US updates it in the system (two different values).  
- Because replication is asynchronous, both updates happen independently before being replicated across regions.  
- Now there is a conflict: Europe has Address = Dublin, Ireland. US has Address = Boston, USA.  
- When replication catches up, the system must decide which update to keep

What consistency approach is being used here?  

What are the risks of this approach?  

How could the system resolve this conflict?  

What trade-offs are being made between performance, availability, and consistency?

### <mark style="background: #04FF00A6;">Summary Answers to Scenario</mark> 

<mark style="background: #04FF00A6;">What consistency approach is being used here?</mark>  
- Asynchronous replication (lazy replication).  
- Each leader accepts writes independently, and changes are propagated later.  
- This improves performance and availability but risks temporary divergence.  

<mark style="background: #04FF00A6;">What are the risks of this approach?</mark>
- <mark style="background: #04FF00A6;">Data inconsistency:</mark> Two conflicting updates exist for the same record.  
- <mark style="background: #04FF00A6;">Stale reads:</mark> Customers or staff may see outdated information depending on which replica they connect to.  
- <mark style="background: #04FF00A6;">Customer confusion / business errors:</mark> Wrong shipping address could lead to failed deliveries

<mark style="background: #04FF00A6;">How could the system resolve this conflict?</mark>
- <mark style="background: #04FF00A6;">Last-write-wins</mark> (timestamp-based): Keep the most recent update — simple but may discard a valid change.  
- <mark style="background: #04FF00A6;">Application</mark>-level rules: e.g., customer edits override staff edits (or vice versa). This ties resolution to business rules.  
- <mark style="background: #04FF00A6;">Manual resolution:</mark> System detects the conflict and prompts the user to confirm the correct address. Reliable, but slower.  
- <mark style="background: #04FF00A6;">Consensus/majority vote:</mark> Leaders exchange updates and decide collectively, but this adds latency and complexity.  

<mark style="background: #04FF00A6;">What trade-offs are being made between performance, availability, and consistency?</mark>  
- <mark style="background: #04FF00A6;">Performance:</mark> Asynchronous replication improves write performance (no waiting for all replicas).  
- <mark style="background: #04FF00A6;">Availability:</mark> Each leader can keep accepting writes, even if other regions are offline.  
- <mark style="background: #04FF00A6;">Consistency:</mark> Sacrificed in the short term — replicas may diverge until conflicts are resolved.

<mark style="background: #04FF00A6;">Overall:</mark>
- The system prioritises performance + availability over immediate consistency → aligns with AP systems in the CAP theorem (eventual consistency).  
- Stronger consistency could be achieved with synchronous replication, but at the cost of higher latency and reduced availability.

### <mark style="background: #04FF00A6;">Managing Latency:</mark>

Replicating data across geographically distributed locations can introduce latency - Delay in replicating data.  

Achieving low-latency replication is crucial, especially in scenarios where real-time or near-real-time access to data is essential.  

The approach to replication (synchronous, asynchronous, time-based) has a significant issue.

### <mark style="background: #04FF00A6;">Security:</mark>

Replicating sensitive data across multiple nodes introduces security challenges.  

<mark style="background: #04FF00A6;">Encrypting data during transmission and at restis important:</mark>
- authorisation mechanisms  
- protecting against unauthorized access.  
- data masking at rest

### <mark style="background: #04FF00A6;">Minimising Downtime:</mark>  

Helps maintain a consistent and up-to-date state across all replicated nodes. Any delay in replication could lead to data inconsistencies and potential conflicts.  

<mark style="background: #04FF00A6;">Helps preserve data integrity:</mark> Timely replication ensures that changes made to the data are accurately and reliably propagated to all relevant nodes.  

Often involves having redundant nodes and failover mechanisms. To ensure that if one node becomes unavailable, another can take over seamlessly, providing high availability.  

<mark style="background: #04FF00A6;">Helps ensure a reliable service with minimal disruptions for users:</mark>
- Even in the presence of hardware failures, software issues, or maintenance activities.  
- Reliability and consistent availability contribute to building trust with users and maintaining a positive reputation in the market.

<mark style="background: #04FF00A6;">Automatic Failover:</mark>
- Maintaining one or more replica databases (followers) alongside the primary database (leader).  
- In the event of a leader database failure, automatic failover mechanisms detect the failure and promote one of the replica databases to become the new leader, ensuring continuity of service.  
- Provides redundancy and immediate availability if the leader database experiences a failure ensuring consistency and availability.

<mark style="background: #04FF00A6;">Load Balancing and Traffic Routing:</mark>
- Distribute incoming traffic across multiple database servers, including the leader and replica databases.  
- In case of a failure, load balancers automatically reroute traffic to the available and operational database servers.  
- Where high traffic loads are common, load balancing ensures that database resources are utilised efficiently.  
- When a database server fails, the traffic routing mechanism immediately directs requests to operational servers, mitigating downtime and maintaining a responsive shopping experience.

<mark style="background: #04FF00A6;">Geographic Redundancy and Failover:</mark>
- Deploy replica databases in different geographic regions or data centres.  
- In the event of a regional outage or catastrophic failure, traffic can be redirected to a replica in another region, ensuring service continuity.  
- Where customers are in different regions and expect uninterrupted service, geographic redundancy minimises the impact of regional outages.

### <mark style="background: #04FF00A6;">Consider this Scenario:</mark>

Suppose we have a Primary in Dublin and a replica in Sydney  

What problems arise, and how would you fix them? 

<mark style="background: #04FF00A6;">Consider latency:</mark>
- How long will it take for data written in Dublin to appear in Sydney?  
- What problems could stale data cause for users in Australia?  
- Would synchronous or asynchronous replication be better here?

<mark style="background: #04FF00A6;">Consider failover and downtime:</mark>
- If the Dublin primary crashes, what happens to users?  
- How can we promote Sydney to primary quickly?  
- What mechanisms (automatic failover, monitoring) would you need?

<mark style="background: #04FF00A6;">Consider load balancing:</mark>
- Can we route read requests to Sydney while keeping writes in Dublin?  
- How would this help reduce latency and load on Dublin?

<mark style="background: #04FF00A6;">Consider geographic redundancy:</mark>
- What if there’s a regional outage in Dublin (e.g., power or network failure)?  
- Should we have replicas in multiple regions (not just Dublin + Sydney)?

<mark style="background: #04FF00A6;">Consider security:</mark> 
- How do we protect sensitive data as it travels between Dublin and Sydney? 
- What measures (e.g., encryption in transit, secure authentication) are needed to prevent unauthorised access?

### <mark style="background: #04FF00A6;">Consider this Scenario - Solution</mark> 

<mark style="background: #04FF00A6;">Latency:</mark>
 - Writes in Dublin take time to replicate to Sydney (high network latency across continents).  
 - Users in Australia may see stale data.  
 - Use asynchronous replication for better performance, but warn about possible stale reads.  
 - For critical data, use regional leaders (multi-leader replication) so writes can be made closer to the user.

<mark style="background: #04FF00A6;">Failover and Downtime:</mark>
- If Dublin fails, all writes stop until Sydney can be promoted to primary. This risks long downtime.  
- Implement automatic failover (e.g., monitoring, election of a new leader).  
- Keep health checks running across both regions.  
- Consider a multi-leader setup to allow both Dublin and Sydney to accept writes.

<mark style="background: #04FF00A6;">Load Balancing:</mark>
- Dublin may become overloaded handling global requests.  
- Route read queries to Sydney to reduce Dublin’s load. 
- Use a global load balancer to direct users to the nearest replica for reads. 
- Ensure eventual consistency is acceptable for non-critical reads.

<mark style="background: #04FF00A6;">Geographic Redundancy:</mark>
- If Dublin suffers a regional outage (e.g., power failure), Sydney alone may not handle all traffic.  
- Deploy additional replicas in multiple geographic regions (e.g., North America, Asia).  
- Use geo-distributed replication with failover between regions. 
- Apply disaster recovery planning (cold or warm standby replicas).

<mark style="background: #04FF00A6;">Security:</mark>
- Replicating sensitive data across continents increases exposure to attacks.  
- Encrypt data in transit and at rest in both Dublin and Sydney.  
- Use secure authentication/authorization for replication streams.  
- Apply data masking if compliance requires it (e.g., GDPR).

### <mark style="background: #04FF00A6;">Replication in CouchDB:</mark>

Persistent replication in CouchDB is controlled through a document in the <mark style="background: #04FF00A6;">_replicator</mark> database.  

Each <mark style="background: #04FF00A6;">document in _replicator</mark> describes one replication process.  

When a replication task is initiated on the sending node, it is called push replication, if it is initiated by the receiving node, it is called pull replication.

<mark style="background: #04FF00A6;">Can be:</mark>
- Leader → Follower or Primary → Replica  
- Active to Active/Multi-Primary

During replication, CouchDB will compare the source and the destination database to determine which documents differ between the source and the destination database.  

It does so by following the Changes Feeds on the source and comparing the documents to the destination.  

Changes are submitted to the destination in batches where they can introduce conflicts.  

Documents that already exist on the destination in the same revision are not transferred. As the deletion of documents is represented by a new revision, a document deleted on the source will also be deleted on the target.  

A replication task will finish once it reaches the end of the changes feed.  

If its continuous property is set to true, it will wait for new changes to appear until the task is cancelled.

### <mark style="background: #04FF00A6;">Change Feeds in CouchDB:</mark> 

Provide a continuous stream of changes as they occur, allowing clients to stay synchronised with the database in near real-time.  

Allows you to receive real-time updates about changes to the database.  

A change feed is typically accessed through a continuous feed, an HTTP connection that stays open and continuously sends updates to the client as changes occur in the database.  

Clients can subscribe to the changes feed by making a GET request to the `_changes` endpoint.  

The feed=continuous parameter indicates that the client wants to receive changes continuously.

The `_changes` endpoint supports various options to filter and customize the changes feed.  

You can specify a `since` parameter to start the feed from a particular sequence number or a `filter` parameter to filter changes based on specific criteria. e.g.  

```bash
curl  
http://localhost:5984/your_database/_changes?feed=continuous&since=12345&filter  
=my_filter
```  

By default, the changes feed provides only the IDs and metadata of changed documents.  

However, you can include the full document bodies in the feed by adding the `include_docs=true` parameter

<mark style="background: #04FF00A6;">The continuous feed uses long-polling:</mark>
- The server holds the connection open until a change occurs or a timeout is reached.  
- If a change occurs within the timeout period, the server immediately sends the change to the client.  
- If no changes occur, the server sends an empty response after the timeout, and the client can then open a new connection to continue listening for changes

![[Pasted image 20251003100452.png]]