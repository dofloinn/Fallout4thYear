### <mark style="background: #C900FFA6;">Summary of lecture</mark>  

Implement <mark style="background: #C900FFA6;">client-side authentication using an HTML login</mark> form with JavaScript validation.  

Ensure <mark style="background: #C900FFA6;">secure form data transmission</mark> to the server via the HTTPS POST method.  

<mark style="background: #C900FFA6;">Validate and sanitise user input</mark> on the server to avert security vulnerabilities.  

Utilise <mark style="background: #C900FFA6;">Redis as an in-memory data store</mark> for efficient session management.  

<mark style="background: #C900FFA6;">Integrate Redis with frameworks</mark> such as Express.js for seamless session handling in web applications.

### <mark style="background: #C900FFA6;">Concepts</mark>

<mark style="background: #C900FFA6;">Authentication:</mark> Authentication is the <mark style="background: #C900FFA6;">process of verifying a user's identity</mark>, typically through credentials like usernames and passwords. In JavaScript, authentication mechanisms are commonly implemented using libraries or frameworks like Passport.js or JSON Web Tokens (JWTs).  

<mark style="background: #C900FFA6;">Authorisation:</mark> Authorisation determines a <mark style="background: #C900FFA6;">user's actions/permissions within a system</mark> or application after being authenticated. In JavaScript, authorisation logic is often implemented based on user roles, permissions, or access control lists (ACLs).

### <mark style="background: #C900FFA6;">Authentication - Client</mark>

1. Create the login form - Don’t forget the HTML ``<input type = “password”>``  
2. Validate the fields on the client side - JavaScript Validation API, Angular...  ``<input>`` required, lengths, type...  
3. Send the form data to the server by POST  
	- HTTPS will send the form data encrypted *  
	- e.g. ``<form method="post" action="/login">``

### <mark style="background: #C900FFA6;">Authentication - Server</mark>

4. Validate again and sanitise the fields on the server  
5. Compute the hash of the sent password  
6. Compare the received details with the values stored in your database  
7. If the values match, set the session variables - Allow access to the resources/routes that require authentication  
8. On log out, destroy the session variables

### <mark style="background: #C900FFA6;">Authentication</mark>

![[Pasted image 20260323100009.png]]

### <mark style="background: #C900FFA6;">JavaScript Validation API</mark>

![[Pasted image 20260323100031.png]]

### <mark style="background: #C900FFA6;">Validation HTML Input Attributes</mark>

![[Pasted image 20260323100051.png]]

A String pattern is like a regular expression, with "" instead of /^ $/

pattern="[A-Za-z]{3}" // 3 letters

### <mark style="background: #C900FFA6;">Regular Expressions</mark>

<mark style="background: #C900FFA6;">Features:</mark>
- It starts and ends with /  
- ^ is the beginning 
- \+ is one or more times the previous  
- \* is zero or more than the previous  
- \$ is the end 
- ``/^[0-9]+$/`` // at least one numeric char long  
- ``/^[a-zA-Z]+$/`` 
- // both lowercase and uppercase letters 
- ``/^[0-9a-zA-Z]+$/``  
- // numbers and letters

### <mark style="background: #C900FFA6;">Regular Expressions:</mark>

https://developer.mozilla.org/en/docs/Web/JavaScript/Guide/Regular_Expressions  

Test Regular Expressions: https://regex101.com/  

Your user’s passwords should have minimum lengths and format requirements, which you can check with regular expressions.

### <mark style="background: #C900FFA6;">Regular expressions examples</mark>

1. Check if a string contains “cat” (simple match)  
```js
let text = "My cat is sleeping.";  
let pattern = /cat/;  
console.log(pattern.test(text)); // true
```  

Looks for the exact word “cat” anywhere in the string.

2. Validate if a string contains only digits  
```js
let number = "12345";  
let pattern = /^\d+$/;  
console.log(pattern.test(number)); // true
```  

^ = start, $ = end, \d+ = one or more digits. So this checks:  

“Is this only digits from start to end?”

3. Check if a string is a valid email  
```js
let email = "example@mail.com";  
let pattern = ^[a-zA-Z0-9._]+@[a-zA-Z-]+\.[a-zA-Z]{2,}$  
console.log(pattern.test(email)); // true
```  

``^[a-zA-Z0-9._]+`` – Local part with only letters, digits, dot, and underscore  

``[a-zA-Z-]+`` – Domain with only letters and hyphens  

``[a-zA-Z]{2,}`` – TLD with only letters, minimum 2 characters

4. Extract all hashtags from a sentence  
```js
let text = "I love #coding and #JavaScript!";  
let pattern = /#\w+/g;  
console.log(text.match(pattern)); // ["#coding",  
"#JavaScript"]
```  

#\w+ = # followed by letters, numbers, or underscores g 

flag = global match (finds all matches)

5. Validate a strong password  
```js
let password = "Str0ngP@ss!";  
let pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;  
console.log(pattern.test(password)); // true
```  

At least one lowercase letter  
At least one uppercase letter  
At least one digit  
At least one special character  
Minimum 8 characters long

### <mark style="background: #C900FFA6;">Internet domain pattern</mark>

<mark style="background: #C900FFA6;">Explanation of the pattern:</mark> 
- ^: Asserts the start of the string.  
- (?:https?:\/\/)?: Matches the protocol part (optional).  
- (?:www\.)?: Matches the optional "www." prefix.  
- ([a-zA-Z0-9-]+): Matches the domain name (can include letters, digits, and hyphens).  
- \.: Matches the dot separating the domain and the top-level domain (TLD).  
- ([a-zA-Z]{2,}): Matches the top-level domain (TLD) consisting of at least two letters.  
- (?:\/\S*)?: Matches the optional path part (such as "/path/to/page").  
- $: Asserts the end of the string.  

```
^(?:https?:\/\/)?(?:www\.)?([a-zA-Z0-9-]+)\.([a-zA-Z]{2,})(?:\/\S*)?$
```

### <mark style="background: #C900FFA6;">Email address pattern</mark>

<mark style="background: #C900FFA6;">Explanation of the pattern:</mark>  
- ^: Asserts the start of the string.  
- ``[a-zA-Z0-9._%+-]+``: Matches the local part of the email address, including letters, digits, dots, underscores, per cent signs, plus signs, and hyphens.  
- @: Matches the "@" symbol, which separates the local part from the domain part.  
- ``[a-zA-Z0-9.-]+:`` Matches the domain name, including letters, digits, dots, and hyphens.  
- \.: Matches the dot separating the domain name from the top-level domain (TLD).  
- ``[a-zA-Z]{2,}``: Matches the top-level domain (TLD), which consists of at least two letters.  
- $: Asserts the end of the string.

### <mark style="background: #C900FFA6;">Validation CSS Pseudo Selectors</mark>

This pseudo-class is useful for highlighting field errors for the user.

![[Pasted image 20260323101138.png]]

```js
selector:pseudo-class {  
	property:value;  
}
```

``input:invalid`` Selects all ``<input>`` elements with an invalid value

### <mark style="background: #C900FFA6;">Input Validation</mark>  

Client-side validation is performed to enhance the user experience and save bandwidth  
- Provide immediate feedback
- Save trips to the server  

However, you must always perform server-side validation as well for security reasons.  
- JavaScript can be bypassed 
- <mark style="background: #C900FFA6;">Input sanitisation:</mark> Avoid code injection, cross-site scripting

### <mark style="background: #C900FFA6;">Server-side Validation & Sanitization</mark>

Make sure that you validate the input and report any errors before creating the user

https://express-validator.github.io/docs/  
- isLength: checks the length of the string  
- isEmail: verifies if it is a string.
- Trim: trims characters (whitespace by default) at the beginning and the end of a string  
- Escape: replaces <, >, &, ', " and / with their corresponding HTML entities  
- Custom  

https://www.npmjs.com/package/validator  
- Blacklist: remove characters that appear in the blacklist.

### <mark style="background: #C900FFA6;">Bcrypt</mark>

Bcrypt is a <mark style="background: #C900FFA6;">password-hashing function</mark> designed to store passwords securely.  

It <mark style="background: #C900FFA6;">employs adaptive hashing</mark> (based on the data characteristics), making brute-force attacks computationally expensive.  

Bcrypt enhances <mark style="background: #C900FFA6;">security by incorporating salting</mark>, which prevents the use of precomputed hash tables for passwords cracking.  

Bcrypt is deliberately slow in generating a hash, which raises the difficulty for attackers attempting to crack passwords.

### <mark style="background: #C900FFA6;">Bcrypt for passwords</mark>

![[Pasted image 20260323101654.png]]

### <mark style="background: #C900FFA6;">Password Hashes on Node.js</mark>

In the DB, keeping the passwords hashed  
- Bcrypt is the de facto way to hash passwords  
- Store the result in a field with ~255 characters  

https://www.npmjs.com/package/bcrypt  

```js
const bcrypt = require('bcrypt');  
const saltRounds = 10;  

bcrypt.hash(myPlaintextPassword, saltRounds, function(err, hash) {  
	// Store hash in your password DB.  
});  

// hash is loaded from your DB.  
bcrypt.compare(myPlaintextPassword, hash, function(err, result) {  
	if(result) {  
		// Passwords match  
	} else {  
		// Passwords don't match  
	}
});
```

https://www.youtube.com/watch?v=O6cmuiTBZVs  

Parameter to establish how costly in time something is

### <mark style="background: #C900FFA6;">Sessions</mark>

<mark style="background: #C900FFA6;">Sessions set a user-key/ID on the user's computer:</mark>
- Web storage: client-side sessions to allow separate instances of the same web app to run in different windows without interfering with each other  
- Traditional cookies: communication with the server  

<mark style="background: #C900FFA6;">When you open a page, it scans the computer for a user key:</mark>
- If there is a match, it accesses that session  
- If not, it starts a new session  

Session <mark style="background: #C900FFA6;">data</mark> is not saved in the <mark style="background: #C900FFA6;">cookie</mark>, just the session ID

<mark style="background: #C900FFA6;">Concept definition:</mark> Sessions refer to the duration of interaction between a user and a system, typically maintained through session identifiers. In JavaScript, sessions are often managed server-side to track user activity and maintain user state across multiple requests.

### <mark style="background: #C900FFA6;">Sessions</mark>  

Session data is stored server-side.  

You might recall ``$_SESSION`` from PHP:  

``$_SESSION["favanimal"] = "cat";``  

In Node/Express, you need to add an appropriate store to manage this data  

The most popular is <mark style="background: #C900FFA6;">Redis</mark>  

<mark style="background: #C900FFA6;">Officially, Redis is not supported on Windows, but you can still install it:</mark>
- https://redislabs.com/blog/redis-on-windows-8-1-and-previous-versions/ 
- https://www.redislabs.com/blog/redis-on-windows-10

### <mark style="background: #C900FFA6;">What Is a Cookie?</mark> 

<mark style="background: #C900FFA6;">A cookie is a tiny text file saved on your device by your web browser at the request of a website. It stores information like:</mark> 
- Whether you're logged in,  
- What's in your shopping cart  
- Your language preference  
- Analytics or tracking data

### <mark style="background: #C900FFA6;">How Cookies Work (Step-by-Step)</mark>
1. You visit a website: Your browser sends a request to the website's server: ``GET /homepage HTTP/1.1``  
2. The server responds and sets a cookie: The server includes a Set-Cookie header in the response: Set-Cookie: session_id=abc123; HttpOnly; Path=/; This tells your browser: “Hey, store this!”  
3. Your browser stores the cookie: Your browser saves that cookie for the domain.  
4. You return or go to another page: On future requests to the same site, your browser automatically adds: Cookie: session_id=abc123  

This helps the server know who you are or what session you're in.

### <mark style="background: #C900FFA6;">HTTP Cookies</mark>

<mark style="background: #C900FFA6;">Cookies:</mark> Cookies are small pieces of data stored on the client side (in the user's browser) that are sent with each HTTP request to a server. In JavaScript, cookies are commonly used for session management, tracking, and storing user preferences.

<mark style="background: #C900FFA6;">The HTTP protocol is stateless:</mark> Initially, only static pages were served upon request  

With the development of personalisation, to maintain information on the server about the <mark style="background: #C900FFA6;">state</mark> (authentication, number of visits, preferences...), cookies were created  

There is a mechanism for <mark style="background: #C900FFA6;">servers</mark> to both store and retrieve information on the client side until they expire

### <mark style="background: #C900FFA6;">HTTP Cookies</mark>

<mark style="background: #C900FFA6;">A server can send cookies to the client:</mark>
- If the browser accepts it, it is stored as plain text  
- Then, the browser sends the same cookie to the server in subsequent visits.  

<mark style="background: #C900FFA6;">Client-side JavaScript can also create a cookie; if so, it can be read/written by the client and the server:</mark>
- document.cookie = "key1=value1;key2=value2;expires=date";  
- When you read the cookie, you can only see the key=value bits  
- It works as a String that you can append more key=value(s)

### <mark style="background: #C900FFA6;">How Cookies Work</mark>

<mark style="background: #C900FFA6;">Cookies:</mark>
- Cookie parameters (all optional except the last one):  
- <mark style="background: #C900FFA6;">Expires:</mark> The date the cookie will expire. If this is blank, the cookie will expire and be deleted when the visitor closes the browser: a session cookie.  
- When Chrome or Firefox are configured to reopen tabs from the last time they were opened upon startup, they will keep session cookies when closing the browser, making them act as persistent cookies.  
- <mark style="background: #C900FFA6;">Domain:</mark> The domain name of the website.  
- <mark style="background: #C900FFA6;">Path:</mark> The path to the directory or web page that sets the cookie. By default, it is '/', so you can retrieve the cookie from any directory or page.  
- <mark style="background: #C900FFA6;">Secure:</mark> If the cookie contains the word "Secure", the cookie may only be retrieved with a secure server (HTTPS).

Google Ads track users to show the best adverts

![[Pasted image 20260323102803.png]]

### <mark style="background: #C900FFA6;">Cookies</mark>

<mark style="background: #C900FFA6;">HttpOnly:</mark> Directs browsers not to expose cookies through channels other than HTTP (and HTTPS) requests, and thus not accessible via client-side JavaScript (using document.cookie)  

<mark style="background: #C900FFA6;">Name=Value:</mark> Cookies are <mark style="background: #C900FFA6;">key-value pairs</mark>. Values may not include semicolons, commas, or whitespaces.  

Browsers do not send the cookie attributes back to the server; they send the name and value.  

The browser uses the attributes to determine when to delete a cookie, accept or block a cookie, and so on.  

<mark style="background: #C900FFA6;">Beware of the EU Cookie Laws and GDPR:</mark> Requires asking permission from users before planting cookies and including details on their purpose.

### <mark style="background: #C900FFA6;">XSS - Cross-Site Scripting</mark>

If you store sensitive info in a cookie accessible via ``document.cookie``, a malicious script on your site (from an XSS attack) can <mark style="background: #C900FFA6;">read and steal</mark> the cookie.

1. The hacker connects to the website and infects it with malicious code in the form.

2. Alice accesses the website and runs the code provided by the hacker.  

3. The code executed by Alice sends her cookies to the hacker, who then takes control of Alice's profile, including her credit card.

### <mark style="background: #C900FFA6;">Express Sessions</mark>

https://www.npmjs.com/package/express-session  

The default cookie settings are { path: '/', httpOnly: true, secure: false, maxAge: null }.  

``maxAge`` is the number of milliseconds to add to the current date to calculate the Expires parameter  

The default name of the cookie is ``'connect.sid'``.  

```js
npm install express-session  
var session = require('express-session');  
var app = express();  
app.use(session({  
secret: 'keyboard cat', // used to sign the session ID cookie  
resave: false, // session NOT saved back to the store if not modified  
saveUninitialized: true, // choosing false is useful for login sessions  
cookie: { maxAge: 60000 }  
}));
```

### <mark style="background: #C900FFA6;">What is REDIS?</mark>

<mark style="background: #C900FFA6;">Redis is an open-source (BSD licensed)</mark>, in-memory data structure store that can function as a <mark style="background: #C900FFA6;">database, cache, and message broker</mark>. It facilitates fast and scalable session management.  

Redis acts as a <mark style="background: #C900FFA6;">session store that manages session data</mark>, storing it as a key-value pair with the session ID as the key and the session data as the value. After a specified duration, it deletes the session data.  

Redis can <mark style="background: #C900FFA6;">quickly retrieve and access cookies due to its in-memory nature</mark>, making it highly efficient. It is suitable for real-time and high-traffic web applications.  

Redis <mark style="background: #C900FFA6;">supports various data structures, including hashes, sets, and lists</mark>, rendering it versatile and adaptable for any application.

### <mark style="background: #C900FFA6;">Explanation:</mark>

1) Redis looks in cache memory; if it is not there, then it will go to the dataset.  
2) Retrieve the information  
3) Put it in the cache so it will accelerate the app the next time the client accesses it.

![[Pasted image 20260324165745.png]]

### <mark style="background: #C900FFA6;">Redis Data Store</mark> 

```shell
npm install redis connect-redis  
C:\Program Files\Redis>redis-server
```  

To store or access session data, use req.session (in JSON)  

```js
const redis = require('redis');  
const session = require('express-session');  

let RedisStore = require('connect-redis')(session);  
let redisClient = redis.createClient();  

app.use(  
	session({  
		store: new RedisStore({ client: redisClient }), // default host: 'localhost', port: 6379  
		secret: 'keyboard cat',  
		resave: false,  
		saveUninitialized: true  
	});  
);
```

### <mark style="background: #C900FFA6;">Example: Visit counter per route</mark>

```js
let RedisStore = require('connect-redis')(session);  
let redisClient = redis.createClient();  

app.use(  
	session({  
		store: new RedisStore({ client: redisClient }),  
		secret: 'keyboard cat',  
		resave: false,  
		saveUninitialized: true  
	})  
);  

app.use(function (req, res, next) {  
	if (!req.session.views)  
		req.session.views = {};  
	
	var pathname = parseurl(req).pathname;  
	req.session.views[pathname] = (req.session.views[pathname] || 0) + 1;  
	next();  
});  

app.get('/foo', function (req, res, next) {  
	res.send('You viewed this page ' + req.session.views['/foo'] + ' times');  
});  

app.get('/bar', function (req, res, next) {  
	res.send('You viewed this page ' + req.session.views['/bar'] + ' times');  
});
```

### <mark style="background: #C900FFA6;">Destroy Session</mark>

<mark style="background: #C900FFA6;">Session.destroy(callback);</mark>  
- Destroys the session and will unset the ``req.session`` property.  
- Once complete, the callback will be invoked.  
- Example:  

```js
app.post("/logout", function (req, res){  
	req.session.destroy( function (err) {  
		if(err)  
			return console.log(err);  
		res.send("You have been logged out.");  
	});  
});
```

