### <mark style="background: #FFF503A6;">What is the stack?</mark>  

It’s a special region of your computer’s memory that stores temporary variables created by each function (including the main() function).  

The stack is a <mark style="background: #FFF503A6;">“LIFO” (last in, first out)</mark> data structure, that is managed and optimized by the CPU quite closely.  

Every time a function declares a new variable, it is “pushed” onto the stack.  

Then every time a function exits, all of the variables pushed onto the stack by that function, are freed (that is to say, they are deleted).  

Once a stack variable is freed, that region of memory becomes available for other stack variables

### <mark style="background: #FFF503A6;">Memory Management with Stack</mark> 

The advantage of using the stack to store variables, is that memory is managed for you.  

You don’t have to allocate memory by hand, or free it once you don’t need it anymore.  

What’s more, because the CPU organizes stack memory so efficiently, reading from and writing to stack variables is very fast.

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
2. (optionally) resizing the heap variable using ``realloc()``  
3. releasing the memory from the heap using ``free()``

### <mark style="background: #FFF503A6;">Allocating memory with malloc and calloc</mark>  

These functions are used to allocate memory at runtime.  

The ``malloc()`` function takes as input the size of the memory block to be allocated.  

The ``calloc()`` function is like ``malloc()`` except that it also initializes all elements to zero.  

The ``calloc()`` function takes two input arguments, the number of elements and the size of each element.  

Try out ``malloc-calloc.c``

### <mark style="background: #FFF503A6;">Resizing a variable using realloc</mark> 

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
https://www.youtube.com/watch?v=Rxvv9krECNw  
https://boredzo.org/pointers/