<mark style="background: #FFF503A6;">Overview</mark>
- Revision – Unix and Linux  
- Architecture and components of a Unix system  
- Programming in a Unix environment  
- Shell Scripting / C Programming  
- Software Tools  
- Programming Philosophies  
- Standards  
- Design Principles

### <mark style="background: #FFF503A6;">What is Unix?</mark>

UNIX is an operating system (OS) that was developed by AT&T in 1969 by Ken Thompson and Dennis Ritchie.  

The UNIX OS is made up of different programs that provide different features and functionality to keep the system running stable and to allow the users to perform specific tasks etc...  

Unix systems are multi-user and multi-tasking and can be used for servers and for users‘ personal PCs

### <mark style="background: #FFF503A6;">Unix / Linux Examples</mark>

<mark style="background: #FFF503A6;">Linux Examples:</mark>
- Debian GNU/Linux  
- Ubuntu  
- Mandriva Linux  
- Red Hat Enterprise Linux  
- Gentoo  
- Fedora  
- SUSE  
- Linux Enterprise  
- openSUSE  
- Linux Mint  
- Slackware Linux  

Confusingly, Linux is often used interchangeably to refer to the kernel and the full OS

### <mark style="background: #FFF503A6;">Makeup of a Unix System</mark>

<mark style="background: #FFF503A6;">A Unix system has three main components:</mark>
- Kernel
- Shell
- Programs

### <mark style="background: #FFF503A6;">Unix Architecture</mark>

![[Pasted image 20260206092134.png]]

### <mark style="background: #FFF503A6;">The Kernel</mark>

The kernel can be thought of the software that is used to interact with the systems hardware (handling files, disks, networking etc)  

The kernel is an integral part of the OS and is always running.  

As part of the install process, the kernel is specifically built to suit the machine.  

If any hardware components are changed in a given machine, the kernel will have to be re-built.

The interface to the kernel is a layer of software called <mark style="background: #FFF503A6;">system calls</mark>.  

Programs use system calls to execute operations.  

Libraries are common functionalities that are available for use and sit on top of the system calls. These can be used by programs to perform specific tasks. The program could use the library to access the system call interface directly.

### <mark style="background: #FFF503A6;">Kernel Responsibilities</mark>

<mark style="background: #FFF503A6;">Includes:</mark>
- System Memory Management
- Software Program Management
- Hardware Management
- Filesystem Management

### <mark style="background: #FFF503A6;">The Shell</mark>

The shell is an <mark style="background: #FFF503A6;">interface between the user and the kernel</mark>.  

The shell is a command line interpreter (CLI)  

A user can enter commands via the CLI, the program will run and the program can interact with the kernel by using system calls to perform tasks.  

There are a number of different shells that can be used: Bash / Korn / C Shell etc.

### <mark style="background: #FFF503A6;">Commands</mark>

There are a large number of commands that can be used to perform specific tasks in a UNIX environment.  

Eg: mv, cp, ls, grep, pwd etc....  

A number of different options can be used with the commands to perform more specific tasks.  

A number of commands can be grouped together to create a shell script to perform a larger task.

### <mark style="background: #FFF503A6;">Programs</mark>

When the specific functionality needed is greater than the basics of shell scripts, a program can solve this problem.  

A program can be written in a language to solve the problem.  

The program will have more control over the system and can access the OS API’s and make system calls to perform very low-level specific tasks. This can offer better performance, efficiency and maintainability  

Question: Why would you prefer a C program over a Shell Script?

### <mark style="background: #FFF503A6;">What is Linux?</mark>

<mark style="background: #FFF503A6;">It is:</mark>
- Linux is open source
- Free to use and distribute
- Servers and Client machines
- Linux is the kernel used by the GNU operating system.
- Linux is a unix-like operating system kernel and open source. UNIX is proprietary.

### <mark style="background: #FFF503A6;">GNU Project and the Free Software Foundation</mark>  

In 1983 Richard Stallman created the GNU project (short for "GNU's Not Unix").  

The main goal was to create a free software Unix-like system  

The Linux kernel was created be Linus Torvalds in 1991 and released as as free software under the GNU General Public License.  

A lot of the GNU packages that were developed for Linux have made their way into some Unix systems.  

Linux systems have gained prominence as the operating system of choice for servers for business

### <mark style="background: #FFF503A6;">What is the difference between Unix and Linux</mark>  

Linux distros are free to obtain and use. Unix is not.  

Linux is unix-like operating system released as free and open source. Linux is created by Linus Torvalds. Linux distributions uses Linux kernel to build the whole operating system.  

Linux is not derived from Unix source code, but its interfaces are intentionally like Unix (POSIX Standards).  

Linux can be thought of as a clone of UNIX.  

UNIX systems come as a complete OS with associated tools etc, all from the one vendor.

### <mark style="background: #FFF503A6;">OS Basics:: The Linux System</mark>

![[Pasted image 20260206093029.png]]

### <mark style="background: #FFF503A6;">Main Components in a Linux System</mark> 

<mark style="background: #FFF503A6;">Includes:</mark>
- The Linux Kernel 
- The GNU Utilities  
- Graphical Desktop Environment  
- Application Software

### <mark style="background: #FFF503A6;">Standards</mark>

The IEEE was the main body responsible for the standardization of Unix.  

The IEEE Unix standards is known as POSIX, this was the first Unix standard.  

The POSIX standards has detailed definitions regarding shells and command sets and interfaces for non-C programming languages.  

The Open Group (a group of Unix vendors), is now responsible for the standardisation of Unix.

### <mark style="background: #FFF503A6;">UNIX and the C Compiler</mark>

The UNIX command for compiling a C program is gcc  

gcc is a compiler from GNU for Linux.  

A program needs to be compiled and this process creates a binary code file that can be executed. The binary file may not work on another machine, if the program is moved to another machine it should be re-compiled.

### <mark style="background: #FFF503A6;">Manual Pages</mark>

<mark style="background: #FFF503A6;">Linux distros include manual pages for the following:</mark>  
- (1) User commands  
- (2) System calls  
- (3) Standard library functions  
- (8) System/Admin commands  

The numbers are related to the page sections.  

Eg: man ls The manual is a very good resource and should be used to get  
more information and detail for commands etc....

### <mark style="background: #FFF503A6;">Unix Development Philosophy</mark>

<mark style="background: #FFF503A6;">The UNIX philosophy is documented by Doug McIlroy in the The Bell System Technical Journal from 1978:</mark>  
1. Make each program do one thing well. To do a new job, build afresh rather than complicate old programs by adding new "features".  
2. Expect the output of every program to become the input to another, as yet unknown, program. Don't clutter output with extraneous information. Avoid stringently columnar or binary input formats. Don't insist on interactive input.  
3. Design and build software, even operating systems, to be tried early, ideally within weeks. Don't hesitate to throw away the clumsy parts and rebuild them.  
4. Use tools in preference to unskilled help to lighten a programming task, even if you have to detour to build the tools and expect to throw some of them out after you've finished using them.

The philosophy documented by Doug McIlroy was later summarized by Peter H. Salus in A Quarter-Century of Unix (1994).  

<mark style="background: #FFF503A6;">The Unix philosophy (by Doug McIlroy):</mark> 
1. Write programs that do one thing and do it well.  
2. Write programs to work together.  
3. Write programs to handle text streams, because that is a universal interface.

Rob Pike (one of the great masters of C programming) detailed a different set of rules in Notes on C Programming:  

<mark style="background: #FFF503A6;">Rule 1:</mark> You can’t tell where a program is going to spend its time. Bottlenecks occur in surprising places, so don’t try to second guess and put in a speed hack until you’ve proven that’s where the bottleneck is.  

<mark style="background: #FFF503A6;">Rule 2:</mark> Measure. Don’t tune for speed until you’ve measured, and even then don’t unless one part of the code overwhelms the rest.  

<mark style="background: #FFF503A6;">Rule 3:</mark> Fancy algorithms are slow when n is small, and n is usually small. Fancy algorithms have big constants. Until you know that n is frequently going to be big, don’t get fancy. (Even if n does get big, use Rule 2 first.)  

<mark style="background: #FFF503A6;">Rule 4:</mark> Fancy algorithms are buggier than simple ones, and they’re much harder to implement. Use simple algorithms as well as simple data structures.  

<mark style="background: #FFF503A6;">Rule 5:</mark> Data dominates. If you’ve chosen the right data structures and organized things well, the algorithms will almost always be self-evident. Data structures, not algorithms, are central to programming.  

<mark style="background: #FFF503A6;">Rule 6:</mark> There is no Rule 6.

Source: The Art of Unix Programming by Eric Steven Raymond 2003

### <mark style="background: #FFF503A6;">General Design Principles</mark>

<mark style="background: #FFF503A6;">DRY:</mark> Don’t Repeat Yourself  

<mark style="background: #FFF503A6;">KISS:</mark> Keep It Simple Stupid  

<mark style="background: #FFF503A6;">YAGNI:</mark> You Ain’t Gonna Need It  

Tell, Don’t Ask  

<mark style="background: #FFF503A6;">SoC:</mark> Separation of Concerns

### <mark style="background: #FFF503A6;">DRY – Don’t Repeat Yourself</mark>

The DRY design principle places an emphasis on not duplicating data or behaviour in the code base.  

When developing large\complex systems it can be easy to duplicate data \ code \ logic to get something working.  

The problem with this is that when changes need to be made to the application, it can be difficult to identify what to update.  

Maintainability and extendibility will suffer.  

The principle requires that data or behaviour should occur once in the system and offer it through a reusable unit.

### <mark style="background: #FFF503A6;">KISS – Keep It Simple Stupid</mark>

Try to keep the code simple. A system or process will work best if it is kept simple.  

Don’t use overly complex code to get something working.  

By keeping the code solution simple and clean, this will help towards a maintainable and extensible system.

### <mark style="background: #FFF503A6;">YAGNI – You Ain’t Gonna Need It</mark> 

Do not add additional code/functionality to a system, only enough to solve the given problem.  

Adding additional functionality to an application is also described as “Gold Plating”.  

The YAGNI principle ties into the TDD (test-driven development) process, in that you just write enough code to get the test to pass.

### <mark style="background: #FFF503A6;">SoC – Separation of Concerns</mark>

This principle is closely related to the Single Responsibility Principle (SRP).  

The main purpose is to ensure that different concerns are not located in the same code base.  

The concern can be described as the behaviour of a class.  

From an OOP perspective SoC is trying to encapsulate data and behaviour to facilitate code reuse. Separate classes for different data and behaviour.  

SoC facilitates code reuse, maintainability, extendibility and testability.

### <mark style="background: #FFF503A6;">Summary of Eric Raymond’s Rules</mark>

<mark style="background: #FFF503A6;">Rule of Modularity:</mark> Write simple parts connected by clean interfaces.  

<mark style="background: #FFF503A6;">Rule of Clarity:</mark> Clarity is better than cleverness.  

<mark style="background: #FFF503A6;">Rule of Composition:</mark> Design programs to be connected to other programs.  

<mark style="background: #FFF503A6;">Rule of Separation:</mark> Separate policy (rules) from mechanism; separate interfaces from engines.  

<mark style="background: #FFF503A6;">Rule of Simplicity:</mark> Design for simplicity; add complexity only where you must.  

<mark style="background: #FFF503A6;">Rule of Parsimony:</mark> Write a big program only when it is clear by demonstration that nothing else will do.  

<mark style="background: #FFF503A6;">Rule of Transparency:</mark> Design for visibility to make inspection and debugging easier.  

<mark style="background: #FFF503A6;">Rule of Robustness:</mark> Robustness is the child of transparency and simplicity.  

<mark style="background: #FFF503A6;">Rule of Representation:</mark> Fold knowledge into data so program logic can be stupid and robust.  

<mark style="background: #FFF503A6;">Rule of Least Surprise:</mark> In interface design, always do the least surprising thing.  

<mark style="background: #FFF503A6;">Rule of Silence:</mark> When a program has nothing surprising to say, it should say nothing.  

<mark style="background: #FFF503A6;">Rule of Repair:</mark> When you must fail, fail noisily and as soon as possible.

<mark style="background: #FFF503A6;">Rule of Economy:</mark> Programmer time is expensive; conserve it in preference to machine time.  

<mark style="background: #FFF503A6;">Rule of Generation:</mark> Avoid hand-hacking; write programs to write programs when you can. 

<mark style="background: #FFF503A6;">Rule of Optimisation:</mark> Prototype before polishing. Get it working before you optimize it.  

<mark style="background: #FFF503A6;">Rule of Diversity:</mark> Distrust all claims for “one true way”.  

<mark style="background: #FFF503A6;">Rule of Extensibility:</mark> Design for the future, because it will be here sooner than you think.

<mark style="background: #FFF503A6;">Reference:</mark> The Art of Unix Programming - Eric Steven Raymond

### <mark style="background: #FFF503A6;">To Do: Additional Reading</mark>

Read Chapter 1 [Philosophy] from Eric Raymond’s Book - The Art of Unix Programming
