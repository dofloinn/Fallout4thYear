### <mark style="background: #C900FFA6;">Summary of lecture</mark>  

JWT is a <mark style="background: #C900FFA6;">standard for securely transmitting information</mark> as a JSON object.  

<mark style="background: #C900FFA6;">It consists of three parts:</mark>
- Header, 
- Payload, 
- Signature.  

JWT facilitates <mark style="background: #C900FFA6;">stateless authorization</mark>, storing the user state in the token.  

Set short expiration times for tokens and <mark style="background: #C900FFA6;">avoid storing sensitive data</mark> in local storage.  

Use HTTPS, implement best practices, and <mark style="background: #C900FFA6;">design tokens with encryption</mark> to mitigate security risks.

![[Pasted image 20260324170402.png]]

### <mark style="background: #C900FFA6;">High-level description of how cookies work</mark>

![[Pasted image 20260324170427.png]]

### <mark style="background: #C900FFA6;">What is JWT?</mark>

JSON Web Token (JWT) is an open standard for securely transmitting information as a JSON object (RFC 7519).  
- <mark style="background: #C900FFA6;">Compact:</mark> because of its size, it can be quickly sent through a URL, POST parameter, or inside an HTTP header.
- <mark style="background: #C900FFA6;">Self-contained:</mark> the payload contains all the required information about the user, to avoid querying the database more than once.  

This information can be verified and trusted because it is digitally signed.

JWTs are stateless 

<mark style="background: #C900FFA6;">JWTs can be signed using:</mark>  
- A secret (with the <mark style="background: #C900FFA6;">HMAC</mark> algorithm)  
- A public/private key pair (using <mark style="background: #C900FFA6;">RSA</mark> or <mark style="background: #C900FFA6;">ECDSA</mark>)  

JWTs can also be encrypted to provide secrecy between parties: https://jwt.io/  

<mark style="background: #C900FFA6;">Stateless:</mark> Stateless refers to a system or protocol that does not maintain any state information between requests. In JavaScript, stateless architectures are often used to improve scalability and reduce server-side storage requirement

A JWT can be imagined as a hotel card

### <mark style="background: #C900FFA6;">JWT Structure</mark> 

JWTs consist of three parts separated by dots, e.g. ``xxxxx.yyyyy.zzzzz``:  

<mark style="background: #C900FFA6;">Header (Base64Url encoded):</mark> 
- The type of the token: JWT  
- The signing algorithm, e.g. HMAC, SHA256 or RSA  
- e.g. { "alg": "HS256", "typ": "JWT" }  

<mark style="background: #C900FFA6;">Payload (also Base64Url encoded):</mark>
- Registered claims: optional, predefined fields:  
- iss (issuer), exp (expiration), sub (subject), aud (audience)  
- Public claims: can be defined at will, minding collisions  
- Private claims: custom claims to share information between agreeable parties  
- e.g. { "name": "John Doe", "admin": true }  

<mark style="background: #C900FFA6;">Signature:</mark>
- To create the signature, you use the encoded header, the encoded payload, a secret/private key, and the algorithm specified in the header  
- The signature is used to verify that the message wasn't changed (integrity) and if signed with a private key, that the sender of the JWT is who it says it is

Do not put secret information in the payload or header elements of a JWT unless it is encrypted, as they are readable (but not changeable) by anyone.

### <mark style="background: #C900FFA6;">Creating a JWT</mark>

![[Pasted image 20260324171248.png]]

### <mark style="background: #C900FFA6;">Cookies vs JWT</mark> 

<table>
	<tr>
		<td>&nbsp;</td>
		<td>Cookies</td>
		<td>JWTs</td>
	</tr>
	<tr>
		<td>Purpose</td>
		<td>Store session state on the client side.</td>
		<td>Authenticate and authorize users across multiple domains and APIs.</td>
	</tr>
	<tr>
		<td>Security</td>
		<td>Can be vulnerable to CSRF and XSS attacks.</td>
		<td>Can be more secure due to the use of signatures and encryption.</td>
	</tr>
	<tr>
		<td>Size Limit</td>
		<td>Limited to 4KB of data.</td>
		<td>Can store larger amounts of data.</td>
	</tr>
	<tr>
		<td>Server-side storage</td>
		<td>Cookies require server-side storage to track the session state.</td>
		<td>JWTs do not require server-side storage, as all necessary information is encoded in the token itself.</td>
	</tr>
	<tr>
		<td>Token Expiration</td>
		<td>Can be set to expire after a specified period.</td>
		<td>JWTs can be set to expire after a specified period or can be set to never expire.</td>
	</tr>
	<tr>
		<td>Revocation</td>
		<td>Cookies cannot be easily revoked once they are set.</td>
		<td>JWTs can be revoked by adding the token to a blacklist, or by using a token revocation list.</td>
	</tr>
	<tr>
		<td>Cross-Domain</td>
		<td>Cookies can only be read by the domain that set them.</td>
		<td>JWTs can be used to authenticate users across multiple domains and APIs</td>
	</tr>
</table>


### <mark style="background: #C900FFA6;">Main advantage of JWT</mark>

![[Pasted image 20260324171944.png]]

### <mark style="background: #C900FFA6;">XSS (Cross-Site Scripting) and CSRF (Cross-Site Request Forgery) attacks</mark>

<mark style="background: #C900FFA6;">XSS (Cross-Site Scripting):</mark> A security vulnerability in which attackers inject malicious scripts into web pages viewed by other users, allowing them to execute arbitrary code in the victims' browsers. 

<mark style="background: #C900FFA6;">Example:</mark> An attacker gains access to a user's account by making the user execute certain code.  

<mark style="background: #C900FFA6;">CSRF (Cross-Site Request Forgery):</mark> A security vulnerability where attackers deceive authenticated users into unknowingly performing actions on another website, often resulting in unauthorized transactions or data manipulation. 

<mark style="background: #C900FFA6;">Example:</mark> Once the user is logged into a bank, they may inadvertently run transactions towards another account.

### <mark style="background: #C900FFA6;">Authentication vs Authorisation</mark>

<mark style="background: #C900FFA6;">Authentication</mark> is the act of validating that users are who they claim to be. This is the first step in any security process.  

<mark style="background: #C900FFA6;">Authorisation</mark> in system security is the process of giving the user permission to access a specific resource or function. This term is often used interchangeably with access control or client privilege.  

Authentication can be accessed at the first door of the hotel.  

Authorisation is required to access the different things in the hotel: VIP, swimming pool, cafeteria, and so on.

### <mark style="background: #C900FFA6;">JWT Authorization</mark>

Once a user provides valid credentials, the server responds with a session JWT that must be stored locally, either on:  
- HTML5 Web storage: then sent in the HTTP AUTHORIZATION header (default)  
- Cookies: set with the SET-COOKIE directive  

Whenever the user wants to access a protected route or resource, he should send the JWT containing any necessary information.  

This can facilitate a <mark style="background: #C900FFA6;">stateless authorisation</mark> mechanism: the user state is never saved in the server memory but instead decoded from the JWT.  
- This allows you to use/create (RESTful) stateless APIs  
- Stateless mechanisms are suitable for scalability  
- However, there is an overhead to the client when making requests if a lot of data is encoded within the JWT.  
- While with sessions, since the SESSION IDs are very small, the overhead is passed on to the server  
- JWT are resistant to CSRF attacks because they are typically sent in the Authorization header


### <mark style="background: #C900FFA6;">Authorization: Bearer (token)</mark>  

JWTs are typically sent in the Authorization header, using the Bearer schema:  
- Authorization: Bearer ``<token>``
- If so, you can easily use external APIs, as there won’t be cookies restricted to the same origin  

<mark style="background: #C900FFA6;">Example:</mark>  

```
Authorization: BEARER  
Bearer token: https://www.youtube.com/watch?v=BNEoKexlmA4eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0ODg0NjQ5NTAsImlhdCI6MTQ4ODIwNTc1MCwic3ViIjoiOWJhNGRlYWItMDdiMy00NTVjLTk1YTMtMDhkYmQ4MGFkMmUwIn0.NShG3qC2I_LBxZoKX8UBz_kFkWKSzJs6JrgDc27P9Lbd-OR9nIsV35Jk2uNvspJH2VyZ7bHS3RR-8CtTexRqcsozrkZsicBWbauX4ph3DULGST5ju3tVNXi-NsQoFHij-4BPGNMjjr4DftwnKmJeGA0dI4exZ0Q33AHJVjXNAEVA16x9FOBMkBfXXDQFKIyJtg46GB3hd7IX8Di4WB8iV-99bsb911UmSb1FKrZQ32zhpFQ0ybms2RGxN1MeMfYeZLjB4c3BpkrV84ucl3VoXd6qxWzuvWF9r6EyGa9kKxgtGIDOZB0kYCSLLKef9i2EDxyTCRmOK8HJvYwNdH-Vg
```  

### <mark style="background: #C900FFA6;">JWT Use Cases</mark> 

<mark style="background: #C900FFA6;">Authorisation (the most common):</mark>  
- Once the user is logged in (authenticated), he will be sent a JWT, and each subsequent request he makes will include that JWT
- The server's protected routes will check for a valid JWT, and if it's present, the user will be allowed access to permitted routes and resources, sometimes according to his role
- e.g. only an admin can add or change a given resource
- Single Sign On is a feature that is widely used by JWT nowadays because of its ability to be easily used across different domains.  

<mark style="background: #C900FFA6;">Information Exchange:</mark> Because of the integrity and authorship verification capabilities mentioned previously.

### <mark style="background: #C900FFA6;">JWT Authorization with Header</mark>

![[Pasted image 20260324172709.png]]

![[Pasted image 20260324172728.png]]

![[Pasted image 20260324172741.png]]

### <mark style="background: #C900FFA6;">What happens if a user intercepts a JWT token?</mark>  

If a user <mark style="background: #C900FFA6;">intercepts a JWT token</mark>, they may gain <mark style="background: #C900FFA6;">unauthorised access</mark> to protected resources.  

Attackers might intercept JWT tokens through <mark style="background: #C900FFA6;">man-in-the-middle attacks</mark> or application vulnerabilities like XSS (Cross-Site Scripting).  

To mitigate the risk, <mark style="background: #C900FFA6;">use secure communications protocols like HTTPS</mark>, implement best practices for securing web apps, and design tokens with <mark style="background: #C900FFA6;">short expiration times and encryption</mark>.

### <mark style="background: #C900FFA6;">JWT Authorization Security</mark>

Since tokens are credentials, take care to prevent security issues - in general, you should not keep tokens longer than required  

<mark style="background: #C900FFA6;">You also should not store sensitive session data in local web storage due to XSS vulnerabilities:</mark> 
- Use the object ``sessionStorage`` instead of ``localStorage`` if persistent storage is not needed; ``sessionStorage`` object is available only to that window/tab until the window is closed;  
- XSS can be used to steal all the data in these objects;  
- Pay attention to "localStorage.getItem" and "setItem" calls; this can be a sign of putting sensitive information in local storage, which is a bad practice;  
- Do not store session identifiers in local storage as the data is always accessible by JavaScript; cookies can mitigate this risk using the httpOnly flag;  
- In JWT, there is no way to restrict the visibility of an object to a specific path like with the path attribute of cookies; every object is shared within an origin and protected with the Same Origin Policy;  
- Avoid hosting multiple applications on the exact origin, all of them would share the same ``localStorage`` object; use different subdomains instead.  

To avoid man-in-the-middle attacks, web storage users must exercise due diligence and ensure they always send the JWTs over HTTPS.

### <mark style="background: #C900FFA6;">JWT Authorization with Cookie</mark>  

<mark style="background: #C900FFA6;">Request:</mark>  
![[Pasted image 20260324173106.png]]

Cookies do not require state to be stored on the server if they contain a JWT because the JWT encapsulates everything the server needs to serve the request.

<mark style="background: #C900FFA6;">Response and Request:</mark>
![[Pasted image 20260324173133.png]]

### <mark style="background: #C900FFA6;">Stateless JWT vs Cookie Sessions</mark>

![[Pasted image 20260324173159.png]]

![[Pasted image 20260324173209.png]]

<mark style="background: #C900FFA6;">JWT Token:</mark> User details stored in JWT Token saved in local web storage token can be encrypted  

<mark style="background: #C900FFA6;">Cookie saves session ID:</mark> User details are stored on the server.  

The cookie saves the session ID only. In plain text, a cookie can be restricted to your domain  

Use HTTPS/SSL to ensure that your cookies and JWTs are encrypted by default during client and server transmission, to help avoid man-in-the-middle attacks.

### <mark style="background: #C900FFA6;">JWT on Node/Express</mark>

https://www.npmjs.com/package/jsonwebtoken  

```shell
npm install jsonwebtoken
```

```js
jwt.sign(payload, secretOrPrivateKey, [options, callback]) 

var jwt = require('jsonwebtoken’);  
var token = jwt.sign({ foo: 'bar' }, 'shhhhh');
 
jwt.sign({ foo: 'bar' }, privateKey, { algorithm: 'RS256' },  
	function(err, token) {  
		console.log(token);  
	});
	
jwt.verify(token, secretOrPublicKey, [options, callback])
``` 

Callback/returns the payload decoded if the signature is valid and optional expiration, audience, or issuer are valid. If not, it will call/throw the error.

### <mark style="background: #C900FFA6;">JWT Generation to use with Header</mark>

```js
app.post('/login', (req, res) => {  
	// Read username and password from the request body  
	const { username, pwd } = req.body;  
	// Filter user from the user's array by username and password  
	const user = users.find(u => { return u.username === username && u.password === pwd });  
	if (user) {  
		// Generate an access token  
		const accessToken = jwt.sign({ username: user.username, role:  
		user.role },  
		accessTokenSecret, { expiresIn: '20m' });  
		res.json({  
		accessToken  
		});  
	} else {  
		res.send('Username or password incorrect');  
	}  
});
```

### <mark style="background: #C900FFA6;">JWT Authorization with Header</mark>

```js
app.get('/books', authenticateJWT, (req, res) => {  
	res.json(books);  
});  

const authenticateJWT = (req, res, next) => {  
	const authHeader = req.headers.authorization;  
	if (authHeader) {  
		const token = authHeader.split(' ')[1]; // Bearer [JWT_TOKEN]  
		jwt.verify(token, accessTokenSecret, (err, user) => {  
			if (err) {  
				return res.sendStatus(403);  
			}  
			req.user = user;  
			next();  
		});  
	} else {  
		res.sendStatus(401);  
	}  
};
```

### <mark style="background: #C900FFA6;">JWT Generation to use with Cookies</mark>

```js
const jwtkey = 'my_secret_key';  
const jwtExpirySeconds = 300;  

const users = {  
	user1: 'password1',  
	user2: 'password2'  
};  

const signIn = (req, res) => {  
	// Get credentials from JSON body  
	const { username, password } = req.body;  
	if (!username || !password || users[username] !== password) {  
		// return 401 error is username or password doesn't exist, or if password does  
		// not match the password in our records  
		return res.status(401).end();  
	}  
	// Create a new token with the username in the payload  
	// and which expires 300 seconds after issue  
	const token = jwt.sign({ username }, jwtkey, {  
		algorithm: 'HS256',  
		expiresIn: jwtExpirySeconds  
	});  
	console.log('token:', token);  
	// set the cookie as the token string, with a similar max age as the token  
	// here, the max age is in milliseconds, so we multiply by 1000  
	res.cookie('token', token, { maxAge: jwtExpirySeconds * 1000 });  
	res.end();  
};
```

### <mark style="background: #C900FFA6;">JWT Authorization with Cookies</mark>

```js
const welcome = (req, res) => {  
	// We can obtain the session token from the request's cookies, which come with every request.  
	const token = req.cookies.token;  
	// if the cookie is not set, return an unauthorized error  
	if (!token) {  
		return res.status(401).end();  
	}  
	let payload;  
	try {  
		// Parse the JWT string and store the result in `payload`.  
		// Note that we are passing the key in this method as well.  
		// This method will throw if the token is invalid  
		// (if it has expired according to the expiry time we set  
		// or if the signature does not match)  
		payload = jwt.verify(token, jwtkey);  
	} catch (e) {  
		if (e instanceof jwt.JsonWebTokenError) {  
			// if the error thrown is because the JWT is unauthorized, return a 401 error  
			return res.status(401).end();  
		}  
	// otherwise, return a bad request error  
	return res.status(400).end();  
	}  
	// Finally, return the welcome message to the user, along with their username given in the token  
	res.send(`Welcome ${payload.username}!`);  
};
```

### <mark style="background: #C900FFA6;">Expiry and Revocation</mark>  

It is common and good practice to set some expiry time for server-issued tokens to force the client to periodically re-authenticate  

This can be done by including an expiry timestamp in the token, which the client is free to read  

In other circumstances, the server may want to revoke a token altogether, which can happen if:  
- The token is only intended to be used a fixed number of times  
- The associated identity credentials have been changed since the token was issued  

To implement revocation, the server must keep track of issued tokens and their status (e.g. blacklisted), which can affect scalability
