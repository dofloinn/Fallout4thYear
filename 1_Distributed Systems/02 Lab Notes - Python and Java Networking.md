### <mark style="background: #FFF3A3A6;">Java Networking APIs</mark>

Through the classes in ``java.net``, Java programs can use TCP or UDP to communicate over the Internet

The ``URL``, ``URLConnection``, ``Socket``, and ``ServerSocket`` classes all use TCP to communicate over the network

The ``DatagramPacket``, ``DatagramSocket``, and ``MulticastSocket`` classes are for use with UDP.

### <mark style="background: #FFF3A3A6;">Java.net</mark>

Core package java.net provides the classes for implementing networking application

Using these classes, the network programmer can communicate with any server on the Internet or implement their own Internet server.

### <mark style="background: #FFF3A3A6;">Programmatic Access to Network Parameters:</mark>

Systems often run with multiple active network connections, such as wired Ethernet, 802.11 b/g (wireless), and bluetooth.

Some applications might need to access this information to perform the particular network activity on a specific connection.

The ``java.net.NetworkInterface`` class provides access to this information.

### <mark style="background: #FFF3A3A6;">Network Interface:</mark>

A network interface is the point of interconnection between a computer and a private or public network.

``NetworkInterface`` is useful for a multi- homed system, which is a system with multiple NICs.

Using ``NetworkInterface``, you can specify which NIC to use for a particular network activity.

### <mark style="background: #FFF3A3A6;">Class</mark>

``java.net.InetAddress``

This class represents an Internet Protocol (IP) address. An IP address is either a 32-bit or 128-bit unsigned number used by IP.

Static method ``getByName`` of this class uses DNS (Domain Name System) to return the Internet address of a specified host name as an ``InetAddress`` object.
- ``public static InetAddress getByName(String host)`` throws ``UnknownHostException``
- Determines the IP address of a host, given the host's name. The host name can either be a machine name, such as "java.sun.com", or a textual representation of its IP address. If a literal IP address is supplied, only the validity of the address format is checked.

### <mark style="background: #FFF3A3A6;">Class InetAddress</mark>

```Java
String host;
try {
	InetAddress address = InetAddress.getByName(host);
	System.out.println("IP address: " + address.toString());
}
catch (UnknownHostException e){
	System.out.println("Could not find " + host);
}
```

### <mark style="background: #FFF3A3A6;">Working with URLs in Java</mark>

Java programs can use a class called <mark style="background: #FFF3A3A6;">URL</mark> in the java.net package to represent a URL address

<mark style="background: #FFF3A3A6;">Creating an absolute URL:</mark> An absolute URL contains all of the information necessary to reach the resource in question.

`URL myURL = new URL("http://example.com/");`

### <mark style="background: #FFF3A3A6;">Creating a URL Relative to Another:</mark>

A relative URL contains only enough information to reach the resource relative to (or in the context of) another URL

You can create a URL object from a relative URL specification. For example, if you know two URLs at the site example.com:
http://example.com/pages/page1.html
http://example.com/pages/page2.html

You can create URL objects for these pages relative to their common base URL: http://example.com/pages/ like this:

``URL myURL = new URL("http://example.com/pages/");``
``URL page1URL = new URL(myURL, "page1.html");``
``URL page2URL = new URL(myURL, "page2.html");``

 <mark style="background: #FFF3A3A6;">The general form of URL constructor is:</mark>
``URL(URL baseURL, String relativeURL)``
- The first argument is a URL object that specifies the base of the new URL.
- The second argument is a String that specifies the rest of the resource name relative to the base.
- If ``baseURL`` is null, then this constructor treats ``relativeURL`` like an absolute URL specification.
- If ``relativeURL`` is an absolute URL specification, then the constructor ignores ``baseURL``.

### <mark style="background: #FFF3A3A6;">Parsing a URL:</mark>

The URL class provides several methods that let you query URL objects.

You can get the protocol, authority, host name, port number, path, query, filename, and reference from a URL using accessor methods (all are listed in Java docs)

<mark style="background: #FFF3A3A6;">Examples:</mark>
- ``getProtocol`` Returns the protocol identifier component of the URL.
- ``getAuthority`` Returns the authority component of the URL.
- ``getHost`` Returns the host name component of the URL.
- ``getPort`` Returns the port number component of the URL. The getPort method returns an integer that is the port number. If the port is not set, getPort returns -1.
- ``getPath`` Returns the path component of this URL.

### <mark style="background: #FFF3A3A6;">Python Networking</mark>

Python plays an essential role in network programming.

The standard library of Python has full support for network protocols, encoding, and decoding of data and other networking concepts.

There are two levels of network service access in Python:
- Low-Level Access
- High-Level Access

<mark style="background: #FFF3A3A6;">Low-Level Access:</mark>
- Programmers can use and access the basic socket support for the operating system using Python's libraries
- Allows to implement both connection-less and connection- oriented protocols for programming.

<mark style="background: #FFF3A3A6;">High-Level Access:</mark>
- Application-level network protocols (HTTP, FTP, etc.) can also be accessed using high-level access provided by Python libraries.