### <mark style="background: #C900FFA6;">Goal</mark>

<mark style="background: #C900FFA6;">Learn one of the most popular front-end libraries:</mark> 
- Basic principles  
- Application architecture  
- Programming techniques  

Leverage the knowledge of JS concepts  

Get to know the browser’s object models (BOM and DOM)

### <mark style="background: #C900FFA6;">Why a Library?</mark>  

<mark style="background: #C900FFA6;">Simplify the browser environment:</mark>
- Uniform DOM methods  
- More explicit hierarchy  
- <mark style="background: #C900FFA6;">Higher-level</mark> components than HTML elements  
- <mark style="background: #C900FFA6;">Automatic</mark> processing of events and updates  

<mark style="background: #C900FFA6;">Simplify the development methods:</mark>
- Predefined programming <mark style="background: #C900FFA6;">patterns</mark> and application architecture  
- Lots of compatible plugins and extensions  
- Explicit and rigid <mark style="background: #C900FFA6;">state</mark> management

### <mark style="background: #C900FFA6;">Main Resources</mark>

Tutorials and guides: https://react.dev/learn

API Reference: https://react.dev/reference/react

### <mark style="background: #C900FFA6;">Browser Development Tools</mark>

 
https://addons.mozilla.org/en-US/firefox/addon/react-devtools/  

https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en

### <mark style="background: #C900FFA6;">Browser Main Objects</mark> 

<mark style="background: #C900FFA6;">window</mark> represents the window that contains the Document Object Model (DOM) document  
- allows to interact with the browser via the BOM: Browser Object Model (not standardized)  
- global object, contains all JS global variables
- can be omitted when writing JS code in the page  

<mark style="background: #C900FFA6;">document:</mark> 
- represents the DOM tree loaded in a window  
- accessible via a window property: ``window.document``

![[Pasted image 20260224153454.png]]

### <mark style="background: #C900FFA6;">Browser Object Model</mark>

<mark style="background: #C900FFA6;">window properties:</mark>
- console: browser debug console (visible via developer tools)  
- document: the document object  
- history: allows access to History API (history of URLs)  
- location: allows access to Location API (current URL, protocol, etc.). Read/write property, i.e., can be set to load a new page  
- ``localStorage`` and ``sessionStorage``: allows access to the two objects via the Web Storage API, to store (small) info locally in the browser

### <mark style="background: #C900FFA6;">Document Object Model</mark>  

Browser’s internal representation of a web page: Obtained through parsing HTML  

<mark style="background: #C900FFA6;">Browsers expose an API (in JavaScript) that you can use to interact with the DOM:</mark> 
- Access the page metadata and headers  
- Inspect the page structure  
- Edit any node in the page  
- Change any node attribute  
- Create/delete nodes in the page  
- Edit the CSS styling and classes  
- Attach or remove event listeners

![[Pasted image 20260224153656.png]]

### <mark style="background: #C900FFA6;">Types of Nodes (Classes)</mark>

<mark style="background: #C900FFA6;">Document:</mark> the document Node, the root of the tree  

<mark style="background: #C900FFA6;">Element:</mark> an HTML tag  

<mark style="background: #C900FFA6;">Attr:</mark> an attribute of a tag  

<mark style="background: #C900FFA6;">Text:</mark> the text content of an Element or Attr Node  

<mark style="background: #C900FFA6;">Comment:</mark> an HTML comment  

<mark style="background: #C900FFA6;">DocumentType:</mark> the Doctype declaration

![[Pasted image 20260224153807.png]]

### <mark style="background: #C900FFA6;">Event Listeners</mark> 

JavaScript in the browser uses an event-driven programming model - Everything is triggered by the firing of an event  

<mark style="background: #C900FFA6;">Events are determined by:</mark>
- The Element generating the event (event source target)
- The type of generated event

<mark style="background: #C900FFA6;">Event Categories:</mark>
- User Interface events (load, resize, scroll, etc.)  
- Focus/blur events  
- Mouse events (click, dblclick, mouseover, drag, etc.)  
- Keyboard events (keyup, etc.)  
- Form events (submit, change, input)  
- Mutation events (DOMContentLoaded, etc.)  
- HTML5 events (invalid, loadeddata, etc.)  
- CSS events (animations etc.)

https://en.wikipedia.org/wiki/DOM_events

### <mark style="background: #C900FFA6;">Preventing Default Behavior</mark> 

<mark style="background: #C900FFA6;">Many events cause a default behavior:</mark>  
- Click on link: go to URL  
- Click on submit button: form is sent  

Can be prevented by ``event.preventDefault()``

### <mark style="background: #C900FFA6;">React Key Concepts</mark>  

<mark style="background: #C900FFA6;">Declarative approach:</mark>
- Never explicitly manipulate the DOM  
- Never explicitly define the order of operations  
- Just define how each component is going to render itself  

<mark style="background: #C900FFA6;">Functional design approach:</mark>
- <mark style="background: #C900FFA6;">Components</mark> as functions  
- Re-render everything on every change (Virtual DOM)  
- Explicit management of the state of the application

### <mark style="background: #C900FFA6;">React is Functional</mark> 

UI Fragment = f ( state, props )  

Many components do not need to manage state  

<mark style="background: #C900FFA6;">UI Fragment = f ( props ):</mark>
- Idempotent  
- Immutable  

Jargon note: props = properties

### <mark style="background: #C900FFA6;">Immutability</mark>

Reacts exploits Immutability of objects, for ease of programming and efficiency of processing  

Component ``‘props’`` are immutable (read-only by the component)  

Component ``‘state’`` is not directly mutable (can be changed only through special calls)  

<mark style="background: #C900FFA6;">Functions are ‘pure’ (have no side-effects besides computing the return value):</mark>
- Idempotency (re-rendering the same component always yields the same result)  
- Predictability

### <mark style="background: #C900FFA6;">Re-Rendering</mark>  

The application is made of Components  

<mark style="background: #C900FFA6;">The entire application is re-rendered:</mark> 
- Every time a state is changed  
- Every time a property is changed  

<mark style="background: #C900FFA6;">Each Component will re-build itself from scratch:</mark>  
- With minor variations, or  
- Radically different  

Performance?

### <mark style="background: #C900FFA6;">Re-Rendering Performance</mark> 

Modifications to the DOM are expensive (re-computing layout and updating GUI)  

<mark style="background: #C900FFA6;">React implements a Virtual DOM layer:</mark> 
- Internal in-memory data structure, optimized and very fast to update  
- Corrects some DOM anomalies and asymmetries  
- Manages its own set of “synthetic” events  
- After components re-render, React computes the difference between the “old” DOM and the new modified Virtual DOM  
- Only modifications and differences are selectively applied to the browser’s DOM, in batch

### <mark style="background: #C900FFA6;">Update Cycle</mark> 
- Build new Virtual DOM tree  
- Diff with old one  
- Compute minimal set of changes  
- Put them in a queue  
- Batch render all changes to browser

![[Pasted image 20260224154657.png]]

### <mark style="background: #C900FFA6;">Synthetic Events</mark>  

React implements its own event system  

A single native event handler at root of each component

Normalises events across browsers  

Decouples events from DOM

### <mark style="background: #C900FFA6;">How React Code is integrated in the DOM</mark>  

```js
const container = document.getElementById('root');  

const root = createRoot(container); 

root.render(
	<h1>
		Hello, world!
	</h1>
);
```

### <mark style="background: #C900FFA6;">JSX Syntax</mark> 

```js
const container = document.getElementById('myapp');  

const root = createRoot(container);  

root.render(  
	<div id="test">  
		<h1>A title</h1>  
		<p>A paragraph</p>  
	</div>  
	);  

const container = document.getElementById('myapp');  

const root = createRoot(container);  

root.render(  
	React.DOM.div({ id: 'test' },  
		React.DOM.h1(null, 'A title'),  
		React.DOM.p(null, 'A paragraph')  
	)
);
```  

### <mark style="background: #C900FFA6;">Components</mark>  

Everything on a page is a Component - Even simple HTML tags (React.DOM.element)  

Components may be nested  

``ReactDOM.createRoot().render()`` builds a component and attaches it to a DOM container

![[Pasted image 20260224155422.png]]

### <mark style="background: #C900FFA6;">Defining Custom Components</mark>

<mark style="background: #C900FFA6;">As a function, returning DOM elements:</mark>

```js
const BlogPostExcerpt = () => {  

	return (  
		<div>  
			<h1>Title</h1>  
			<p>Description</p>  
		</div>  
	)  
}
```  

<mark style="background: #C900FFA6;">The function may receive some props:</mark>
```js

const BlogPostContent = (props) => {  
	return (  
		<div>  
			<p>{props.content}</p>  
		</div>  
	)  
}
```

### <mark style="background: #C900FFA6;">Types of Components</mark>  

<mark style="background: #C900FFA6;">Presentational Components:</mark>
- Generate DOM nodes to be displayed: 
- Do not manage application state  
- Might have some internal state, uniquely for presentation purposes  

<mark style="background: #C900FFA6;">Container Components:</mark>
- Manage the state for a group of children  
- May interact with the back-end  
- Create (presentational) children to display the information

### <mark style="background: #C900FFA6;">Props and State</mark>  

<mark style="background: #C900FFA6;">Props (properties) are passed to a component by its parent:</mark>
- <mark style="background: #C900FFA6;">Values</mark> (strings, objects, ...) to configure how the component displays or behaves
- Top-to-bottom data flow  
- <mark style="background: #C900FFA6;">Functions</mark> (callbacks) to access the parent’s methods  
- Bottom-to-top action requests

![[Pasted image 20260224160127.png]]

<mark style="background: #C900FFA6;">State is a set of variables local to the component:</mark>  
- <mark style="background: #C900FFA6;">Initialized</mark> with default value or by props’ values  
- Can be <mark style="background: #C900FFA6;">mutated</mark> only by calling <mark style="background: #C900FFA6;">specific methods</mark> (Asynchronous) Will initiate re-rendering of the Virtual DOM  
- Current state value can be passed to children (as props)

### <mark style="background: #C900FFA6;">Unidirectional Data Flow</mark>

State is passed to the view and to child components  

Actions are triggered by the view  

Actions can update the state  

The state change is passed to the view and to child component

![[Pasted image 20260224160329.png]]

### <mark style="background: #C900FFA6;">Corollary</mark> 

<mark style="background: #C900FFA6;">A state is always owned by one Component:</mark> Any data that's affected by this state can only affect Components below it: its children.  

Changing state on a Component will never affect its parent, or its siblings, or any other Component in the application - Just its children  

For this reason, state is often <mark style="background: #C900FFA6;">moved up</mark> in the Component tree, so that it can be <mark style="background: #C900FFA6;">shared</mark> between components that need to access it.

### <mark style="background: #C900FFA6;">Basic requirements</mark> 

Import the React library - Import several needed libraries  

We want to use JSX - Babel required  

We need to run on a web server - To be able to use modules - import in JS code  

```js
<script type='module'> // in HTML code
```  

Avoid problems with CORS  

Implement polyfills for browser compatibility  

Ease app development (edit-save-reload cycle)

### <mark style="background: #C900FFA6;">Starting With All The Needed Infrastructure</mark>

1. ``npm create vite@latest my-app``  
2. From the menu, choose React, then JavaScript  
3. cd ``my-app``  
4. npm install  
5. ... 65 Megabytes later ...  
6. npm run dev  
7. Visit http://localhost:5173

### <mark style="background: #C900FFA6;">Folder Structure</mark>  

```
my-app  
├── node_modules  
├── package.json  
├── package-lock.json  
├── .gitignore  
├── vite.config.js  
├── index.html  
├── public  
│ └── vite.svg  
└── src  
	├── assets  
	│ └── react.svg  
	├── App.css  
	├── App.jsx  
	├── index.css  
	└── main.jsx
```  

public is the web server root - Static files go here  

<mark style="background: #C900FFA6;">index.html is the page template:</mark>
- Published at http://localhost:xxxx  
- Automatically reloads when app changes  
- No need to modify, normally  
- Contains an element with id="root"  

src contains all scripts  

<mark style="background: #C900FFA6;">src/main.jsx is the JavaScript entry point:</mark>
- Contains the ``createRoot`` call to mount the App in the #root element  
- Do not touch, normally  

<mark style="background: #C900FFA6;">src/App.jsx is the file containing your application:</mark>  
- Develop here!  
- Feel free to import other components

### <mark style="background: #C900FFA6;">Importing/Exporting</mark> 

The browser uses “ES6 Modules” - ECMA Standard  

Uses import/export keywords - The require function used in Node.js doesn’t work here

![[Pasted image 20260224161626.png]]

### <mark style="background: #C900FFA6;">Example: Hello world</mark>  

App must return the JSX of the whole application  

<mark style="background: #C900FFA6;">We may use “custom components”:</mark>  
- Simply defined as JS functions  
- Receive ‘props’
- The lang JSX attribute becomes a property props.lang  

```js
function Button(props) {  
	if (props.lang === 'it')  
		return <button>Ciao!</button>;  
	else  
		return <button>Hello!</button>;  
	}  
	function App() {  
		return (  
			<p>  
				Press here: <Button lang='it' />  
			</p>  
		);  
}  
export default App;
```

### <mark style="background: #C900FFA6;">Example: Components in a Separate File</mark> 

```js
import Button from './Button.jsx';  

function App() {  
	return (  
		<p>  
			Premi qui: <Button lang='it' />  
		</p>  
	);  
}  
export default App;  

function Button(props) {  
	if (props.lang === 'it')  
		return <button>Ciao!</button>;  
	else  
		return <button>Hello!</button>;  
}  
export default Button;
```

### <mark style="background: #C900FFA6;">Example: Dynamic State</mark>

 
Button.jsx  
```js
import { useState } from "react";  

function Button(props) {  
	let [buttonLang, setButtonLang] = useState(props.lang);
	  
	if (buttonLang === 'it')  
		return <button onClick={()=>setButtonLang('en')}>Ciao!</button>;  
	else  
		return <button onClick={()=>setButtonLang('it')}>Hello!</button>;}  

export default Button;
```

### <mark style="background: #C900FFA6;">Example: adding Bootstrap</mark> 

Bootstrap CSS may be loaded “manually” from index.html or, better...  

The react-bootstrap library delivers many React Components that mimic the various Bootstrap classes  
- npm install react-bootstrap  
- npm install bootstrap  
 
```js

import 'bootstrap/dist/css/bootstrap.min.css';  

import { Col, Container, Row } from 'react-bootstrap';  

import MyButton from './Button.jsx';  

function App() {  
	return (  
		<Container>  
			<Row>  
				<Col>  
					Premi qui: <MyButton lang='it' />  
				</Col>  
			</Row>  
		</Container>  
	);  
}  
export default App;
```

```js
import { useState } from "react";  
import { Button } from "react-bootstrap";  

function MyButton(props) {  
	let [buttonLang, setButtonLang] = useState(props.lang) ;  
	if (buttonLang === 'it')  
		return <Button variant='primary' onClick={()=>setButtonLang('en')}>Ciao!</Button>  
	else  
		return <Button variant='primary' onClick={()=>setButtonLang('it')}>Hello!</Button>}  
export default MyButton;
```

### <mark style="background: #C900FFA6;">What’s next?</mark>
- Components and props  
- JSX  
- State and Hooks  
- Events  
- Forms  
- Lifecycle  
- Router  
- ...

### <mark style="background: #C900FFA6;">License</mark>  

These slides are distributed under a Creative Commons license “Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)”  

<mark style="background: #C900FFA6;">You are free to:</mark>  
- Share - copy and redistribute the material in any medium or format  
- Adapt - remix, transform, and build upon the material  
- The licensor cannot revoke these freedoms as long as you follow the license terms.  

<mark style="background: #C900FFA6;">Under the following terms:</mark>  
- <mark style="background: #C900FFA6;">Attribution:</mark> You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.  
- <mark style="background: #C900FFA6;">NonCommercial:</mark> You may not use the material for commercial purposes.  
- <mark style="background: #C900FFA6;">ShareAlike:</mark> If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.  
- <mark style="background: #C900FFA6;">No additional restrictions:</mark> You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.  

https://creativecommons.org/licenses/by-nc-sa/4.0/

