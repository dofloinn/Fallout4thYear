### <mark style="background: #C900FFA6;">Summary of lecture</mark> 

Express.js is a fast, minimalist web framework for Node.js, widely accepted as the industry standard.  

It is <mark style="background: #C900FFA6;">open-source</mark> under the <mark style="background: #C900FFA6;">MIT License</mark> and designed for building web applications and APIs.  

Express facilitates the creation of HTTP servers and routing for handling different endpoints. Its simple installation using <mark style="background: #C900FFA6;">“npm”</mark> allows for easy configuration for serving files and resolving routes. The framework supports static files.  

Express employs middleware to handle requests, enable the definition of route parameters, and facilitate REST API design conventions. It supports various <mark style="background: #C900FFA6;">HTTP methods</mark> and allows the chaining of handler functions.  

Express simplifies the development of web applications by offering a clean and flexible architecture for routing and handling requests.

![[Pasted image 20260224170701.png]]

### <mark style="background: #C900FFA6;">Express.js</mark>

Express.js, or simply Express, is a <mark style="background: #C900FFA6;">fast, unopinionated, minimalist</mark> web framework for Node.js: http://expressjs.com/  

The <mark style="background: #C900FFA6;">de facto</mark> standard is the dominant position based on public acceptance or market forces.  

It is <mark style="background: #C900FFA6;">free and open-source</mark> under the MIT License.  

It is designed to build <mark style="background: #C900FFA6;">web applications</mark> and APIs.

api.js  
```js
var express = require("express");  
var http = require("http");  
var app = express();  

// Create our Express-powered HTTP server and have it to listen on port 8080  

http.createServer(app).listen(8080);  
// set up our routes  

app.get("/hello", function (req, res) {  
	// no need to set up HTTP headers  
	res.send("Hello World!");  
}); // simply using res.send instead of res.write and res.end  

app.get("/goodbye", function (req, res) {  
	res.send("Goodbye World!");  
	});  
	app.get("/", function (req, res) {  
	res.send("This is the root route!");  
});
```

### <mark style="background: #C900FFA6;">Routes</mark>

node api.js  
localhost:8080/  
localhost:8080/hello  
localhost:8080/goodbye  
ctrl + c

![[Pasted image 20260224170940.png]]

### <mark style="background: #C900FFA6;">Web API Architecture</mark>

![[Pasted image 20260224171002.png]]

### <mark style="background: #C900FFA6;">Static files</mark> 

```js
// configure the app to use the view directory for static files  
app.use(express.static(__dirname + "/view"));  
// __dirname is where your server script is located
```  

<mark style="background: #C900FFA6;">The static file directory view will initially resolve any request sent to our server before it is handed off to our routes:</mark>
- If we have a file called index.html in our view directory and go to localhost:8080/index.html, it will return the file's contents.  
- If the file doesn’t exist, it will then check to see if there’s a match among our routes.  

<mark style="background: #C900FFA6;">Sending static files more generally:</mark>
```js
res.sendFile(path.join(__dirname + 'view/' + filename));
```

### <mark style="background: #C900FFA6;">Web API with Express</mark>  

<mark style="background: #C900FFA6;">Routing</mark> determines how an application or API responds to a client request to a particular endpoint, URI (or path), and HTTP request method (GET, POST, PUT, DELETE).  

Routing refers to matching a requested URL (i.e., a route) to the appropriate code.  

<mark style="background: #C900FFA6;">Express supports methods corresponding to all HTTP request methods</mark>. Only the first match of each route (endpoint + method) will be called initially. However, each route can have one or more handler functions. When the route is matched, these can be chained and even cause the control flow to go to a ‘next’ route.  

Router functions are Express middleware, meaning they must either complete (respond to) the request, e.g. ``res.send()``, or call the next function or route in the chain.

### <mark style="background: #C900FFA6;">Middleware in Express</mark>  

https://www.geeksforgeeks.org/middleware-in-express-js/  

Middleware is whatever gets executed between the request of the server and the final response

![[Pasted image 20260224171423.png]]

### <mark style="background: #C900FFA6;">Web API with Express</mark>  

Route definition structure:

<mark style="background: #C900FFA6;">app.method(PATH, HANDLERs):</mark>  
- <mark style="background: #C900FFA6;">app</mark> is an instance of express.  
- <mark style="background: #C900FFA6;">method</mark> is an HTTP request method in lowercase.  
- <mark style="background: #C900FFA6;">PATH</mark> on the server. It can be strings, string patterns, or regular expressions.  
- Query strings are not part of the route path.  
- You can access them in Express via req.query.q  
- <mark style="background: #C900FFA6;">HANDLER</mark> is the callback function executed when the route is matched.  
- You can also use ``app.all()`` to handle all HTTP methods.

### <mark style="background: #C900FFA6;">Web API with Express</mark>  

Say 'users' is your JS array of users:  

With one handler:  
```js
app.get('/users', function (req, res) {  
	res.json(users);  
});
```

![[Pasted image 20260224171710.png]]

<mark style="background: #C900FFA6;">With multiple handlers:</mark>
```js

var cb1 = function (req, res, next) {  
	if (!authenticated)  
		next('route'); // bypass the next handlers and go to the next route  
	next(); // pass control to the next handler specified in the array, cb2  
	}  
	var cb2 = function (req, res) {  
	return res.json(users);  
}  
app.get('/users', [cb1, cb2]);  
/* you can use this mechanism to respect the “single responsibility” and “don’t repeat yourself” principles and reuse handlers */
```

Route parameters are named URL segments that capture the values specified at their position in the URL.

The captured values are populated in the req.params object, with the name of the route parameter in the path as the key.

<mark style="background: #C900FFA6;">The name of route parameters must be made up of [A-Za-z0-9_]:</mark>
- <mark style="background: #C900FFA6;">Request URL:</mark> http://localhost:3000/users/1
- <mark style="background: #C900FFA6;">Route path:</mark> /users/:userId  
- <mark style="background: #C900FFA6;">req.params:</mark> { "userId": "1" }  

```js
app.get('/users/:userId', function (req, res) { 
	res.json(users[req.params.userId]);  
	// returns the JSON representation of the object in position 1  
	// {"id":"1","username":"Dave Davids"}  
});  

var users = [  
	{ id: '0', username: 'Robin Wieruch'},  
	{ id: '1', username: 'Dave Davids' }  
];
```

<mark style="background: #C900FFA6;">Resource/identifier/resource:</mark> 
```js
app.get('/users/:userId/books', function (req, res) {  
	res.send("All the books of user " + req.params.userId);  
	// TODO find all the books of that user and send them  
});
```  

<mark style="background: #C900FFA6;">Resource/identifier/resource/identifier:</mark>
```js
req.params: { "userId": "0", "bookId": "1" }  
app.get('/users/:userId/books/:bookId', function (req, res) {  
res.send("Book " + req.params.bookId + " of user " +  
req.params.userId);  
// TODO find that book of that user and sent it 
});
```  

<mark style="background: #C900FFA6;">Force the identifier to be a number:</mark>  
- Route path: /users/:userId(\\d+)
- If it’s not, you will receive a message like: Cannot GET /users/a

<mark style="background: #C900FFA6;">Resource/identifier/resource:</mark>
```js
// Route to get all books of a user  
app.get('/users/:userId/books', function (req, res) {  
	const user = users.find(function (u) {  
		return u.userId === req.params.userId;  
});
  
if (!user) {  
	return res.status(404).send('User not found');  
}
  
res.send('All the books of user ' + req.params.userId + ': ' + JSON.stringify(user.books));  
});
```

<mark style="background: #C900FFA6;">Resource/identifier/resource/identifier:</mark> 
```js
app.get('/users/:userId/books/:bookId', function (req, res) {  
	const userId = req.params.userId;  
	const bookId = req.params.bookId;  
	
	const user = users.find(function (u) {  
		return u.userId === userId;  
	});  
	
	if (!user) {  
		return res.status(404).send('User not found');  
	}  
	
	const book = user.books.find(function (b) { 
		return b.bookId === bookId;  
	});  
	
	if (!book) {  
		return res.status(404).send('Book not found');  
	}  

	res.send(`Book ${bookId} of user ${userId}: ${JSON.stringify(book)}`);  
});
```

```js
// before any routes are defined:  
app.use(express.json());  
// parses text as JSON and exposes the object on req.body. Don’t double it with JSON.stringify  
app.use(express.urlencoded({ extended: true }));  
// for forms, parses text as URL encoded data and exposes the object on req.body Say your client sends a request like $.post("/users", { id: '2', username: 'John Doe' });  

app.post('/users', function (req, res) {  
	users.push(req.body); // TODO persist the data  
	res.send("Received");  
});  

app.put('/users/:userId', function (req, res) { 
	// TODO update the user and reply back  
});  

app.delete('/users/:userId', function (req, res) {  
	// TODO delete the user and reply back  
});
```

```js
app.put('/users/:userId', function (req, res) { 
	// Assuming the updated user data is in the request body  
	const userId = req.params.userId;  
	const userData = req.body;  
	
	const userIndex = users.findIndex(function (u) {  
		return u.userId == userId;  
	});  
	
	if (userIndex == -1) {  
		return res.status(404).send('User not found');  
	}  
	// Update the user data  
	users[userIndex] = Object.assign({}, users[userIndex], userData);  

	res.send(`User ${userId} updated: ${JSON.stringify(users[userIndex])}`); 
	});  

	app.delete('/users/:userId', function (req, res) {  
		const userId = req.params.userId;  
		const userIndex = users.findIndex(function (u) { 
			return u.userId === userId;  
		});  
	
	if (userIndex === -1) {  
		return res.status(404).send('User not found');  
	}  
	// Delete the user  
	const deletedUser = users.splice(userIndex, 1)[0];  
	res.send(`User ${userId} deleted: ${JSON.stringify(deletedUser)}`);  
});
```

### <mark style="background: #C900FFA6;">REST API Design Conventions</mark>  

Keep your base URL simple and intuitive, with only singular or plural concrete nouns for resources and only 2 base URLs per resource:  ``/users and /users/1``  

Relationships between resources: 
```
/resource/identifier/resource 
GET /users/1/books
```  

Put optional states and attributes ("sweep complexity") behind the HTTP question mark:  

``GET /users?location=dublin&car=no``

### <mark style="background: #C900FFA6;">REST API Design Conventions</mark>  

Support partial response (to save bandwidth, especially for mobile) by adding optional fields in a comma-delimited list:  
```
// Only these three fields will be in the response  
/users?fields=name,car,location
```  

<mark style="background: #C900FFA6;">Pagination</mark> (e.g. get records 50 to 75)  
``/users?limit=25&offset=50``  

Use verbs for "non-resource" URLs:  
/convert?from=EUR&to=USD&amount=100  

Use a few <mark style="background: #C900FFA6;">HTTP status codes</mark> for error handling (200 – OK, 400 – Bad Request, 500 - Internal Server Error) with detailed descriptions in the payload, e.g.:  

```js
{
	"type": "OauthException", 
	"message":"(#803) Some of the aliases you requested do not exist: foo.bar"
}
```

