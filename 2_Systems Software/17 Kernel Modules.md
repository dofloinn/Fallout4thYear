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
- Separation of user space and kernel space prevents unauthorized access and instability in the system.  
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
static int __init hello_init(void) // Use __init to mark for initialization  
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

<mark style="background: #FFF503A6;">linux/init.h:</mark> Definitions for initialization and exit macros.  

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
