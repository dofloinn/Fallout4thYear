# <mark style="background: #FFF503A6;">01 Development Tools and Scripting Techniques</mark>

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

The IEEE was the main body responsible for the standardisation of Unix.  

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

The philosophy documented by Doug McIlroy was later summarised by Peter H. Salus in A Quarter-Century of Unix (1994).  

<mark style="background: #FFF503A6;">The Unix philosophy (by Doug McIlroy):</mark> 
1. Write programs that do one thing and do it well.  
2. Write programs to work together.  
3. Write programs to handle text streams, because that is a universal interface.

Rob Pike (one of the great masters of C programming) detailed a different set of rules in Notes on C Programming:  

<mark style="background: #FFF503A6;">Rule 1:</mark> You can’t tell where a program is going to spend its time. Bottlenecks occur in surprising places, so don’t try to second guess and put in a speed hack until you’ve proven that’s where the bottleneck is.  

<mark style="background: #FFF503A6;">Rule 2:</mark> Measure. Don’t tune for speed until you’ve measured, and even then don’t unless one part of the code overwhelms the rest.  

<mark style="background: #FFF503A6;">Rule 3:</mark> Fancy algorithms are slow when n is small, and n is usually small. Fancy algorithms have big constants. Until you know that n is frequently going to be big, don’t get fancy. (Even if n does get big, use Rule 2 first.)  

<mark style="background: #FFF503A6;">Rule 4:</mark> Fancy algorithms are buggier than simple ones, and they’re much harder to implement. Use simple algorithms as well as simple data structures.  

<mark style="background: #FFF503A6;">Rule 5:</mark> Data dominates. If you’ve chosen the right data structures and organised things well, the algorithms will almost always be self-evident. Data structures, not algorithms, are central to programming.  

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

<mark style="background: #FFF503A6;">Rule of Optimisation:</mark> Prototype before polishing. Get it working before you optimise it.  

<mark style="background: #FFF503A6;">Rule of Diversity:</mark> Distrust all claims for “one true way”.  

<mark style="background: #FFF503A6;">Rule of Extensibility:</mark> Design for the future, because it will be here sooner than you think.

<mark style="background: #FFF503A6;">Reference:</mark> The Art of Unix Programming - Eric Steven Raymond

### <mark style="background: #FFF503A6;">To Do: Additional Reading</mark>

Read Chapter 1 [Philosophy] from Eric Raymond’s Book - The Art of Unix Programming

# <mark style="background: #FFF503A6;">02 Make</mark>

<mark style="background: #FFF503A6;">Overview:</mark>
- Make
- Make and makefile examples

### <mark style="background: #FFF503A6;">Reference</mark>

The main slide content for the Make and Makefile has been sourced from the gnu.org website.  

The level of detail in the GNU documentation is very complete, for more information please read this resource  

https://www.gnu.org/software/make/manual/make.html

### <mark style="background: #FFF503A6;">GNU make</mark>

Make was implemented by Richard Stallman and Roland McGrath.  

The GNU make utility is used to automate which parts of a large program may need to be recompiled.  

Make can facilitate the creation of larger programs from separate sources.  

Make can automate tasks for compilation, cleaning, debugging and organising outputs.

### <mark style="background: #FFF503A6;">Make Usage</mark>

The make command allows for a program to be recompiled is a very specific sequence. It uses a makefile to detail the commands for compiling and updating each file.  

The main executable is made up of object files. The object files are compiled from C source files.  

The makefile contains the sequence for creating the main executable, the make command runs the makefile  

Command line arguments can be provided to make to specify which files should be recompiled

### <mark style="background: #FFF503A6;">Introduction to makefiles</mark>

A makefile will be created to describe the process needed to recompile a program.  

Most often, the makefile tells make how to compile and link a program.  

<mark style="background: #FFF503A6;">Makefiles are a good idea because:</mark>
- faster to recompile things (less typing, and it only recompiles based on what’s changed and leaves the rest)
- organise “steps” in a (potentially complex) compilation into one place (the makefile), which makes it easier for other people to compile your code

### <mark style="background: #FFF503A6;">What a Rule Looks Like</mark>

The first word and colon build: on line 1 represents the name of a recipe called build.  

The list of files after the colon (go.c primes.c) represent all of the things that go depends upon. On the next line, there is a TAB (not spaces) followed by a compile command.  

This represents the steps (there could be more lines for more steps if there were any) that are required to “make” the “go” recipe.  

Now all we have to do from the command - line is type `make go`, and make will “make” the recipe for “go”.

### <mark style="background: #FFF503A6;">Additional Resources</mark> 

Below, you can find some more useful information about headers files and makefiles.  
- GNU C Compiler (gcc): Header Files
- Wikipedia: Header Files  
- GNU Make and GNU make manual  
- Wikipedia: Make  
- A Simple Makefile Tutorial  
- GNU Make in detail for beginners  
- UNIX Programming Tools

# <mark style="background: #FFF503A6;">03 C</mark>

### <mark style="background: #FFF503A6;">High-level Description</mark>

C is a compiled language that was initially used for writing system software.  

First a program is written and then compiled into an executable.  

On a Unix/Linux system, the compiler (cc = gcc) is free and operated on the command line.  

C is a structured procedural language.

<mark style="background: #FFF503A6;">Advantages</mark>
- <mark style="background: #FFF503A6;">Fast:</mark> It is a compiled language and so is close to the machine hardware.  
- <mark style="background: #FFF503A6;">Portable:</mark> You can compile your program to run on just about any hardware platform out there). 
- <mark style="background: #FFF503A6;">Mature:</mark> (a long history and lots of resources and experience available).  
- You have direct access to memory.  
- You have access to low-level system features if needed.  
- There are many tools for making programming easier (e.g., IDEs like Xcode).

<mark style="background: #FFF503A6;">Disadvantages</mark>
- It’s easy to get into trouble, e.g., with direct memory access & pointers. 
- There is a compile — test (crash) — debug cycle for each piece of code.  
- You must manage memory yourself.  
- It does not support Object-Oriented Programming.  
- Sometimes code is more verbose than in high-level scripting languages like Python, R, etc.

### <mark style="background: #FFF503A6;">Target Areas</mark>

When you need to process large volumes of data  

If you have a data processing operation or a simulation, and you know it will take a long time to run, then it is often worth it to spend some time implementing it in C.  

The graph compares the speed of interpreters for several languages.

![[Pasted image 20260206101823.png]]

Fortran can be faster than C.

C is optimal for many processing-based applications

![[Pasted image 20260206101905.png]]

### <mark style="background: #FFF503A6;">Print Statements</mark>

printf is part of the C library which contains many other useful functions as well.  

Standard practice to include the library into your code. This can be done by typing \#include  <stdio.h> in the source preamble.  

Program to print “Hello World” in the console:  
  
```C
#include <stdio.h>  
int main() {  
	printf("Hello World");  
}
```

### <mark style="background: #FFF503A6;">Data Types</mark>

Four basic data types  
  
<table>
	<tr>
		<th>Type</th>
		<th>Meaning</th>
		<th>size (bytes)</th>
		<th>size (bits)</th>
	</tr>
	<tr>
		<td>char</td>
		<td>Character</td>
		<td>1</td>
		<td>8</td>
	</tr>
	<tr>
		<td>int</td>
		<td>Integer</td>
		<td>4</td>
		<td>32</td>
	</tr>
	<tr>
		<td>float</td>
		<td>Single-precision floating point number</td>
		<td>4</td>
		<td>32</td>
	</tr>
	<tr>
		<td>double</td>
		<td>Double-precision floating point number</td>
		<td>8</td>
		<td>64</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Qualified Data Types</mark>

short, long qualifiers (caution - system dependent):  

<table>
	<tr>
		<th>Qualifier</th>
		<th>size (bytes)</th>
		<th>size (bits)</th>
	</tr>
	<tr>
		<td>short int</td>
		<td>2</td>
		<td>16</td>
	</tr>
	<tr>
		<td>long int</td>
		<td>8</td>
		<td>64</td>
	</tr>
	<tr>
		<td>long double</td>
		<td>16</td>
		<td>128</td>
	</tr>
</table>

also have signed and unsigned qualifiers

### <mark style="background: #FFF503A6;">Bytes</mark>

We have been talking about variable types and how many bytes they take up in memory.  

An important quantity to know about is that one byte is made up of 8 bits. One bit can take on two possible values: 0 or 1. An unsigned 8-bit variable can take on values between 0 and (28)-1 =255. A signed 8-bit variable can take on values between -128 to 127.  

When a variable is signed, it can take on negative values, and half of its total range is spread below zero, and the other half above zero.  

A signed int can take on values between -2,147,483,648 and +2,147,483,647. If we want to be able to represent integers larger than +2,147,483,647, then we can either use more bits (e.g., by using a long int), or by forcing all 32 bits of our int to be used on the positive side of zero.  

An unsigned int (4 bytes or 32 bits) can take on values between 0 and 4,294,967,295

### <mark style="background: #FFF503A6;">const keyword</mark>

The ``const`` keyword is used to specify that a variable’s value cannot be changed.  

It tells the compiler to prevent the user from changing the value of that variable.  
  
```C
#include <stdio.h>  
int main() {  
	// Try changing the value of x  
	const int x = 33;  
	printf("variable x is unchangeable: %d",x );  
	return 0;  
}
```

### <mark style="background: #FFF503A6;">Declarations</mark>

Unlike in languages like Python, R, Octave/Matlab, etc., which are dynamically typed, the C language is a statically typed language.  

From a practical point of view, this means in C we have to declare, up front, the type of every variable we use.  
  
See types.c on Brightspace.  

```C
#include <stdio.h>  
int main() {  
	double a = 123.456;  
	double b = 50.2;  
	double c = 100.0;  
	double d[] = {a, b, c};  
	printf("a=%.3f, b=%.3f, c=%.3f, d=[%.3f, %.3f, %.3f]\n", a, b, c, d[0],  
	d[1], d[2]);  
	return 0;  
}
```

### <mark style="background: #FFF503A6;">Expressions</mark>

Like in any other programming language, in C, there are many arithmetic, relational, and logical operators we can use to write expressions that are made up of simpler basic types.

### <mark style="background: #FFF503A6;">Arithmetic Operators</mark>

Binary arithmetic operators in C: + - * / %.  

When writing arithmetic expressions, we must always be aware of operator precedence, which is the order in which operators are applied when evaluating an expression.  

For example 4+5\*6 evaluates to 34, because the * operator has precedence over the + operator, and so the expression is evaluated as 4 + (5\*6), not (4+5)\*6.  

Parentheses can be used to enforce the order of evaluation, or, for clarity. 

E.g. double q = a\*x\*x+b\*x+c;  
versus  
double q = (a\*x\*x) + (b\*x) + c;

### <mark style="background: #FFF503A6;">Relational and Logical Operators</mark>

The relational operators are >, >=, < and <=, which all have equal precedence. There are also two equality operators: == and !=.  

A very common gotcha in C programming is to erroneously use the assignment operator = when you mean to use the equality operator \==, for example:  
- if (grade = 49) grade = grade + 1; // INCORRECT !!!
- if (grade == 49) grade = grade + 1; // CORRECT  

There are two logical operators && (logical AND) and || (logical OR).  

By default in C, the results of relational and logical operators are evaluated to integer values: 0 for FALSE and 1 for TRUE.

### <mark style="background: #FFF503A6;">Control Flow – for loop</mark> 
  
```C
#include <stdio.h>  
int main() {  
	int cumsum = 0;  
	int i;  
	
	for (i=1; i<=100; i++) {  
		cumsum = cumsum + i;  
	}  
	
	printf("the cumulative sum up to 100 is %d\n", cumsum);  
}
```  

See myfor.c on Brightspace

### <mark style="background: #FFF503A6;">Control Flow – conditional if/else</mark>

<mark style="background: #FFF503A6;">The basic if statement looks like this:</mark>

```C
if (conditional_expression){  
	program_statements;  
}else{  
	program_statements;  
}
```

The if ``program_statements`` are only executed if the ``conditional_expression`` returns a non-zero value, i.e. if it returns a value that is not FALSE (FALSE = 0).  

The else statements are executed otherwise.

### <mark style="background: #FFF503A6;">Functions</mark>
 
<mark style="background: #FFF503A6;">A function must be defined in the following way:</mark>
```C
returnType functionName (arg1Type arg1Name, arg2Type arg2Name) {  
	function_statement;  
	function_statement;  
	return returnVar;  
}
```  

On the first line, we begin by declaring the data type the function will return once it finishes.  

You can define a function that doesn’t return anything by using void.  

The next item is the name of the function, which you get to choose.  

Next is a list of input arguments that the function expects to see when it is called.  

Then in the body of the function is code, which does whatever you want the function to do.

Finally, we need to return a value if the return type is not void.

### <mark style="background: #FFF503A6;">Function Example</mark>

```C
#include <stdio.h>  
void writeMessage(void) {  
	printf("Hello there.\n");  
}  

int main() {  
	writeMessage();  
	return 0;  
}
```  

See myfunc.c on Brightspace.

### <mark style="background: #FFF503A6;">Functions</mark>

The ``#include`` statement is used to link a header file or a library with a source file. We’ve already seen example of this.  

``#include <stdio.h>`` indicates that we want to include all the content of the system header file stdio.h into our source file. So, for any source file, the template for using the ``#include`` statement is: 

``#include <file name>``  
or, for a user header file:  
``#include "file name"``

# <mark style="background: #FFF503A6;">04 GDB</mark>

### <mark style="background: #FFF503A6;">Debugging, not printf?</mark>

Debugging is the process of finding out where the bug in your code lies. It can fix crashes, remove any logical mistakes, and make your program more efficient.

<mark style="background: #FFF503A6;">gdb</mark> is a powerful debugging tool for C

<mark style="background: #FFF503A6;">Why not printf?</mark> The disadvantages of debugging using trace code are that you need many printf() statements all over your program, and it becomes a nuisance to put them in, take them out, etc.

Moreover a symbolic debugger can do a lot more stuff than simple trace code. It can:
- halt a program
- allow you to inspect variable values
- jump to an arbitrary line of code
- evaluate expressions
- restart from where you left off

### <mark style="background: #FFF503A6;">GDB</mark> 

GDB is the GNU’s Project debugger  

GDB gives an insight into what is actually happening within a program while it is running.  

There are 4 specific tasks GDB can help with to try identify bugs:  
- Start your program, specifying anything that might affect its behaviour.  
- Make your program stop on specified conditions.  
- Examine what has happened, when your program has stopped.  
- Change things in your program, so you can experiment with correcting the effects of one bug and go on to learn about another.

GDB is mainly used to debug programs written in C or C++.  

GDB is free software, protected by the gnu General Public License (GPL).

### <mark style="background: #FFF503A6;">Using GDB – Compiling Programs</mark>

To let GDB be able to read all that information line by line from the symbol table, we need to compile it a bit differently.  

A Debugging Symbol Table maps instructions in the compiled binary program to their corresponding variable, function, or line in the source code.  

Symbol tables may be embedded into the program or stored as a separate file. So if you plan to debug your program, then it is required to create a symbol table which will have the required information to debug the program.  

Use the –g flag when compiling your programs with GCC

### <mark style="background: #FFF503A6;">Running gdb – test case</mark> 

Try gdb out on the go.c code from last week.  

Run gdb from the directory containing the executable go using ``gdb go``  

To run the program in GDB, we type: ``run``  

If the program takes parameters we type run param1 param2 param3

### <mark style="background: #FFF503A6;">Using GDB – Commands</mark>

To stop the program: ``kill``  

To start the program again: ``run``  

To quit GDB: ``quit``  

There are a lot of GDB commands that we won’t cover in the slides, have a look at the help pages.

### <mark style="background: #FFF503A6;">GDB: Interaction with program execution</mark>

<mark style="background: #FFF503A6;">With GDB it is possible to:</mark>  
- Stop the program  
- See where the program has stopped  
- View contents of variables  
- Set variables  
- Call functions  
- Etc...

### <mark style="background: #FFF503A6;">GDB: View the operation of program</mark>  

Ctrl C will stop the program  

The continue keyword restarts the program  

For a stopped program, list shows us where the program currently is  

To step through the code use breakpoints with the next and step commands (we will cover breakpoints later in the slides)

### <mark style="background: #FFF503A6;">GDB: View content of a variable</mark>  

To view the content of a variable use the print command e.g. print age  

```shell
~ (main) $ gcc –g hello.c -o hello  
~ (main) $ gdb hello  
(gdb) break 10  
Breakpoint 1 at 0x11d2: file hello.c, line 11.  
(gdb) run  
Starting program: ~/hello  
Enter your age: 10  
Breakpoint 1, main () at hello.c:11  
11 }  
(gdb) print age  
$1 = 10
```

### <mark style="background: #FFF503A6;">GDB: Changing the value of a variable</mark>  

It is possible to change the value of a variable in GDB.  

If the program is not operating as expected, it is possible to set a variable.  

Eg. 
```shell
set age = 21  
print age
```

### <mark style="background: #FFF503A6;">GDB: Calling functions</mark>  

<mark style="background: #FFF503A6;">To call a function in C use the following:</mark> 
- call ``displayResults()``  
- Use the finish command to get the function to complete its actions and return a value (if any)

### <mark style="background: #FFF503A6;">GDB: Breakpoints</mark>  

A breakpoint can be added to stop the program executing at a particular point in the program. (ie a particular line number)  

It is also possible to stop the program at a specific function call.  

When the program has stopped it possible to values variables are holding, examine the stack and step through the program.

### <mark style="background: #FFF503A6;">GDB:: Breakpoint:: line</mark>

Enter GDB for the program in question

Add a breakpoint using the following syntax:
- ``break 12``
- This will add a breakpoint to line 12

When the program is run it will stop at each breakpoint in the program

If there are multiple files in the program, you must specify the filename when setting the breakpoint

```shell
break hello.c:12
```

### <mark style="background: #FFF503A6;">GDB:: Breakpoint:: function</mark>

Enter GDB for the program in question  

<mark style="background: #FFF503A6;">Add a function breakpoint using the following syntax:</mark>
- break myfunction  
- This will add a breakpoint to line 12  

When the program is run it will stop at each breakpoint in the program

### <mark style="background: #FFF503A6;">GDB:: Temporary Breakpoints</mark>  

A temporary breakpoint stops once, then the breakpoint is disposed of.  

<mark style="background: #FFF503A6;">Syntax:</mark> ``tbreak 12``  

The standard rules for the general breakpoints apply!!

### <mark style="background: #FFF503A6;">GDB:: View breakpoints</mark>

<mark style="background: #FFF503A6;">To get a list of all breakpoints:</mark>

```shell
info breakpoints
```

### <mark style="background: #FFF503A6;">GDB:: Breakpoints:: remove</mark>  

```shell
To remove a breakpoint use the following syntax:
```

```shell
disable 12
```

### <mark style="background: #FFF503A6;">GDB:: Breakpoints:: skip</mark> 

If you wish to skip a breakpoint, use the following syntax:  

```shell
ignore 12 1
```  

This will ignore the breakpoint on line 12 for one iteration.

### <mark style="background: #FFF503A6;">GDB:: Watchpoints</mark>

A watchpoint can be added to a variable.  

If we have a variable named age: ``watch age``  
- Read watchpoint: ``rwatch age`` 
- Read/Write watchpoint: ``awatch age``  

The standard breakpoint command work with watchpoints:  ``info, disable``

### <mark style="background: #FFF503A6;">GDB:: Backtrace</mark>

The backtrace command can be used to examine the stack to see the the stack frames that control program flow.  

The stack frames are used to tell a function where to return to after a function is called.  

To examine a stack frame: ``info frame``  

The <mark style="background: #FFF503A6;">backtrace</mark> command gives a list of the stack frames  

The frame command can be used to switch between stack frames: ``frame 12``

### <mark style="background: #FFF503A6;">DDD – Data Display Debugger</mark> 

DDD is a GUI for debugging programs  

The default debugger for DDD is GDB  

The standards operation of GDB is the exact same, the only benefit is this is a GUI application instead of the command line  

<mark style="background: #FFF503A6;">More info:</mark> https://www.gnu.org/software/ddd/manual/pdf/ddd.pdf

### <mark style="background: #FFF503A6;">Additional Resources</mark>

<mark style="background: #FFF503A6;">GDB Documentation:</mark>
- https://www.sourceware.org/gdb/documentation/ 
- https://www.sourceware.org/gdb/  

<mark style="background: #FFF503A6;">DDD:</mark> https://www.gnu.org/software/ddd/manual/pdf/ddd.pdf

# <mark style="background: #FFF503A6;">05 Processes and Signals</mark>

<mark style="background: #FFF503A6;">Overview</mark>
- Basics of Processes
- System Calls
- Exec and Fork
- Signals and Interrupts

### <mark style="background: #FFF503A6;">Processes</mark> 

The running instance of a program is called a process.  

Multiple processes can be used to perform multiple tasks concurrently.  

This can make use of existing programs in the system environment.  

Programmers can make use of this functionality when writing programs

### <mark style="background: #FFF503A6;">Processes in Linux</mark>

In a Linux environment, the functions that are used to manipulate processes are found in the unistd.h header file. 

Have a look at the following for more details: http://pubs.opengroup.org/onlinepubs/7908799/xsh/unistd.h.html

### <mark style="background: #FFF503A6;">Process Ids</mark>

Every process that is running in a Linux environment must be <mark style="background: #FFF503A6;">uniquely identifiable</mark>. Why??  

A <mark style="background: #FFF503A6;">process ID</mark> is used as the unique identifier for a process.  

The process IDs are <mark style="background: #FFF503A6;">16 bit numbers</mark> and are assigned <mark style="background: #FFF503A6;">sequentially</mark> as processes are spawned.  

Every process has a parent, this can be thought of as a tree structure, where the <mark style="background: #FFF503A6;">init process</mark> is root.

The ps command can be used to get the processes that are running on the current system

### <mark style="background: #FFF503A6;">Terminating a Process</mark> 

The kill command is used to kill a process.  

The kill command sends a ``SIGTERM`` signal to the process.  

Other signals can be sent to a process, we will see this later in the slides.

### <mark style="background: #FFF503A6;">Kill Example</mark> 

Open a calculator  

Use the PS command with pgrep to find the process  

Kill the process with: kill 1896 (if 1896 is the process id)

### <mark style="background: #FFF503A6;">System Calls</mark> 

The system call is the fundamental interface between an application and the Linux kernel.  

The following link contains a comprehensive list of system calls: http://man7.org/linux/man-pages/man2/syscalls.2.html

### <mark style="background: #FFF503A6;">Creating a process</mark> 

In Linux there are two main ways to start a process in a C program:  
- System
- Fork and Exec  

There are some overheads associated with using system, so the preferred option should be fork and exec. There are also some security concerns associated with using system.

### <mark style="background: #FFF503A6;">System</mark>

The system function is part of the ``stdlib.h`` library.  

System allows a C program to run a command (similar to one you would run in a terminal window)  

E.g.  
```C
#include <stdlib.h>  

int main() {  
	return system("ls -la");  
}
```

### <mark style="background: #FFF503A6;">Fork</mark>

The fork command can be used to make a <mark style="background: #FFF503A6;">duplicate</mark> copy of its parent process.  

Fork will duplicate a process. The duplicate is referred to as the <mark style="background: #FFF503A6;">child process</mark>.  

Both processes continue executing from the point the programs forked.  

Both have separate and <mark style="background: #FFF503A6;">unique process IDs</mark>.

### <mark style="background: #FFF503A6;">Fork Example</mark>

```C
#include<stdio.h>  
#include<unistd.h>  

int main(int argc, char **argv)  
{  
	printf("Start\n");  
	pid_t pid = fork();  
	printf("\nMy PID is: %d", pid);  
	if (pid == 0)  
	{  
		printf("\nHello from the child process!!\n\n\n");  
	}  
	else if (pid > 0)  
	{  
		printf("\nHello from the parent process!!\n\n\n");  
	}  
	else  
	{  
		printf("Something went wrong!!");  
		return 1;  
	}  
	printf("End");  
	return 0;  
}
```

The returned process ID is of type ``pid_t``  

The fork command will return the pid. The parent will have a ``pid > 0`` and the child will have a pid of 0.  

To get the real pid for the child process use the ``getpid()`` function.

### <mark style="background: #FFF503A6;">exec</mark>

The exec function can be used to replace a program instance currently running in a process.  

When the exec function is called the current process stops and a new program starts executing  

Can be useful to pass over restricted access to executable to original pid with restricted access or to keep pids clean without a hanging parent.  

In shell scripts, it tells the interpreter to replace itself with the program it runs.  

Should only be run at the end of a shell script since nothing will run afterwards.  

Saves a pid and about 1ms of CPU time.

See man exec  

<mark style="background: #FFF503A6;">xecvp and execlp:</mark> Take a program name, doesn’t require full page name  

<mark style="background: #FFF503A6;">execv, execvp, execve:</mark> Accept an argument list for the new program (null terminated array)  

<mark style="background: #FFF503A6;">execve and execle:</mark> Accept an array of null terminated environmental values

### <mark style="background: #FFF503A6;">Exec example</mark>

  
```C
#include <stdio.h>  
#include <stdlib.h>  
#include <unistd.h> /* for fork */  
#include <sys/types.h> /* for pid_t */  
#include <sys/wait.h> /* for wait */  

int{  
	main()  
		char *argv[]={"echo","Echo is running now....",NULL};  
		//argv[0] is the command to run: echo  
		//argv[1] text to be echoed  
		//argv[2] null, needed!!  
		execv("/bin/echo",argv);  
		printf("Im the last thing in this program to output!!");  
		return  
}
```

See execExample.c

### <mark style="background: #FFF503A6;">Using fork and exec together</mark> 
  
```C
#include <stdio.h>  
#include <stdlib.h>  
#include <unistd.h> /* for fork */  
#include <sys/types.h> /* for pid_t */  
#include <sys/wait.h> /* for wait */  

int main()  
{ /*Spawn a child to run the program.*/  
	pid_t pid=fork();  
	if (pid==0) { /* child process */  
		char *argv[]={"echo","Echo is running now....",NULL};  
		sleep(15);  
		execv("/bin/echo",argv);  
		exit(127); /* only if execv fails */  
	}  
	else  
	{ /* pid!=0; parent process */  
		printf("The parent keeps doing whats its doign!!");  
		sleep(3);  
	}  
	return 0;  
}  
```

See execExample-2.c  

Here we fork the program and get exec to run a different process in the fork.  

What do you think happens when we run this?

### <mark style="background: #FFF503A6;">Signals</mark>  

A signal is a software interrupt  

A program needs to be able to handle software interrupts.

A signal can be used to send an asynchronous message to a program.  

Depending on the signal that was sent the program can decide how to proceed.

### <mark style="background: #FFF503A6;">Signals in Linux</mark>

In Linux there are a pre-defined set of Signals that perform specific tasks.  

```shell
kill -l
```

![[Pasted image 20260213093333.png]]

### <mark style="background: #FFF503A6;">Signal Description</mark>

man 7 signal

![[Pasted image 20260213093421.png]]

### <mark style="background: #FFF503A6;">Signals in Linux</mark> 

When a signal is received, the process needs to tell the kernel how to proceed.  

<mark style="background: #FFF503A6;">Potentially, there are 3 possible options:</mark>  
- Ignore the signal  
- Catch the signal  
- Go with the signal default  

Note: The specific signals for kill cannot be ignored or caught (Sigkill and Sigstop). Why? If the kernel or an administrator need to stop a process they should be able to do so.  

The header file that offers signal functionality is ``signal.h``

### <mark style="background: #FFF503A6;">Signal Example</mark> 

```C
#include<stdio.h>  
#include<signal.h>  
#include<unistd.h>  

void sig_handler(int sigNum)  
{  
	if (sigNum == SIGINT)  
		printf("SIGINT Interrupt Received\n");  
	}  

	int main(void)  
	{  
		if (signal(SIGINT, sig_handler) == SIG_ERR) 
		{  
			printf("\nSomething went wrong!!\n");  
		}  
		// Infinite Loop  
		while(1) 
		{  
			sleep(1);  
		}  
	return 0;  
}
``` 

See ``signal.c``  

Compile and run this code  

What do you expect to see when you try and terminate with Ctrl-C?  

Open a second terminal and look for the process using  

```C
ps –aux | grep a.out
```  

Try ``kill <pid>``  

Note that ``kill –n <pid>`` gives increasingly aggressive kill signals

# <mark style="background: #FFF503A6;">06 File IO and profiling</mark>


<mark style="background: #FFF503A6;">Overview</mark>
- Recap on last week (also exec_examples)  
- Unix file system organisation  
- Profiling with gprof

### <mark style="background: #FFF503A6;">execl and execv families</mark>

``execl, execlp, execle``  

``execv, execve, execvp, execvpe`` 

<mark style="background: #FFF503A6;">Common features:</mark>  
- All functions take the file name of the program to be executed as the first argument.  
- All replace the current process with the new program.  
- None create a new process; they replace the existing one.

### <mark style="background: #FFF503A6;">Differences in execl and execv</mark>  

<mark style="background: #FFF503A6;">1. Argument format:</mark>  
- execl, execlp, execle: Take individual arguments as separate strings after the filename.  
- execv, execve, execvp, execvpe: Take an array of null-terminated string pointers (including the filename) as the second argument.  

<mark style="background: #FFF503A6;">2. Path searching:</mark>  
- ``execl:`` Searches only the current directory or the root directory (/).  
- ``execlp:`` Similar to ``execl``, but also searches the directories listed in the PATH environment variable if the filename doesn't contain a slash (/).  
- ``execle:`` Identical to ``execl``, but allows setting the environment variables for the new process.  
- ``execv:`` No automatic path searching; requires the full path to the executable.  
- ``execve:`` Identical to ``execv``, but allows setting the environment variables for the new process.  
- ``execvp:`` Similar to ``execv``, but also searches the directories listed in the PATH environment variable.  
- ``execvpe:`` Identical to ``execvp``, but allows setting the environment variables for the new process.

### <mark style="background: #FFF503A6;">exec function summary</mark>

``execl`` and ``execlp`` are good for simple cases where you know the exact location of the program and don't need to set the environment.  

``execv`` and ``execvp`` require the full path to the program but offer more flexibility with arguments and environment. 

``execle`` and ``execve`` are similar to their corresponding non-e versions but allow setting the environment.  

``execvp`` and ``execvpe`` search the PATH for the program like ``execlp`` but offer environment control like ``execve``.

### <mark style="background: #FFF503A6;">Choosing an exec function</mark> 

Use execl or execlp when you know the program location and don't need environment control.  

Use execv or execvp when you need precise control over arguments and environment, or when the program location might be in the PATH.  

Use execle or execve if you need environment control along with the basic functionality of execl or execv.  

Use execvp or execvpe for the flexibility of path searching combined with environment control.

### <mark style="background: #FFF503A6;">Some exec demonstrations</mark>

<mark style="background: #FFF503A6;">See exec_examples in this week’s ClassCode folder:</mark>  
1. execl_example.c  
2. execle_example.c  
3. execlp_example.c  
4. execv_example.c  
5. execve_example.c  
6. execvp_example.c  
7. execvpe_example.c

### <mark style="background: #FFF503A6;">File Systems</mark>

A file system is a software that dictates how to store and read data from disks.  

<mark style="background: #FFF503A6;">Addresses the following:</mark>
- Provides API to access data on the disk that programs can use.  
- Universal way for accessing different storage devices.  
- Physical operations on the disk storage.

### <mark style="background: #FFF503A6;">Directory Structure</mark>  

The Unix directory structure follows the POSIX standard.  

The Portable Operating System Interface (POSIX) is a family of standards specified by the IEEE  

Computer Society for maintaining compatibility between operating systems  

It has several predefined directories that we cannot move or rename.  

We’re allowed to put our data only in specific paths.

### <mark style="background: #FFF503A6;">Root Directory</mark>

Unix operates a hierarchical file system.  

It treats everything as either a file or a directory, this makes the file system very efficient and effective.  

The POSIX standard says that the file system should have a top-level directory called the root directory.  

The slash sign / indicates the root directory.  

All directories and files of all connected disk drives are below the root directory.

### <mark style="background: #FFF503A6;">Mounting</mark>

If we want to access the contents of a disk drive, we should mount it.  

Mounting means embedding the contents of a disk into the root directory.  

When mounting is done, we can access the disk contents through some path.  

This path is called a mount point. If we go to the mount point, we enter the file system of the disk.

### <mark style="background: #FFF503A6;">Basic File System Navigation</mark>

![[Pasted image 20260220090321.png]]

### <mark style="background: #FFF503A6;">/bin</mark> 

/bin is a standard subdirectory of /  

Its main function is to store basic system executable programs (binaries).  

These can be used as part of the very early boot stage, to offer user functionality, or repairing a system  

Binaries like cat, ls etc

### <mark style="background: #FFF503A6;">/sbin</mark>

/sbin is short for system binaries  

/sbin is a standard subdirectory of the root directory and contains executables that are mostly administrative tools.  

/sbin's programs are normally executed only by the root user or require superuser privileges  

/sbin by default is not in the PATH environment variable of ordinary users

### <mark style="background: #FFF503A6;">/usr/bin</mark>  

/usr/bin contains executable files that are not part of the core operating system.  

Binaries for general-purpose everyday tasks.  

Utilities commonly used by regular users like editors, networking tools, graphics programs, etc.

### <mark style="background: #FFF503A6;">/usr/sbin</mark>  

This directory contains program binaries for system administration which are not essential for the boot process  

System admin for managing user-related aspects like printing etc.  

Requires root privileges.

### <mark style="background: #FFF503A6;">/dev</mark>  

The /dev directory contains specific device files.  

These files are created during the installation process.

### <mark style="background: #FFF503A6;">/etc</mark>

The /etc directory is used to store files that are used in the administration and management of user accounts, file system, device drivers etc.  

It is primarily made up of configuration files.  

A configuration file is a local file used to control the operation of a program.  

“Editor’s Text Configuration” – text files heavily used to configure early unix systems – this was a central location for these.

### <mark style="background: #FFF503A6;">/lib</mark> 

The /lib directory contains kernel modules and shared library images.  

These are used to boot the system and to run commands in the root filesystem  

A library file in /lib has a .so extension. (These are equivalent to`dll` files in Windows)  

The main concept is to allow programs to include functionality be referencing the /lib directory.  

The files in the /lib directory can be described as providing system functionality.

### <mark style="background: #FFF503A6;">Permissions</mark>  

On Unix-like systems, file permissions help to access, write, and execute the files.  

These permissions restrict the other users from performing an unauthorised activity, and thus they maintain security.  

<mark style="background: #FFF503A6;">There are three principal permissions in Linux:</mark>  
- Read – The read permission provides the capability to read/view the file's contents. We execute this permission with the letter r.
- Write – The write permission provides the ability to modify the file, i.e., add or remove contents from the file. We execute this permission with the letter w.
- Execute – The execute authorisation offers the ability to run the file. For example, you'll need this permission to run a shell script. The letter x describes this permission.  

Investigate permissions with ``ls –l`` and ``chmod``.

### <mark style="background: #FFF503A6;">Permission Groups</mark> 

The Linux permissions model has three user categories.  

<mark style="background: #FFF503A6;">Every user class has its reading, writing, and executing permissions set:</mark>
1. Owner: The owner category provides info about an owner’s actions.  
2. Group: The group describes a group member's actions associated with the file/directory.  
3. Other: Similarly, the other category describes actions that the other member can perform.

### <mark style="background: #FFF503A6;">Checking File Permissions</mark> 

We use the ls command to check the file permissions with an extension `l` indicating the long list format.  

<mark style="background: #FFF503A6;">Here’s the syntax:</mark> ``ls –l <filename>``

### <mark style="background: #FFF503A6;">Permission Field Explained</mark>  

Each column in the permission field from ls –l has particular meaning.  

<mark style="background: #FFF503A6;">The first character indicates the file type. This can be:</mark>  
- A dash (-) for a regular file.  
- d for a directory.  
- l for a symbolic link (a shortcut to another file or directory).  

<mark style="background: #FFF503A6;">Next, we find permission classes composed of nine characters representing three triplets of three characters each:</mark>
- Permissions for the file owner, also referred to as the user or u.  
- Permissions for the group owning the file, also referred to as g.  
- Permissions for anyone else, also known as others or o.  

<mark style="background: #FFF503A6;">Permission are represented by combinations the three characters - rwx:</mark>  
- r is short for read, which means that we can open a file and read its contents.  
- w is short for write, which means that we can edit or delete a file.  
- x is short for execute, which means a file can be run as an executable or script.  
- A dash means permission is not provided.

### <mark style="background: #FFF503A6;">Changing File Permissions</mark>  

Syntax for setting permissions: 
``chmod [OPTIONS] NUMBER FILE``  

The NUMBER is a three-digit string, each digit (0 - 7) representing the permission for one category of users.  

The corresponding value for each permission possibility is:  
- 4 -> read
- 2 -> write
- 1 -> execute
- 0 -> none  

E.g. ``rw- would be 4+2+0=6``  

Can also modify permissions by adding + or removing - permissions to a particular group e.g. ``chmod u+x FILE``

### <mark style="background: #FFF503A6;">Question</mark> 

Imagine we had a file called `example.md`,  

Grant the read and write permissions to the owner of example.md and only read permission to group members and all other users.  

What would the chmod command look like?

### <mark style="background: #FFF503A6;">File Operations</mark>

<mark style="background: #FFF503A6;">What can we do:</mark>  
- Create a new file  
- Open a file  
- Read a file  
- Close a file

### <mark style="background: #FFF503A6;">fopen</mark>  

Before a file can be read or written to, it has to be opened using the fopen() function.  

It takes as arguments a string corresponding to the filename, and a second argument (also a string) corresponding to the mode.  

The mode is read (“r”), write (“w”) or append (“a”).  

The fopen() function then returns a pointer to the (open) file.  

See ClassCode/file-examples/file_example1.c  

<mark style="background: #FFF503A6;">Note:</mark> If a multi-word string is supplied to ``scanf()``, only the first word gets stored in the array

### <mark style="background: #FFF503A6;">fgets</mark>  

fgets is a function in the C programming language that reads a limited number of characters from a given file stream source into an array of characters.  

fgets stands for file get string. It is included in the C standard library header file stdio.h.  

It allows us to use a read a multi-word string without the clumsy format specifier that we require for fscanf  

``The prototype of the function is as follows:``  
``char* fgets(char *string, int length, FILE * stream);``  

See ClassCode/file-examples/file_example5.c

### <mark style="background: #FFF503A6;">fputs</mark>  

fputs() is a standard C library function that is used to write a string of characters to a file at the location indicated by the file pointer.  

<mark style="background: #FFF503A6;">Declaration of the fputs() function:</mark>
``int fputs (const char * str, FILE * stream);``  

The ``fputs()`` function returns 0 if the string is written to the file successfully.  

EOF is returned if there is an error when writing to the file.  

See ClassCode/file-examples/file_example3.c

### <mark style="background: #FFF503A6;">fread and fwrite</mark> 

The fread library function in C is used to read values from a given data stream and put them values into an array.  

The fread function takes in the following 4 parameters:  
1. ptr − points to a block of memory that is at least size len bytes long.  
2. len − number of elements that need to be read, where each element is size bytes long.  
3. size − size of each element (in bytes) that needs to be read.  
4. input − points to a FILE object that determines a stream of input.  

The fwrite() function writes binary and text data from an array to a given data stream.  

<mark style="background: #FFF503A6;">Takes the following parameters:</mark>  
5. buffer: points to the first object in the array to be written  
6. size: the item size in bytes  
7. count: the number of the objects to be written  
8. stream: points to a FILE object that specifies an output stream  

<mark style="background: #FFF503A6;">Example of fread and fwrite:</mark> ClassCode/file-examples/file_example6.c

### <mark style="background: #FFF503A6;">Profiling with gprof</mark>  

gprof is a linux utility program that can help you determine which parts of your program are taking most execution time.  

<mark style="background: #FFF503A6;">The basic steps are:</mark>  
1. compile your program with profiling enabled (using the -pg compiler flag)  
2. execute your program once to generate a profile data file  
3. run gprof to analyse the profile data  

<mark style="background: #FFF503A6;">Example:</mark> ClassCode/gprof_example.c  

Compile it and run with the `time` command to show its runtime – doesn’t provide much information...

### <mark style="background: #FFF503A6;">gprof in practice</mark>

![[Pasted image 20260220091554.png]]

### <mark style="background: #FFF503A6;">More on gprof profiling</mark>

Profiling works by changing how every function in your program is compiled so that when it is called.  

It will stash away some information about where it was called from.  

From this, the profiler can figure out what function called it, and can count how many times it was called.  

This change is made by the compiler when your program is compiled with the ``-pg`` option, which causes every function to call ``mcount`` as one of its first operations.

The mcount routine, included in the profiling library, is responsible for recording in an in-memory call graph table both its parent routine (the child) and its parent's parent.  

Profiling also involves watching your program as it runs, and keeping a histogram of where the program counter happens to be every now and then.

gprof is an instrumenting profiler, it is profiling the same code you would compile in release without profiling instrumentation.  

There is an overhead associated with the instrumentation code itself.  

Also, the instrumentation code may alter instruction and data cache usage.  

A sampling profiler works on non-instrumented code by looking at the target program's program counter at regular intervals using operating system interrupts.  

It can also query special CPU registers to give you even more insight of what's going on.

# <mark style="background: #FFF503A6;">07 Orphans Zombies and Daemons</mark>

<mark style="background: #FFF503A6;">Overview:</mark>
- Orphan Processes  
- Zombie Processes  
- Daemons  
- Steps to create a daemon  
- Init, Upstart and systemd  
- Required Reading

### <mark style="background: #FFF503A6;">Process Groups</mark>

Every process running is part of a unique process group (PGID)  

When a process is created, it becomes a member of the group its parent is in.  

The first process member in the group sets the PGID to be equal to its PID.  

The first member in the group is referred to as the Group Leader  

A process group is a group of related process which may be collectively running in the foreground

### <mark style="background: #FFF503A6;">Process Groups – System Calls</mark> 

Useful Process Group commands (see man for more details)  
- ``getpgrp()``  
- ``getpgid(0)``  
- ``getpgid(PID)``  

<mark style="background: #FFF503A6;">Shell Commands:</mark> To list the PGID with the ps command use the –j flag

### <mark style="background: #FFF503A6;">Session and Session Groups</mark> 

A session group is a collection of process groups, often linked to a terminal, with one process group taking input at a time (foreground).  

All processes are grouped by sessions  

Try: ``ps axo pid,ppid,pgid,sid | sort –k 4n``  

These are linked to types of groups, eg. A user logs in, all processes the user has running are in its Session Group.  

When a user logs out, the kernel will terminate all processes in the users session group.  

The session's ID is the same as the pid of the process that created the session through the ``setsid()`` system call.  

This session is referred to as the Session Leader.  

The ``setsid()`` system call takes no parameters and will return the new session id.

### <mark style="background: #FFF503A6;">Controlling Terminal</mark>

Every session is associated with a terminal  

Processes in the session get Input and Output from the terminal  

A session is linked to a terminal (this is called the Controlling Terminal or Controlling tty)  

A terminal can be the controlling terminal for only one session at a time.  

An individual process disconnects from its controlling terminal when it calls ``setsid`` to become the leader of a new session

One of the attributes of a process is its controlling terminal.  

Child processes created with fork inherit the controlling terminal from their parent process.  

In this way, all the processes in a session inherit the controlling terminal from the session leader.  

A session leader that has control of a terminal is called the controlling process of that terminal.  

Try ``example_setsid.c``  

An individual process disconnects from its controlling terminal when it calls ``setsid`` to become the leader of a new session  

<mark style="background: #FFF503A6;">Source:</mark> https://www.gnu.org/software/libc/manual/html_node/Controlling-Terminal.html

### <mark style="background: #FFF503A6;">File Descriptor</mark>

Each time a file is opened, the OS creates a record to represent the file.  

This information is stored in the system kernel.  

An integer value is assigned to each record/entry.  

This integer value is the file descriptor. If a process has opened 5 files, there will be 5 file descriptors associated with the process.  

See example_filed.c [Note std i/o/err may occupy 0/1/2]

### <mark style="background: #FFF503A6;">Orphan Processes</mark>

An orphan process is a process whose parent has terminated.  

The orphan will default back to init as its parent (PPID of 1).  

<mark style="background: #FFF503A6;">The orphan will continue to run until it is killed:</mark> 
- Kill -9 PID  
- Where PID is the process ID of the orphan

### <mark style="background: #FFF503A6;">Orphan Processes Example</mark>  

Trial ``example_orphan.c``  

Note when running that the parent terminates after 5 seconds and the child is orphaned  

Orphans are adopted by init (pid=1), or system –user if managing user services in a user session  

Need to kill the orphan

### <mark style="background: #FFF503A6;">Zombie Processes</mark> 

When a process terminates, it isn't removes straight away from memory.  

The process status becomes ``EXIT_ZOMBIE`` and its parent is notified via ``SIGCHLD`` signal.  

The parent should execute the wait() system call to read the child processes exit status.  

Once the parent has processed this information from the child, the terminated process can be removed from memory.  

If the parent is unable to process this information the child process becomes a Zombie Process  

The zombie doesn’t get the signal to leave the memory.

### <mark style="background: #FFF503A6;">Zombie Example</mark>  

Try out example_zombie.c  

Note the process state codes - Defunct (‘zombie’) process, terminated but not cleaned up.  

This means that a dead process isn’t immediately removed and continues to hog the system’s memory, hence becoming a zombie  

```bash
ps -wax |grep a.out  
559488 pts/1 S+ 0:00 ./a.out  
559489 pts/1 Z+ 0:00 [a.out] <defunct>
```

### <mark style="background: #FFF503A6;">Daemons</mark> 

A daemon is a process that runs in the background not under the control of a user.  

A daemon usually has a Parent PID of 1. They are usually started when the system is booted and will only terminate on shutdown.  

<mark style="background: #FFF503A6;">Example:</mark> ``crond, ftpd, rlogind, mysqld, apache``

### <mark style="background: #FFF503A6;">Steps to create example daemon</mark>  
1. <mark style="background: #FFF503A6;">Forking:</mark> It creates two child processes from the main process (parent). The parent exits, leaving the first child to run independently. This child becomes the session leader.  
2. <mark style="background: #FFF503A6;">Ignoring Signals:</mark> It ignores certain signals like SIGCHLD (child process termination) and SIGHUP (terminal hangup) to prevent unexpected behavior.  
3. <mark style="background: #FFF503A6;">Second Fork:</mark> Another fork happens, ensuring the session leader process exits. The remaining child becomes the actual daemon process.  
4. <mark style="background: #FFF503A6;">Environment Setup:</mark> The daemon changes its working directory to the root (/) and sets permissions using umask.  
5. <mark style="background: #FFF503A6;">Closing Files:</mark> It closes all open file descriptors to prevent resource leaks.  
6. <mark style="background: #FFF503A6;">Logging:</mark> It opens a log file named "firstdaemon" and logs a message indicating startup.  
7. <mark style="background: #FFF503A6;">Main Loop:</mark> The daemon enters an infinite loop, logging every 20 seconds that it's running. Finally, it logs its termination and closes the log file.

### <mark style="background: #FFF503A6;">Daemon example</mark>  

Compile the code: gcc -o mydaemon example_daemon.c  

Start the daemon: ./mydaemon  

<mark style="background: #FFF503A6;">See it running:</mark>  
```bash
ps –aux | head -1  
ps -aux| grep mydaemon
```

### <mark style="background: #FFF503A6;">Daemon example results</mark> 

The output should be similar to this:  
```shell
F UID PID PPID PRI NI VSZ RSS WCHAN STAT TTY TIME COMMAND  
1 1001 594869 3060 20 0 2776 1280 hrtime S ? 0:00 ./mydaemon
```  

<mark style="background: #FFF503A6;">What you should see here is:</mark>  
- The daemon has no controlling terminal (TTY = ?)  
- The parent process ID (PPID) is 1 (The init process), or else a system –user process  
- The PID != SID which means that our process is NOT the session leader (because of the second fork())  
- Because PID != SID our process can't take control of a TTY again  

<mark style="background: #FFF503A6;">Reading the syslog:</mark>  
- Locate your syslog file. Mine is here: /var/log/syslog  
- Do a: grep –a mydaemon /var/log/syslog  
- The output should be similar to this:  

```shell
Feb 15 17:41:46 soc-DZY0LX3-SOS mydaemon[596450]: mydaemon started  

Feb 15 17:42:06 soc-DZY0LX3-SOS mydaemon[596450]: mydaemon terminated
```

### <mark style="background: #FFF503A6;">Error Logging</mark>  

How can a daemon deal with error messages?  

It doesn’t have access to standard_error, as it doesn’t have a controlling terminal.  

One option could be to write the error messages to a file, but this could get messy if there were loads of daemons writing to loads of files.  

A central solution would be best  

Most daemons use the syslog function to generate log messages.  

We seen an example of this in the daemon code.

### <mark style="background: #FFF503A6;">Process Status Codes</mark>  

<table>
	<tr>
		<td>D</td>
		<td>uninterruptible sleep (usually IO)</td>
	</tr>
	<tr>
		<td>R</td>
		<td>running or runnable (on run queue)</td>
	</tr>
	<tr>
		<td>S</td>
		<td>interruptible sleep (waiting for an event to complete)</td>
	</tr>
	<tr>
		<td>T</td>
		<td>stopped, either by a job control signal or because it is being traced</td>
	</tr>
	<tr>
		<td>W</td>
		<td>paging (not valid since the 2.6.xx kernel)</td>
	</tr>
	<tr>
		<td>X</td>
		<td>dead (should never be seen)</td>
	</tr>
	<tr>
		<td>Z</td>
		<td>defunct ("zombie") process, terminated but not reaped by its parent</td>
	</tr>
</table>

<mark style="background: #FFF503A6;">Note:</mark> you can view these by typing `man ps`

### <mark style="background: #FFF503A6;">ps – available info</mark>  
- PPID – Parent Process ID 
- PID – Process ID  
- PGID – Process Group ID  
- SID – Session ID  
- TTY – Controlling Terminal  
- TPGID – Controlling tty process group ID  
- STAT – Process Status Codes  
- UID – Effective User Id

### <mark style="background: #FFF503A6;">Required Reading</mark>  

How To Write a UNIX Daemon by Dave Lennert (Hewlett-Packard Company) - http://cjh.polyplex.org/software/daemon.pdf  

Advanced Programming in the Unix Environment – Second Edition – W. Richard Stevens and Stephen A. Rago - Chapter 13. Daemon Processes

# <mark style="background: #FFF503A6;">08 C Refresher - Pointers</mark>

### <mark style="background: #FFF503A6;">What is the stack?</mark>  

It’s a special region of your computer’s memory that stores temporary variables created by each function (including the main() function).  

The stack is a <mark style="background: #FFF503A6;">“LIFO” (last in, first out)</mark> data structure, that is managed and optimised by the CPU quite closely.  

Every time a function declares a new variable, it is “pushed” onto the stack.  

Then every time a function exits, all of the variables pushed onto the stack by that function, are freed (that is to say, they are deleted).  

Once a stack variable is freed, that region of memory becomes available for other stack variables

### <mark style="background: #FFF503A6;">Memory Management with Stack</mark> 

The advantage of using the stack to store variables, is that memory is managed for you.  

You don’t have to allocate memory by hand, or free it once you don’t need it anymore.  

What’s more, because the CPU organises stack memory so efficiently, reading from and writing to stack variables is very fast.

### <mark style="background: #FFF503A6;">Stack variables are local in Nature</mark>

A key to understanding the stack is the notion that <mark style="background: #FFF503A6;">when a function exits</mark>, all of its variables are popped off of the stack (and hence lost forever).  

Thus stack variables are <mark style="background: #FFF503A6;">local</mark> in nature.  

This is related to a concept known as <mark style="background: #FFF503A6;">variable scope</mark>, or local vs global variables.  

A common error in C programming is attempting to access a variable that was created on the stack inside some function, from a place in your program outside of that function (i.e. after that function has exited) – see ``example_stack.c``

### <mark style="background: #FFF503A6;">Limitation of the Stack</mark>  

Another feature of the stack to keep in mind, is that there is a limit (varies with OS) on the size of variables that can be stored on the stack.  

This is not the case for variables allocated on the <mark style="background: #FFF503A6;">heap</mark>.

### <mark style="background: #FFF503A6;">The Heap</mark>

The heap is a region of your computer’s memory that is not managed automatically for you, and is not as tightly managed by the CPU. It is a more free-floating region of memory (and is larger).  

Unlike the stack, the heap does not have size restrictions on variable size (apart from the obvious physical limitations of your computer).  

Also, unlike the stack, variables created on the heap are accessible by any function, anywhere in your program. Heap variables are essentially global in scope.  

However, heap memory is slightly slower to be read from and written to, because one has to use <mark style="background: #FFF503A6;">pointers</mark> to access memory on the heap.

### <mark style="background: #FFF503A6;">Memory Leak</mark> 

To allocate memory on the heap, you must use malloc() or calloc(), which are built-in C functions.  

Once you have allocated memory on the heap, you are responsible for using free() to deallocate that memory once you don’t need it anymore.  

If you fail to do this, your program will have what is known as a <mark style="background: #FFF503A6;">memory leak</mark>. That is, memory on the heap will still be set aside (and won’t be available to other processes).  

The stack and the heap have their own benefits and risks in terms of memory handling.

### <mark style="background: #FFF503A6;">Stack vs Heap – Pros and Cons</mark>  

<table>
	<tr>
		<td>Stack</td>
		<td>Heap</td>
	</tr>
	<tr>
		<td>very fast access</td>
		<td>(relatively) slower access</td>
	</tr>
	<tr>
		<td>local variables only</td>
		<td>variables can be accessed globally</td>
	</tr>
	<tr>
		<td>limit on stack size (OS-dependent)</td>
		<td>no limit on memory size</td>
	</tr>
	<tr>
		<td>variables cannot be resized</td>
		<td>variables can be resized using realloc()</td>
	</tr>
	<tr>
		<td>don’t have to explicitly de-allocate variables</td>
		<td>you must manage memory (you’re in charge of allocating and freeing variables)</td>
	</tr>
	<tr>
		<td>space is managed efficiently by CPU, memory will not become fragmented</td>
		<td>no guaranteed efficient use of space, memory may become fragmented over time as blocks of memory are allocated, then freed</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">When should you use the heap?</mark> 

If you need to allocate a large block of memory (e.g. a large array, or a big struct), and you need to keep that variable around a long time (like a global), then you should allocate it on the heap.  

If you need variables like arrays and structs that can change size dynamically (e.g. arrays that can grow or shrink as needed) then you will likely need to allocate them on the heap, and use dynamic memory allocation functions like ``malloc()``, ``calloc()``, ``realloc()`` and ``free()`` to manage memory.

### <mark style="background: #FFF503A6;">When should you use the stack?</mark>  

If you are dealing with relatively small variables that only need to persist as long as the function using them is alive, then you should use the stack, it’s easier and faster

### <mark style="background: #FFF503A6;">Look at an example of each</mark>

Try out example_stack.c and example_heap.c  

With the heap example, using malloc() to allocate memory on the heap and then using free() to deallocate is a bit cumbersome & prone to memory leak if done badly.  

The star symbols * indicate <mark style="background: #FFF503A6;">pointers</mark>.  

The ``malloc()`` (and ``calloc()`` and ``free()``) functions deal with <mark style="background: #FFF503A6;">pointers</mark>.

### <mark style="background: #FFF503A6;">What are Pointers?</mark>  

The purpose of pointers is to allow you to manually, directly access a block of memory.  

Pointers are used a lot for <mark style="background: #FFF503A6;">strings</mark> and <mark style="background: #FFF503A6;">structs</mark>.  

It’s not difficult to imagine that passing the <mark style="background: #FFF503A6;">address</mark> of a large block of memory (such as a struct that contains many things) to a function, is more efficient than making a copy of it and passing in that copy, only to delete that copy when your function is done with it.  

This is known as <mark style="background: #FFF503A6;">passing by reference</mark> versus <mark style="background: #FFF503A6;">passing by value</mark>.

### <mark style="background: #FFF503A6;">Pointer Example Visual</mark>

``int age = 30;``  

Here, we declare an integer variable age and initialise it to 30.  

<mark style="background: #FFF503A6;">Our memory Stack looks like:</mark>
``age: [ 30 ]``

```C
int age = 30;  
Int *p;  
p = &age
```  

pointer p is now pointing to memory location of variable age  

<mark style="background: #FFF503A6;">Our memory Stack looks like:</mark>  
```
age: [ 30 ]  
p: [.^ ] (pointing to age)
```  

Try out pointer-ex-1.c

### <mark style="background: #FFF503A6;">Pointers and Arrays</mark>  

When you declare an array using an expression like int vec[5]  

What is really happening is that a block of memory is being allocated (on the stack in this case) large enough to hold 5 integers, and the vec variable is a pointer that points to the first element in the array.  

When you index into the array with an expression like ``printf("vec[2]=%d\n", vec[2])``  

What is happening is that C is using <mark style="background: #FFF503A6;">pointer arithmetic</mark> to step into the array the appropriate number of times  

So if you ask for the 3rd element of the vec array using ``vec[2]`` then C is first looking at the location pointed to by vec (the first element of the array), and stepping <mark style="background: #FFF503A6;">two integers</mark> forward, and then reading the value it finds there (``vec[2]``).

### <mark style="background: #FFF503A6;">Pointers and Structs</mark>  

Pointers can also be used to point to a struct.  

Try pointer-structs.c

### <mark style="background: #FFF503A6;">Pointers and Functions</mark> 

One of the handy things you can do in C, is to use a pointer to point to a function. Then you can pass this function pointer to other functions as an argument, you can store it in a struct, etc.  

Try pointer-functions.c

### <mark style="background: #FFF503A6;">Function Arguments: Passing By Value vs Passing By Reference</mark>

Typically when you think about passing arguments to functions, you think about passing the function the value of some variable.  

A common idiom in C however is to pass function arguments by reference, using pointers.  

This is the case in particular with large data structures like arrays and structs, for which it would be inefficient to pass copies to functions.  

Instead, in passing by reference, you simply pass a pointer to the data, to the function.  

<mark style="background: #FFF503A6;">Let us look at two examples:</mark>  
1. ``pointer-function-pass-value.c``  
2. ``pointer-function-pass-reference.c``  

Make sure you understand these two code examples above, and why they do different things

### <mark style="background: #FFF503A6;">Dynamically Allocated Memory</mark>  

In the heap, we can control the amount of memory allocated to a certain variable by using some built in C functions  

If you use malloc() or calloc() to allocate an array on the heap, you can use realloc() to resize it at some later time. In order to use these functions.  

You will need to ``#include <stdlib.h>`` at the top of your C file.  

The built-in functions ``malloc()``, ``calloc()``, ``realloc()`` ``memcpy()`` and free() are what you will use to manage dynamically allocated data structures on the heap, “by hand”. 

<mark style="background: #FFF503A6;">The life cycle of a heap variable involves three stages:</mark>  
1. allocating the heap variable using ``malloc()`` or ``calloc()``  
2. (optionally) resising the heap variable using ``realloc()``  
3. releasing the memory from the heap using ``free()``

### <mark style="background: #FFF503A6;">Allocating memory with malloc and calloc</mark>  

These functions are used to allocate memory at runtime.  

The ``malloc()`` function takes as input the size of the memory block to be allocated.  

The ``calloc()`` function is like ``malloc()`` except that it also initialises all elements to zero.  

The ``calloc()`` function takes two input arguments, the number of elements and the size of each element.  

Try out ``malloc-calloc.c``

### <mark style="background: #FFF503A6;">Resising a variable using realloc</mark> 

Let’s say you use ``calloc()`` to allocate an array of 3 floating-point values, and you later in the program want to increase the size of the array to hold 5 values.  

Use ``realloc`` – see ``realloc.c``

### <mark style="background: #FFF503A6;">Freeing memory - free()</mark> 

You should always use ``free()`` to deallocate memory that has been allocated with ``malloc()`` or ``calloc()``, as soon as you don’t need it anymore.  

Any memory allocated with ``malloc()`` or ``calloc()`` is <mark style="background: #FFF503A6;">reserved</mark>  

If you fail to deallocate memory then you will have a <mark style="background: #FFF503A6;">memory leak</mark>. If your program uses a lot of heap memory, that is not deallocated, and runs for a long time, then you might find that your computer (and your program) slows down, or suddenly freezes, or crashes.  

The rule is, anytime you use ``malloc()`` or ``calloc()``, you must also use free()  

Some dev tools can help with this – e.g. valgrind

### <mark style="background: #FFF503A6;">More information on Pointers</mark>  

<mark style="background: #FFF503A6;">Everything you need to know about pointers:</mark>  
- https://www.youtube.com/watch?v=Rxvv9krECNw  
- https://boredzo.org/pointers/

# <mark style="background: #FFF503A6;">09 IPC and Pipes</mark>

<mark style="background: #FFF503A6;">Overview:</mark>
- Inter Process Communication (IPC)  
- File Descriptors  
- Pipes  
- Pipes Example  
- Named Pipes (FIFO)

### <mark style="background: #FFF503A6;">IPC</mark>

Inter Process Communication (IPC)  

Facilitating communication between different processes.  

<mark style="background: #FFF503A6;">IPC can be offered between:</mark>  
- Related processes  
- Unrelated processes

### <mark style="background: #FFF503A6;">File Streams and File Descriptors</mark>  

<mark style="background: #FFF503A6;">If we need to perform file operations (IO) to a file, there are 2 options available:</mark> 
- Streams  
- File Descriptors  

Streams are represented as File * objects.  

File descriptors are represented as objects of type int.

### <mark style="background: #FFF503A6;">File Streams</mark>  

A stream offers a high level interface that is layered on top of the file descriptors.  

There are more features and functionality that comes with the stream interface for file IO.

### <mark style="background: #FFF503A6;">File Descriptors</mark> 

File descriptors offer a primitive low lever interface for IO operations.  

A file descriptor can connect to a file, a device (terminal), or a pipe or socket to communicate with another process.  

File descriptors should be used for IO with devices, and for nonblocking IO operations.

### <mark style="background: #FFF503A6;">fopen and fdopen</mark> 

The ``fopen()`` function opens the file whose name is the string pointed to by path and associates a stream with it.  

The ``fdopen()`` function associates a stream with the existing file descriptor, fd. The mode of the stream (one of the values "r", "r+", "w", "w+", "a", "a+") must be compatible with the mode of the file descriptor.

### <mark style="background: #FFF503A6;">fgetc</mark>

``fgetc()`` reads the next character from stream and returns it as an unsigned char cast to an int, or EOF on end of file or error.

### <mark style="background: #FFF503A6;">fstat</mark> 

``stat()`` retrieve information about the file pointed to by pathname; the differences for ``fstatat()`` are described below.  

``fstatat()`` is identical to ``stat()``, except that the file about which information is to be retrieved is specified by the file descriptor fd.

### <mark style="background: #FFF503A6;">What are Pipes</mark>  

A pipe allows processes to communicate with each other (Inter Process Communication - IPC)  

A process can write date to a pipe and this can be read by another process.  

The data passes to the pipe follows the FIFO algorithm.  

The pipe has no name.  

The pipe as created by a parent process and uses it to communicate with a child process.  

Pipe is one-way communication only i.e. we can use a pipe such that one process write to the pipe, and the other process reads from the pipe

### <mark style="background: #FFF503A6;">Pipe Syntax in C</mark>  

```C
int pipe(int fds[2]);
```  

<mark style="background: #FFF503A6;">Parameters:</mark>  

- ``fd[0]`` will be the fd(file descriptor) for the read end of pipe. 
- ``fd[1]`` will be the fd for the write end of pipe.
- <mark style="background: #FFF503A6;">Returns:</mark> 0 on Success. -1 on error.

### <mark style="background: #FFF503A6;">Simple Pipe Architecture Example</mark>

Where fd = file descriptor  

``fd[0]`` for reading  

``fd[1]`` for writing  

The pipe is implemented using kernel memory.  

A pipe is a channel with two ends

![[Pasted image 20260306112210.png]]

### <mark style="background: #FFF503A6;">Process forks</mark>

![[Pasted image 20260306112254.png]]

<mark style="background: #FFF503A6;">After a fork we have to decide in which direction the data should flow:</mark>  
- Parent to child  
- Child to parent

### <mark style="background: #FFF503A6;">Parent to Child</mark>

![[Pasted image 20260306112343.png]]

Parent must close ``fd[0]``  

Child must close ``fd[1]``

### <mark style="background: #FFF503A6;">Child to Parent</mark>

![[Pasted image 20260306112431.png]]

Parent must close ``fd[1]``  

Child must close ``fd[0]``

### <mark style="background: #FFF503A6;">Rules for closing pipes</mark> 

If we read from a pipe that was closed, the return should be 0  

If we write to a pipe with read closed on the other end, the SIGPIPE signal will be sent. This will need to be dealt with.

### <mark style="background: #FFF503A6;">Pipe Example</mark> 

See pipe-example-1.c  

We create a pipe using the command pipe(fd)  

We use the fork command to create a child, this communicates with the parent using the write (to pipe) command  

The parent reads from the pipe buffer

### <mark style="background: #FFF503A6;">Rules for closing pipes</mark>  

If we read from a pipe that was closed, the return should be 0  

If we write to a pipe with read closed on the other end, the ``SIGPIPE`` signal will be sent. This will need to be dealt with

### <mark style="background: #FFF503A6;">Pipe Example 2</mark> 

Create a C program to replicate the following:  
``ps aux | grep login``  

How can pipes be used to solve this problem?  

We will go through the solution next.

### <mark style="background: #FFF503A6;">Need dup library call</mark>  

The dup() system call creates a copy of a file descriptor.  

It uses the lowest-numbered unused descriptor for the new descriptor.  

If the copy is successfully created, then the original and copy file descriptors may be used interchangeably.  

They both refer to the same open file description and thus share file offset and file status flags.

### <mark style="background: #FFF503A6;">Pipes IPC Example </mark> 

two functions that will use the exec command to perform different tasks in the process.  

pid stores the process ID  

pipefd array stores the file descriptors.  

Start the program (main)  

Create a pipe and store the associated file descriptors in pipefd array  
  
```c
void exec1();  
void exec2();  

int main() {  
	int pipefd[2];  
	// Create a pipe
	  
	if (pipe(pipefd) == -1) {  
		perror("Error creating pipe");  
		exit(1);  
	}
	
	...
```

Fork to create a child process  

If the pid is 0, we are dealing with the child process. Call the exec1 function to get the child process to swap to a different task.  

Fork again to create a child process  

If the pid is 0, we are dealing with the child process. Call the exec2 function to get the child process to swap to a different task.  

```C
// Fork for "ps aux"  
pid_t pid = fork();  

if (pid == -1) {  
	perror("Error: fork");  
	exit(1);  
} else if (pid == 0) {  
	exec1(pipefd);  
}  
// Fork for "grep login"  
pid = fork();  

if (pid == -1) {  
	perror("Error: fork");  
	exit(1);  
} else if (pid == 0) {  
	exec2(pipefd);  
}
```

Close pipe descriptors in parent  

Wait for child processes to finish  

Return control to terminal

```C
// Close pipe descriptors in parent  
close(pipefd[0]);  
close(pipefd[1]);  

// Wait for child processes to finish  

for (int i = 0; i < 2; i++)  
{  
	wait(NULL);  
} 

return 0; // Return control to terminal  
}
```

```C
void exec1(int pipefd[2]) {  
	dup2(pipefd[1], 1); // Redirect stdout to pipe  
	close(pipefd[0]);  
	close(pipefd[1]);  
	execlp("ps", "ps", "aux", NULL);  
	perror("Error executing ps");  
	exit(1);  
}  

void exec2(int pipefd[2]) {  
	dup2(pipefd[0], 0); // Redirect stdin from pipe  
	close(pipefd[0]);  
	close(pipefd[1]);  
	execlp("grep", "grep", "login", NULL);  
	perror("Error executing grep");  
	exit(1);  
}
```

### <mark style="background: #FFF503A6;">Remarks on pipe-example-2.c</mark>

Pipes enable independent processes to communicate with each other, forming a pipeline of commands.  

fork creates new child processes that can execute different tasks concurrently.  

``dup2`` redirects file descriptors, allowing processes to read from or write to pipes instead of standard input and output.  

``execlp`` replaces the current process image with a new one, effectively executing the specified command.  

Closing unused pipe ends is crucial for proper resource management and preventing deadlocks.  

Using wait ensures that child processes finish before the parent terminates, preventing zombie processes.

### <mark style="background: #FFF503A6;">Additional Resources on dup2</mark> 

- https://www.youtube.com/watch?v=EqndHT606Tw  
- https://www.youtube.com/watch?v=PIb2aShU_H4

### <mark style="background: #FFF503A6;">Pipes – Making Life Easier</mark>

The ``popen()`` function can be used to automate the creation of the pipe and the forking process.  

```C
fp = popen("ls *", "r");
```  

``popen()`` will set the file descriptors to facilitate the communication between parent and child or child and parent as required.

<mark style="background: #FFF503A6;">popen():</mark>
1. Setup Pipes  
2. Fork()  
3. Child process runs ls * command and returns results to parent  
4. Parent reads with fgets and displays with printf  

```C
#include <stdio.h>

int main() {  
	FILE *fp;  
	int status;  
	char path[1024]; 
	 
	fp = popen("ls *", "r"); 
	 
	while (fgets(path, 1024, fp) != NULL)  
		printf("%s", path);  
	
	status = pclose(fp);  
}
```  

See mypopen.c

### <mark style="background: #FFF503A6;">Named Pipes - FIFO</mark>

A FIFO special file sends data from one process to another so that the receiving process reads the data first-in-first-out (FIFO)  

A FIFO special file is also called a named pipe, or a FIFO  

A named pipe operates like a normal pipe  

The main difference is the named pipe exists as a special file  

The special file is a FIFO file, and doesn't contain any user info  

A FIFO special file can also be shared by a number of processes that were not created by forks.

### <mark style="background: #FFF503A6;">FIFO file for a Named Pipe</mark>  

A named pipe operates like a file  

<mark style="background: #FFF503A6;">We can use the standard file IO system calls to operate a named pipe:</mark>  
- ``int open(const char *pathname, int flags);``  
- ``int read(int fd, void *buf, size_t count);``  
- ``int write(int fd, const void *buf, size_t count);``  
- ``int close(fd);``

### <mark style="background: #FFF503A6;">FIFO Named Pipe using mkfifo:</mark>  

The mkfifo function can be used to create a FIFO file.  
```C
mkfifo(fifoFile, 0666);
```  

Use read and write operations to send information between processes.  

The processes don’t need to be related (ancestors)  

Unlink can be called to remove the file. 
```C
unlink(fifoFile);
```

### <mark style="background: #FFF503A6;">FIFO Named Pipe Example</mark>

Copy the files named-pipes-writeread.c and named-pipes - readwrite.c and compile them in your local directory.  

After you compile both files, open up two terminals side by side.  

See we can communicate between the processes by using a FIFO

![[Pasted image 20260306114410.png]]

### <mark style="background: #FFF503A6;">What file type is it?</mark> 

List the contents of the directory using ls –l  

Note the ’p’ to indicate that it’s a pipe file.  

```shell
ls -l myfifo  
prw-rw-r-- 1 sdo sdo 0 Feb 18 17:21 myfifo
```

# <mark style="background: #FFF503A6;">10 IPC Message Queues</mark>

<mark style="background: #FFF503A6;">Overview:</mark>
- Inter Process Communication (IPC)  
- Message Queues  
- Intro to Shared Memory

### <mark style="background: #FFF503A6;">Message Queues</mark>  

A message queue operates as a linked list of messages  

The messages are stored in the system kernel  

Each queue has a unique identifier (queue ID or name)  

Implementations of message queues can vary for  different types of environments.

### <mark style="background: #FFF503A6;">Different Implementations</mark>

<mark style="background: #FFF503A6;">Source:</mark> Linux Man Pages  

POSIX message queues allow processes to exchange data in the form of messages.  

POSIX API is distinct from that provided by System V message queues ``msgget(2)``, ``msgsnd(2)``, ``msgrcv(2)``, etc.  

Better option unless using on legacy applications etc – more predictable (fixed message size, prioritisation)

### <mark style="background: #FFF503A6;">Creating a Queue</mark>  

A Queue is created using ``mq_open()``  

The return from creating the queue is a file descriptor.  

This needs to be stored as type mqd_t, this will be used to access the queue for all subsequent calls.  

Each queue will be given a unique name.  

This is provided when creating the queue.  

See ``man mq_open`` or ``man mq_overview`` for more details

### <mark style="background: #FFF503A6;">Sending and Receiving Messages with the Queue</mark>  

<mark style="background: #FFF503A6;">With the queue setup:</mark>  
- messages can be sent with mq_send  
- messages can be received with mp_receive

<mark style="background: #FFF503A6;">Example:</mark>
- For the Message Queue we will be creating a server program to manage the operation of the queue.  
- server.c  
- A client program will be created to show the operation of the queue  
- client.c

### <mark style="background: #FFF503A6;">Setup the Server</mark> 

```C
mqd_t mq;  
struct mq_attr queue_attributes;  
char buffer[1024 + 1];  
int terminate = 0;  

/* set queue attributes */  
queue_attributes.mq_flags = 0;  
queue_attributes.mq_maxmsg = 10;  
queue_attributes.mq_msgsize = 1024;  
queue_attributes.mq_curmsgs = 0;

/* create queue */  
mq = mq_open("/dt228_queue", O_CREAT | O_RDONLY, 0644, &queue_attributes);  

do {  
	ssize_t bytes_read;  
	/* receive message */  
	bytes_read = mq_receive(mq, buffer, 1024, NULL);  
	buffer[bytes_read] = '\0';  
	
	if (! strncmp(buffer, "exit", strlen("exit")))  
	{ 
		terminate = 1; 
	}  
	else  
	{ 
		printf("Received: %s\n", buffer); 
	}  
} while (!terminate);
```

### <mark style="background: #FFF503A6;">Shutdown the server</mark>

```C
mq_close(mq);  
mq_unlink("/tu85X_queue");  
return 0;
```

### <mark style="background: #FFF503A6;">Setup the Client</mark>

```C
mqd_t mq;  
char buffer[1024];  

/* open the message queue */  
mq = mq_open("/tu85X_queue", O_WRONLY);

printf("Send message to server (enter 'exit' to terminate):\n");  

do {  
	printf(">> ");  
	fflush(stdout);  
	memset(buffer, 0, 1024);  
	fgets(buffer, 1024, stdin);  
	mq_send(mq, buffer, 1024, 0);  
} while (strncmp(buffer, "exit", strlen("exit")));
```

### <mark style="background: #FFF503A6;">Run</mark>

Compile the files using the following command (note the –lrt)  

```C
gcc -o server server.c –lrt  
gcc -o client client.c –lrt
```
  
-lrt means to link against the realtime lib for timing/synchronisation etc.

Run the client in another terminal with the command:  
``$ ./client``  

Send message before starting server (enter 'exit' to terminate):  
``>> Hello``  

Run the server in one terminal with the command  
``./server``  

Received: Hello

### <mark style="background: #FFF503A6;">Shared Memory</mark> 

Shared memory can be used as a mechanism to pass data between different processes.  

One process will create the memory portion and other process can access the memory portion (if permitted).  

A process creates a shared memory segment using ``shmget()``

### <mark style="background: #FFF503A6;">Shared memory: controlling access</mark>  

The process that setups the shared memory segment can control what other processes can access it.  

Access can be granted using ``mmap()``  

Access can also be removed.  

The two API calls that are used for this are called ``mmap`` and ``shm_open`` – you can do man ``mmap`` or man ``shm_open`` for more info  

See mmap-example.c

# <mark style="background: #FFF503A6;">11 Sockets</mark>

<mark style="background: #FFF503A6;">Overview:</mark>
- IPC Summary  
- Past Learning: Socket Revision  
- Introduction to Sockets  
- Socket Documentation  
- Server Setup  
- Client Setup  
- In-Class Example  
- Summary

### <mark style="background: #FFF503A6;">Revision – What we covered last week</mark>

<mark style="background: #FFF503A6;">IPC – Communication between processes on the same machine:</mark>
- Unnamed Pipes  
- Named Pipes  
- Message Queue

### <mark style="background: #FFF503A6;">Revision:: Sockets</mark>

Two machines on a network can communicate over a network using a Hostname/IP address and a given port address.

![[Pasted image 20260313151032.png]]

Sockets will provide for communication between a Client program and a server.  

<mark style="background: #FFF503A6;">What services can the server offer?</mark>  
- Processing (business logic)  
- Database functionality  
- Etc...  
- To ensure reliable communication, TCP will be used to establish a connection between the client and the server.

### <mark style="background: #FFF503A6;">Revision:: What is a Socket</mark>

A socket is an end-point that provides for two-way  
communication between a client and a server.  

The program on the server will be assigned a port. This will allow a client to connect to the socket on the server using the server IP address and the assigned port number.  

Syntax:  
```R
int sockfd = socket(int domain, int type, int protocol);
```

int <mark style="background: #FFF503A6;">domain</mark> -> AF_INET for PV4

int <mark style="background: #FFF503A6;">type</mark> -> SOCK_STREAM for TCP

int <mark style="background: #FFF503A6;">protocol</mark> -> 0

### <mark style="background: #FFF503A6;">Revision:: Client Server</mark>

<mark style="background: #FFF503A6;">Socket Communication</mark> 
- With a socket created, both the client and the server can communicate with the help of the socket.  
- Streams will be used both on the client and the server to facilitate two-way communication.

### <mark style="background: #FFF503A6;">Revision:: Sockets - Sequence</mark> 

- <mark style="background: #FFF503A6;">Step 1:</mark> Server creates a socket and starts listening for a client to connect.  
- <mark style="background: #FFF503A6;">Step 2:</mark> Client makes a socket connection to the server.  
- <mark style="background: #FFF503A6;">Step 3:</mark> Sever decides whether to allow the connection (true or false)  
- <mark style="background: #FFF503A6;">Step 4:</mark> Client sets Input and Output streams for the socket. This will be used to send/receive data.  
- <mark style="background: #FFF503A6;">Step 5:</mark> Client usually closes the socket connection.

### <mark style="background: #FFF503A6;">Sockets in Linux</mark>

The socket network Interface in Linux can be used to facilitate communication between different processes, no matter where they reside.  

Socket communication draws on the strength of network communication protocols.  

The examples we cover in this session are using TCP/IP. (It is possible to use other network protocols for socket communication, but TCP/IP is the most widely used standard)

### <mark style="background: #FFF503A6;">Socket Descriptors</mark>

A socket is an abstraction of a communication endpoint.  

In the Linux environment a socket descriptor is used to access sockets.  

Socket descriptors are implemented as file descriptors in the UNIX System.  

Most of the functions used for reading and writing  
work with the socket descriptor.  

As always you can get more information with `man 2 socket`

### <mark style="background: #FFF503A6;">Socket Function</mark> 

```C
#include <sys/socket.h>

int socket(int domain, int type, int protocol);
```  

When a socket is successfully created it will return the file (socket) descriptor.  

The file descriptor will facilitate the communication between the socket endpoints.

### <mark style="background: #FFF503A6;">Domain Argument</mark>  

When using the socket function to create a file descriptor the domain argument must be provided to determines the nature of the communication.  

The domain parameter specifies a communications domain within which communication will take place; this selects the protocol family which should be used. These families are defined in the include file ``<sys/socket.h>`` . 

<mark style="background: #FFF503A6;">Some formats are:</mark>
- ``AF_LOCAL`` Synonym for AF_UNIX
- ``AF_INET`` IPv4 Internet protocols ip(7)  
- ``AF_INET6`` IPv6 Internet protocols ipv6(7)  
- ``AF_KEY`` Key management protocol, originally developed for usage with IPsec  
- ``AF_NETLINK`` Kernel user interface device netlink(7) 
- ``AF_PACKET`` Low-level packet interface packet(7)  
- ``AF_BLUETOOTH`` Bluetooth low-level socket protocol  
- ``AF_ALG`` Interface to kernel crypto API  
- ``AF_VSOCK`` VSOCK (originally "VMWare VSockets") vsock(7) protocol for hypervisor-guest comms

### <mark style="background: #FFF503A6;">Type</mark>

The socket has the indicated type, which specifies the semantics of communication. 

<mark style="background: #FFF503A6;">Some defined types are:</mark>  
- ``SOCK_STREAM``  
- ``SOCK_DGRAM``  
- ``SOCK_RAW``  

A ``SOCK_STREAM`` type provides sequenced, reliable, two-way connection-based byte streams.  

A ``SOCK_DGRAM`` socket supports datagrams (connectionless, unreliable messages of a fixed (typically small) maximum length).  

``SOCK_RAW`` sockets provide access to internal network protocols and interfaces.

### <mark style="background: #FFF503A6;">Lifeline of a Socket Connection</mark> 

Sockets of type ``SOCK_STREAM`` are <mark style="background: #FFF503A6;">full-duplex</mark> byte streams.  

The connection must be set correctly before any data may be sent or received.  

The <mark style="background: #FFF503A6;">connect</mark> function is used to connect to an existing socket.  

When connected data can be send and received using <mark style="background: #FFF503A6;">read</mark> and <mark style="background: #FFF503A6;">write</mark>.  

When the processes are finished communicating, <mark style="background: #FFF503A6;">close</mark> function is called.

### <mark style="background: #FFF503A6;">In Class Example</mark>

See server.c & client.c

### <mark style="background: #FFF503A6;">Sequence</mark>  

<mark style="background: #FFF503A6;">Server:</mark>
- Set Includes  
- Init Variables  
- Create the Socket  
- Init the Socket  
- Bind Init to Socket  
- Listen for Connections  
- Accept Connection  
- Read Data from Client  
- Cleanup and end program  

<mark style="background: #FFF503A6;">Client:</mark>
- Set Includes  
- Init Variables  
- Create the Socket  
- Set Socket Variables  
- Connect to Socket Server  
- Communicate with Server  
- Cleanup and end program

### <mark style="background: #FFF503A6;">server.c - Init Server Variables</mark>  

```C
int s; // socket descriptor  
int cs; // Client Socket  
int connsize; // size of struct  
int READsize; // size of  
sockaddr_in for client  
connection  
struct sockaddr_in server ,  
client;  
char message[500];
```

### <mark style="background: #FFF503A6;">server.c – Create the Socket</mark>  
 
```C
//Create socket  
s = socket(AF_INET , SOCK_STREAM , 0);  
if (s == -1)  
{  
printf("Could not create socket");  
} else {  
printf("Socket Successfully Created!!");  
}
```

### <mark style="background: #FFF503A6;">server.c – Init the Socket</mark>  

```C
// set sockaddr_in variables  
server.sin_port = htons( 8082 ); // Set the prot  
for communication  
server.sin_family = AF_INET; // Use IPV4 protocol  
server.sin_addr.s_addr = INADDR_ANY;  
// When INADDR_ANY is specified in the bind call,  
the socket will be bound to all local interfaces.
```

### <mark style="background: #FFF503A6;">server.c – Bind Configuration to the Socket</mark> 

```C
//Bind  
if( bind(s,(struct sockaddr *)&server , sizeof(server)) < 0)  
{  
	perror("Bind issue!!");  
	return 1;  
} else {  
	printf("Bind Complete!!");  
}  
```

<mark style="background: #FFF503A6;">NOTE:</mark>

``sockaddr_in:`` IPv4 address structure  

``sockaddr:`` generic socket address wrapper used by the API

### <mark style="background: #FFF503A6;">server.c - Set to listen for connection</mark>  

```C
Listen for a conection  
listen(s,3);  
//Accept and incoming connection  
printf("Waiting for incoming connection from Client>>");  
connsize = sizeof(struct sockaddr_in);
```

### <mark style="background: #FFF503A6;">server.c - Accept a Connection</mark>
  
```C
//accept connection from an incoming client  
cs = accept(s, (struct sockaddr *)&client,(socklen_t*)&connsize);  

if (cs < 0)  
{  
	perror("Can't establish connection");  
	return 1;  
} else {  
	printf("Connection from client accepted!!");  
}
```

### <mark style="background: #FFF503A6;">server.c - Read data from Client</mark> 
  
```C
while(1) {  
	memset(message, 0, 500);  
	//READsize = read(cs,message,500);  
	READsize = recv(cs , message , 2000 , 0);  
	printf("Client said: %s\n", message);  
	//puts(message);  
	write(cs , "What ??" , strlen("What ??"));  
}
```

### <mark style="background: #FFF503A6;">server.c - Clean up on client disconnect</mark>  

```C
if(READsize == 0)  
{  
	puts("Client disconnected");  
	fflush(stdout);  
}  
else if(READsize == -1)  
{  
	perror("read error");  
}
```

### <mark style="background: #FFF503A6;">client.c - Initialise</mark>  

```C
// init client variables  
int SID;  
struct sockaddr_in server;  
char clientMessage[500];  
char serverMessage[500];
```

### <mark style="background: #FFF503A6;">client.c - Create the socket</mark>  

```C
//Create socket  
SID = socket(AF_INET , SOCK_STREAM , 0);  

if (SID == -1)  
{  
	printf("Error creating socket");  
} {  
	printf("socket created");  
}
```

### <mark style="background: #FFF503A6;">client.c -Set Socket Variables</mark> 
  
```C
// set sockaddr_in variables  
server.sin_port = htons( 8082 ); // Port to connect on  
server.sin_addr.s_addr = inet_addr("127.0.0.1"); //  
Server IP  
server.sin_family = AF_INET; // IPV4 protocol
```

### <mark style="background: #FFF503A6;">client.c - Connect to Socket Server</mark>  
 
```C
//Connect to server  
if (connect(SID , (struct sockaddr *)&server, sizeof(server)) < 0)  
{  
	printf("connect failed. Error");  
	return 1;  
}
```

### <mark style="background: #FFF503A6;">client.c - Communicate with Server</mark>  

```C
//keep communicating with server  
while(1)  
{  
	printf("\nEnter message : ");  
	scanf("%s" , clientMessage);  
	//Send some data  
	if( send(SID , clientMessage ,  
	strlen(clientMessage) , 0) < 0)  
	{  
		printf("Send failed");  
		return 1;  
	}  

	//Receive a reply from the server  
	if( recv(SID , serverMessage , 500 , 0) <  
	1)  
	{  
	printf("IO error");  
	//break;  
	}  
	puts("\nServer sent: ");  
	puts(serverMessage);  
}
```

### <mark style="background: #FFF503A6;">Run the Programs</mark>

<mark style="background: #FFF503A6;">Server first:</mark>
```shell
./server  
Socket Successfully Created.  
Bind Complete.  
Waiting for incoming connection from Client>>  
Connection from client accepted!!  
Client said: hello
```

<mark style="background: #FFF503A6;">Then client:</mark>
```shell
$ ./client  
socket created  
Connected to server ok!!  
Enter message : hello
```

### <mark style="background: #FFF503A6;">How can I tell what activity is happening on a given port</mark>  

```shell
lsof –i tcp:8802  

COMMAND PID USER FD TYPE DEVICE size/OFF NODE NAME  
server 2090649 sdo 3u IPv4 64029694 0t0 TCP *:8082 (LISTEN)  
server 2090649 sdo 4u IPv4 64029695 0t0 TCP localhost:8082->localhost:48616 (ESTABLISH)
client 2090691 sdo 3u IPv4 64032803 0t0 TCP localhost:48616->localhost:8082 (ESTABLISHED)
```

### <mark style="background: #FFF503A6;">Control Flow in Client-Server Connection</mark>

![[Pasted image 20260313155057.png]]

### <mark style="background: #FFF503A6;">Summary</mark> 

Socket Programming can be used to facilitate IPC.  

The main benefits is that the processes don’t have to be on the same machine.  

Networks and Internet Protocols can be used to facilitate communication.  

Sockets offers full duple communications.

# <mark style="background: #FFF503A6;">12 Threads</mark>

<mark style="background: #FFF503A6;">Overview:</mark>
- Threading  
- Synchronisation and Concurrency  
- POSIX Threading  
- Thread Example  
- Mutex file locking  
- Locking Example

### <mark style="background: #FFF503A6;">Introduction to Threading</mark>

A thread is a unit of execution within a process.  

Lightweight process that shares the same memory and resources as the main process, but it can execute instructions independently.  

The programs that we have seen to date all ran in a single thread.  

If we are dealing with a large problem, this can be sub-divided into smaller parts and executed in different threads concurrently. This is known as multithreading.  

A <mark style="background: #FFF503A6;">multi-threaded</mark> program has more than one point of execution  

Share the same address space and thus can access the same data.

The state of a single thread is similar to that of a process.  

Program counter (PC) tracks where program fetches instructions from.  

Each thread has its own private set of registers it uses for computation.  

If there are two threads that are running on a single processor; when switching from running one (T1) to running the other (T2), a <mark style="background: #FFF503A6;">context switch</mark> must take place.  

The context switch between threads is similar to the context switch between processes, as the register state of T1 must be saved and the register state of T2 restored before running T2. (With processes, you save state to a <mark style="background: #FFF503A6;">process control block (PCB)</mark>.)  

Require one or more <mark style="background: #FFF503A6;">thread control blocks (TCBs)</mark> to store the state of each thread of a process.

### <mark style="background: #FFF503A6;">Why Use Threads?</mark>

<mark style="background: #FFF503A6;">There are two main reasons why you should use threads:</mark>
- Parallelism  
- To Avoid Blocking

### <mark style="background: #FFF503A6;">Parallelism</mark>

Suppose a program that performs operations on very large arrays, for example, adding two large arrays together.  

If you are running on just a single processor, the task is straightforward: just perform each operation and be done.  

However, if you are executing the program on a system with multiple processors, you have the potential of speeding up this process considerably by using multiple processors to perform the work.  

The task of transforming your standard single-threaded program into a program that does this sort of work on multiple CPUs is called parallelisation, and using a thread per CPU to do this work is a natural and typical way to make programs run faster on modern hardware.

### <mark style="background: #FFF503A6;">To Avoid Blocking</mark>

The second reason is to avoid blocking program progress due to slow I/O.  

Suppose a program that performs different types of I/O: either waiting to send or receive a message, for an explicit disk I/O to complete.  

Instead of waiting, your program may wish to do something else, including utilising the CPU to perform computation or even issuing further I/O requests.  

Using threads is a natural way to avoid getting stuck; while one thread in your program waits (i.e., is blocked waiting for I/O)  

The CPU scheduler can switch to other threads, which are ready to run and do something useful.  

Threading enables overlap of I/O with other activities within a single program, much like <mark style="background: #FFF503A6;">multiprogramming</mark> did for processes across programs; as a result, many modern server-based applications (web servers, database management systems, and the like) make use of threads in their implementations.

### <mark style="background: #FFF503A6;">Threading in C</mark>

C programming has multithreading support.  

A multithreaded program contains two or more parts that will run concurrently in separate threads.  

Each thread has a separate path of execution.  

Multithreading could be described as multitasking.

### <mark style="background: #FFF503A6;">Types of Multitasking</mark>

<mark style="background: #FFF503A6;">Two main types of multitasking:</mark>
- Process Based 
- Thread Based  

Process based multitasking allows a computer to run multiple applications at the same time (eg. Word and PowerPoint etc..)  

Thread based multitasking allows a C program to perform two or more tasks at once. This can make good use of the hardware the program is running on (eg. multicore CPU).

### <mark style="background: #FFF503A6;">User Threads</mark>

User level threads are mostly at the application level where an application creates these threads to sustain its execution in the main memory.  

User threads work in isolation with kernel threads.  

These are easier to create since they do not have to refer to any registers and context switching is much faster than at kernel level thread.  

User level threads, mostly can cause changes at the application level and has no impact on kernel threads.

### <mark style="background: #FFF503A6;">Kernel Threads</mark> 

Kernel threads are mostly independent of the ongoing user-level processes and are executed by the operating system.  

Kernel threads are used by the Operating System for management tasks etc  

Kernel threads are more expensive to create and manage - context switching.  

Most of the kernel level threads can generally not be pre-empted (interrupted) by the user level threads.

### <mark style="background: #FFF503A6;">Multithreading Fundamentals</mark>

![[Pasted image 20260321124427.png]]
![[Pasted image 20260321124443.png]]

### <mark style="background: #FFF503A6;">POSIX threads - pthreads</mark>

Linux Programmer's Manual

```
PTHREADS(7)  
NAME  
	pthreads - POSIX threads  

DESCRIPTION
```  

POSIX.1 specifies a set of interfaces (functions, header files) for threaded programming commonly known as POSIX threads, or Pthreads.  

A single process can contain multiple threads, all of which are executing the same program.  

These threads share the same global memory (data and heap segments), but each thread has its own stack (automatic variables).  

pthreads are kernel threads implemented as lightweight processes

### <mark style="background: #FFF503A6;">Shared attributes within a process</mark>  

<mark style="background: #FFF503A6;">POSIX.1 also requires that threads share a range of attributes (process-wide rather per-thread):</mark> 
- process ID  
- parent process ID  
- process group ID and session ID  
- controlling terminal  
- user and group IDs  
- open file descriptors  
- record locks (see fcntl(2))  
- signal dispositions  
- file mode creation mask (umask(2))  
- current directory (chdir(2)) and root directory (chroot(2))  
- interval timers (setitimer(2)) and POSIX timers (timer_create(2))  
- nice value (setpriority(2))  
- resource limits (setrlimit(2))  

Not shared: measurements of the consumption of CPU time (times(2)) and resources (getrusage(2))

### <mark style="background: #FFF503A6;">Thread Primitives</mark>  

<table>
	<tr>
		<td>Process Primitive</td>
		<td>Thread Primitive</td>
		<td>Description</td>
	</tr>
	<tr>
		<td>fork</td>
		<td>pthread_create</td>
		<td>Create a new flow of control</td>
	</tr>
	<tr>
		<td>waitpid</td>
		<td>pthread_join</td>
		<td>Get exit status</td>
	</tr>
	<tr>
		<td>exit</td>
		<td>pthread_exit</td>
		<td>Exit current code execution</td>
	</tr>
	<tr>
		<td>getpid</td>
		<td>pthread_self</td>
		<td>Get ID</td>
	</tr>
	<tr>
		<td>abort</td>
		<td>pthread_cancel</td>
		<td>Request abort of execution</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Introduction to the Thread API</mark>

The following slides cover the main portions of the thread API.  

The crux of these APIs that we will investigate are how we create and control threads.

### <mark style="background: #FFF503A6;">mypthreads.c</mark>

```C
#include <stdio.h>  
#include <stdlib.h>  
#include <unistd.h>  
#include <pthread.h>  
#include <sys/types.h>  
#include <sys/wait.h>  

void *thread_function(void *arg) {  
	printf("Thread ID (pthread_self): %lu\n", pthread_self());  
	sleep(1); // Simulate some work  
	printf("Thread exiting...\n");  
	pthread_exit((void *)42); // Return value  
}  

int main() {  
	pid_t child_pid;  
	pthread_t thread; 
	 
	printf("Main process ID (getpid): %d\n", getpid());

	// **pthread_create** example  
	int ret = pthread_create(&thread, NULL, thread_function, NULL);  
	if (ret != 0) {  
		perror("pthread_create failed");  
		exit(1);  
	}  
// **pthread_join** example (wait for thread to finish)  
	void *thread_result;  
	ret = pthread_join(thread, &thread_result);  
	if (ret != 0) {  
		perror("pthread_join failed");  
		exit(1);  
	}  
	printf("Thread joined, return value: %ld\n", (long)thread_result);  
	//pthread_cancel(thread); // Not used  
	printf("Main process exiting...\n");  
	exit(0);  
}
```

### <mark style="background: #FFF503A6;">Creating a thread</mark>

The first thing you have to be able to do to write a multi-threaded program is to create new threads, and thus some kind of thread creation interface must exist.  

In POSIX, a thead is is created and starts using the function pthread_create().  

It takes four parameters:

<table>
	<tr>
		<td>Name</td>
		<td>Type</td>
		<td>Description</td>
	</tr>
	<tr>
		<td>ID</td>
		<td>pthread_t *</td>
		<td>Reference (or pointer) to the ID of the thread.</td>
	</tr>
	<tr>
		<td>Attributes</td>
		<td>pthread_attr_t *</td>
		<td>Used to set the attributes of a thread(e.g., the stack size, scheduling policy, etc.) Passing NULL suffices for most applications.</td>
	</tr>
	<tr>
		<td>Starting routine</td>
		<td>void *</td>
		<td>The name of the function that the thread starts to execute. If the function’s return type is void *, then its name is simply written; otherwise, it has to be type-cast to void *.</td>
	</tr>
	<tr>
		<td>Arguments</td>
		<td>void *</td>
		<td>This is the argument that the starting routine takes. If it takes multiple arguments, a struct is used.</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Creating a thread</mark> 

```C
pthread_create(&id[0], NULL, printNumber, &arg);
```  

E.g. ``int ret = pthread_create(&thread, NULL, thread_function, NULL);``

### <mark style="background: #FFF503A6;">Thread Join – Waiting for a thread to complete</mark>  

What happens when we want to wait for a thread to complete?  

In this case, a parent thread is made to wait for a child thread using ``pthread_join()``.  

The two parameters of this function are:  
  
<table>
	<tr>
		<td>Name</td>
		<td>Type</td>
		<td>Description</td>
	</tr>
	<tr>
		<td>Thread ID</td>
		<td>pthread_t</td>
		<td>The ID of the thread that the parent thread waits for.</td>
	</tr>
	<tr>
		<td>Reference to return</td>
		<td>value void **</td>
		<td>The value returned by the exiting thread is caught by this pointer</td>
	</tr>
</table>

### <mark style="background: #FFF503A6;">Thread Join</mark>

```C
int* ptr;  
pthread_join(id, &ptr);
```

### <mark style="background: #FFF503A6;">Thread Termination</mark> 

<mark style="background: #FFF503A6;">There are three options for a thread to terminate:</mark>
- The thread can return from the start routine. This can return the threads exit code.  
- The thread can be stopped by another thread in the same pool/process.  
- The thread can call ``pthread_exit()``

``pthread_exit()`` is used to exit a thread. This function is usually written at the end of the <mark style="background: #FFF503A6;">starting routine</mark>.  

If a value is returned by a thread upon ending, its reference is passed as an argument.  

Since a thread’s local variables are destroyed when they exit, <mark style="background: #FFF503A6;">only</mark> references to global or dynamic variables are returned.

### <mark style="background: #FFF503A6;">Thread Termination</mark>

```C
// Global variable:  
int i = 1;  
// Starting routine:  
void* foo(void* p){  
	int i = *(int*) p;  
	printf("Received value: %i", i);  
	// Return reference to global variable:  
	pthread_exit(&i);  
}
```

### <mark style="background: #FFF503A6;">Second Thread Example</mark>

C program to demonstrate three threads running concurrently  

See thread1.c  

Linking with pthread may be necessary [-lpthread]

### <mark style="background: #FFF503A6;">Program Output</mark>  
```shell
./a.out  
Hello From Thread 3  
Goodbye From Thread 3  
Hello From Thread 2  
Goodbye From Thread 2  
Hello from Thread 1  
Goodbye From Thread 1
```

### <mark style="background: #FFF503A6;">Non-deterministic behaviour</mark>

```shell
./a.out  
Hello from Thread 1  
Goodbye From Thread 1  
Hello From Thread 3  
Goodbye From Thread 3  
Hello From Thread 2  
Goodbye From Thread 2
```

### <mark style="background: #FFF503A6;">Like a function call</mark>

As you seen in example on previous slide, one way to think about the thread is that it is a bit like making a function call.  

However, instead of first executing the function and then returning to the caller, the system instead creates a new thread of execution for the routine that is being called.  

The routine runs independently of the caller, perhaps before returning from the create, but perhaps much later.  

What runs next is determined by the OS scheduler, and although the scheduler likely implements some sensible algorithm, it is hard to know what will run at any given moment in time.  

Outputs are not deterministic.

<mark style="background: #FFF503A6;">Thread use requires some care:</mark> As you also might be able to tell from this example, threads can make life complicated: e.g. non-concurrency.

### <mark style="background: #FFF503A6;">Thread Synchronisation</mark>

If a program is using more than one thread, the threads may be sharing the same resources which can lead to inconsistencies in the program.  

See ``threadasync.c`` for disastrous behaviour

### <mark style="background: #FFF503A6;">threadasync.c</mark>

```C
#include <stdio.h>  
#include <stdlib.h>  
#include <pthread.h>  

int counter = 0; // Shared resource  

void* increment(void* arg) {  
	for (int i = 0; i < 1000000; i++)  
		counter++; // Increment counter (shared resource)  
	return NULL;  
}  

int main() {  
	pthread_t thread1, thread2; // Create two threads  
	pthread_create(&thread1, NULL, increment, NULL);  
	pthread_create(&thread2, NULL, increment, NULL);  
	pthread_join(thread1, NULL); // Wait for both threads to finish  
	pthread_join(thread2, NULL);  
	printf("Final counter value: %d [Should be 2000000]\n", counter);  
	return 0;  
}
```

<mark style="background: #FFF503A6;">Problem:</mark> 
```shell
Final counter value: 1262171 [Should be 2000000]  
Final counter value: 1009841 [Should be 2000000]  
Final counter value: 1011191 [Should be 2000000]  
Final counter value: 1152326 [Should be 2000000]  
Final counter value: 1080933 [Should be 2000000]  
Final counter value: 1008048 [Should be 2000000]  
Final counter value: 1052204 [Should be 2000000]  
Final counter value: 1342317 [Should be 2000000]  
Final counter value: 1244293 [Should be 2000000]
```

### <mark style="background: #FFF503A6;">The heart of the problem – Uncontrolled Scheduling:</mark>  

Imagine one of the two threads (Thread 1) is about to increment counter by one. It loads the value of counter (let’s say it’s 50, to begin with) into its register ie eax. Thus, eax=50 for Thread 1.  

Then it adds one to the register; thus eax=51.  

Next suppose a timer interrupt goes off.  

Thus, the OS saves the state of the currently running thread (its PC, its registers including eax, etc.) to the thread’s TCB.

Next, Thread 2 is chosen to run, and it enters this same piece of code.  

It also executes the first instruction, getting the value of counter and putting it into its eax (remember: each thread when running has its own private registers).  

The value of counter is still 50 at this point, and thus Thread 2 has eax=50.  

Thread 2 increments eax by 1 (thus eax=51), and then saves the value of eax register (51) into global variable.  

Thus, the global variable counter now has the value 51.

Finally, another context switch occurs, and Thread 1 resumes running.  

Recall that it had just executed the mov and add, and is now about to perform the final instruction.  

Recall also that eax=51. Thus, the final instruction executes, and saves the value to memory; the counter is set to 51 again.

The code to increment counter has been run twice, but counter, which started at 50, is now only equal to 51.  

A “correct” version of this program should have resulted in the variable counter equal to 52.

### <mark style="background: #FFF503A6;">Race Condition</mark> 

This is called a <mark style="background: #FFF503A6;">race condition</mark> (or, more specifically, a <mark style="background: #FFF503A6;">data race</mark>).  

The results depend on the timing execution of the code.  

Sometimes (i.e., when context switches that occur at untimely points in the execution), the wrong result occurs.  
This may yield a different result each time; thus, instead of a nice <mark style="background: #FFF503A6;">deterministic</mark> computation (which you are used to from computers), you call this result <mark style="background: #FFF503A6;">indeterminate</mark>.  

Because multiple threads executing this code can result in a race condition, this code is called a <mark style="background: #FFF503A6;">critical section</mark>.

### <mark style="background: #FFF503A6;">How do we fix this?</mark>

What you really want for this code is what is called mutual exclusion.  

This property guarantees that if one thread is executing within the critical section, the others will be prevented from doing so.  

Virtually all of these terms, by the way, were coined by Edsger Dijkstra, who was a pioneer in the field and indeed won the Turing Award because of this and other work.  

See his 1968 paper on “Cooperating Sequential Processes” for a clear description of the problem.

### <mark style="background: #FFF503A6;">Introduction to Locks</mark>

We have seen that we need to protect critical sections.  

We do this using locks.  

In particular, we annotate source code with locks, putting them around critical sections, and thus ensure that any such critical section executes as if it were a single atomic instruction

### <mark style="background: #FFF503A6;">Solution: mutex</mark>

A mutex, short for Mutual Exclusion, is a synchronisation primitive used in multithreaded programming. It acts as a lock to ensure that only one thread can access a shared resource at a time.  

This prevents race conditions and data inconsistencies that can occur when multiple threads try to modify the same data concurrently.

### <mark style="background: #FFF503A6;">Locks: The Basic Idea</mark>

As an example, assume some critical section looks like this, the canonical update of a shared variable:  
``balance = balance + 1;``  

To use a lock, you add some code around the critical section like this:  
```C
lock_t mutex; // some globally-allocated lock ’mutex’  
lock(&mutex);  
balance = balance + 1;  
unlock(&mutex);
```

A lock is just a variable, and thus to use one, you must declare a lock variable of some kind (such as mutex above).  

This lock variable (or just “lock” for short) holds the state of the lock at any instant in time.  

It is either <mark style="background: #FFF503A6;">available</mark> (or <mark style="background: #FFF503A6;">unlocked</mark> or <mark style="background: #FFF503A6;">free</mark>) and thus no thread holds the lock, or <mark style="background: #FFF503A6;">acquired</mark> (or <mark style="background: #FFF503A6;">locked</mark> or <mark style="background: #FFF503A6;">held</mark>), and thus exactly one thread holds the lock and presumably is in a critical section.  

You could store other information in the data type as well, such as which thread holds the lock, or a queue for ordering lock acquisition, but information like that is hidden from the user of the lock.

### <mark style="background: #FFF503A6;">Locks: Semantics</mark>

The semantics of the lock() and unlock() routines are simple.  

Calling the routine lock() tries to acquire the lock; if no other thread holds the lock (i.e., it is free), the thread will acquire the lock and enter the critical section.  

This thread is sometimes said to be the <mark style="background: #FFF503A6;">owner</mark> of the lock. 

If another thread then calls lock() on that same lock variable (mutex in this example), it will not return while the lock is held by another thread; in this way, other threads are prevented from entering the critical section while the first thread that holds the lock is in there.

Once the owner of the lock calls unlock(), the lock is now available (free) again.  

If no other threads are waiting for the lock (i.e., no other thread has called lock() and is stuck therein), the state of the lock is simply changed to free.  

If there are waiting threads (stuck in lock()), one of them will (eventually) notice (or be informed of) this change of the lock’s state, acquire the lock, and enter the critical section.

Locks provide some minimal amount of control over scheduling to programmers.  

In general, threads are viewed as entities created by the programmer but scheduled by the OS, in any fashion that the OS chooses.  

Locks yield some of that control back to the programmer; by putting a lock around a section of code, the programmer can guarantee that no more than a single thread can ever be active within that code.  

Thus locks help transform the chaos that is traditional OS scheduling into a more controlled activity.

### <mark style="background: #FFF503A6;">Pthread Locks</mark>

Beyond thread creation and join, probably the next most useful set of functions provided by the POSIX threads library are those for providing mutual exclusion to a critical section via <mark style="background: #FFF503A6;">locks</mark>.  

<mark style="background: #FFF503A6;">The most basic pair of routines to use for this purpose is provided by the following:</mark>
```C
int pthread_mutex_lock(pthread_mutex_t *mutex);
int pthread_mutex_unlock(pthread_mutex_t *mutex);
```

### <mark style="background: #FFF503A6;">Lock and unlock routines</mark>

The routines should be easy to understand and use. When you have a region of code that is a critical section and thus needs to be protected to ensure correct operation, locks are quite useful.  

If no other thread holds the lock when ``pthread_mutex_lock()`` is called, the thread will acquire the lock and enter the critical section.  

If another thread does indeed hold the lock, the thread trying to grab the lock will not return from the call until it has acquired the lock (implying that the thread holding the lock has released it via the unlock call).  

Of course, many threads may be stuck waiting inside the lock acquisition function at a given time; only the thread with the lock acquired, however, should call unlock.  

```C
pthread_mutex_t lock;  
pthread_mutex_lock(&lock);  
x = x + 1; // or whatever your critical section is pthread_mutex_unlock(&lock);
```

### <mark style="background: #FFF503A6;">threadsync.c</mark>

```C
#include <stdio.h>  
#include <stdlib.h>  
#include <pthread.h>  

int counter = 0; // Shared resource  
// Mutex for synchronisation  
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALisER;  

void* increment(void* arg) {  
	for (int i = 0; i < 1000000; i++) {  
		// Lock the mutex before accessing the shared resource  
		pthread_mutex_lock(&mutex);  
		counter++; // Increment counter  
		// Unlock the mutex after accessing the shared resource  
		pthread_mutex_unlock(&mutex);  
	}  
	return NULL;  
}

int main() {  
	pthread_t thread1, thread2;  
	// Create two threads  
	pthread_create(&thread1, NULL, increment, NULL);  
	pthread_create(&thread2, NULL, increment, NULL);  
	// Wait for both threads to finish  
	pthread_join(thread1, NULL);  
	pthread_join(thread2, NULL);  
	printf("Final counter value: %d [Should be 2000000]\n", counter);  
	// Destroy the mutex after use  
	pthread_mutex_destroy(&mutex);  
	return 0;  
}
```

### <mark style="background: #FFF503A6;">Deterministic output</mark> 

```shell
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]  
Final counter value: 2000000 [Should be 2000000]
```

# <mark style="background: #FFF503A6;">13 Logging</mark>

<mark style="background: #FFF503A6;">Overview:</mark>
- Logging 
- Syslog

### <mark style="background: #FFF503A6;">Linux System Logs</mark>  

Linux gathers a large amount of log files automatically.  

These log files can be used to see how a given process is performing and if any issues have occurred. If the process has an issue with any aspect of the tasks it performs it should place an entry in the log files.  

<mark style="background: #FFF503A6;">Log files typically held in:</mark>
``/var/log``

### <mark style="background: #FFF503A6;">Types of logs (varies)</mark>  

<table>
	<tr>
		<td>File Name</td> 
		<td>Description</td>
	  </tr>
	  <tr>
		<td>/var/log/user.log</td> 
		<td>All user level logs</td>
	  </tr>
	  <tr>
		<td>/var/log/kern.log</td> 
		<td>Info logged by the kernel. May be useful with issues in rebuilding the kernel.</td>
	  </tr>
	  <tr>
		<td>/var/log/daemon.log</td> 
		<td>Holds info on processes running in the background</td>
	  </tr>
	  <tr>
		<td>/var/usr/cron</td> 
		<td>When a schedule task is launched, it is logged here</td>
	  </tr>
	  <tr>
		<td>/var/log/audit/</td> 
		<td>Dir containing all log info for the auditd daemon</td>
	  </tr>
	  <tr>
		<td>/var/log/boot.log</td> 
		<td>Log files for system boot process</td>
	  </tr>
</table>

### <mark style="background: #FFF503A6;">syslog</mark>

The syslog daemon is used to centralise error messages for processes running on system.  

The syslog files can be kept of the same server or centralised on a different server.

### <mark style="background: #FFF503A6;">syslog Protocol</mark>

The syslog protocol specifies how information is propagated over a network.  

It defines a data format definition for its messages.  

This has been standardised in RFC-5424 (also called the IETF-syslog protocol), it uses port 514 for plaintext logs and 6514 for encrypted logs.

### <mark style="background: #FFF503A6;">syslog messages</mark>  

Events from processes will be logged to syslog via messages.  

The message is made up of a header and a number of different fields.

### <mark style="background: #FFF503A6;">openlog</mark>

openlog opens a connection to the system logger.  

The connection is associated to the program currently running.  

``void openlog(const char *ident, int option, int facility);``  

Identity string is added to the start of each log entry.  

If ident is null the program name will be used.

### <mark style="background: #FFF503A6;">option argument of openlog</mark>
 
The option argument to ``openlog()`` is a bit mask constructed by ORing (bitwise OR |) together any of the following values:  
- <mark style="background: #FFF503A6;">LOG_CONS:</mark> Write directly to the system console if there is an error while sending to the system logger.
- <mark style="background: #FFF503A6;">LOG_NDELAY:</mark> Open the connection immediately (normally, the connection is opened when the first message is logged). This may be useful, for example, if a subsequent ch‐root(2) would make the pathname used internally by the logging facility unreachable.
- <mark style="background: #FFF503A6;">LOG_NOWAIT:</mark> Don't wait for child processes that may have been created while logging the message. (The GNU C library does not create a child process, so this option has no effect on Linux.)
- <mark style="background: #FFF503A6;">LOG_ODELAY:</mark> The converse of LOG_NDELAY; opening of the connection is delayed until syslog() is called. (This is the default, and need not be specified.)
- <mark style="background: #FFF503A6;">LOG_PERROR:</mark> (Not in POSIX.1-2001 or POSIX.1-2008.) Also log the message to stderr. 
- <mark style="background: #FFF503A6;">LOG_PID:</mark> Include the caller's PID with each message.

### <mark style="background: #FFF503A6;">facility argument of openlog</mark>  

The facility argument is used to specify what type of program is logging the message. This lets the configuration file specify that messages from different facilities will be handled differently.  
- <mark style="background: #FFF503A6;">LOG_AUTH:</mark> security/authorisation messages 
- <mark style="background: #FFF503A6;">LOG_AUTHPRIV:</mark> security/authorisation messages (private) 
- <mark style="background: #FFF503A6;">LOG_CRON:</mark> clock daemon (cron and at) 
- <mark style="background: #FFF503A6;">LOG_DAEMON:</mark> system daemons without separate facility value 
- <mark style="background: #FFF503A6;">LOG_FTP:</mark> ftp daemon 
- <mark style="background: #FFF503A6;">LOG_KERN:</mark> kernel messages (these can't be generated from user processes) 
- <mark style="background: #FFF503A6;">LOG_LOCAL0:</mark> through LOG_LOCAL7 reserved for local use 
- <mark style="background: #FFF503A6;">LOG_LPR:</mark> line printer subsystem  
- <mark style="background: #FFF503A6;">LOG_MAIL:</mark> mail subsystem  
- <mark style="background: #FFF503A6;">LOG_NEWS:</mark> USENET news subsystem

### <mark style="background: #FFF503A6;">level argument of syslog</mark>  

``void syslog(int priority, const char *format, ...);``  
  
<mark style="background: #FFF503A6;">Values for level:</mark> This determines the importance of the message. 

<mark style="background: #FFF503A6;">The levels are, in order of decreasing importance:</mark>  
- <mark style="background: #FFF503A6;">LOG_EMERG:</mark> system is unusable  
- <mark style="background: #FFF503A6;">LOG_ALERT:</mark> action must be taken immediately
- <mark style="background: #FFF503A6;">LOG_CRIT:</mark> critical conditions
- <mark style="background: #FFF503A6;">LOG_ERR:</mark> error conditions
- <mark style="background: #FFF503A6;">LOG_WARNING:</mark> warning conditions
- <mark style="background: #FFF503A6;">LOG_NOTICE:</mark> normal, but significant, condition
- <mark style="background: #FFF503A6;">LOG_INFO:</mark> informational message
- <mark style="background: #FFF503A6;">LOG_DEBUG:</mark> debug-level message

### <mark style="background: #FFF503A6;">Example: syslog1.c</mark>

```C
#include <syslog.h>  
#include <stdio.h>  
#include <stdlib.h>  

int main() {  
	// LOG_CONS: Write console if an error occurs sending to logger.  
	// LOG_PID: Include the PID with each message  
	// facility is LOG_USER indicating a user-level message  
	openlog("example_program", LOG_CONS | LOG_PID, LOG_USER);  
	// LOG_INFO => normal, informational message.  
	syslog(LOG_INFO, "Test message from example_program.");  
	closelog();  
	return EXIT_SUCCESS;  
}
```

```shell
$ ./a.out &  
[3] 828239  
$ tail -1 /var/log/syslog  
Mar 14 15:31:48 soc-DZY0LX3-SOS example_program[828239]: Test message from example_program.
```


# <mark style="background: #FFF503A6;">14 Security</mark>

<mark style="background: #FFF503A6;">Basic Security Concerns:</mark> 
- Access Control
- Superuser

### <mark style="background: #FFF503A6;">Introduction</mark>

<mark style="background: #FFF503A6;">Linux Systems:</mark> multiply concurrent user base  

Possibility of remote connections  

Possibility of content or files being deleted by different users  

Potential for Comprised System Security

### <mark style="background: #FFF503A6;">Security and the Linux Kernel</mark>

The Linux kernel offers the functionality to ensure only appropriate operations can be performed by legitimate users  

Access and levels of access needs to be controlled for both users and processes.  

We may want users to be able to access certain files and directories but restrict access to other files and directories

### <mark style="background: #FFF503A6;">Users and Groups</mark>

In a Linux system each user is assigned a unique user id (UID)  

The login process will convert the persons username to their unique user id, this will be used for the remainder of their session.  

It is possible to have multiple usernames for the same user id but a bad idea, usually indicating misconfiguration.

### <mark style="background: #FFF503A6;">Access Control</mark>

User IDs can be used to control access to different resources.  

A resource can be associated with a UID. This can be used to limit access to the resource.  

Sharing resources between multiple users can be problematic. 

Linux doesn’t associate multiple UID’s with a file, it doesn’t create a list of users who can assess this file.

<mark style="background: #FFF503A6;">To solve this problem Linux offers group functionality:</mark>
- Each group has its own Group Id (GID), a group can also have a name  
- A Group can have 1 or more UIDs  
- A UID can be linked with multiple GIDs  
- A GID can’t contain another GID, only UIDs

<mark style="background: #FFF503A6;">Identifying UID and groups:</mark>  
- whoami  
- id

### <mark style="background: #FFF503A6;">Access Control - superuser</mark>

superuser (SU) usually has a username of root and UID 0  

```shell
$ id root
```  
  
The SU account can pretty much do anything (full privileges)  

The SU account should be used with caution and shouldn’t be used for trivial operations etc.  

The standard security model runs applications with non - administrative security (general user accounts), account privileges need to be elevated to modify the underlying system  

Running applications / performing operations as root has the potential for things going spectacularly wrong, this would be a serious problem for a server in a production environment

### <mark style="background: #FFF503A6;">Processes (UID and GID)</mark>

A process has an associated UID and GID  

When a process performs a system call, the kernel will evaluate whether to perform the operation.  

It examines the permissions to perform the operation (system call) and check this against the UID and GID of the process requesting the operation.  

<mark style="background: #FFF503A6;">Types:</mark>  
- ``gid_t`` - Used for group IDs.  
- ``uid_t`` - Used for user IDs.  
- where ``uid_t`` and ``gid_t`` are integer types. From ``sys/types.h``

### <mark style="background: #FFF503A6;">Example: try id then uidgid.c</mark>

  
```C
#include <stdio.h>  
#include <unistd.h>  
#include <sys/types.h>  

int main() {  
	uid_t uid = geteuid();  
	gid_t gid = getegid();  
	printf("This process is associated with UID: %d and GID: %d\n", uid, gid);  
}
```

### <mark style="background: #FFF503A6;">Basics of File System Permissions</mark>

<mark style="background: #FFF503A6;">User categories:</mark>
- <mark style="background: #FFF503A6;">Owner:</mark> The user who created the file or directory.
- <mark style="background: #FFF503A6;">Group:</mark> A group of users on the system that can be assigned specific permissions.
- <mark style="background: #FFF503A6;">Others:</mark> All users on the system who are not the owner or members of the assigned group.

<mark style="background: #FFF503A6;">Three basic permission types:</mark>
- <mark style="background: #FFF503A6;">Read (r):</mark> Allows users to view the contents of a file or list the contents of a directory.
- <mark style="background: #FFF503A6;">Write (w):</mark> Allows users to modify the contents of a file or create, delete, and rename files within a directory.
- <mark style="background: #FFF503A6;">Execute (x):</mark> Allows users to execute a file (if it's a program or script) or access and traverse a directory.

<mark style="background: #FFF503A6;">Filetypes:</mark>
- (dash for a standard file)  
- d (letter d for a directory)  
- p (special char for named pipes)

### <mark style="background: #FFF503A6;">Creating and Removing Users </mark>

<mark style="background: #FFF503A6;">To create a new user:</mark>
- ``useradd –m sarah –p password``
- Where sarah is the username  
- -m creates the home directory for the user 
- -p sets the password  

<mark style="background: #FFF503A6;">To remove a user:</mark>  
- ``deluser --remove-home sarah``
- Where sarah is the username 
- --remove-home deletes the home dir for sarah

### <mark style="background: #FFF503A6;">In-Class Demo</mark>

<mark style="background: #FFF503A6;">Create 2 new users:</mark>
- Sarah  
- Josh  

```
sudo useradd -m sarah -p password  
sudo useradd -m josh -p password
```

<mark style="background: #FFF503A6;">Create a new group:</mark>
- ``groupadd sales``  

<mark style="background: #FFF503A6;">Add a user to a group:</mark>
- ``usermod –a –G sales sarah``  
- -a (appending)  
- -G (to a Group)  
- sales (group name)  
- sarah (username)

<mark style="background: #FFF503A6;">Who is in a group?</mark> 
- ``grep sales /etc/group``
- sales is the group name
- /etc/group is the location  

```shell
cat /etc/group | grep sales  
sales:x:1003:sarah
```

<mark style="background: #FFF503A6;">Create 2 folders as root</mark>
```shell
sudo mkdir marketing
sudo mkdir sales
```

<mark style="background: #FFF503A6;">Assigning a folder to a group:</mark> The Sales folder in the tmp folder needs to be assigned to the sales group:  
```shell
sudo chgrp sales /var/tmp/sales/
```  
 
<mark style="background: #FFF503A6;">Change permissions so anyone in the group sales can add files:</mark>
```shell
sudo chmod g+rwx /var/tmp/sales/
```

<mark style="background: #FFF503A6;">Add a file as sarah:</mark>
```shell
sudo su – sarah  
cd /var/tmp/sales  
touch test.md  
$ ls -la
```

<mark style="background: #FFF503A6;">Try to add a file as josh:</mark>
```shell
sudo su – josh  
cd /var/tmp/sales  
-sh: 1: cd: can't cd to /var/tmp/sales
```

### <mark style="background: #FFF503A6;">Summary</mark>

Kernel decides whether a process is allowed to access a particular file or not.  

It checks if the accessing user is the owner, part of the owing group or someone else.  

Based on the above, the bits are checked to see if the desired task is permitted.

<mark style="background: #FFF503A6;">Security Holes:</mark>
1. Want to prevent user from executing a program  
2. Suppose user copies the program(file)  
3. They might try to change the permission of the copy and run  
4. This needs to be addressed by restricting copying, setting default permissions appropriately, etc.

# <mark style="background: #FFF503A6;">15 Stat</mark>

<mark style="background: #FFF503A6;">Overview:</mark>
- stat and file attributes
- Flags 
- Permissions Example  
- Retrieving additional file MetaData

### <mark style="background: #FFF503A6;">What is the stat function?</mark> 

The <mark style="background: #FFF503A6;">stat</mark> is a command which gives information about the file and filesystem.  

<mark style="background: #FFF503A6;">stat</mark> command gives information such as the size of the file, access permissions and the user ID and group ID, birth time access time of the file.  

<mark style="background: #FFF503A6;">stat</mark> can also provide the file system information.  

```shell
stat /etc/resolv.conf  
File: /etc/resolv.conf  
size: 417 Blocks: 8 IO Block: 4096 regular file  
Device: 700h/1792d Inode: 1376296 Links: 1  
Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)  
Access: 2023-03-15 16:25:28.899802066 +0000  
Modify: 2023-03-15 16:25:26.567762614 +0000  
Change: 2023-03-15 16:25:26.711765050 +0000
```

### <mark style="background: #FFF503A6;">stat in C</mark>

<mark style="background: #FFF503A6;">st_mode</mark> is the file ``typest_ino`` is the Inode number  

<mark style="background: #FFF503A6;">st_dev</mark> device id containing the file  

<mark style="background: #FFF503A6;">st_rdev</mark> device id containing the file (special file)  

<mark style="background: #FFF503A6;">st_nlink</mark> number of hard links  

<mark style="background: #FFF503A6;">st_uid</mark> UID of file owner ``st_gid``  
- GID of owner ``st_size`` size in bytes ``st_atim`` last access time  
- ``st_mtim`` last modified time  
- ``st_ctim`` last change time  

<mark style="background: #FFF503A6;">st_blksize</mark> block size for filesystem IO  

<mark style="background: #FFF503A6;">st_blocks</mark> no. of 512 blocks allocated

![[Pasted image 20260330125243.png]]

### <mark style="background: #FFF503A6;">Example with stat</mark>

See file-owner.c

<mark style="background: #FFF503A6;">S_IRUSR</mark> is the read flag for the owner  

<mark style="background: #FFF503A6;">S_IWUSR</mark> is the write flag for the owner  

<mark style="background: #FFF503A6;">S_IXUSR</mark> is the execute flag for the owner

### <mark style="background: #FFF503A6;">Example with stat - Output</mark>

```shell
./file-owner test.md
```  

Owner can read test.md  

Owner can modify test.md

### <mark style="background: #FFF503A6;">Flags</mark> 

<table>
	<tr>
		<td>Flags</td>
		<td>Description Flag Value</td>
	  </tr>
	  <tr>
		<td>S_IFMT</td>
		<td>A bitmask used to get mode value of a file</td>
	  </tr>
	  <tr>
		<td>S_IFSOCK</td>
		<td>A file constant of socket</td>
	  </tr>
	  <tr>
		<td>S_IFLINK</td>
		<td>A file constant of symbolic link</td>
	  </tr>
	  <tr>
		<td>S_IFREG</td>
		<td>File constant for regular file</td>
	  </tr>
	  <tr>
		<td>S_IFBLK</td>
		<td>File constant for block file</td>
	  </tr>
	  <tr>
		<td>S_IFDIR</td>
		<td>File constant for directory file</td>
	  </tr>
	  <tr>
		<td>S_IFCHR</td>
		<td>File constant for character file</td>
	  </tr>
	  <tr>
		<td>S_IFIFO</td>
		<td>A file constant of fifo</td>
	  </tr>
	  <tr>
		<td>S_ISUID</td>
		<td>Set User ID bit</td>
	  </tr>
	  <tr>
		<td>S_ISGID</td>
		<td>Set Group ID bit</td>
	  </tr>
	  <tr>
		<td>S_ISVTX</td>
		<td>Sticky bit which indicates shared text</td>
	  </tr>
	  <tr>
		<th>Owner</th>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td>S_IRWXU</td>
		<td>Owner Permissions (read, write, execute)</td>
	  </tr>
	  <tr>
		<td>S_IRUSR</td>
		<td>Read Permissions for owner</td>
	  </tr>
	  <tr>
		<td>S_IWUSR</td>
		<td>Write Permissions for owner</td>
	  </tr>
	  <tr>
		<td>S_IXUSR</td>
		<td>Execute Permissions for owner</td>
	  </tr>
	  <tr>
		<th>Groups</th>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td>S_IRGRP</td>
		<td>Read Permissions for group</td>
	  </tr>
	  <tr>
		<td>S_IWGRP</td>
		<td>Write Permissions for group</td>
	  </tr>
	  <tr>
		<td>S_IXGRP</td>
		<td>Execute Permissions for group</td>
	  </tr>
	  <tr>
		<td>S_IRWXG </td>
		<td>Group Permissions (read, write, execute)</td>
	  </tr>
	  <tr>
		<th>Everyone</th>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td>S_IROTH</td>
		<td>Read Permissions for others</td>
	  </tr>
	  <tr>
		<td>S_IWOTH</td>
		<td>Write Permissions for others</td>
	  </tr>
	  <tr>
		<td>S_IXOTH</td>
		<td>Execute Permissions for others</td>
	  </tr>
	  <tr>
		<td>S_IRWXO</td>
		<td>Permissions for others (read, write, execute)</td>
	</tr>
</table>


### <mark style="background: #FFF503A6;">Second Example</mark>

See stat-example.c

This program will run and take a filename/path as an argument.  
 
```C
main(int argc, char *argv[])  
{  
	struct stat s;  
	if (stat(argv[1], &s) == -1) {  
		exit(EXIT_FAILURE);  
	}  
	/* 
	Using the flag options we can determine the type of file we are dealing with.  
	
	S_IFMT is a bit mask for file type*/
	printf("File type:"); 
	 
	switch (s.st_mode & S_IFMT) {  
		case S_IFBLK: printf("block device\n"); break;  
		case S_IFCHR: printf("character device\n"); break;  
		case S_IFDIR: printf("directory\n"); break;  
		case S_IFIFO: printf("FIFO/pipe\n"); break;  
		case S_IFLNK: printf("symlink\n"); break;  
		case S_IFREG: printf("regular file\n"); break;  
		case S_IFSOCK: printf("socket\n"); break;  
		default: printf("unknown?\n"); break;  
	}
	
	/* Inode is an entry in inode table, containing information ( the metadata ) about a regular file and directory.  

Link count refers to the hard links and Unix file system nodes (inodes) */

	printf("I-node number: %ld\n", (long) s.st_ino);
	
	printf("Mode: %lo (octal)\n", (unsigned long) s.st_mode);  
	
	printf("Link count: %ld\n", (long) s.st_nlink);  
	
	printf("Ownership: UID=%ld GID=%ld\n", (long) s.st_uid, (long) s.st_gid);  
	
	printf("Preferred I/O block size: %ld bytes\n", (long) s.st_blksize);  
	
	printf("File size: %lld bytes\n", (long long) s.st_size);  
	
	printf("Blocks allocated: %lld\n", (long long) s.st_blocks);  
	
	printf("Last status change: %s\n", ctime(&s.st_ctime));  
	
	printf("Last file access: %s\n", ctime(&s.st_atime));  
	
	printf("Last file modification: %s\n\n", ctime(&s.st_mtime));  
	
	printf((s.st_mode & S_IRUSR)? "r":"-");  
	
	printf("\n\n");  
	
	exit(EXIT_SUCCESS);
}
```

### <mark style="background: #FFF503A6;">Run the program</mark>

```shell
$ ./stat-example test.md  
File type:regular file  
I-node number: 1449200  
Mode: 100666 (octal)  
Link count: 1  
Ownership: UID=1000 GID=1000  
Preferred I/O block size: 4096 bytes  
File size: 15 bytes  
Blocks allocated: 8  
Last status change: Wed Mar 15 17:38:57 2023  
Last file access: Wed Mar 15 17:40:31 2023  
Last file modification: Wed Mar 15 17:38:57 2023
```

# <mark style="background: #FFF503A6;">16 Terminal IO</mark>

### <mark style="background: #FFF503A6;">What is Terminal IO</mark>

Terminal IO has always been a problematic and complex area for all types of operating systems.  

The manual page for terminal I/O is usually one of the longest in most editions of the programmer’s manuals.  

GUIs are not the only way to interact with a system.  

<mark style="background: #FFF503A6;">Terminal device drivers are used for different types of devices:</mark> 
- Terminals  
- Modems  
- Printers  
- Direct connection between two computers etc..

<mark style="background: #FFF503A6;">Terminal IO has two modes of operation:</mark>
- <mark style="background: #FFF503A6;">Canonical Mode:</mark> The terminal input is processed as lines.  
- <mark style="background: #FFF503A6;">Noncanonical Mode:</mark> The terminal input is processed as characters  

The basic mode of operation is Canonical Mode.  

The terminal device is controlled by a terminal driver from within the kernel.

### <mark style="background: #FFF503A6;">Canonical Mode</mark>

Terminal input is processed in lines that is terminated by newline, EOF or EOL characters.  

Input is not read until a complete line has been entered by the user.  

The system can provide input editing to allow for some characters to be dealt with in a special way.  

Limitations on the length of a line can be determined by using  ``_POSIX_MAX_CANON`` and ``MAX_CANON``.

### <mark style="background: #FFF503A6;">Noncanonical Mode</mark>

<mark style="background: #FFF503A6;">Individual characters are processed:</mark> Instead of waiting for a complete line (like hitting enter), each key press is registered as a single character.  

<mark style="background: #FFF503A6;">No automatic editing:</mark> The system doesn't perform actions like backspace or delete to modify the input before it's sent to the program. This allows programs to handle special characters in their own way.

### <mark style="background: #FFF503A6;">Input and Output Queues for Terminal Device</mark>

![[Pasted image 20260422131523.png]]

### <mark style="background: #FFF503A6;">Input and Output Queues for Terminal Device</mark> 

Every terminal device will have an input queue and an output queue.  

If echoing is enabled there is a link between the queues.  

<mark style="background: #FFF503A6;">The input queue will have an associated max size/capacity:</mark> 
- MAX_INPUT (size of input queue)  
- MAX_CANON (Max bytes input line)  

The size of the output queue is finite, but there are no variables to define this, as the kernel will manage this.

### <mark style="background: #FFF503A6;">Terminal Line Discipline</mark>

Terminal Line Discipline is a module that contains the functionality for all canonical processing.  

The is the standard for most unix/linux systems.  

The module sits between the kernels read and write functions and the device driver.

![[Pasted image 20260422131629.png]]

<mark style="background: #FFF503A6;">Note:</mark> By isolating the canonical processing in a separate module, all terminal drivers can support canonical processing consistently

### <mark style="background: #FFF503A6;">termios.h</mark> 

All the terminal device characteristics that we can examine and change are contained in a termios structure.  

This structure is defined in the header ``<termios.h>``  

```C
struct termios {  
	/* input flags */  
	tcflag_t c_iflag;  
	/* output flags */  
	tcflag_t c_oflag;  
	/* control flags */  
	tcflag_t c_cflag;  
	/* local flags */  
	tcflag_t c_lflag;  
	/* control characters */  
	cc_t c_cc[NCCS];
};
```

The input flags control the input of characters by the terminal device driver  

The output flags control the driver output (e.g., perform output processing)  

The control flags affect the RS-232 serial lines (e.g. ignore modem status lines, one or two stop bits per character)  

The local flags affect the interface between the driver and the user (e.g. echo on or off, job control stop signal for background output)

Use “man termios” and search for control flag options (c_cflag)  

Too many options to list here

### <mark style="background: #FFF503A6;">Summary of Terminal IO Functions</mark> 

<table>
	<tr>
		<td>Function</td>
		<td>Desc</td>
	  </tr>
	  <tr>
		<td>tcgetattr</td>
		<td>Get attributes from termois structure</td>
	  </tr>
	  <tr>
		<td>tcsetattr</td>
		<td>Set attribute for termois structure</td>
	  </tr>
	  <tr>
		<td>cfgetispeed</td>
		<td>Get input speed</td>
	  </tr>
	  <tr>
		<td>cfgetospeed</td>
		<td>Get output speed</td>
	  </tr>
	  <tr>
		<td>cfsetispeed</td>
		<td>Set input speed</td>
	  </tr>
	  <tr>
		<td>cfsetospeed</td>
		<td>Set output speed</td>
	  </tr>
	  <tr>
		<td>tcdrain</td>
		<td>Wait for output transmission to finish</td>
	  </tr>
	  <tr>
		<td>tcflow</td>
		<td>Suspend transmission or receive</td>
	  </tr>
	  <tr>
		<td>tcflush</td>
		<td>Flush pending input and/or output</td>
	  </tr>
	  <tr>
		<td>tcsendbreak</td>
		<td>Send break character</td>
	  </tr>
	  <tr>
		<td>tcgetpgrp</td>
		<td>Get foreground process id</td>
	  </tr>
	  <tr>
		<td>tcsetpgrp</td>
		<td>Set foreground process id</td>
	  </tr>
	  <tr>
		<td>tcgetsid</td>
		<td>Get GID of session leader</td>
	  </tr>
</table>

### <mark style="background: #FFF503A6;">Special Characters</mark> 

<table>
	<tr>
		<td>Character</td>
		<td>Description</td>
	  </tr>
	  <tr>
		<td>CR</td>
		<td>Carriage Return \r</td>
	  </tr>
	  <tr>
		<td>DISCARD</td>
		<td>Discard Output ^O</td>
	  </tr>
	  <tr>
		<td>DSUSP</td>
		<td>Delay Suspend ^Y</td>
	  </tr>
	  <tr>
		<td>EOF</td>
		<td>End of File ^D</td>
	  </tr>
	  <tr>
		<td>EOL</td>
		<td>End of Line</td>
	  </tr>
	  <tr>
		<td>EOL2</td>
		<td>Alternative End of Line</td>
	  </tr>
	  <tr>
		<td>ERASE</td>
		<td>Backspace one character ^H</td>
	  </tr>
	  <tr>
		<td>ERASE2</td>
		<td>Alternate backspace character ^H</td>
	  </tr>
	  <tr>
		<td>INTR</td>
		<td>Interrupt Signal ^C</td>
	  </tr>
	  <tr>
		<td>KILL</td>
		<td>Erase Line ^U</td>
	  </tr>
	  <tr>
		<td>LNEXT</td>
		<td>Literal next ^V</td>
	  </tr>
	  <tr>
		<td>NL</td>
		<td>Line feed \n</td>
	  </tr>
	  <tr>
		<td>QUIT</td>
		<td>Quit Signal ^\</td>
	  </tr>
	  <tr>
		<td>REPRINT</td>
		<td>Reprint all input ^R</td>
	  </tr>
	  <tr>
		<td>START</td>
		<td>Resume output ^Q</td>
	  </tr>
	  <tr>
		<td>STATUS</td>
		<td>Status ^T</td>
	  </tr>
	  <tr>
		<td>STOP</td>
		<td>Stop output ^S</td>
	  </tr>
	  <tr>
		<td>SUSP</td>
		<td>Suspend signal ^Z</td>
	  </tr>
	  <tr>
		<td>WERASE</td>
		<td>Backspace one word ^W</td>
	  </tr>
</table>

### <mark style="background: #FFF503A6;">Getting and Setting Terminal attributes</mark> 

To get and set a termios structure, we call two functions: ``tcgetattr`` and ``tcsetattr``.  

This is how we examine and modify the various option flags and special characters to make the terminal operate the way we want it to.  

Both functions take a pointer to a termios structure and either return the current terminal attributes or set the terminal’s attributes.

### <mark style="background: #FFF503A6;">Example myterm2.c [Part 1]</mark>

```C
#include <stdio.h>  
#include <stdlib.h>  
#include <unistd.h>  
#include <termios.h>  
int main(void) {  
	struct termios term, original_term;  
	// Fetch the current terminal settings  
	if (tcgetattr(STDIN_FILENO, &term) < 0) {  
		perror("tcgetattr"); return -1;  
	}  
	// Save a copy of the original settings for restoration later  
	original_term = term;  
	// Disable echoing of characters typed  
	term.c_lflag &= ~ECHO;  
	// Set non-canonical input (read 1 character at a time)  
	term.c_cc[VMIN] = 1;  
	term.c_cc[VTIME] = 0;  
	// Change EOF character to Ctrl+G (0x07)  
	term.c_cc[VEOF] = 0x07;
	
	// Apply the modified terminal settings  
	if (tcsetattr(STDIN_FILENO, TCSANOW, &term) < 0) {  
		perror("tcsetattr");  
		return -1;  
	}  
	
	printf("Terminal settings changed:\n");  
	printf(" - Echoing disabled (characters won't be shown)\n");  
	printf(" - Press any key, Ctrl+G to exit.\n");  
	// Loop to read characters without echo (including Enter)  
	while (1) {  
		int ch = getchar();  
		if (ch == EOF) { // Now checks for Ctrl+G (0x07)  
			break;  
		}  
		// Print the character for demonstration  
		printf("You pressed: %c\n", ch);  
	}  
	// Restore original terminal settings. Try this without!!!  
	tcsetattr(STDIN_FILENO, TCSANOW, &original_term);  
	printf("\nTerminal settings restored.\n");  
	
	return 0;  
}
```

### <mark style="background: #FFF503A6;">Additional Reading</mark>

Chapter 18 – Advanced Programming in the Unix Environment (Stevens and Rago)

# <mark style="background: #FFF503A6;">17 Kernel Modules</mark>

<mark style="background: #FFF503A6;">Overview</mark>  
- What is a kernel module?  
- How to create a simple kernel module (demo)

### <mark style="background: #FFF503A6;">The Kernel</mark>

<mark style="background: #FFF503A6;">Operating Systems Revision:</mark>
- The kernel manages the operation of a computer system and its hardware.  
- The kernel acts as an interface between hardware and software components.  
- A full kernel will control hardware resources using device drivers  
- For most systems the kernel is the first program to be loaded  
- The kernel manages start-up process, memory, I/O, different peripherals, I/O requests from software etc...

<mark style="background: #FFF503A6;">Kernel Revision:</mark>
- Runs in a protected area of memory (the kernel space).  
- Manages the running processes, hard disks, interrupts etc...  
- General programs run in user space.  
- Separation of user space and kernel space prevents unauthorised access and instability in the system.  
- Kernel offers an interface to facilitate processes requesting access to services (functionality) via system calls (usually via wrapper functions)

### <mark style="background: #FFF503A6;">Types of kernels</mark>

<mark style="background: #FFF503A6;">Monolithic Kernel:</mark>
- All operating system services operate in kernel space.  
- Has dependencies between system components  
- Large and complex codebase.  
- <mark style="background: #FFF503A6;">Examples:</mark> Unix, Linux.....

<mark style="background: #FFF503A6;">Micro Kernel:</mark> 
- Follows a minimalist approach  
- Tiny core, big security eg SerenityOS  
- Modular design, easy updates  
- Services in user space, less risk  
- Communication overhead exists  
- Ideal for specific needs  
- More stable

<mark style="background: #FFF503A6;">Hybrid Kernel:</mark>
- Combo of monolithic and micro  
- Offers speed of mono  
- Modularity and stability of micro  
- E.g. WindowsNT

### <mark style="background: #FFF503A6;">Kernel Modules</mark>

LKMs facilitate adding to the Linux Kernel at runtime.  

Useful for device drivers by letting the kernel communicate the underlying hardware (without needing to know how the hardware works)  

The benefits of LKM is that it doesn't require us to include the code for every device driver in the Linux Kernel, we can make additions as needed.

Modular approach offers flexibility and doesn't require the kernel to be rebuilt each time we need to add new hardware or update driver code.  

Modules run in kernel space.  

User space has no visibility of the hardware and uses the system resources via system calls as needed.

Kernel modules will have a .ko extension.  

On most linux systems, the kernel modules will reside inside ``/lib/modules/<kernel_version>/kernel/ directory``.

### <mark style="background: #FFF503A6;">Working with Kernel Modules</mark>

<mark style="background: #FFF503A6;">lsmod:</mark> Show the status of modules in the Linux Kernel, showing what kernel modules are currently loaded.  

<mark style="background: #FFF503A6;">insmod:</mark> insert a module into the Linux Kernel  

<mark style="background: #FFF503A6;">modinfo:</mark> show information about a Linux Kernel module  

<mark style="background: #FFF503A6;">rmmod:</mark> remove a module from the Linux Kernel  

<mark style="background: #FFF503A6;">modprob:</mark> add and remove modules from the Linux Kernel 

``sudo apt-get install build-essential linux-headers-`uname -r``

### <mark style="background: #FFF503A6;">Example: hello_world_mod.c</mark> 

```C
#include <linux/module.h> // Needed by all modules  
#include <linux/kernel.h> // Needed for KERN_INFO  
#include <linux/init.h> // Needed for the macros  
MODULE_LICENSE("GPL");  
MODULE_AUTHOR("Author");  
MODULE_DESCRIPTION("A Simple Hello World Module");  
MODULE_VERSION("0.1"); // It's a good practice to version your module  
static int __init hello_init(void) // Use __init to mark for initialisation  
only  
{  
	printk(KERN_INFO "Hello, world\n");  
	return 0; // A non 0 return means init_module failed; module can't be loaded.  
}  
static void __exit hello_exit(void) // Use __exit to mark for exit only  
{  
	printk(KERN_INFO "Goodbye, world\n");  
}  
module_init(hello_init);  
module_exit(hello_exit);
```

### <mark style="background: #FFF503A6;">Example: hello_world_mod.c</mark> 

<mark style="background: #FFF503A6;">linux/module.h:</mark> Core component for all modules.  

<mark style="background: #FFF503A6;">linux/kernel.h:</mark> Provides KERN_INFO for logging purposes.  

<mark style="background: #FFF503A6;">linux/init.h:</mark> Definitions for initialisation and exit macros.  

<mark style="background: #FFF503A6;">Module Macros:</mark>  
- MODULE_LICENSE("GPL"): License type, needed to avoid tainting the  
kernel.  
- MODULE_AUTHOR/DESCRIPTION/VERSION: Module metadata.  

<mark style="background: #FFF503A6;">Initialisation and Exit:</mark>  
- ``__init hello_init(void):`` Initialisation function, runs when module is loaded.  
- ``__exit hello_exit(void):`` Cleanup function, runs when module is removed.  
- <mark style="background: #FFF503A6;">Logging:</mark> ``printk(KERN_INFO "Hello/Goodbye, world\n")`` Logs messages to the kernel log.  
- <mark style="background: #FFF503A6;">Module Registration:</mark> ``module_init()`` and ``module_exit()`` macros register init and exit functions.

### <mark style="background: #FFF503A6;">Example: Makefile</mark>

```sh
obj-m += hello_world_mod.o  

# Use the KERNELDIR if exists, else default to /lib/modules/`uname -r`/build  
KERNELDIR ?= /lib/modules/$(shell uname -r)/build  

# PWD variable captures the current directory  
PWD := $(shell pwd)  
all:  
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules  
clean:  
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean`
```

``obj-m := hello_world_mod.o:`` Specifies the object file to be compiled.  

``KERNELDIR ?= /lib/modules/$(shell uname -r)/build:`` Sets the kernel directory, allows overriding.  

``PWD := $(shell pwd):`` Captures current directory for the make process.  

``all target:`` Invokes make in the kernel directory to build modules.  

``clean target:`` Cleans up module build artifacts.

### <mark style="background: #FFF503A6;">Use module</mark> 

Run make  

Insert the Module: sudo insmod hello_world_mod.ko to insert the module into the kernel.  

This triggers the hello_init function, and "Hello, world" is logged.  

Check the kernel log using sudo dmesg | tail.  

Should see the "Hello, world" message indicating the module was successfully loaded.  

Try modinfo hello_world_mod.ko  

Try lsmod  

Use sudo rmmod hello_world_mod to remove the module.  

Triggers the hello_exit function, and "Goodbye, world" is logged.  

Again, use ``sudo dmesg | tail to verify "Goodbye, world"`` is logged, indicating the module was removed cleanly.

### <mark style="background: #FFF503A6;">Module info</mark>

<table>
	<tr>
		<td>modinfo</td>
		<td>hello_world_mod.ko</td>
	</tr>
	<tr>
		<td>filename:</td>
		<td>hello_world_mod.ko</td>
	</tr>
	<tr>
		<td>version:</td>
		<td>0.1</td>
	</tr>
	<tr>
		<td>description:</td>
		<td>A Simple Hello World Module</td>
	</tr>
	<tr>
		<td>author:</td>
		<td>Author</td>
	</tr>
	<tr>
		<td>license:</td>
		<td>GPL</td>
	</tr>
	<tr>
		<td>srcversion:</td>
		<td>EC1FA09EA6EB912EEB5361A</td>
	</tr>
	<tr>
		<td>depends:</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>retpoline:</td>
		<td>Y</td>
	</tr>
	<tr>
		<td>name:</td>
		<td>hello_world_mo</td>
	</tr>
	<tr>
		<td>dvermagic:</td>
		<td>6.5.0-26-generic SMP preempt mod_unload modversions</td>
	</tr>
</table>


# <mark style="background: #FFF503A6;">18 auditd and init</mark>

<mark style="background: #FFF503A6;">Auditing user actions:</mark>  
- Who is doing what?
- Who modified that file??

### <mark style="background: #FFF503A6;">auditd:</mark>

auditd is the userspace component to the Linux Auditing System  

auditd is short for “Linux Audit Daemon” and its purpose is to write audit records to the disk.  

auditd is a native feature of the linux kernel to collect information on system activity, the main focus of this will be accountability and incident investigation (who did what)  

auditd uses hooks to system calls.

<mark style="background: #FFF503A6;">Difference between auditd & syslog:</mark>
- Syslog and the audit subsystem have different purposes.  
- syslog is a general logging daemon available for any application or the system to use for any reason.  
- The audit daemon's job is to track specific activities or events to determine who did what and when

<mark style="background: #FFF503A6;">Auditd can perform the following:</mark>  
- Monitoring system calls  
- Monitoring File access  
- Monitor auditable events within the kernel  

This will allow us to watch for particular types of events on a given system. We will need to specify what we want to watch (create rules).  

auditd is a logger, it offers no preventative measures. It only brings transparency and accountability.

### <mark style="background: #FFF503A6;">auditd – creating rules</mark>

Auditd offers a basic set of rules that can be used for logging particular events.  

Support is offered to create custom rules  

Rules are contained within rule files on the system.

### <mark style="background: #FFF503A6;">auditd rules & configuration</mark>

The default auditd configuration should be suitable for most environments.  

However, if your environment has to meet the criteria set by the Controlled Access Protection Profile (CAPP), which is a part of the Common Criteria certification, the Audit daemon configuration must abide by a strict set of rules  

An <mark style="background: #FFF503A6;">example of this</mark> is the directory that holds the Audit log files (usually /var/log/audit/) should reside on a separate partition. This prevents other processes from consuming space in this directory, and provides accurate detection of the remaining space for the Audit daemon.  

The CAPP is a Common Criteria security profile that specifies a set of functional and assurance requirements  

CAPP standards provide access controls that are capable of enforcing access limitations on individual users and data objects

### <mark style="background: #FFF503A6;">auditd rules – setup configuration</mark> 

There are auditd pre-defined rules that can be used to offer meaningful logging on a system.  

These will probably need to be setup and configured to suit the systems needs (what do we really need to audit?)  

<mark style="background: #FFF503A6;">Auditd can only audit:</mark>  
- The file system  
- System call rules  
- Other security related evens (logins, network connections, etc)  

For rules created it follows a “first match wins” approach.  

The rest of the rules are not evaluated

### <mark style="background: #FFF503A6;">auditd rules</mark>  

<mark style="background: #FFF503A6;">Rules are written to:</mark>  /etc/audit/audit.rules  

These rules are loaded by the audit daemon when it starts  

auditctl can be used to set rules  

These rules only make temp changes, we need to modify audit.rules to set a rule.  

<mark style="background: #FFF503A6;">Logs can be viewed via:</mark>  
- ausearch  
- aureport

### <mark style="background: #FFF503A6;">auditd reporting</mark>

<mark style="background: #FFF503A6;">ausearch</mark> facilitates a search of the audit logs for specific criteria.  

This can be command names, system calls, events etc...  

<mark style="background: #FFF503A6;">aureport</mark> facilitates the creation of summary reports from the audit logs. This shows less granular detail but offers better reporting via tabular lists etc...

### <mark style="background: #FFF503A6;">Auditing to Syslog</mark> 

It can be beneficial to centralise audit logs.  

The audisp-remote plugin can be used to send logs to a remote Syslog server.  

This takes audit events and writes them to Syslog.

### <mark style="background: #FFF503A6;">auditd</mark>

auditd - Tool for Security Auditing on Linux Server  

auditd or audit daemon, is a userspace component to the Linux Auditing System.  

It’s responsible for writing audit records to the disk.  

<mark style="background: #FFF503A6;">Install:</mark> 
```sh
sudo apt-get update && sudo apt-get install auditd  
sudo service auditd start
```  

<mark style="background: #FFF503A6;">To add a watch to a file or directory:</mark>
```sh
auditctl -w /var/www/html -p rwxa
```  

<mark style="background: #FFF503A6;">Search logs:</mark>  
```sh
ausearch -f /var/www/html/ > accesslog.txt
```

### <mark style="background: #FFF503A6;">auditctl</mark>

auditctl program is used to control the behaviour, get status, and add or delete rules  

See the man pages to view all options  

<mark style="background: #FFF503A6;">Examples:</mark>  
- To see all syscalls made by a specific program:
- ``auditctl -a exit,always -S all -F pid=1234``  
- To see files opened by a specific user:
- ``auditctl -a exit,always -S open -F auid=611``

### <mark style="background: #FFF503A6;">ausearch</mark> 

<mark style="background: #FFF503A6;">ausearch</mark> is a tool that can query the audit daemon logs based for events based on different search criteria

See man pages for options  

<mark style="background: #FFF503A6;">Examples:</mark>  
- Failed login attempts  
- ``ausearch -m USER_LOGIN -sv no``

### <mark style="background: #FFF503A6;">aureport</mark>

aureport is a tool that produces summary reports of the audit system logs  

See man pages for options  

<mark style="background: #FFF503A6;">Examples:</mark>  
- Login Summary Report  
- ``aureport -i --login --summary``  
- Executable Summary Report  
- ``aureport -i --executable --summary``

### <mark style="background: #FFF503A6;">System Startup</mark>

<mark style="background: #FFF503A6;">Booting a Linux installation involves multiple stages and software components:</mark>
- firmware initialisation  
- boot loader  
- loading and startup of a Linux kernel image  
- execution of various startup scripts and daemon processes  

Boot loader will load the kernel into memory. The Kernel will setup system functions such as essential hardware etc. The Kernel will create the init process to run in userspace.  

<mark style="background: #FFF503A6;">init will use one of the following:</mark>  
- scripts that are executed by the shell (sysv, bsd, runit)  
- configuration files that are executed by the binary components (systemd, upstart)

### <mark style="background: #FFF503A6;">System Startup - init process</mark>

Init – Initialisation  

Daemon process which runs in user space as soon as the computer starts.  

This is the first process to start and usually has a PID = 1  

Init is most commonly referred to as System V init.  

If the init daemon cannot start this will result in no processes being started and the system will reach a stage called “kernel panic”

Init begins the entire set of processes and manages this task.  

There are alternatives to init, we will see these later today.  
Init has been in existence since the Unix days (System V and LSB)  

Init operation is linked to a file: /etc/inittab  

The /etc/inittab file is used to set the default run level for the system.  

<mark style="background: #FFF503A6;">Every run level has an entire directory of scripts:</mark>
- S scripts start  
- K scripts finish

<mark style="background: #FFF503A6;">Init run levels</mark> 
- 0 – System halt i.e the system can be safely powered off with no activity.  
- 1 – Single user mode - no network interfaces, daemons  
- 2 – Multiple user mode with no NFS(network file system).  
- 3 – Starts the system normally  
- 4 – User-definable.  
- 5 – Multiple user mode under GUI (graphical user interface) this is basically level 3 with GUI (standard level for Linux)  
- 6 – Reboot