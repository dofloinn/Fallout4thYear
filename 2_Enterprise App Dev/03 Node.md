### <mark style="background: #C900FFA6;">Summary of lecture</mark>

<mark style="background: #C900FFA6;">Node.js:</mark> Open-source runtime server for JavaScript, compiled to native machine code using Google Chrome's V8 engine.  

<mark style="background: #C900FFA6;">Asynchronous, non-blocking I/O architecture</mark> ideal for real-time applications, network software, and single-page programs.  

<mark style="background: #C900FFA6;">Advantages over Apache/PHP</mark>, but drawbacks include single-threaded operation and occasional backward compatibility issues.

<mark style="background: #C900FFA6;">Lecture topics:</mark> 
- Getting started, 
- writing code, 
- modules, 
- file serving, 
- NPM packages, 
- MySQL integration, 
- MVC architecture, 
- the DRY principle.  

<mark style="background: #C900FFA6;">Enables efficient development</mark> through code reuse and parallel development, emphasising system dynamism and optimisation.

![[Pasted image 20260211094237.png]]

### <mark style="background: #C900FFA6;">History of Node.js</mark>

Node.js was written initially by Ryan Dahl (San Diego, US) in 2009, about thirteen years after introducing the first server-side JavaScript environment.  

The first <mark style="background: #C900FFA6;">JavaScript server-side environment</mark> was Netscape's LiveWire Pro Web.  

It was introduced in 1996. It allows developers to use JavaScript to create dynamic, server-side web applications.

![[Pasted image 20260211094317.png]]

### <mark style="background: #C900FFA6;">Node.js</mark>

Node.js is an <mark style="background: #C900FFA6;">open-source runtime server environment</mark>.  

Written in C++, Google Chrome’s V8 JS engine compiles JavaScript source code to native machine code in runtime instead of interpreting it beforehand.  

It allows you to run <mark style="background: #C900FFA6;">JavaScript</mark> on the server.  

It is <mark style="background: #C900FFA6;">free</mark> and runs on <mark style="background: #C900FFA6;">various platforms</mark> (Windows, Linux, Unix, Mac OS X, etc).  

Node.js represents a "JavaScript everywhere" paradigm  

Unifying web application development around a <mark style="background: #C900FFA6;">single programming language</mark>, rather than different languages for server-side and client-side scripts

### <mark style="background: #C900FFA6;">PHP and Java approach</mark>

One waiter for one table using threads

![[Pasted image 20260211094623.png]]

### <mark style="background: #C900FFA6;">Node.js approach</mark>

One waiter for all tables using only one thread

![[Pasted image 20260211094709.png]]

### <mark style="background: #C900FFA6;">Node.js Architecture</mark>

![[Pasted image 20260211094739.png]]

### <mark style="background: #C900FFA6;">Comparing speed access in time</mark>

![[Pasted image 20260211094814.png]]

<table>
	<tr>
		<th>Component</th>
		<th>Access Time (ns)</th>
		<th>Relative Speed</th>
	</tr>
	<tr>
		<td>Registers</td>
		<td>0.1</td>
		<td>----</td>
	</tr>
	<tr>
		<td>L1 Cache</td>
		<td>1</td>
		<td>10 times slower than registers</td>
	</tr>
	<tr>
		<td>L2 Cache</td>
		<td>3-10</td>
		<td>3-10 times slower than L1 Cache</td>
	</tr>
	<tr>
		<td>RAM</td>
		<td>10-100</td>
		<td>10-100 times slower than L2 Cache</td>
	</tr>
	<tr>
		<td>Hard Drive (SSD)</td>
		<td>50-150</td>
		<td>500-1500 times slower than RAM</td>
	</tr>
	<tr>
		<td>Network Access</td>
		<td>(LAN) 1M–10M</td>
		<td>10-100 times slower than SSD</td>
	</tr>
</table>

### <mark style="background: #C900FFA6;">Why Node.js?</mark>  

Node.js uses asynchronous I/O programming!  

It runs <mark style="background: #C900FFA6;">single-threaded, non-blocking, asynchronous programming</mark>, which is very memory efficient - no thread context switching.  

<mark style="background: #C900FFA6;">Node.js can generate dynamic page content:</mark>
- It can create, open, read, write, delete, and close files on the server;  
- It can collect form data; 
- It can create, read, update, and delete data in your database 

Node.js is great for <mark style="background: #C900FFA6;">event-driven (callback) architectures</mark>, facilitating scalability and real-time web applications (like real–time communications and browser games).

### <mark style="background: #C900FFA6;">Where to use Node.js</mark>

<mark style="background: #C900FFA6;">1.Network Software:</mark> Node.js is incredibly efficient for constructing scalable network software like web servers, real-time chat applications, and gaming servers.  

<mark style="background: #C900FFA6;">2.Data Flow:</mark> Node.js excels at managing data flow applications, such as real-time audio and video processing, because it can process substantial amounts of data without disrupting other processes.  

<mark style="background: #C900FFA6;">3.Single-Page Programs:</mark> Node.js can build quick and efficient single-page programs by leveraging its extensive library of modules and packages.

<mark style="background: #C900FFA6;">4.Microservices Design:</mark> Node.js is often used for building microservices-based programs due to its lightweight and quick nature, which makes it easier to create and roll out services swiftly.

<mark style="background: #C900FFA6;">5.Connecting Node.js servers:</mark> Using multiple Node.js servers together can improve an application's performance, scalability, and maintainability. This can be achieved through load balancing, running Node.js in cluster mode, or building a microservices-based application.

### <mark style="background: #C900FFA6;">Apache/PHP versus Node.js</mark>

<mark style="background: #C900FFA6;">How PHP handles a file request:</mark>
1. Sends the task to the computer's file system.  
2. Waits while the file system opens and reads the file.  
3. Returns the content to the client.  
4. Ready to handle the subsequent request.  

<mark style="background: #C900FFA6;">How Node.js handles a file request:</mark>  
1. Sends the task to the computer's file system.  
2. Ready to handle the subsequent request.  
3. When the file system opens and reads the file, the server returns the content to the client.  
4. Observer pattern: the subject maintains a list of observers and notifies them of state changes by calling a method  
5. Node.js eliminates the waiting and simply continues with the next request.  
6. Node.js is being used by eBay, General Electric, GoDaddy, Microsoft, PayPal, Uber, Wikipins, Yahoo!, and Yammer to name a few.

### <mark style="background: #C900FFA6;">Comparison between PHP and Node.js</mark>

![[Pasted image 20260211100319.png]]

### <mark style="background: #C900FFA6;">Why maybe not Node.js?</mark> 

<mark style="background: #C900FFA6;">Not multi-threaded by default:</mark>
- Single-threaded by default (main event loop).
- Multithreading is available using Worker Threads for CPU-bound tasks.
- libuv uses a thread pool for some asynchronous operations.
- CPU-intensive operations will perform poorly.
- Only I/O is asynchronous; it has no thread-switching  

<mark style="background: #C900FFA6;">Loss of data:</mark>
- In case of an error (with a single thread), global data may be lost
- Maturity of documentation, support
- Frequent changes, not always NPM backward compatible
- It takes experience to judge the packages in NPM

### <mark style="background: #C900FFA6;">Node.js versus its Predecessors</mark> 

<table>
	<tr>
		<th>Feature</th>
		<th>Node.js (2009-Present)</th>
		<th>LiveWire (1996-Late 1990s)</th>
		<th>JScript in ASP (1996-2000s)</th>
	</tr>
	<tr>
		<td>Execution</td>
		<td>V8 engine (fast, compiled JS)</td>
		<td>Interpreted JS</td>
		<td>Interpreted JScript</td>
	</tr>
	<tr>
		<td>Architecture</td>
		<td>Event-driven, non-blocking</td>
		<td>Blocking, thread-based</td>
		<td>Blocking, request-response</td>
	</tr>
	<tr>
		<td>Scalability</td>
		<td>High (handles thousands of connections)</td>
		<td>Limited</td>
		<td>Limited, resource-heavy</td>
	</tr>
	<tr>
		<td>Platform</td>
		<td>Cross-platform</td>
		<td>Netscape Enterprise Server</td>
		<td>only Windows IIS only</td>
	</tr>
	<tr>
		<td>Package Manager</td>
		<td>NPM (large ecosystem)</td>
		<td>None</td>
		<td>None</td>
	</tr>
	<tr>
		<td>Use Cases</td>
		<td>APIs, real-time apps, microservices</td>
		<td>Early web apps</td>
		<td>Dynamic websites, enterprise apps</td>
	</tr>
	<tr>
		<td>Adoption</td>
		<td>Massive (Netflix, LinkedIn, PayPal, etc.)</td>
		<td>Small, discontinued</td>
		<td>Microsoft ecosystem, later replaced</td>
	</tr>
	<tr>
		<td>Current Status</td>
		<td>Active, widely used</td>
		<td>Obsolete</td>
		<td>Obsolete, replaced by ASP.NET</td>
	</tr>
</table>

### <mark style="background: #C900FFA6;">Getting Started</mark>

Download and install Node.js from: https://nodejs.org  

Node.js files contain tasks that will be executed on certain events, like someone trying to access a port on the server  

Node.js files have the extension ".js"

Node.js files must be initiated on the server before having any effect

![[Pasted image 20260211103444.png]]

### <mark style="background: #C900FFA6;">Hello.js</mark>

```js
var http = require('http'); // include module for the http server  
var url = require('url'); // include module to split the query string  
http.createServer(function (req, res) {  
	res.writeHead(200, {'Content-Type': 'text/html'});  
	var q = url.parse(req.url, true).query; // returns an object  
	res.end('Hello World! The month is: ' + q.month);  
}).listen(8080);  
/* req is an http.IncomingMessage object that includes the url property (after the domain name) */
```

HTTP GET method

![[Pasted image 20260211103609.png]]

### <mark style="background: #C900FFA6;">Example of Node.js Code</mark>

```js
var http = require("http");  
http.createServer(function (request, response) {  
	// Send the HTTP header  
	// HTTP Status: 200 : OK  
	// Content Type: text/plain  
	response.writeHead(200, {'Content-Type': 'text/plain'});  
	// Send the response body as "Hello World"  
	response.end('Hello World\n');  
}).listen(8081);  
// Console will print the message  
console.log('Server running at http://127.0.0.1:8081/');
```

### <mark style="background: #C900FFA6;">Modules</mark>

Modules are the same as JavaScript libraries: a set of functions you want to include in your web application.  

You can create your modules and easily include them:  

On a file mymodule.js write:  
```js
exports.myDateTime = function () {  
	return Date();  
};
```  

Use it in the main server file with:
```js
var dt = require('./mymodule');  
dt.myDateTime();
```

### <mark style="background: #C900FFA6;">Example</mark>

today.js
```js
var http = require('http');  
var dt = require('./mymodule');  

http.createServer(function (req, res) {  
	res.writeHead(200, {'ContentType': 'text/html'});  
	res.end('Hello World! Today is ' +  
dt.myDateTime());  
}).listen(8080);   
```

mymodule.js
```js 
exports.myDateTime = function() {  
	return Date();  
};
```

![[Pasted image 20260211104001.png]]

### <mark style="background: #C900FFA6;">URL module</mark>

```js
var url = require('url');  
var adr = 'http://localhost:8080/default.htm?year=2017&month=february';  
var q = url.parse(adr, true);  

console.log(q.host); //returns 'localhost:8080' 
console.log(q.pathname); //returns '/default.htm'  
console.log(q.search); //returns '?year=2017&month=february'  

var qdata = q.query; //returns an object: { year: 2017, month: 'february' }  
console.log(qdata.month); //returns 'february'
```

### <mark style="background: #C900FFA6;">Serving Files</mark>

```js
var http = require('http');  
var url = require('url');  
var fs = require('fs');  

http.createServer(function (req, res) {  
	var q = url.parse(req.url, true);  
	var filename = "." + q.pathname;  
	
	fs.readFile(filename, function(err, data) {
		if (err) {  
			res.writeHead(404, {'Content-Type': 'text/html'});  
			return res.end("404 Not Found");  
		}  
		res.writeHead(200, {'Content-Type': 'text/html'});  
		res.write(data);  
		return res.end();  
	}); // you can use 'return' to ensure you stop after the (first)  
callback  
}).listen(8080);
```

### <mark style="background: #C900FFA6;">Packages</mark>

NPM is a pre-installed package manager for Node.js packages.  

www.npmjs.com hosts thousands of free packages.  

A package in Node.js contains all the files you need for a module.  

On the command line, tell NPM to download any package: “npm install upper-case”  

NPM uses the folder ``"node_modules"`` to place the packages, e.g.  
``C:\nodejs\node_modules\upper-case``  

Include the "upper-case" package in the same way you include any other module:  

``var uc = require('upper-case');``

### <mark style="background: #C900FFA6;">Some Node Packages</mark>

<mark style="background: #C900FFA6;">File Upload:</mark> https://www.w3schools.com/nodejs/nodejs_uploadfiles.asp  

<mark style="background: #C900FFA6;">Sending emails:</mark> https://www.w3schools.com/nodejs/nodejs_email.asp  

Express -> later, to build REST APIs  

Database Access

### <mark style="background: #C900FFA6;">MySQL</mark>

MySQL is the most popular open-source relational database.  

You can download a free MySQL database at https://www.mysql.com/products/community/  

Include the “MySQL Workbench”, a GUI to manage your DB.

### <mark style="background: #C900FFA6;">Node.js MySQL</mark> 

```js
// npm install mysql  
var mysql = require('mysql');  

var con = mysql.createConnection({  
	host: "localhost",  
	user: "yourusername",  
	password: "yourpassword",  
	database: "mydb"  
});  

con.connect(function(err) {  
	if (err) throw err;  
	con.query("SELECT name, address FROM users", function (err, result,  
	fields) { // fields is an array with information about each field  
		as an object  
		if (err) throw err;  
		console.log(result[2].address);  
	});  
});
```

### <mark style="background: #C900FFA6;">Node.js MySQL SELECT</mark>

When the user provides query values, you should escape special characters to prevent SQL injections:  

```js
var sql = 'SELECT * FROM users WHERE address = ' + mysql.escape(adr);  
con.query(sql, function (err, result) {  
	if (err) throw err;  
	console.log(result);  
});  

//OR  

var sql = 'SELECT * FROM users WHERE name = ? OR address = ?';  
con.query(sql, [name, adr], function (err, result){  
	// TO DO  
});
```

### <mark style="background: #C900FFA6;">Node.js MySQL SELECT</mark>

<mark style="background: #C900FFA6;">Wildcards</mark>  Find names starting with S:  

```js
con.query("SELECT * FROM users WHERE name LIKE 'S%'", function (err, result) {  
	// TODO  
});
``` 

For a refresher on SQL syntax: https://www.w3schools.com/sql/default.asp

### <mark style="background: #C900FFA6;">Node.js MySQL INSERT</mark>

For tables with an auto-increment ID field, you can get the ID of the row you just inserted by asking for the result object.  

<mark style="background: #C900FFA6;">Note:</mark> Only one row can have been inserted.  

```js
con.connect(function(err) {  
	if (err) throw err;  
	var sql = "INSERT INTO users (name, address) VALUES ('Michelle', 'Blue Village 1')";
	
	con.query(sql, function (err, result) {  
		if (err) throw err;  
		console.log("1 record inserted, ID: " + result.insertId);  
	});  
});
```

### <mark style="background: #C900FFA6;">Node.js MySQL UPDATE</mark>

```js
con.connect(function(err) {  
	if (err) throw err;  
	var sql = "UPDATE users SET address = 'Canyon 123’  
	WHERE address = 'Valley 345'";  
	con.query(sql, function (err, result) {  
		if (err) throw err;  
		console.log(result.affectedRows + " record(s) updated");  
	// e.g. 2 record(s) updated  
	});  
});
```

### <mark style="background: #C900FFA6;">Node.js MySQL DELETE</mark> 

```js
con.connect(function(err) {  
	if (err) throw err;  
	var sql = "DELETE FROM users WHERE address = 'Mountain 21'";  
	
	con.query(sql, function (err, result) {  
		if (err) throw err;  
		console.log("deleted: " + result.affectedRows + "rows.");  
	// e.g. deleted 3 rows  
	});  
});
```

### <mark style="background: #C900FFA6;">MVC</mark>

The <mark style="background: #C900FFA6;">Model-View-Controller (MVC)</mark> pattern, originally formulated in the late 1970s, is a software architecture design pattern based on keeping the presentation of data separated from the methods that interact with the data.  

An MVC system should allow a front-end developer and a back-end developer to work on the same system in parallel.  

MVC was originally designed for desktop GUIs, but it has been adapted and adopted by web developers  

The pattern encourages the development of modular systems, allowing developers to update, add, or even remove functionality quickly.

### <mark style="background: #C900FFA6;">Server-Side MVC</mark>

![[Pasted image 20260211110453.png]]

One-way data flow system!

### <mark style="background: #C900FFA6;">Model</mark>  

In server-side MVC, the Model includes <mark style="background: #C900FFA6;">persistent data and variables for business logic</mark>. It must allow access to view, collect, and write data.  

The Model is technically “blind” —it does not know what happens to the data when it is passed to the View.  

Its sole purpose is to process data into its permanent storage or seek and prepare data to be passed along.  

The Model asks no questions and accepts all requests.

### <mark style="background: #C900FFA6;">View</mark>

The View is where data, requested from the Model, is viewed, and its final output is determined. Traditionally, it is the part of the system where the <mark style="background: #C900FFA6;">HTML is generated and displayed</mark>.  

The View also ignites reactions from the user, who then interacts with the Controller. For example, a button generated by a View, which a user clicks and triggers an action in the Controller.  

Many mistake the View as having no connection to the Model and that all of the data displayed by the View is passed from the Controller.  

There is no direct relationship between the View and the Controller without the Model or the User.

### <mark style="background: #C900FFA6;">Controller</mark>

The Controller handles data the user inputs or submits and updates the Model accordingly. It serves the user interactions. Each Controller function is triggered by the user’s interaction with the View.  

<mark style="background: #C900FFA6;">The Controller collects information</mark> and passes it on to the Model to be organised for storage. It does not contain any logic needed to process the input.  

A common mistake is assigning to the Controller responsibilities that the View should have, like crunching and processing data from the Model to the View

### <mark style="background: #C900FFA6;">DRY principle</mark>

“Don’t Repeat Yourself”: Every piece of knowledge must have a single, authoritative representation within a system.  

The aim is to maximise system dynamism and optimisation. If you need to write the same code in many places, create a separate method and use it wherever required.  

This introduces the possibility of caching and improving the overall run time.  

Changing one system element does not alter unrelated elements, making DRY a vital principle when developing MVC patterns.  

It promotes code reuse and parallel development.