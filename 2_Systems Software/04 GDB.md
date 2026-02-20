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