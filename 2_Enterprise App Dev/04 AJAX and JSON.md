<mark style="background: #C900FFA6;">Lesson Outline:</mark>
- Section 1 – Introduction to AJAX  
- Section 2 – HTTP Requests  
- Section 3 – Code example

### <mark style="background: #C900FFA6;">Summary of lecture</mark>

AJAX, short for <mark style="background: #C900FFA6;">Asynchronous JavaScript And XML</mark>, uses a browser's built-in ``XMLHttpRequest`` object, JavaScript, and HTML DOM to exchange data with a web server without reloading the entire page.  

Despite its name, AJAX applications commonly use plain text or <mark style="background: #C900FFA6;">JSON for data transport</mark>. AJAX enables asynchronous updates to web pages, allowing components to be updated independently, triggered by events like page loading or button clicks.  

The lecture also covers related concepts such as HTTP protocols, XMLHttpRequest methods, and the use of AJAX in libraries like jQuery, AngularJS, and ReactJS. It also covers basic commands for Axios in Node.js.

### <mark style="background: #C900FFA6;">Section 1 - Introduction to AJAX</mark>

![[Pasted image 20260217111624.png]]

### <mark style="background: #C900FFA6;">AJAX</mark>

<mark style="background: #C900FFA6;">AJAX:</mark> Asynchronous JavaScript And XML.

AJAX is not a programming language. It just uses:  
- A browser built-in ``XMLHttpRequest`` object (to request data from a web server)  
- JavaScript and HTML DOM (to display or use the data)  

AJAX is a misleading name. AJAX applications might use XML to transport data, but it is equally common to transport data as plain text or JSON text.  

AJAX allows web pages to be updated <mark style="background: #C900FFA6;">asynchronously</mark> by exchanging data with a web server behind the scenes.  

This means it is possible to update parts of a web page without reloading the whole page. Everything else on the page keeps working while we wait for the data.

### <mark style="background: #C900FFA6;">AJAX allows for updating the different components independently</mark>

![[Pasted image 20260217111826.png]]

### <mark style="background: #C900FFA6;">AJAX</mark>

![[Pasted image 20260217111848.png]]

This happens behind the scenes

1. An <mark style="background: #C900FFA6;">event occurs</mark> on a web page (the page is loaded, a button is clicked, etc.)  
2. JavaScript creates an ``XMLHttpRequest`` object  
3. The ``XMLHttpRequest`` object sends a request to a web server  
4. The server <mark style="background: #C900FFA6;">processes the request</mark>  
5. The server <mark style="background: #C900FFA6;">sends a response back</mark> to the web page  
6. JavaScript reads the response  
7. Proper action (like page update) is performed by JavaScript  

<mark style="background: #C900FFA6;">NOTE:</mark> Both the web page and the files you are trying to load must be on the same server.

### <mark style="background: #C900FFA6;">HTTP – Session Overview</mark>

![[Pasted image 20260217112031.png]]

### <mark style="background: #C900FFA6;">HTTP Request Methods</mark>


<table>
	<tr>
		<td>GET</td>
		<td>Request for a document (resource) on a server</td>
	</tr>
	<tr>
		<td>HEAD</td>
		<td>Retrieve only the headers (meta-information), but not the document itself.  
		As the headers contain an entry on the document‘s length, this method is useful for quality-based transfer decisions.  
		- check for valid and broken links in Web pages.  
		- check Web pages for modifications.</td>
	</tr>
	<tr>
		<td>POST</td>
		<td>Send information to the server (usually information provided in a form).</td>
	</tr>
	<tr>
		<td>PUT</td>
		<td>Upload file to URI specified</td>
	</tr>
	<tr>
		<td>DELETE</td>
		<td>Remove file specified by URI</td>
	</tr>
	<tr>
		<td>TRACE</td>
		<td>Returns contents of request header in response message body</td>
	</tr>
</table>

### <mark style="background: #C900FFA6;">HTTP Protocols</mark>

![[Pasted image 20260217112428.png]]

### <mark style="background: #C900FFA6;">HTTP Multiplexing</mark>

![[Pasted image 20260217112452.png]]

### <mark style="background: #C900FFA6;">XMLHttpRequest object methods</mark>

![[Pasted image 20260217112514.png]]

URL may be ``.txt``, ``.xml``, ``.json`` or scripts like ``.js`` and ``.php`` that return data

### <mark style="background: #C900FFA6;">XMLHttpRequest object properties</mark>

![[Pasted image 20260217112632.png]]

The ``onreadystatechange`` event is triggered four times (1-4), one time for each change in the ``readyState``.

### <mark style="background: #C900FFA6;">Example: text file on server</mark>

```json
myTutorials.txt, in JSON array format  
[  
	{  
		"display": "HTML Tutorial",  
		"url": "https://www.w3schools.com/html/default.asp"  
	},  
	{  
		"display": "CSS Tutorial",  
		"url": "https://www.w3schools.com/css/default.asp"  
	},  
	{  
		"display": "JavaScript Tutorial",  
		"url": "https://www.w3schools.com/js/default.asp"  
	},  
	{  
		"display": "jQuery Tutorial",  
		"url": "https://www.w3schools.com/jquery/default.asp"  
	}  
]
```

### <mark style="background: #C900FFA6;">Example: XMLHttpRequest() object</mark>

```html
<script>  
	xmlhttp = new XMLHttpRequest();  
	url = "myTutorials.txt";  
	
	xmlhttp.onreadystatechange = function() {  
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) { // finished and OK  
			myArr = JSON.parse(xmlhttp.responseText); //string turned to object  
			myFunction(myArr); //callback function  
		}  
	}  
	
	xmlhttp.open("GET", url, true); //true asynchronous  
	xmlhttp.send();  
	
	function myFunction(myArr) {  
		out = "";  
		for(i = 0; i < myArr.length; i++) { 
			out += '<a href="' + myArr[i].url + '">' + myArr[i].display + '</a><br>';  
		// <a href="http://www.w3schools.com">Visit W3Schools</a><br>  
		}  
		document.getElementById("example").innerHTML = out;  
	}
</script>
```

### <mark style="background: #C900FFA6;">GET or POST?</mark>

<mark style="background: #C900FFA6;">GET is simpler and faster than POST</mark>  

To avoid getting a cached result, add a unique ID to the URL  

```js
xhttp.open("GET", "server.js?t=" + Math.random(), true);
```  

<mark style="background: #C900FFA6;">However, always use POST requests when:</mark>
- <mark style="background: #C900FFA6;">Updating</mark> a file or database record on the server (when you can’t guarantee to work around a cashed file).  
- Sending a <mark style="background: #C900FFA6;">large amount of data</mark> to the server (POST has no size limitations).  
- Sending <mark style="background: #C900FFA6;">user input</mark> can contain unknown characters (POST is more robust and secure than GET).  
- Sending <mark style="background: #C900FFA6;">sensitive data</mark>, like passwords (POST data is not visible in the URL)

### <mark style="background: #C900FFA6;">POST Requests</mark>

Sending data without sending any parameters:  
```js
xhttp.open("POST", "data.txt", true);  
xhttp.send();
```  

Sending data with the request:  

```js
xhttp.open("POST", "server.js", true);  
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded"); // Adds HTTP headers to the request  
xhttp.send("fname=Henry&lname=Ford");
```

### <mark style="background: #C900FFA6;">jQuery AJAX</mark>

Some older browsers have a different syntax for AJAX implementation.  

You would have to write extra code to test for it, e.g.:  

```js
var xhttp;  
if (window.XMLHttpRequest)  
	xhttp = new XMLHttpRequest();  
else  
	// code for IE6, IE5  
	xhttp = new ActiveXObject("Microsoft.XMLHTTP");
```

jQuery handles <mark style="background: #C900FFA6;">cross-browser compatibility</mark>, and we can write AJAX with a single line of code.  

jQuery is likely already included in a Bootstrap page.

### <mark style="background: #C900FFA6;">jQuery</mark>

In your .html, include jQuery from a CDN, e.g.:  
```html
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
```  

<mark style="background: #C900FFA6;">The syntax is:</mark>

```js
$(selector).action  
//OR:
jQuery(selector).action
```  

The jQuery selector uses CSS selectors to select elements. 

<mark style="background: #C900FFA6;">Examples:</mark>
```js
$("p").hide() - hides all <P> elements  
$(".test").hide() - hides all elements with class="test"  
$("#test").hide() - hides the element with id="test"
```

### <mark style="background: #C900FFA6;">jQuery AJAX: Load</mark>

Load data from the server and place the returned content into the matched HTML elements.  

```js
$(selector).load(URL, data, callback);
```

The optional data parameter specifies a set of query string key/value pairs to send along with the request.  

```js
$("#div1").load("test.txt");
```  

Loads the content of the file "test.txt" into the element with id “div1”

The optional callback parameter is the name of a function to be executed after the load() method is completed.  

<mark style="background: #C900FFA6;">The callback function can have different parameters:</mark> 
- ``responseTxt`` - contains the resulting content if the call succeeds  
- ``statusTxt`` - contains the status of the call  
- ``xhr`` - contains the ``XMLHttpRequest`` object

### <mark style="background: #C900FFA6;">jQuery AJAX: load</mark>

```js
$("#div1").load("test.txt", function(responseTxt, statusTxt, xhr){  

	if(statusTxt == "success")  
		alert("External content loaded successfully!");  
	if(statusTxt == "error")  
		alert("Error: " + xhr.status + ": " + xhr.statusText);  
});
```

### <mark style="background: #C900FFA6;">jQuery AJAX: GET</mark>

```js
$.get(URL, callback);  

$.get("server.js", function(data, status){  
	alert("Data: " + data + "\nStatus: " + status);  
});
```

A URL is required for the server-side resource you wish to request.  

The second parameter is (an optional) callback function. You probably don’t want to ignore the result, so you’ll specify the callback.  

The first callback parameter holds the content requested, and the second callback parameter holds the request status.

### <mark style="background: #C900FFA6;">jQuery AJAX: POST</mark>

A URL is required for the server-side resource you wish to request.  

The optional data parameter specifies some key/value  
parameters to send along with the request.  

The optional callback parameter is a function that can be executed if the request succeeds after loading the response data.

```js
$.post(URL, data, callback);  

$("#btn1").click(function(){  
	$.post("server.js",  
	{  
		name: "Donald Duck",  
		city: "Duckburg"  
	},  
	function(data, status){  
		alert("Data: " + data + "\  
		nStatus: " + status);  
	});  
});
```

### <mark style="background: #C900FFA6;">jQuery AJAX: getJSON()</mark>

```js
$(selector).getJSON(url,data,success(data,status,xhr)) // uses GET  
// getJSON parses the JSON automatically, so we don't need to call JSON.parse  
//It's implied that "test.json" is expected to be in the same directory as the HTML file containing this JavaScript code  
$("#btn2").click(function(){  
	$.getJSON("test.json", function(result){  
		$.each(result, function(key, value){  
			$("#div1"). append("param: " + key + " data: " + value + "<br>");  
		});  
	});  
});
```  

As for jQuery 1.4, the request will usually fail silently if the JSON file contains a syntax error.  

For this reason, avoid frequent hand-editing of JSON data

### <mark style="background: #C900FFA6;">AJAX in Angular</mark>  

Modern browsers support two ways of making HTTP requests:  
- The ``XMLHttpRequest`` interface (like AJAX)  
- The <mark style="background: #C900FFA6;">fetch() API</mark> - offers simpler code, but browser support for aborting requests is still under development, and Internet Explorer does not yet support it.  

The HttpClient in @angular/common/http offers a client HTTP API that rests on XMLHttpRequest, e.g.:  

```js
configUrl = 'assets/config.json';  
getConfig() {  
return this.http.get(this.configUrl);  
}
```

https://angular.io/guide/http  

The benefits of HttpClient include request and response interception and streamlined error handling.  
- In AngularJS, it’s called $http:  
- https://docs.angularjs.org/api/ng/service/$http  

What is angular? https://www.youtube.com/watch?v=WAZTZUgeLhQ  

More info: https://angular.io/guide/what-is-angular

### <mark style="background: #C900FFA6;">AJAX in ReactJS</mark>

You can use any AJAX library you like with React.  

<mark style="background: #C900FFA6;">Some popular ones are:</mark>
- jQuery AJAX  
- Axios  

You can use the Browser’s fetch() API for asynchronous  communication.  

https://reactjs.org/docs/faq-ajax.html

React video: https://www.youtube.com/watch?v=N3AkSS5hXMA  

More info: https://reactjs.org/docs/faq-ajax.html
### <mark style="background: #C900FFA6;">AXIOS Basic commands</mark>

1. <mark style="background: #C900FFA6;">GET Request:</mark> ``axios.get('https://api.example.com/data');``
2. <mark style="background: #C900FFA6;">GET Request with Parameters:</mark> ``axios.get('https://api.example.com/data', { params: { key1: 'value1', key2: 'value2' } });``  
3. <mark style="background: #C900FFA6;">POST Request:</mark> ``axios.post('https://api.example.com/data', { key1: 'value1', key2: 'value2' });``  
4. <mark style="background: #C900FFA6;">PUT Request:</mark> ``axios.put('https://api.example.com/data/123', { key1: 'updatedValue1', key2: 'updatedValue2' });`` 
5. <mark style="background: #C900FFA6;">DELETE Request:</mark> ``axios.delete('https://api.example.com/data/123');``

### <mark style="background: #C900FFA6;">Node.js Response</mark> 

To get the HTTP request body (POST data) without using ExpressJS:  

The request object passed in the connection callback is a stream. We must listen for the stream data events processed in chunks. When the data ends, the stream end event is called once:  
```js
// Creating an HTTP server using the createServer method provided by the 'http' module.  

http.createServer(function (req, res) {  
	// Initializing an empty array to store incoming data chunks.  
	let data = [];  
	// Listening for the 'data' event on the request object, which is emitted when data is received.  
	req.on('data', chunk => {  
		// Appending each data chunk to the 'data' array.  
		data.push(chunk);  
	});
	
	// Listening for the 'end' event on the request object, which is emitted when all data has been received.  
	req.on('end', () => {  
	// Logging the parsed JSON data to the console.  
		console.log(JSON.parse(data));  
		//Write a response to the client indicating that JSON data has been received.  
		res.write("JSON received, thank you.");  
		// Ending the response, signalling that no more data will be sent.  
		return res.end();  
	});  
}
```

### <mark style="background: #C900FFA6;">JSON or XML?</mark>

![[Pasted image 20260217115239.png]]

<mark style="background: #C900FFA6;">JSON vs XML:</mark>
- Both are plain text and can be parsed and used by multiple languages  
- Both are self-describing (human readable)  
- Both are hierarchical  
- Both can be fetched with an ``XMLHttpRequest``  
- XML has to be parsed with an XML parser to extract values and store them in variables  
- JSON can be parsed by a standard JavaScript function, JSON.parse, and JSON maps to JavaScript objects  
- JSON is potentially <mark style="background: #C900FFA6;">shorter, faster and easier</mark> to read and write, especially for AJAX applications

### <mark style="background: #C900FFA6;">JSON</mark>

JSON (JavaScript Object Notation) is a lightweight text-based open standard designed for human-readable data interchange.  
- extended from JavaScript  
- the file type is ".json"  
- the MIME type for JSON text is "application/json"  
- language-independent data interchange  
- communication between browsers and servers  
- communication between peers  
- JSON has no version number.  
- No revisions to the JSON grammar are anticipated.  
- The strict syntax allows the parsing algorithms to remain simple, efficient, and consistent.

<mark style="background: #C900FFA6;">JSON Values</mark>
- Strings: 0 or more Unicode characters, wrapped in "double quotes", backslash used for escape characters  
- Booleans // true or false  
- Numbers  
- Objects  
- Arrays  
- null

<mark style="background: #C900FFA6;">JSON Numbers:</mark>
- Integer
- Real  
- Scientific  
- No octal or hex  
- No ``NaN`` or Infinity  
- Use null instead

![[Pasted image 20260217115706.png]]

<mark style="background: #C900FFA6;">JSON Objects:</mark>
- Objects are unordered containers of key/value pairs  
- Objects are wrapped in { }  
- Keys are strings  
- Values are JSON values  
- : separates keys and values  
- , separates key/value pairs

```json
{  
	"name": "Jack Byrne",  
	"enrolled": true,  
	"grade": "A",  
	"birthday": {  
		"day": 10,  
		"month": "June",  
		"year": 1990  
	}  
}
```

<mark style="background: #C900FFA6;">JSON Arrays</mark>
- Arrays are ordered sequences of values 
- Arrays are wrapped in []  
- , separates values  
- Just like in JavaScript, a JSON array can contain multiple objects, e.g.:  

```js
var employees = [  
{"firstName":"John", "lastName":"Doe"},  
{"firstName":"Anna", "lastName":"Smith"},  
{"firstName":"Peter","lastName":"Jones"}  
];
```

### <mark style="background: #C900FFA6;">JS to JSON conversion</mark>

Convert a JavaScript object into a JSON object with ``JSON.stringify()``  

```js
var obj = { name: "John", age: 30, city: "New York"};  
// the JS object is similar but does not take "" in the keys  
var myJSON = JSON.stringify(obj);
```  

The corresponding JSON object is: ``{"name":"John","age":30,"city":"New York"}``

### <mark style="background: #C900FFA6;">JSON to JS parsing</mark>

To parse JSON to a JavaScript object, use JSON.parse(text).  

It is supported by major browsers. For older ones, a compatible JavaScript library is available at JSON.org.  

“text” string shall be in JSON syntax  

You can then access the object’s properties with the dot notation, and use them on your webpage:  

```js
var text = '{"name":"Jack", "school": "DIT"}';  
var obj = JSON.parse(text);  
obj.name  
obj.school
```
