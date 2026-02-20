
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
- Execute – The execute authorization offers the ability to run the file. For example, you'll need this permission to run a shell script. The letter x describes this permission.  

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