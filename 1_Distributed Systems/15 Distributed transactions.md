<mark style="background: #FFF503A6;">Introduction to transactions</mark>
- A group of operations often represent a unit of “work”.  
- <mark style="background: #FFF503A6;">Transaction:</mark> An operation composed of a number of discrete steps.
- Free from interference by operations being performed on behalf of other concurrent clients
- Either all of the operations must be completed successfully or they must have no effect at all in the presence of server crashes.

### <mark style="background: #FFF503A6;">Basic Transaction Operations</mark>

<mark style="background: #FFF503A6;">Begin transaction:</mark>
- Marks the start of a transaction
- Read/write/compute data (modify files or objects)
- Data needs to be restored if the transaction is aborted.  

<mark style="background: #FFF503A6;">End transaction:</mark> mark the end of a transaction – no more tasks  

<mark style="background: #FFF503A6;">Commit transaction:</mark> make the results permanent  

<mark style="background: #FFF503A6;">Abort transaction:</mark> kill the transaction, restore original values

### <mark style="background: #FFF503A6;">The transactional model</mark>

<mark style="background: #FFF503A6;">Applications are coded as follows:</mark>  
- <mark style="background: #FFF503A6;">begin</mark> transaction
- Perform a series of <mark style="background: #FFF503A6;">read</mark>, <mark style="background: #FFF503A6;">update</mark> operations 
- Terminate by <mark style="background: #FFF503A6;">commit</mark> or <mark style="background: #FFF503A6;">abort</mark>.

### <mark style="background: #FFF503A6;">ACID properties of transactions</mark>  

<mark style="background: #FFF503A6;">Atomicity:</mark> The transaction happens as a single indivisible action. Everything succeeds or else the entire transaction is rolled back. Others do not see intermediate results.  

<mark style="background: #FFF503A6;">Consistency:</mark> A transaction takes the system from one consistent state to another consistent state. A transaction cannot leave the database in an inconsistent state. E.g., total amount of money in all accounts must be the same before and after a transfer funds’ transaction  

<mark style="background: #FFF503A6;">Isolated (Serialisable):</mark> Each transaction must be performed without interference from other transactions - there must be no observation by other transactions of a transaction's intermediate effects. If transactions run at the same time, the final result must be the same as if they executed in some serial order.  

<mark style="background: #FFF503A6;">Durability:</mark> After a transaction has completed successfully, all its effects are saved in permanent storage.

### <mark style="background: #FFF503A6;">Atomicity of transactions</mark>

Two aspects

<mark style="background: #FFF503A6;">1. All or nothing:</mark>  
- It either completes successfully, and the effects of all of its operations are recorded in the objects, or (if it fails or is aborted) it has no effect at all.
- <mark style="background: #FFF503A6;">Two further aspects of its own:</mark> failure atomicity and durability
- <mark style="background: #FFF503A6;">Failure atomicity:</mark> the effects are atomic even when the server crashes;
- <mark style="background: #FFF503A6;">Durability:</mark> after a transaction has completed successfully, all its effects are saved in permanent storage.  

<mark style="background: #FFF503A6;">2. Isolation:</mark>  
- Each transaction must be performed without interference from other transactions
- There must be no observation by other transactions of a transaction's intermediate effects

### <mark style="background: #FFF503A6;">Transactions:</mark>

Transactions are carried out concurrently for higher performance  

<mark style="background: #FFF503A6;">Two common problems with transactions:</mark>
- Lost update
- Inconsistent retrieval  

<mark style="background: #FFF503A6;">Solution:</mark> Serial equivalence

### <mark style="background: #FFF503A6;">Lost Update</mark>  

```python
T1: A=read(x), write(x, A*10)  
T2: B=read(x), write(x, B*10)
``` 

<mark style="background: #FFF503A6;">If not properly isolated, we could get the following interleaving:</mark>
```python
A=read(x), B=read(x), write(x, A*10), write(x, B*10)
```  

Executing T1 and T2 should have increased x by ten times twice, but – we lost one of the updates

### <mark style="background: #FFF503A6;">Inconsistent retrieval</mark>

```python
T1: withdraw(x, 10), deposit(y, 10)  
T2: sum all accounts
```  

<mark style="background: #FFF503A6;">Improper interleaving:</mark>  
```python
(T1)withdraw(x, 10), (T2)sum+=read(x),  
(T2)sum+=read(y), ..., (T1)deposit(y, 10)
```  

<mark style="background: #FFF503A6;">The sum would be incorrect:</mark>
- It doesn’t account for the 10 that are ‘in transit’ 
- neither in x nor in y  
- the retrieval is inconsistent

### <mark style="background: #FFF503A6;">Serial equivalence</mark> 

A <mark style="background: #FFF503A6;">serially equivalent interleaving</mark> is one in which the combined effect is the same as if the transactions had been done one at a time in some order  

Does not mean to actually perform one transaction at a time, as this would lead to bad performance  

<mark style="background: #FFF503A6;">The same effect means:</mark>
- the read operations return the same values
- the instance variables of the objects have the same values at the end

### <mark style="background: #FFF503A6;">Conflicting operations</mark>

When a pair of operations conflicts we mean that their combined effects depends on the order in which they are executed.  

e.g. <mark style="background: #FFF503A6;">read</mark> and <mark style="background: #FFF503A6;">write</mark> (whose effects are the result returned by read and the value set by write)

<table>
	<tr>
		<th>Operations of different transactions</th>
		<th>Conflict</th>
		<th>Reason</th>
	</tr> 
	<tr>
		<td>read read</td>
		<td>No</td>
		<td>Because the effect of a pair of read operations. Does not depend on the order in which they are executed</td>
	</tr>
	<tr>
		<td>read write</td>
		<td>Yes</td>
		<td>Because the effect of a read and a write operation  depends on the order of their execution</td>
	</tr>
	<tr>
		<td>write write</td>
		<td>Yes</td>
		<td>Because the effect of a pair of write operations depends on the order of their execution</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Aborted transactions</mark>

Two problems associated with aborted transactions:  

<mark style="background: #FFF503A6;">‘Dirty reads’:</mark>  
- A transaction observes a write from a transaction that has not completed yet.
- An interaction between a read operation in one transaction and an earlier write operation on the same object by a transaction that then aborts
- A transaction that committed with a ‘dirty read’ is not recoverable

<mark style="background: #FFF503A6;">‘Premature writes’:</mark> interactions between <mark style="background: #FFF503A6;">write</mark> operations on the same object by different transactions, one of which aborts  

Both can occur in serially equivalent executions of transactions

### <mark style="background: #FFF503A6;">Dirty reads</mark> 

<mark style="background: #FFF503A6;">T1 reads a value that T2 wrote, then commits and later, T2 aborts:</mark>  
- The value is “dirty”, since the update to it should not have happened
- T1 has committed, so it cannot be undone  

<mark style="background: #FFF503A6;">Handling dirty reads:</mark> Transactions are only allowed to read objects that committed transactions have written

### <mark style="background: #FFF503A6;">Premature writes and Strict executions</mark>

<mark style="background: #FFF503A6;">Premature writes:</mark> a problem related to the interaction between write operations on the same object belonging to different transactions.  

<mark style="background: #FFF503A6;">Strict executions of transactions:</mark> The service delays both read and write operations on an object until all transactions that previously wrote that object have either committed or aborted  

Enforces <mark style="background: #FFF503A6;">isolation</mark>

### <mark style="background: #FFF503A6;">Strict executions of transactions</mark>

<mark style="background: #FFF503A6;">Curing premature writes:</mark>  
- if a recovery scheme uses ‘before images’
- write operations must be delayed until earlier transactions that updated the same objects have either committed or aborted  

<mark style="background: #FFF503A6;">To avoid both ‘dirty reads’ and ‘premature writes’:</mark>
- delay both read and write operations
- If both read and write operations on an object are delayed until all transactions that previously wrote that object have either committed or aborted. 
- Enforces the property of <mark style="background: #FFF503A6;">isolation</mark>  

<mark style="background: #FFF503A6;">Tentative versions</mark> are used during progress of a transaction – objects in tentative versions are stored in volatile memory

### <mark style="background: #FFF503A6;">Locks</mark>

Transactions must be scheduled so that their effect on shared data is serially equivalent.  

A server can achieve <mark style="background: #FFF503A6;">serial equivalence</mark> of transactions by serializing access to the objects.  

Serial equivalence requires that all of a transaction’s accesses to a particular object be serialized with respect to accesses by other transactions.  

Example of a serializing mechanism is the use of – exclusive locks

### <mark style="background: #FFF503A6;">Exclusive locks</mark>

Serializing mechanism  

Need an object? Get a lock for it! – Read or write locks, or both (exclusive)  

<mark style="background: #FFF503A6;">Exclusive locks:</mark>
- Only one object can read or write at a time.
- If you can't lock the data you have to wait
- Server locks object it is about to use for a client
- If a client requests access to an object that is already locked for another clients, the operation is suspended

### <mark style="background: #FFF503A6;">Transactions T and U with exclusive locks</mark>

![[Pasted image 20251116205152.png]]

### <mark style="background: #FFF503A6;">Two-phase locking</mark> 

<mark style="background: #FFF503A6;">Two phase locking:</mark>
- Not permitted acquire a new lock after any release
- Transactions acquire locks in a growing phase and release locks in a shrinking phase
- Ensures <mark style="background: #FFF503A6;">serial equivalence</mark>

### <mark style="background: #FFF503A6;">Strict Two Phase Locking</mark>

Extension of two-phase locking that prevents – <mark style="background: #FFF503A6;">dirty reads</mark> and <mark style="background: #FFF503A6;">premature writes</mark>  

Any locks acquired are not given back until the transaction completed or aborts – ensures <mark style="background: #FFF503A6;">durability</mark>  

Locks must be held until all the objects it updated have been written to permanent storage.  

Locks are only released upon commit / abort

### <mark style="background: #FFF503A6;">Rules for Strict Two-Phase Locking</mark>

<mark style="background: #FFF503A6;">1. When an operation accesses an object within a transaction:</mark>  
- If the object is not already locked, it is locked and the operation proceeds.
- If the object has a conflicting lock set by another transaction, the transaction must wait until it is unlocked.
- If the object has a non-conflicting lock set by another transaction, the lock is shared and the operation proceeds.
- If the object has already been locked in the same transaction, the lock will be promoted if necessary and the operation proceeds. (Where promotion is prevented by a conflicting lock, rule (b) is used.)  

<mark style="background: #FFF503A6;">2. When a transaction is committed or aborted, the server unlocks all objects it locked for the transaction.</mark>

### <mark style="background: #FFF503A6;">Deadlock</mark>

A state in which each member of a group of transactions is waiting for some other member to release a lock

![[Pasted image 20251116205542.png]]

### <mark style="background: #FFF503A6;">Flat and Nested Transactions</mark>

<mark style="background: #FFF503A6;">Flat transaction:</mark> Performed atomically on a unit of work  

<mark style="background: #FFF503A6;">Nested:</mark> Hierarchical  

Transactions may be composed of other transactions.  

Several transactions may be started from within a transaction – we have a top-level transaction and sub-transactions which may have their own sub-transactions.  

To a parent, a subtransaction is atomic with respect to failures and concurrent access.  

<mark style="background: #FFF503A6;">Transactions at the same level can run concurrently but access to common objects is serialised:</mark>
- a subtransaction can fail independently of its parent and other subtransactions;
- when it aborts, its parent decides what to do, e.g. start another subtransaction or give up.

![[Pasted image 20251116205744.png]]

### <mark style="background: #FFF503A6;">Advantages of nested transactions (over flat ones)</mark>

Subtransactions may run concurrently with other subtransactions at the same level: 
- this allows additional concurrency in a transaction.
- when subtransactions run in different servers, they can work in parallel.  

<mark style="background: #FFF503A6;">Subtransactions can commit or abort independently:</mark>
- This is potentially more robust
- A parent can decide on different actions according to whether a subtransaction has aborted or not 
- This is potentially more robust and a parent can decide on different actions according to whether a subtransaction has aborted or not.

### <mark style="background: #FFF503A6;">Distributed Transaction</mark> 

Transaction that updates data on two or more systems  

Implemented as a set of sub-transactions  

<mark style="background: #FFF503A6;">Challenge:</mark> Handle machine, software, & network failures while preserving transaction integrity

A <mark style="background: #FFF503A6;">distributed transaction</mark> refers to a flat or nested transaction that accesses objects managed by  
- <mark style="background: #FFF503A6;">Multiple</mark> servers (processes)
- All servers need to commit or abort a transaction  

<mark style="background: #FFF503A6;">Allows for even better performance:</mark> At the price of increased complexity

<mark style="background: #FFF503A6;">Each computer runs a transaction manager</mark>
- Responsible for sub-transactions on that system
- Performs prepare, commit, and abort calls for sub-transactions  

Every sub-transaction must agree to commit changes before the overall transaction can complete

### <mark style="background: #FFF503A6;">Committing Distributed Transactions</mark>

<mark style="background: #FFF503A6;">Transactions may process data at more than one server:</mark>  
- Problem: any server may fail or disconnect while a commit for transaction T is in progress.
- They must agree to commit or abort - “Log locally, commit globally.”  

<mark style="background: #FFF503A6;">The atomicity property of transactions:</mark> when a distributed transaction comes to an end, either all of its operations are carried out or none of them.

### <mark style="background: #FFF503A6;">Distributed commit problem</mark>  

<mark style="background: #FFF503A6;">The distributed commit problem:</mark> having an operation being performed by each member of a process group, or none at all.  

<mark style="background: #FFF503A6;">With distributed transactions:</mark> the operation may be the commit of a transaction at a single site that takes part in the transaction.

### <mark style="background: #FFF503A6;">Distributed commit protocols</mark>

<mark style="background: #FFF503A6;">One-phase:</mark> the coordinator to communicate the commit or abort request to all of the participants in the transaction and to keep on repeating the request until all of them have acknowledged that they have carried it out.  

<mark style="background: #FFF503A6;">Two-phase:</mark>
- designed to allow any participant to abort its part of a transaction
- can result in extensive delays for participants in the uncertain state.  

<mark style="background: #FFF503A6;">Three-phase:</mark>
- designed to alleviate delays due to participants in the uncertain state.
- more expensive in terms of the number of messages and the number of rounds
- required for the normal (failure-free) case.  

<mark style="background: #FFF503A6;">Note:</mark> we look at them in more details as part of fault tolerance topic

### <mark style="background: #FFF503A6;">Summary</mark>

<mark style="background: #FFF503A6;">Transaction:</mark> An operation composed of a number of discrete steps.  

A distributed transaction involves several different servers.  

Atomicity requires that the servers participating in a distributed transaction either all commit it or all abort it  

Atomic commit protocols are designed to achieve this effect, even if servers crash during their execution

### <mark style="background: #FFF503A6;">References:</mark>

Chapter 16: Coulouris, Dollimore and Kindberg, Distributed Systems: Concepts and Design, 5thEd.