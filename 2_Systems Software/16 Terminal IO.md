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

Additional Reading  
Chapter 18 – Advanced Programming in the Unix Environment  
(Stevens and Rago)