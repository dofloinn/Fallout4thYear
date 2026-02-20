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