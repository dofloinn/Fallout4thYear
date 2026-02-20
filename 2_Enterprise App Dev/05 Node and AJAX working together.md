### <mark style="background: #C900FFA6;">What is the main advantage of AJAX?</mark>  

The main advantage of AJAX is that it allows to update fragments of a web page independently without having to refresh the full page which can be very time consuming.

![[Pasted image 20260217120345.png]]

AJAX can update the different fragments independently

There are three files we are going to use  

Files can be downloaded from Brightspace on a file called Node.zip  
- <mark style="background: #C900FFA6;">Example.js:</mark> Contains the JavaScript code to attend client’s requests for accessing a file. If the file is available the Node.js server returns that file. Otherwise it gives an error.  
- <mark style="background: #C900FFA6;">Index.html:</mark> It is a file that contains the website and the AJAX code to be executed from the client.  
- <mark style="background: #C900FFA6;">ajax_info.txt:</mark> It is a file hosted in the server that is going to be access by the client through AJAX.

### <mark style="background: #C900FFA6;">STEP 1: Server starts Node.js to listen to what clients requests</mark>

![[Pasted image 20260217120543.png]]

1. Create a folder called Node  
2. Copy the documents on that folder  
3. Execute in console: “Node Example.js”  
4. Server Running and waiting for requests...

### <mark style="background: #C900FFA6;">STEP 2: Client requests for the website</mark>

![[Pasted image 20260217120609.png]]

1. Client launches a browser (Chrome)  
2. Writes on the browser: “http://localhost:8080/index.html”

### <mark style="background: #C900FFA6;">STEP 3: Server sends the file to the client</mark>

![[Pasted image 20260217120652.png]]

1. Server is executing the code in “Example.js”  
2. Server looks for a file called “index.html” in the system  
3. Server sends “index.html” to the client

### <mark style="background: #C900FFA6;">STEP 4: Client executes the AJAX code</mark>

![[Pasted image 20260217120745.png]]

<mark style="background: #C900FFA6;">Client:</mark>
1. Client executes the code in the index.html file  
2. The code creates an AJAX XMLHttpRequest object  
3. The object asks for a document to the browser  

<mark style="background: #C900FFA6;">Server:</mark>
1. The files need to be in the same server/website  
2. If the file does not exist we get no errors it is silence.

### <mark style="background: #C900FFA6;">STEP 5: Server returns the file</mark>

![[Pasted image 20260217120832.png]]

1. Server is executing the code in “Example.js”  
2. Server looks for a file called “ajax_info.txt” in the system  
3. Server sends “ajax_info.txt” to the object

### <mark style="background: #C900FFA6;">STEP 6: Client uses the browser to update the Index.html file for the client</mark>

![[Pasted image 20260217120913.png]]

1. Ajax object reads the file  
2. Browser executes the code  
3. Browser updates the DOM document

### <mark style="background: #C900FFA6;">Why AJAX uses same-origin policy?</mark>

The same-origin policy is a critical security mechanism that restricts how a document or script loaded by one origin can interact with a resource from another origin.  

It helps isolate potentially malicious documents, reducing possible attack vectors.  

For example, it prevents a malicious website on the Internet from running JS in a browser to read data from a third-party webmail service or a company intranet and relaying that data to the attacker.  

https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy

![[Pasted image 20260217120958.png]]