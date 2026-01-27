### <mark style="background: #C900FFA6;">Summary of lecture</mark>

Mobile device challenges include small screens, variable dimensions, touch screens, typing difficulties, and social influences.  

Design strategies involve optimizing common interaction sequences, reducing typing, and minimising steps in tasks.  

Mobile Interaction Design Patterns require vertical stack, generous borders, thumbnail-and-text lists, loading indicators, and others.  

Bootstrap is a popular HTML, CSS, and JavaScript library for responsive, mobile-first websites.  

Bootstrap 5, released in 2011, uses Flexbox for layout and offers new components, faster stylesheets, and responsiveness.  

No longer dependent on jQuery, Bootstrap 5 includes new classes, an improved "forms" section, and additional features like Accordion and Off-canvas.

![[Pasted image 20260127101055.png]]

### <mark style="background: #C900FFA6;">Joomla vs Blogger</mark>

![[Pasted image 20260127101118.png]]
![[Pasted image 20260127101132.png]]
![[Pasted image 20260127101142.png]]

### <mark style="background: #C900FFA6;">Why Mobile Design?</mark>

Mobile devices now account for approx. 60% of web traffic worldwide in 2022*.  

<mark style="background: #C900FFA6;">The Challenges of Mobile Design:</mark>
- Tiny screen sizes  
- Variable screen widths/heights  
- Touch screens  
- Difficulty in typing text  
- Challenging physical environments (moving, variable brightness)  
- Social influences and limited attention  

Interaction design pattern books (2009, 2010)  

Twitter Bootstrap - 2011

### <mark style="background: #C900FFA6;">Mobile Design</mark>

<mark style="background: #C900FFA6;">For ease of use:</mark>
- Optimise the most common interaction sequences
- Eliminate or reduce typing e.g. type = email on forms, a mobile browser will add ‘@’ ‘.com’ on the main keyboard.
- Hints and auto-complete (AJAX, browser cache...)  
- Reduce the number of taps  
- Reduce the number of steps to complete tasks  

<mark style="background: #C900FFA6;">For data usage optimisation:</mark>
- Use as few page loads as possible (AJAX...)  
- Use lightweight protocols if possible (REST...)  
- For page load speed consider JS library choices (size, server-side rendering...)  
- W3.CSS versus Bootstrap?  
- React versus Angular?

### <mark style="background: #C900FFA6;">Server-Browser interaction</mark>

<mark style="background: #C900FFA6;">Web server</mark> refers to <mark style="background: #C900FFA6;">hardware, software, or both</mark> working together.  

A web server is a computer that <mark style="background: #C900FFA6;">stores web server software</mark> and a website's component files.  

A web server includes several parts that control how web users access hosted files.  

Whenever a browser needs a file on a web server, the <mark style="background: #C900FFA6;">browser requests the file via HTTP</mark>, the server accepts the request and sends it back to the browser.  

A <mark style="background: #C900FFA6;">static web server</mark> server sends its hosted files as-is to your browser. A <mark style="background: #C900FFA6;">dynamic web server</mark> has extra software, most commonly an application server and a database.

![[Pasted image 20260127101431.png]]

### <mark style="background: #C900FFA6;">Client-side vs. Server-side rendering</mark>  

<mark style="background: #C900FFA6;">Server-side rendering</mark> is the <mark style="background: #C900FFA6;">most common approach</mark>. It works by converting  

HTML files in the server into usable information for the browser.  

<mark style="background: #C900FFA6;">Client-side rendering renders content in the browser using JavaScript</mark>. So instead of getting all of the content from the HTML document itself, you are getting a bare-bones HTML document with a JavaScript file.

### <mark style="background: #C900FFA6;">Pros and cons</mark>

![[Pasted image 20260127103045.png]]

### <mark style="background: #C900FFA6;">Mobile Users</mark> 

<mark style="background: #C900FFA6;">What do mobile users need?</mark>
- Users with a mobile device may only want to use your web app in particular ways  
- They won’t have the same range of needs that a user of the full website will have  

<mark style="background: #C900FFA6;">Design for use contexts such as:</mark> 
- “I need to know something, quickly.”  
- “I need to do something, right now.”  
- “What’s relevant to the place I’m in at the moment?”

### <mark style="background: #C900FFA6;">Difference Between A Mobile App And A Web App</mark>  

Mobile apps and web apps are NOT the same thing  

A web app is a website that is designed fluidly, responding to being viewed on a smartphone.  

Native mobile apps are built for a platform such as iPhone or Android. They are installed via an app store and access to system resources (GPS, camera).  

Let’s consider the Yelp native app vs. the Yelp.com web app

![[Pasted image 20260127103242.png]]

### <mark style="background: #C900FFA6;">Difference Between Mobile and Web Apps</mark>

<mark style="background: #C900FFA6;">Web</mark> apps need an <mark style="background: #C900FFA6;">active internet connection</mark> to run, whereas <mark style="background: #C900FFA6;">mobile</mark> apps may work <mark style="background: #C900FFA6;">offline</mark>.  

Mobile are <mark style="background: #C900FFA6;">faster but require updates regularly</mark>. The web needs no updates.  

Mobile apps are more expensive but faster and tend to be more advanced in terms of features and functionality.  

Native mobile apps are built using specific languages and Integrated Development Environments (IDE). Apple devices run on the iOS native operating system and are  built with Objective-C or Swift, and the Xcode IDE. Native apps for Android are mostly written in Java using the Android Studio or Eclipse IDE.  

Apple and Google also provide their own development tools, interface elements and software development kits (SDK).

### <mark style="background: #C900FFA6;">Web Apps versus Mobile Apps</mark>  

<mark style="background: #C900FFA6;">Advantages of a mobile-first Web App:</mark>
1. Immediacy – web apps are instantly available  
2. Compatibility – web apps are compatible across devices  
3. Upgradability – web apps can be updated instantly  
4. Reachability – web apps can be found easily  

<mark style="background: #C900FFA6;">(Former) Advantages of Mobile Apps:</mark>
1. Can work offline (games, etc.) -> Progressive Web Apps  
2. Can use the camera, GPS, etc. -> Browser HTML5 APIs e.g.  ``navigator.geolocation.getCurrentPosition, navigator.mediaDevices.getUserMedia...``  
3. This can lead to a better user experience

### <mark style="background: #C900FFA6;">Mobile Interaction Design Patterns</mark>

<mark style="background: #C900FFA6;">Features:</mark>
- Vertical stack  
- Generous borders  
- Thumbnail-and-text lists  
- Loading indicators  
- Filmstrip (swipe navigation)  
- Touch tools (show aftertouch)  
- Infinite list (append more)  
- Text clear button

![[Pasted image 20260127103606.png]]

### <mark style="background: #C900FFA6;">Responsive Web Design</mark>

Designing websites which automatically adjust themselves to look good on all devices.

![[Pasted image 20260127103638.png]]

### <mark style="background: #C900FFA6;">Bootstrap</mark>

Bootstrap is the most popular <mark style="background: #C900FFA6;">HTML, CSS, and JavaScript</mark> library for developing responsive, <mark style="background: #C900FFA6;">mobile-first</mark> websites.

Bootstrap is completely <mark style="background: #C900FFA6;">free</mark> to download and use, even in commercial applications.  

Bootstrap creates responsive designs: apps that <mark style="background: #C900FFA6;">automatically adjust themselves</mark> to look good on all devices: phones, tablets and desktops.  

Bootstrap is <mark style="background: #C900FFA6;">compatible with all modern browsers</mark>: Chrome, Firefox, Internet Explorer, Safari, and Opera.

### <mark style="background: #C900FFA6;">History</mark>

Bootstrap was developed by Mark Otto and Jacob Thornton at Twitter  

Released as an open-source product in August 2011 on GitHub.

### <mark style="background: #C900FFA6;">Browser Object Model (BOM)</mark>

<mark style="background: #C900FFA6;">The Browser Object Model (BOM) gives you:</mark> 
- The resolution of the screen, in pixels (screen.width, screen.height)
- The dimensions of the visitor's screen, in pixels, minus interface features like the Windows Taskbar (screen.availWidth, screen.availHeight)  
- The width and height of the browser window's content area (viewport), including scrollbars, in the pixels (window.innerWidth, window.innerHeight;)

![[Pasted image 20260127104021.png]]

### <mark style="background: #C900FFA6;">Getting Bootstrap</mark>

<mark style="background: #C900FFA6;">There are two ways to start using Bootstrap:</mark>  
1. Download Bootstrap from https://getbootstrap.com/  
2. Include Bootstrap from a CDN  

MaxCDN provides CDN support for Bootstrap's CSS and JavaScript.  

You must also include jQuery from Google, for example.  

Many users already have downloaded Bootstrap when visiting another site, so it will be loaded from  
the cache in yours, which is faster.  

Also, most CDNs will serve files from the server closest to the user, which is also faster.  
```html
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
```

### <mark style="background: #C900FFA6;">What is jQuery?</mark>

jQuery is a lightweight, "write less, do more", JavaScript library.  

The purpose of jQuery is to make it much easier to use JavaScript on your website.  

jQuery also simplifies a lot of the complicated things from JavaScript, like AJAX calls and DOM manipulation.

### <mark style="background: #C900FFA6;">The HTML DOM (Document Object Model)</mark>

When a web page is loaded, the browser creates a Document Object Model of the page.  

The <mark style="background: #C900FFA6;">HTML DOM</mark> model is constructed as a tree of <mark style="background: #C900FFA6;">Objects</mark>:
![[Pasted image 20260127104601.png]]

### <mark style="background: #C900FFA6;">BST: Background color classes</mark>

![[Pasted image 20260127104639.png]]

### <mark style="background: #C900FFA6;">Text color</mark>

![[Pasted image 20260127104700.png]]

### <mark style="background: #C900FFA6;">Bootstrap 5</mark>

Bootstrap 5 is the newest version of Bootstrap; with new components, faster stylesheet and more responsiveness.  

It is the most stable version, and it is still supported by the team for critical bug fixes and documentation changes.  

However, new features will NOT be added to it.  

The biggest difference between Bootstrap 3 and 5 is that Bootstrap 5 uses flexbox, instead of floats, to handle the layout.

![[Pasted image 20260127104733.png]]
![[Pasted image 20260127104742.png]]

### <mark style="background: #C900FFA6;">BST5 is not using jQuery</mark>

The “forms” have been improved  

New classes (positioning, font size, borders, etc)  

No continuity for the Jumbotron  

Left-to-right pages (For other languages such as Arabic)  

Icons have been refurbished.  

Two new components have been added: Accordion and off-canvas

### <mark style="background: #C900FFA6;">BST5: Accordion and Off-canvas</mark>

![[Pasted image 20260127104843.png]]

### <mark style="background: #C900FFA6;">BST5: Alerts</mark>

![[Pasted image 20260127104916.png]]

### <mark style="background: #C900FFA6;">BST 5 has more colors</mark>

BST added a new palette of colours to the default values

![[Pasted image 20260127105156.png]]

### <mark style="background: #C900FFA6;">Bootstrap 5</mark>

Bootstrap 5 uses jQuery and Popper.js for JavaScript components (like modals, tooltips, popovers etc).  

However, if you just use the CSS part of Bootstrap, you don't need them.  

Popper.js is a positioning engine; its purpose is to calculate the position of an element to position it near a given reference element.  

Popper.js is just ~6KB minified and gzipped, with zero dependencies.  

Its code base is in ES6 and tested against several browsers.  

It integrates nicely with React, AngularJS and more

![[Pasted image 20260127105245.png]]

### <mark style="background: #C900FFA6;">Bootstrap First Page</mark>

![[Pasted image 20260127105317.png]]

### <mark style="background: #C900FFA6;">Bootstrap Grid System</mark>

![[Pasted image 20260127105416.png]]

Grid columns should add up to 12 for a row.  

The columns will re-arrange automatically depending on the screen size  

<mark style="background: #C900FFA6;">The Bootstrap 4 grid system has five classes:</mark>
![[Pasted image 20260127105440.png]]

<mark style="background: #C900FFA6;">Each class scales up</mark>, so if you wish to set the same widths for sm and md, you only need to specify sm.

If you specify widths for a screen size, below that size the elements will stack  
```html
<div class="col-sm-6">  
<div class="col-sm-6">
```  

This will result in a 50/50 split on sm and above md, lg and xl.  

On extra small screens, it will <mark style="background: #C900FFA6;">automatically stack</mark>.  

The classes can be combined to adjust the layout to better suit each screen size  

```html
<div class="col-sm-7 col-md-6 col-lg-8"> content 1</div>  
<div class="col-sm-5 col-md-6 col-lg-5"> content 2 </div>
```  

On <mark style="background: #C900FFA6;">small devices</mark>, it will divide the content into two columns, one with 7/12 of the width, the other with 5/12  

On <mark style="background: #C900FFA6;">medium devices</mark>, it’s a 50/50 split  

On <mark style="background: #C900FFA6;">large devices</mark>, it will be 2/3 vs 1/3 split

### <mark style="background: #C900FFA6;">Example</mark>

![[Pasted image 20260127105926.png]]

### <mark style="background: #C900FFA6;">GRID: Xs screen for phones</mark>

![[Pasted image 20260127105958.png]]

### <mark style="background: #C900FFA6;">GRID: SM Screens for tablets</mark>

![[Pasted image 20260127110039.png]]

### <mark style="background: #C900FFA6;">GRID: MD Small laptops</mark>

![[Pasted image 20260127110109.png]]

### <mark style="background: #C900FFA6;">Bootstrap Styles</mark>

<mark style="background: #C900FFA6;">Tables</mark> have light padding and only horizontal dividers.  

<mark style="background: #C900FFA6;">The .table class adds basic styling to a table:</mark>  
![[Pasted image 20260127110204.png]]

Images can have rounded corners (except on IE8)

### <mark style="background: #C900FFA6;">Buttons:</mark>

![[Pasted image 20260127110300.png]]

These styles can be applied to ``<a>, <button>, <input type="button">`` and ``<input type="submit">``

### <mark style="background: #C900FFA6;">Cards</mark>

A card in Bootstrap 4 is a bordered box with some padding around its content. It includes options for headers, footers, content, images, overlays, etc.  

If you are familiar with Bootstrap 3, cards replace old panels, wells, and thumbnails

![[Pasted image 20260127110425.png]]

![[Pasted image 20260127110436.png]]

### <mark style="background: #C900FFA6;">Bootstrap Styles</mark>

<mark style="background: #C900FFA6;">Loading indicators:</mark>
- Progress bars  
- Spinners  
- Spinners

![[Pasted image 20260127112306.png]]

```html
<button class="btn btn-primary">  
<span class="spinner-border spinner-border-sm"></span>  
<div class="spinner-border"></div>  
Loading...  
</button>
```

![[Pasted image 20260127112339.png]]

### <mark style="background: #C900FFA6;">Bootstrap Styles</mark>

<mark style="background: #C900FFA6;">Forms:</mark>  

```html
<form>  
<div class="form-group">  
<label for="email">Email:</label>  
<input type="email" class="form-control" id="email">  
</div>  
<div class="form-group">  
<label for="pwd">Password:</label>  
<input type="password" class="form-control" id="pwd">  
</div>  
<div class="checkbox">  
<label><input type="checkbox"> Remember me</label>  
</div>  
<button type="submit" class="btn btn-default">Submit</button>  
</form>
```

![[Pasted image 20260127112612.png]]

### <mark style="background: #C900FFA6;">Bootstrap Components</mark>
- Carousel (slideshow)  
- Modal (dialog/popup box)  
- Tooltip & Popover  
- Toast (temporary alert)  
- Scrollspy (automatically updates links in a navigation list based on scroll position)  
- Fixed Navigation Bars

![[Pasted image 20260127112647.png]]

### <mark style="background: #C900FFA6;">Bootstrap Templates</mark>

To be productive quickly, you can get pre-made free templates on:  
- https://getbootstrap.com/docs/4.4/examples/  
- https://www.w3schools.com/bootstrap5/index.php  

Save the page source code and edit it.

### <mark style="background: #C900FFA6;">Table Filtering Utilities</mark>

<mark style="background: #C900FFA6;">jQuery filter():</mark> https://www.w3schools.com/bootstrap4/bootstrap_filters.asp  

<mark style="background: #C900FFA6;">DataTables:</mark> 
- https://www.datatables.net/
- https://www.datatables.net/manual/styling/bootstrap4

<mark style="background: #C900FFA6;">Bootstrap Table:</mark> https://examples.bootstrap-table.com/

### <mark style="background: #C900FFA6;">Bibliography</mark>

https://www.classcentral.com/course/youtube-bootstrap-5-tutorial-55184/classroom  

https://github.com/iamshaunjp/bootstrap-5-tutorial  

https://www.w3schools.com/bootstrap5/  

https://getbootstrap.com/docs/5.3/layout/grid/  

https://www.slideshare.net/MallikarjunaGD/bootstrap-5-ppt  

https://usu.instructure.com/courses/530950/files/72746028/download?wrap=1