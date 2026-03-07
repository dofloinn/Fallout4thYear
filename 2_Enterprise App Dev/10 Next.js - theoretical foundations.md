From React to Next.js  

Early websites were server-rendered: the server generated a complete HTML page for every request and users immediately saw content.  

React introduced browser-side rendering where JavaScript builds the interface dynamically. 

This enabled interactivity but caused slow first load, blank screens, poor SEO, and heavy device processing.  

<mark style="background: #C900FFA6;">Next.js</mark> combines React interactivity with server-rendered performance and search visibility.  

Next.js is a framework built on top of React.

React only handles the UI and does not <mark style="background: #C900FFA6;">define routing, page loading, data fetching, or server interaction</mark>.  

Next.js adds a server runtime, routing system, rendering strategies, and performance optimizations.  

React is UI library, while Next.js is a complete web application framework.

### <mark style="background: #C900FFA6;">Diagram on React</mark>

![[Pasted image 20260225102444.png]]

### <mark style="background: #C900FFA6;">Client-Side Rendering and SEO Problems</mark>  

In traditional React, the browser requests a page, receives an empty HTML response, downloads JavaScript, executes React, and then renders content.  

This model is called <mark style="background: #C900FFA6;">Client-Side Rendering (CSR)</mark>.  

Consequences include blank initial screens, slow loading on low-power devices, and difficulty for search engines.  

Search engines index HTML content rather than JavaScript execution.  

In CSR, the initial HTML contains little information, and real content appears only after scripts run.  

This can lead to poor ranking or pages not being indexed at all, especially for blogs and public websites.

### <mark style="background: #C900FFA6;">Server Rendering and Rendering Strategies</mark>  

<mark style="background: #C900FFA6;">Next.js</mark> allows pages to be generated before reaching the browser.  

The server produces complete HTML and sends it to the client.  

Users see content immediately, devices do less work, and SEO improves significantly.  

<mark style="background: #C900FFA6;">Next.js</mark> supports several rendering models: Client-Side Rendering, Server-Side Rendering, Static Site Generation, and Incremental Static Regeneration.  

Developers can choose the most appropriate strategy for each page.

### <mark style="background: #C900FFA6;">Server-Side Rendering (SSR)</mark> 

The server fetches data and builds the HTML page for every request.  

<mark style="background: #C900FFA6;">Advantages:</mark> always fresh data, strong SEO, and immediately visible content.  

<mark style="background: #C900FFA6;">Disadvantage:</mark> increased server workload.  

Used for dashboards and personalized applications.

### <mark style="background: #C900FFA6;">Static Generation and Incremental Regeneration</mark>  

Pages are generated once during deployment and stored as static files.  

<mark style="background: #C900FFA6;">Advantages:</mark> extremely fast, scalable, SEO-friendly.  

<mark style="background: #C900FFA6;">Disadvantage:</mark> The content does not automatically update.  

Used for blogs and documentation.  

<mark style="background: #C900FFA6;">Hybrid approach:</mark> a static page is regenerated in the background after a defined time.  

Users get fast loading while content updates without rebuilding the whole site.  

Suitable for product listings and news pages.

### <mark style="background: #C900FFA6;">Rendering Model Comparison</mark>  

<mark style="background: #C900FFA6;">CSR:</mark> browser builds page.  

<mark style="background: #C900FFA6;">SSR:</mark> server builds a page for each request.  

<mark style="background: #C900FFA6;">SSG:</mark> page built once.  

<mark style="background: #C900FFA6;">ISR:</mark> page rebuilt periodically.  

Next.js is a hybrid rendering framework combining performance and dynamic data.

### <mark style="background: #C900FFA6;">Routing and Dynamic Pages</mark>

Next.js maps the project folder structure directly to URLs.  

Folders represent routes, and files represent pages.  

This removes routing configuration and reduces programming errors.  

Next.js supports variable URLs for resources like users, products, and articles.  

A single-page template can represent thousands of pages using parameters.

### <mark style="background: #C900FFA6;">Data Fetching and Component Types</mark>  

React usually fetches data after the page loads in the browser.  

Next.js fetches data before sending the page.  

The browser receives ready content, improving performance and SEO.  

Server components run on the server and access databases securely.  

Client components run in the browser and handle user interaction.  

Modern applications distribute processing between server and client.

### <mark style="background: #C900FFA6;">Full-Stack Capability and Optimisation</mark>  

Next.js supports backend APIs and authentication.  

A single project can contain UI, server logic, and APIs.  

This reduces the separation between frontend and backend development.  

Automatic optimisations include code splitting, image optimisation, prefetching, and caching.  

Developers achieve performance without complex configuration.

### <mark style="background: #C900FFA6;">When to Use Next.js</mark> 

Use when SEO matters, public pages exist, authentication is required, or performance is critical.  

Typical examples include e-commerce, SaaS, and dashboards.  

React alone suits internal tools, prototypes, and applications without SEO requirements.

### <mark style="background: #C900FFA6;">Key Takeaways and Big Picture</mark>  

React moved interfaces to the browser, creating performance and SEO issues.  

Next.js reintroduced server rendering intelligently and supports multiple rendering models.  

<mark style="background: #C900FFA6;">Evolution:</mark> Server websites → jQuery → React SPA → Hybrid frameworks.  

Next.js represents the modern direction of server-aware frontend development.