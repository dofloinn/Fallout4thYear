![[Pasted image 20260126161843.png]]

### <mark style="background: #C900FFA6;">What is JavaScript?</mark>

<mark style="background: #C900FFA6;">JavaScript is a dynamic / scripting language:</mark>
- A high-level language that executes many behaviours at runtime 
- Static languages perform them during compilation
- For example, it is <mark style="background: #C900FFA6;">dynamically typed</mark>. <mark style="background: #C900FFA6;">Dynamically typed</mark> means that at runtime, the system merely checks that a variable supports all of the operations performed on it  
- TypeScript is a strict syntactical superset of JavaScript, and adds optional static typing to the language  

Originally only executed <mark style="background: #C900FFA6;">client-side</mark>, by the web browser  
- As opposed to server-side (on the web server)  
- Currently, Node.js allows you to run JavaScript on the server  
- Some databases, like MongoDB and CouchDB, also use JavaScript  

JavaScript is <mark style="background: #C900FFA6;">not</mark> part of the Java platform

JavaScript is #1
![[Pasted image 20260126162159.png]]

### <mark style="background: #C900FFA6;">What Does JavaScript Do?</mark>

<mark style="background: #C900FFA6;">JavaScript:</mark>
- Displays <mark style="background: #C900FFA6;">interactive content</mark>  
- Performs <mark style="background: #C900FFA6;">animations</mark> of page elements  
- <mark style="background: #C900FFA6;">Validates input</mark> values from a form before submitting them to the server  
- Loads new page content or submits data to the server, via <mark style="background: #C900FFA6;">AJAX</mark>, without reloading the page  
- Transmits information about the user's browsing activities - Web analytics, Ad tracking, Personalisation...


### <mark style="background: #C900FFA6;">Limitations</mark>

Script code is embedded in the webpage, <mark style="background: #C900FFA6;">viewable to the  world</mark>.  

For <mark style="background: #C900FFA6;">security</mark> reasons, scripts are limited in what they can do: e.g., can't access the client's hard drive directly (has to  
go through the browser)  

Since it is designed to run on any machine, scripts do <mark style="background: #C900FFA6;">not</mark> contain <mark style="background: #C900FFA6;">platform-specific</mark> commands.  

The user can <mark style="background: #C900FFA6;">block</mark> JavaScript, so input validation must be performed on the server-side as well.

### <mark style="background: #C900FFA6;">JavaScript Essentials</mark>

JavaScript is Case Sensitive

```js
// single-line comment  
/* multi-  
-line  
comment */
``` 

JavaScript Can Change HTML Content, Attributes, Styles  

JavaScript Can Hide/Show HTML Elements

### <mark style="background: #C900FFA6;">The <\script/> Tag</mark>

To insert a JavaScript into an HTML page, use the ``<script>`` tag.  

The ``<script>`` and ``</script>`` tells where the JavaScript starts and ends.  

The lines between the ``<script>`` and ``</script>`` contain the JavaScript.  

You can place an unlimited number of scripts in an HTML document.  

Scripts can be placed in the ``<body>`` and/or in the ``<head>`` section of an HTML page.

### <mark style="background: #C900FFA6;">External JavaScript</mark>

Scripts can also be placed in external files, to be used by several different web pages. The files have the extension .js

To use an external script, point to the ``.js`` file in the ``"src"`` attribute of the  
```html
<script> tag:  
<!DOCTYPE html>  
<html>  
<body>  
<script src="myScript.js"></script>  
</body>  
</html>
```

Do not declare ``<script>`` again in the external ``.js`` file  

External scripts can be referenced with a full URL or with a path relative to the current web page  
```html
<script
src="http://www.w3schools.com/js/myScript1.js"></script>
```

### <mark style="background: #C900FFA6;">Manipulating HTML Elements</mark>

To access an HTML element from JavaScript, you can use the document.getElementById(id) method.  

The innerHTML property defines the HTML content  

```html
<!DOCTYPE html>  
<html>  
<body>  
<h1>My First Web Page</h1>  
<p id="demo">My First Paragraph.</p>  
<script>  
document.getElementById("demo").innerHTML="My First JavaScript";  
</script>  
</body>  
</html>
```

### <mark style="background: #C900FFA6;">Variables</mark>

The assignment operator (=) assigns a value to a variable  

You declare JavaScript variables with the var keyword: 
```js
var carname = "Volvo";
```  

You can declare many variables in one statement. Just start the statement with var and separate the variables by comma:  

```js
var lastname = "Doe", age = 30, job = "carpenter";
```  

A variable declared without a value will have the value <mark style="background: #C900FFA6;">undefined</mark>.  

If you <mark style="background: #C900FFA6;">re-declare</mark> a JavaScript variable, it <mark style="background: #C900FFA6;">will not lose</mark> its value.  

If you assign a value to a variable that has not yet been declared, the variable will automatically be declared as a ``GLOBAL`` variable.  

Avoid using global vars, as they can be overwritten by other scripts

### <mark style="background: #C900FFA6;">Variables - ECMAScript 6</mark>

![[Pasted image 20260126163656.png]]

### <mark style="background: #C900FFA6;">Primitive Data Types</mark>

JavaScript has dynamic types. This means that the same variable can be used as different types:  

```js
var x; // x is undefined  
var x = 5; // now x is a Number  
var x = "John"; // now x is a String
```  

Variables may contain values of the following primitive types: Number, String, Boolean, Null  

Numbers are not allowed as the first character of identifiers  

Joining words: firstName, lastName, masterCard, interCity

### <mark style="background: #C900FFA6;">Numbers:</mark>

JavaScript Numbers can be written with or without decimals:
```js
var x1 = 34.00;  
var x2 = 34;
```

<mark style="background: #C900FFA6;">The Number.isInteger() method returns true if the argument is an integer:</mark>  
```js
Number.isInteger(10); // returns true  
Number.isInteger(10.5); // returns false
```  

The isNaN() method returns true if the argument is not a Number.  

Extra large or extra small numbers can be written with scientific (exponential) notation:  
```js
var y=123e5; // 12300000  
var z=123e-5; // 0.00123
```  

The exponentiation operator (\*\*) raises the first operand to the power of the second operand:  
```js
var x = 5;  
var z = x ** 2; // result is 25  
// x ** y produces the same result as Math.pow(x,y):
```

### <mark style="background: #C900FFA6;">Strings</mark>

A string can be any text inside quotes. You can use single or double quotes:  
```js
var carname="Volvo XC60";  
var carname='Volvo XC60';
``` 

You can use quotes inside a string, as long as they don't match the quotes surrounding the string:  
```js
var answer="It's alright";  
var answer="He is called 'Johnny'";  
var answer='He is called "Johnny"';
```

### <mark style="background: #C900FFA6;">Boolean</mark>

<mark style="background: #C900FFA6;">Booleans can only have two values: true or false:</mark> 
```
var x = true;  
var y = false;
```

### <mark style="background: #C900FFA6;">Undefined and Null</mark>

<mark style="background: #C900FFA6;">Undefined</mark> is the value of a variable with no value.  

Variables can be emptied by setting the value to <mark style="background: #C900FFA6;">null</mark>;

### <mark style="background: #C900FFA6;">== vs ===</mark>

<mark style="background: #C900FFA6;">equality operator</mark> \==, the interpreter implicitly tries to convert the values before comparing them  

```
function myFunction(){  
var x = 5;  
document.getElementById("demo").innerHTML = x=="5"; //returns true  
}
```  

<mark style="background: #C900FFA6;">identity operator</mark> \==\=, does not convert the values when comparing them

```
function myFunction(){  
var x = 5;  
document.getElementById("demo").innerHTML = x==="5"; //returns false  
}
```

### <mark style="background: #C900FFA6;">Keywords</mark>

![[Pasted image 20260126165111.png]]

### <mark style="background: #C900FFA6;">Functions and Events</mark>

```html
<script>  
document.getElementById("demo").innerHTML="My First JavaScript";  
</script>
```  

The code above is executed when the page loads  

More often, we want to execute code when an <mark style="background: #C900FFA6;">event</mark> occurs, like when the user clicks a button  

If we put JavaScript code inside a <mark style="background: #C900FFA6;">function</mark>, we can call that function when an event occurs

### <mark style="background: #C900FFA6;">Functions</mark>

A function is a block of code that will be executed when "someone" calls it.  

It is written as a code block (inside curly { } brackets), preceded by the function keyword.  

```html
<!DOCTYPE html>  
<html>  
	<head>  
		<script>  
		function myFunction(){  
		alert("Hello World!");  
		}  
		</script>
	</head>  
	<body>  
		<button onclick="myFunction()">Try it</button>  
	</body>
</html>
```

### <mark style="background: #C900FFA6;">Functions with Arguments</mark>

A function in JavaScript is always passed by value, just like the primitive types  

```html
<button onclick="myFunction('Bob', 'Builder')">Click for Bob</button>  
<script>  
function myFunction(name, job){ // note we don’t use “var name”  
alert("Welcome " + name + ", the " + job);  
}  
</script>
```  

ES6 allows function parameters to have default values  

```js
function myFunction(x, y = 10) {  
	// y is 10 if not passed or undefined  
	return x + y;  
}  
myFunction(5); // will return 15
```

### <mark style="background: #C900FFA6;">Arrow Functions</mark>

![[Pasted image 20260126165654.png]]

![[Pasted image 20260126165719.png]]

### <mark style="background: #C900FFA6;">Event Handlers</mark>

An event handler is a predefined JavaScript property of an object (in most cases an element in the document) that is used to handle an event on a Web page.  

An event is something that happens when the viewer performs some sort of action, such as clicking a mouse button, moving the mouse over a link, etc.  

The page loading or other similar actions are also events.  

JavaScript event handlers identify them and perform specific tasks, making pages interactive and more useful.

### <mark style="background: #C900FFA6;">Event in HTML Element</mark>

To use an event handler, you add it as an additional attribute to an HTML tag.  

The only difference between an event handler “attribute” and an HTML attribute is that you can add JavaScript code inside an event handler attribute rather than just an attribute value:  
```html
<body>  
<form>  
<input type = "button" value = "Click Me!" onclick = "window.alert('Hi!');">  
</form>  
</body>
```  

Notice that the alert command ends with a semicolon.  

This enables you to add additional JavaScript code after the alert, to perform multiple actions on the click event.

If the code you want to use is long, you may wish to put it in a function  

That function can be in an external file as well  

```js
function hi_and_bye() {  
alert('Hi!');  
alert('Bye!');  
}
``` 

```html
<body>  
<form>  
<input type = "button" value = "Click Me!" onclick = "hi_and_bye();" />  
</form>  
<script src="ext1.js"></script>  
</body>
```

### <mark style="background: #C900FFA6;">Event Handler in the Script Code</mark>

You can also tie an event to the element within the script code, with ``document.getElementById()``, for example.  


```html
<body>  
	<form>  
		<input type = "button" value = "Click Me!" id = "say_hi">  
	</form>  
	<script>  
		function hi_and_bye() {  
		alert('Hi!');  
		alert('Bye!');  
		}  
		var hi_button = document.getElementById("say_hi");  
		hi_button.onclick = hi_and_bye;  
		// if you use hi_and_bye(); above, the function will be called straight away  
	</script>
</body>
```

![[Pasted image 20260126170403.png]]

### <mark style="background: #C900FFA6;">Example: onmouseover</mark>

```html
<!DOCTYPE html>  
<html>  
	<body>  
		<div onmouseover = "mOver(this);" onmouseout = "mOut(this);">Mouse Over Me</div>  
	<!-- you are passing the div to the function -->  
		<script>  
			function mOver(obj){  
				obj.innerHTML = "Thank You";  
			}  
			function mOut(obj){  
				obj.innerHTML = "Mouse Over Me, Please!";  
			}  
		</script>  
	</body>  
</html>
```

### <mark style="background: #C900FFA6;">Example: onmousedown, onmouseup</mark>

```html
<!DOCTYPE html>  
<html>  
<body>  
<div onmousedown = "mDown(this);" onmouseup = "mUp(this);" style = "background-  
color:#D94A38;width:90px;height:20px;padding:40px;">Click Me</div>  
<script>  
function mDown(obj){  
obj.style.backgroundColor = "#1ec5e5";  
obj.innerHTML = "Release Me!";  
}  
function mUp(obj){  
obj.style.backgroundColor = "#D94A38";  
obj.innerHTML = "Thank You!";  
}  
</script>  
</body>  
</html>
```

### <mark style="background: #C900FFA6;">Timing Events</mark>

JavaScript allows for the execution of code at specified time intervals - timing events:  
```js
setTimeout(function, milliseconds)  
// executes a function, after waiting a specified number of milliseconds  
setInterval(function, milliseconds)  
// same as setTimeout(), but repeats the execution of the function continuously  
clearTimeout(var)  
// stops the execution of the function specified in setTimeout(), saved into a //variable  
clearInterval(var)  
// stops the executions of the function specified in the setInterval() method
```  

```html
<button onclick="myVar = setTimeout(myFunction, 3000)">Try it</button>  
<button onclick="clearTimeout(myVar)">Stop it</button>
```

### <mark style="background: #C900FFA6;">Example: setInterval()</mark>

Pop up an alert every 2 seconds (2000 milliseconds):

```html
<html>  
<head>  
</head>  
<body>  
<script>  
function annoy_alert() {  
alert("Am I bothering you yet?");  
}  
setInterval(annoy_alert, 2000);  
// setInterval(“annoy_alert()”, 2000);  
</script>  
</body>  
</html>
```

### <mark style="background: #C900FFA6;">Objects</mark>

In JavaScript <mark style="background: #C900FFA6;">almost everything is an object</mark>.

Even <mark style="background: #C900FFA6;">primitive datatypes</mark> (except null and undefined) can be treated as objects.  

<mark style="background: #C900FFA6;">Booleans, Numbers, Strings</mark> can be objects or primitive data treated as objects.  

<mark style="background: #C900FFA6;">Dates</mark> are always objects.  

<mark style="background: #C900FFA6;">Maths</mark> and <mark style="background: #C900FFA6;">Regular Expressions</mark> are always objects.  

<mark style="background: #C900FFA6;">Arrays</mark> are always objects.  

Even <mark style="background: #C900FFA6;">functions</mark> are always objects.

### <mark style="background: #C900FFA6;">Object Properties</mark>

Properties are the values associated with an object.  

The syntax for accessing the property of an object is: 
``objectName.propertyName``  

This example uses the length property of the String object to find the length of a string:  
```js
var message = "Hello World!";  
var x = message.length;
```  

The value of x, after execution of the code above will be 12

### <mark style="background: #C900FFA6;">Objects Methods</mark>

Methods are the actions that can be performed on objects.  

You can call a method with the following syntax: 
```
objectName.methodName()
```  

This example uses the ``toUpperCase()`` method of the String object, to convert a text to uppercase:  

```js
var message = "Hello world!";  
var x = message.toUpperCase();
```

The value of x, after execution of the code above will be HELLO WORLD!

### <mark style="background: #C900FFA6;">Classes</mark>

```html
<!DOCTYPE html>  
<html>  
<body>  
<script>  
class Person{  
constructor (firstname, lastname, age, eyecolor){  
this.firstname = firstname;  
this.lastname = lastname;  
this.age = age;  
this.eyecolor = eyecolor;  
}  
}  
var myFriend = new Person("John","Doe",50,"blue");  
document.write(myFriend.firstname + " is " + myFriend.age + " years old.");  
</script>  
</body>  
</html>
```

### <mark style="background: #C900FFA6;">“this” keyword</mark>

In JavaScript, the thing called <mark style="background: #C900FFA6;">this</mark>, is the object that "owns" the JavaScript code.  

The value of <mark style="background: #C900FFA6;">this</mark>, when used in a function, is the object that "owns" the function.  

The value of <mark style="background: #C900FFA6;">this</mark>, when used in an object, is the object itself.  

Note that <mark style="background: #C900FFA6;">this</mark> is not a variable. It is a keyword.  

You cannot change the value of <mark style="background: #C900FFA6;">this</mark>.

### <mark style="background: #C900FFA6;">Creating a Direct Instance</mark>

The following examples create a new instance of an object, with four properties in it:  
```js
var person = {  
firstName: "John",  
lastName: "Doe",  
age: 50,  
eyeColor: "blue"  
};  
var person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};
```

### <mark style="background: #C900FFA6;">Adding Properties to Objects</mark>

You can add new properties to an existing object by simply giving it a value.  

Assume that the person object already exists - you can then give it new properties:  

```js
var person2 = {};  
(...)  
person2.hairColour = "black";
```

### <mark style="background: #C900FFA6;">Arrays:</mark>

A JavaScript array should be created with ``[]``:  
```js
var myCars = ["Saab", "Volvo", "BMW"];
```  

Accessing:  
```js
var name = cars[0];  
// Array indexes start with 0  
// In JavaScript, arrays always use numbered indexes.
```

### <mark style="background: #C900FFA6;">Array Elements Can Be Objects</mark>

JavaScript variables can be objects. Arrays are special kinds of objects, with numbered indexes.  

Because of this, you can have <mark style="background: #C900FFA6;">variables</mark> of <mark style="background: #C900FFA6;">different types</mark> in the same Array.  

You can have <mark style="background: #C900FFA6;">objects</mark> in an Array. You can have <mark style="background: #C900FFA6;">functions</mark> in an Array. You can have <mark style="background: #C900FFA6;">arrays</mark> in an Array:  
```js
myArray[0] = Date.now;  
myArray[1] = myFunction;  
myArray[2] = myCars;
```

### <mark style="background: #C900FFA6;">Array Properties and Methods</mark>

![[Pasted image 20260126172941.png]]

### <mark style="background: #C900FFA6;">Arrays versus Objects</mark>

Arrays use numbered indexes.

Objects use named indexes.

Arrays are a special kind of objects, with numbered indexes.  

<mark style="background: #C900FFA6;">When to Use Arrays? When to use Objects?</mark>
- JavaScript does not support associative arrays (maps, dictionaries)  
- You should use objects when you want the element names to be strings (text).  
- You should use arrays when you want the element names to be numbers.


### <mark style="background: #C900FFA6;">Passing Objects as Arguments</mark>

JavaScript is always passed by value, but for objects that value of the variable is a reference.  

Because of this, <mark style="background: #C900FFA6;">when you pass an object</mark> and <mark style="background: #C900FFA6;">change its properties</mark>, those changes <mark style="background: #C900FFA6;">persist</mark> outside of the function.  

This makes it look like it’s pass by reference.  

But if you actually <mark style="background: #C900FFA6;">change</mark> the value of the <mark style="background: #C900FFA6;">object</mark> variable, you will see that the change <mark style="background: #C900FFA6;">does not persist</mark>, proving it's really pass by value.

### <mark style="background: #C900FFA6;">Passing Objects as Arguments</mark>

![[Pasted image 20260126173452.png]]

### <mark style="background: #C900FFA6;">JavaScript for...in Loop</mark>

The code inside the for...in loop will be executed once for each property of the object:

![[Pasted image 20260126173541.png]]

### <mark style="background: #C900FFA6;">Math Object Properties</mark>

The Math object allows you to perform mathematical tasks.  

All properties/methods of Math can be called by using Math as an object, without creating it, e.g. Math.PI

![[Pasted image 20260126173614.png]]

### <mark style="background: #C900FFA6;">Math Object Methods</mark>

![[Pasted image 20260126173632.png]]

### <mark style="background: #C900FFA6;">Date Object</mark>

``new Date()`` creates a new date object with the current date an time  

``new Date(year, month, day, hours, minutes, seconds, milliseconds)``
- Note: JavaScript counts months from 0 to 11.  
- January is 0. December is 11.  

``new Date(milliseconds)`` - milliseconds since January 01, 1970, 00:00:00 UTC  

``new Date(date string)`` - "2019-09-16" (The International Standard)

### <mark style="background: #C900FFA6;">Window Object</mark>

The window object is supported by all browsers. It represents the browser's window.  

All global JavaScript objects, functions, and variables automatically become members of the window object.  

Even the document object (of the HTML DOM) is a property of the window object:  

```js
window.document.getElementById("header");
```  

is the same as:  
```js
document.getElementById("header");
```

### <mark style="background: #C900FFA6;">Window Popups</mark>

<mark style="background: #C900FFA6;">Alert Box:</mark>
- An alert box is often used if you want to make sure information comes through to the user.  
- When an alert box pops up, the user will have to click "OK" to proceed.  
- ``window.alert("sometext");``  

<mark style="background: #C900FFA6;">Confirm Box:</mark>
- A confirm box is often used if you want the user to verify or accept something.  
- When a confirm box pops up, the user will have to click either "OK" or "Cancel" to proceed.  
- If the user clicks "OK", the box returns true. If the user clicks "Cancel", the box returns false.  
- ``window.confirm("sometext");``

### <mark style="background: #C900FFA6;">Best Practices</mark>

Put all <mark style="background: #C900FFA6;">declarations at the top</mark> of each script or function  

<mark style="background: #C900FFA6;">Initialise all variables</mark> when declaring them  

Use semicolons to separate statements  

Add white space to your script to make it more readable -put spaces around operators ( = + - * / )  

Avoid code lines longer than 80 characters  

If a JavaScript statement does not fit on one line, the best place to break it, is after an operator

### <mark style="background: #C900FFA6;">Tips</mark>

You can use the console.log() method to display data  
- similar to System.out.println() in Java  
- Press F12 in the Browser window. Go to “console” to see the output  

You can also use “Inspect Elements” to test code changes live  

www.w3schools.com has documentation, examples and a “simulator”