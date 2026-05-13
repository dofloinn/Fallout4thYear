### <mark style="background: #FFF503A6;">1. File Descriptors</mark>

<mark style="background: #FFF503A6;">Definition:</mark> Each time a file is opened, the OS creates a record to represent the file. This information is stored in the system kernel. An integer value is assigned to each record/entry - this integer is the file descriptor. If a process has opened 5 files, there will be 5 file descriptors associated with the process.

<mark style="background: #FFF503A6;">Default file descriptors:</mark>
- `0` - stdin
- `1` - stdout
- `2` - stderr

<mark style="background: #FFF503A6;">Significance in systems programming:</mark> File descriptors are fundamental to I/O and IPC in Unix/Linux. They can connect to a file, a device (terminal), or a pipe/socket to communicate with another process. File descriptors offer a primitive, low-level interface for IO operations.

<mark style="background: #FFF503A6;">File Streams vs File Descriptors:</mark>
- <mark style="background: #FFF503A6;">Streams</mark> (`FILE *`) offer a high-level interface with more features, layered on top of file descriptors.
- <mark style="background: #FFF503A6;">File descriptors</mark> (`int`) are primitive and low-level; should be used for IO with devices and non-blocking IO.

<mark style="background: #FFF503A6;">C code example:</mark>
```c
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd1, fd2;
    char filename1[] = "file1.txt";
    char filename2[] = "file2.txt";

    fd1 = open(filename1, O_RDONLY);
    fd2 = open(filename2, O_WRONLY);

    if (fd1 == -1 || fd2 == -1) {
        perror("Error opening file");
        return 1;
    }

    printf("File descriptors:\n");
    printf("File 1: %d\n", fd1);   // likely 3
    printf("File 2: %d\n", fd2);   // likely 4

    close(fd1);
    close(fd2);
    return 0;
}
```

<mark style="background: #FFF503A6;">FDs and IPC:</mark> File descriptors support IPC through pipes (`pipe()` returns two FDs: `fd[0]` for reading, `fd[1]` for writing) and sockets.

### <mark style="background: #FFF503A6;">2. Canonical & Non-Canonical Terminal I/O</mark>

<mark style="background: #FFF503A6;">Two modes of terminal operation:</mark>
- Canonical
- Non-canonical

<mark style="background: #FFF503A6;">Canonical Mode (default):</mark>
- Terminal input is processed in lines terminated by newline, EOF, or EOL characters.
- Input is not read until a complete line has been entered.
- The system provides input editing (backspace, etc.).
- Limitations on line length via `_POSIX_MAX_CANON` and `MAX_CANON`.
- <mark style="background: #FFF503A6;">Use case:</mark> Normal shell input, text editors that work line by line.

<mark style="background: #FFF503A6;">Non-Canonical Mode:</mark>
- Individual characters are processed - no waiting for Enter.
- No automatic editing - backspace/delete are not handled by the driver.
- Programs handle special characters in their own way.
- <mark style="background: #FFF503A6;">Use case:</mark> Games, interactive programs (like `vim`), real-time input processing.

`termios` structure (in `<termios.h>`):
```c
struct termios {
    tcflag_t c_iflag;   // input flags
    tcflag_t c_oflag;   // output flags
    tcflag_t c_cflag;   // control flags
    tcflag_t c_lflag;   // local flags
    cc_t     c_cc[NCCS]; // control characters
};
```

<mark style="background: #FFF503A6;">Key functions:</mark>

| Function                        | Description                         |
| ------------------------------- | ----------------------------------- |
| `tcgetattr(fd, &term)`          | Get current terminal attributes     |
| `tcsetattr(fd, TCSANOW, &term)` | Set terminal attributes immediately |

<mark style="background: #FFF503A6;">Key control characters (c_cc array):</mark>
- `VMIN` - minimum characters for non-canonical read
- `VTIME` - timeout for non-canonical read
- `VEOF` - EOF character (default Ctrl+D)

<mark style="background: #FFF503A6;">Example - switching to non-canonical mode:</mark>
```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <termios.h>

int main(void) {
    struct termios term, original_term;
	
    if (tcgetattr(STDIN_FILENO, &term) < 0) {
        perror("tcgetattr"); return -1;
    }
    original_term = term;  // save original
	
    term.c_lflag &= ~ECHO;   // Disable echo
    term.c_cc[VMIN] = 1;     // Read 1 character at a time
    term.c_cc[VTIME] = 0;    // No timeout
	
    if (tcsetattr(STDIN_FILENO, TCSANOW, &term) < 0) {
        perror("tcsetattr"); return -1;
    }
	
    // ... read characters one at a time ...
	
    // Restore original settings
    tcsetattr(STDIN_FILENO, TCSANOW, &original_term);
    return 0;
}
```

### <mark style="background: #FFF503A6;">3. Signals & Signal Handling</mark>

<mark style="background: #FFF503A6;">What is a signal?</mark> A signal is a software interrupt - an asynchronous message sent to a program. Depending on the signal, the program decides how to proceed.

<mark style="background: #FFF503A6;">Three options when a signal is received:</mark>
1. Ignore the signal (`SIG_IGN`)
2. Catch the signal (define a custom handler function)
3. Go with the default (`SIG_DFL`)

<mark style="background: #FFF503A6;">Note:</mark> `SIGKILL` and `SIGSTOP` cannot be caught or ignored. This ensures the kernel/administrator can always terminate a process.

<mark style="background: #FFF503A6;">Header file:</mark> `#include <signal.h>`

<mark style="background: #FFF503A6;">Common signals:</mark>
- `SIGINT` - interrupt (Ctrl+C)
- `SIGTERM` - termination request
- `SIGKILL` - kill (cannot be caught)
- `SIGSTOP` - stop (cannot be caught)
- `SIGCHLD` - child process terminated
- `SIGHUP` - terminal hangup
- `SIGSEGV` - segmentation fault
- `SIGPIPE` - write to pipe with no readers

<mark style="background: #FFF503A6;">Signal handler example:</mark>
```c
#include <stdio.h>
#include <signal.h>
#include <unistd.h>

void sig_handler(int sigNum) {
    if (sigNum == SIGINT)
        printf("SIGINT Interrupt Received\n");
}

int main(void) {
    if (signal(SIGINT, sig_handler) == SIG_ERR) {
        printf("\nSomething went wrong!!\n");
    }
    while(1) {
        sleep(1);
    }
    return 0;
}
```

<mark style="background: #FFF503A6;">Handling SIGINT and SIGTERM cleanly with a flag:</mark>
```c
#include <stdio.h>
#include <signal.h>
#include <unistd.h>

volatile sig_atomic_t running = 1;

void handle_signal(int sig) {
    running = 0;   // set flag - handler stays simple
}

int main() {
    signal(SIGINT, handle_signal);
    signal(SIGTERM, handle_signal);

    while (running) {
        sleep(1);
        printf("Running...\n");
    }
    printf("Exiting cleanly.\n");
    return 0;
}
```

Why `volatile sig_atomic_t`?
- `volatile` tells the compiler the value can change unexpectedly (from signal handler).
- `sig_atomic_t` ensures atomic read/write - safe from race conditions between the main loop and handler.
- Signal handlers should be kept simple - just set a flag, not do complex work.

<mark style="background: #FFF503A6;">Signal handler limitations:</mark>
- Should not call non-reentrant functions (e.g. `printf`, `malloc`) from inside handlers.
- Should only set flags or call async-signal-safe functions.

### <mark style="background: #FFF503A6;">4. Pipes & FIFOs (Named Pipes)</mark>

<mark style="background: #FFF503A6;">What is a pipe? (Unnamed pipes)</mark>
- Allows processes to communicate with each other (IPC).
- Data passes in FIFO order.
- The pipe has no name (unnamed).
- Created by a parent process, used to communicate with a child process.
- One-way communication only.

<mark style="background: #FFF503A6;">Syntax:</mark>
```c
int pipe(int fds[2]);
// fd[0] = read end
// fd[1] = write end
// Returns: 0 on success, -1 on error
```

<mark style="background: #FFF503A6;">Rules for closing pipes:</mark>
- If you read from a pipe that was closed → return value is `0`.
- If you write to a pipe whose read end is closed → `SIGPIPE` is sent.

<mark style="background: #FFF503A6;">Pipe example (child sends to parent):</mark>
```c
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int main(void) {
    int fd[2];
    pid_t pid;
    char string[] = "Hello from child!\n";
    char readbuffer[100];

    pipe(fd);
    pid = fork();

    if (pid == 0) {          // Child
        close(fd[0]);        // close read end
        write(fd[1], string, strlen(string)+1);
        exit(0);
    } else {                 // Parent
        close(fd[1]);        // close write end
        read(fd[0], readbuffer, sizeof(readbuffer));
        printf("Message from Child: %s", readbuffer);
    }
    return 0;
}
```

<mark style="background: #FFF503A6;">Parent-to-child:</mark> parent closes `fd[0]`, child closes `fd[1]`.

<mark style="background: #FFF503A6;">Child-to-parent:</mark> parent closes `fd[1]`, child closes `fd[0]`.

<mark style="background: #FFF503A6;">Kernel's role:</mark> The pipe is implemented in kernel memory. The kernel manages the buffer, handles blocking when the pipe is empty/full, and sends `SIGPIPE` on broken pipe.

<mark style="background: #FFF503A6;">Key differences between unnamed and named pipes:</mark>

| Unnamed Pipe | Named Pipe (FIFO) |
|---|---|
| No name, exists in kernel only | Exists as a special file in the filesystem |
| Only between related processes (parent/child) | Any unrelated processes can use it |
| Created with `pipe()` | Created with `mkfifo()` |
| Automatically cleaned up | Must be explicitly removed with `unlink()` |

<mark style="background: #FFF503A6;">Creating a FIFO:</mark>
```c
mkfifo("myfifo", 0666);   // create FIFO file
```

<mark style="background: #FFF503A6;">Using a FIFO (standard file I/O):</mark>
```c
// Writer:
int fd = open("myfifo", O_WRONLY);
write(fd, buffer, strlen(buffer));
close(fd);

// Reader:
int fd = open("myfifo", O_RDONLY);
read(fd, buffer, sizeof(buffer));
close(fd);

// Cleanup:
unlink("myfifo");
```

The FIFO file appears in `ls -l` with `p` as the first character: `prw-rw-r--`

### <mark style="background: #FFF503A6;">5. Daemons - Creating a Daemon Process</mark>

<mark style="background: #FFF503A6;">What is a daemon?</mark> 
- A process that runs in the background, not under the control of a user. 
- Usually started at boot, terminates at shutdown. 
- Has Parent PID of 1. 

<mark style="background: #FFF503A6;">Examples:</mark> `crond`, `mysqld`, `apache`.

<mark style="background: #FFF503A6;">Steps to Create a Daemon:</mark>
1. Fork - create a child process, then parent exits. Child continues.
2. setsid() - child calls `setsid()` to become a new session leader, detaching from the controlling terminal.
3. Ignore signals - ignore `SIGCHLD` and `SIGHUP` to prevent unexpected behaviour.
4. Second fork - fork again; session leader exits. Remaining child can never acquire a controlling terminal.
5. chdir("/") - change working directory to root to avoid locking any mount point.
6. umask(0) - reset file permission mask so the daemon can create files with any permissions.
7. Close all open file descriptors - iterate and close everything to prevent resource leaks.
8. Open log - use `openlog()` / `syslog()` since there's no terminal for error output.

<mark style="background: #FFF503A6;">Full daemon example:</mark>
```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <syslog.h>

static void become_daemon() {
    pid_t child_pid;

    // Step 1: First fork
    child_pid = fork();
    if (child_pid < 0) exit(EXIT_FAILURE);
    if (child_pid > 0) exit(EXIT_SUCCESS);  // parent exits

    // Step 2: Become session leader
    if (setsid() < 0) exit(EXIT_FAILURE);

    // Step 3: Ignore signals
    signal(SIGCHLD, SIG_IGN);
    signal(SIGHUP, SIG_IGN);

    // Step 4: Second fork
    child_pid = fork();
    if (child_pid < 0) exit(EXIT_FAILURE);
    if (child_pid > 0) exit(EXIT_SUCCESS);  // session leader exits

    // Step 5: Change working directory
    chdir("/");

    // Step 6: Reset umask
    umask(0);

    // Step 7: Close all open file descriptors
    for (int fd = sysconf(_SC_OPEN_MAX); fd >= 0; fd--) {
        close(fd);
    }

    // Step 8: Open syslog
    openlog("mydaemon", LOG_PID, LOG_DAEMON);
}

int main() {
    become_daemon();

    while (1) {
        syslog(LOG_NOTICE, "mydaemon running");
        sleep(20);
        break;
    }

    syslog(LOG_NOTICE, "mydaemon terminated");
    closelog();
    return EXIT_SUCCESS;
}
```

<mark style="background: #FFF503A6;">What to look for when running:</mark>
- `TTY = ?` - no controlling terminal
- `PPID = 1` - parent is init
- `PID != SID` - not the session leader (second fork ensures this)
- 
### <mark style="background: #FFF503A6;">6. exec() Family</mark>

<mark style="background: #FFF503A6;">Purpose:</mark> 
- Replace the current process image with a new one. 
- The current process stops and a new program starts executing. 
- It does not create a new process.

<mark style="background: #FFF503A6;">Two families:</mark>
- ``execl`` 
- ``execv``

`execl` family - arguments passed as individual strings (variadic):
- `execl(path, arg0, arg1, ..., NULL)`
- `execlp(file, arg0, arg1, ..., NULL)` - searches PATH
- `execle(path, arg0, ..., NULL, envp[])` - custom environment

`execv` family - arguments passed as a null-terminated array:
- `execv(path, argv[])` - needs full path
- `execvp(file, argv[])` - searches PATH
- `execve(path, argv[], envp[])` - custom environment, needs full path
- `execvpe(file, argv[], envp[])` - PATH search + custom environment

<mark style="background: #FFF503A6;"> Categorisation table:</mark>

| Function | Arg format | Path search | Custom env |
|---|---|---|---|
| `execl` | list | no | no |
| `execlp` | list | yes | no |
| `execle` | list | no | yes |
| `execv` | array | no | no |
| `execvp` | array | yes | no |
| `execve` | array | no | yes |
| `execvpe` | array | yes | yes |

<mark style="background: #FFF503A6;">Memory tip:</mark>
- `l` = list (individual args), `v` = vector (array)
- `p` = PATH search, `e` = environment

`execvp` - takes program name + argument array, searches PATH:
```c
char *argv[] = {"ls", "-la", NULL};
execvp("ls", argv);  // finds 'ls' in PATH automatically
```

`execve` - requires full path, custom environment array:
```c
char *argv[] = {"/bin/ls", "-la", NULL};
char *envp[] = {"HOME=/tmp", "PATH=/bin:/usr/bin", NULL};
execve("/bin/ls", argv, envp);  // full control
```

<mark style="background: #FFF503A6;">Practical example with fork:</mark>
```c
pid_t pid = fork();
if (pid == 0) {  // child
    char *argv[] = {"echo", "Hello", NULL};
    execv("/bin/echo", argv);
    exit(127);  // only reached if exec fails
} else {
    // parent continues
    wait(NULL);
}
```

### <mark style="background: #FFF503A6;">7. Makefiles</mark>

<mark style="background: #FFF503A6;">Purpose:</mark> GNU `make` automates which parts of a large program need to be recompiled. It can automate compilation, cleaning, debugging, and organising outputs.

<mark style="background: #FFF503A6;">Why use makefiles:</mark>
- Faster to recompile (only recompiles changed files)
- Organises compilation steps in one place

<mark style="background: #FFF503A6;">Structure of a Rule:</mark>
- <mark style="background: #FFF503A6;">Target:</mark> name of the file to build, or a phony target (e.g. `clean`)
- <mark style="background: #FFF503A6;">Prerequisites:</mark> files the target depends on; if any change, the target is rebuilt
- <mark style="background: #FFF503A6;">Command:</mark> TAB-indented shell command(s) to build the target

```
target: prerequisites
	command(s)
```

<mark style="background: #FFF503A6;">Example makefile:</mark>
```makefile
build: go.c primes.c
	gcc -o go go.c primes.c

run:
	./go 3

clean:
	rm go
```

<mark style="background: #FFF503A6;">How it works:</mark>
- `make build` - checks if `go.c` or `primes.c` have changed; if so, recompiles.
- `make clean` - runs the clean recipe.
- If no target is specified, the first rule is run by default.

<mark style="background: #FFF503A6;">Modular design:</mark> Larger projects split into object files, each with its own rule. 

<mark style="background: #FFF503A6;">Only changed modules are recompiled:</mark>
```makefile
main: main.o utils.o
	gcc -o main main.o utils.o

main.o: main.c
	gcc -c main.c

utils.o: utils.c utils.h
	gcc -c utils.c
```

---

### <mark style="background: #FFF503A6;">8. systemd & Service Units</mark>

<mark style="background: #FFF503A6;">Context:</mark> Linux boot involves firmware → boot loader → kernel → init process. Modern systems use systemd (or upstart) instead of traditional SysV init.

<mark style="background: #FFF503A6;">Init process:</mark> First process to start (PID = 1). Starts all other processes. If it fails → "kernel panic".

<mark style="background: #FFF503A6;">systemd</mark> is a service manager that uses unit files (configuration files) to manage daemons and services.

<mark style="background: #FFF503A6;">Unit file location:</mark> `/etc/systemd/system/` or `/lib/systemd/system/`

Structure of a `.service` unit file:
```ini
[Unit]
Description=My Custom Daemon
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/mydaemon
Restart=on-failure
User=nobody

[Install]
WantedBy=multi-user.target
```

<mark style="background: #FFF503A6;">Key sections:</mark>
- `[Unit]` - description and dependencies (`After=` controls start order)
- `[Service]` - how to start/stop the service:
  - `Type=simple` - process started by `ExecStart` is the main process
  - `ExecStart` - command to start the daemon
  - `Restart=on-failure` - auto-restart if it crashes
- `[Install]` - when to start (runlevel equivalent)

<mark style="background: #FFF503A6;">Managing services:</mark>
```bash
systemctl start myservice       # start
systemctl stop myservice        # stop
systemctl enable myservice      # start at boot
systemctl status myservice      # check status
journalctl -u myservice         # view logs
```

---

### <mark style="background: #FFF503A6;">9. dup() and dup2()</mark>

`dup(fd)` - creates a copy of `fd` using the lowest-numbered unused file descriptor. Both FDs refer to the same open file.

`dup2(oldfd, newfd)` - makes `newfd` a copy of `oldfd`. If `newfd` is already open, it is first closed. This is used to redirect standard input/output.

Classic use - implementing a shell pipeline (`ls -la | grep .txt`):
```c
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>

void exec1(int pipefd[2]) {
    dup2(pipefd[1], 1);   // Redirect stdout → pipe write end
    close(pipefd[0]);
    close(pipefd[1]);
    execlp("ls", "ls", "-la", NULL);
    perror("exec ls"); exit(1);
}

void exec2(int pipefd[2]) {
    dup2(pipefd[0], 0);   // Redirect stdin ← pipe read end
    close(pipefd[0]);
    close(pipefd[1]);
    execlp("grep", "grep", ".txt", NULL);
    perror("exec grep"); exit(1);
}

int main() {
    int pipefd[2];
    if (pipe(pipefd) == -1) { perror("pipe"); exit(1); }

    pid_t pid = fork();
    if (pid == 0) exec1(pipefd);   // child 1: ls

    pid = fork();
    if (pid == 0) exec2(pipefd);   // child 2: grep

    close(pipefd[0]);
    close(pipefd[1]);
    wait(NULL);
    wait(NULL);
    return 0;
}
```

<mark style="background: #FFF503A6;">How it works:</mark>
- `dup2(pipefd[1], 1)` makes stdout (fd 1) point to the pipe's write end.
- `dup2(pipefd[0], 0)` makes stdin (fd 0) point to the pipe's read end.
- After `dup2`, close the original pipe FDs - no longer needed.
- `execlp` replaces the process image - `ls` writes to what it thinks is stdout, but is actually the pipe.

### <mark style="background: #FFF503A6;">10. syslog</mark>

<mark style="background: #FFF503A6;">Purpose:</mark> Centralised logging for daemons and system processes. Daemons have no controlling terminal so can't use `fprintf(stderr, ...)`.

<mark style="background: #FFF503A6;">Header:</mark> `#include <syslog.h>`

<mark style="background: #FFF503A6;">Three key functions:</mark>
- ``openlog()``
- ``syslog()``
- ``closelog()``

<mark style="background: #FFF503A6;">openlog(ident, option, facility):</mark> Opens a connection to the system logger

<mark style="background: #FFF503A6;">Parameters:</mark>
- `ident` - string prepended to every log message (usually program name)
- `option` flags:
	- `LOG_PID` - include PID in each message
	- `LOG_CONS` - write to console if logging fails
	- `LOG_NDELAY` - open connection immediately
- `facility` - type of program logging:
	- `LOG_DAEMON` - system daemons
	- `LOG_USER` - user-level messages
	- `LOG_KERN` - kernel messages
	- `LOG_AUTH` - security/auth messages
	- `LOG_CRON` - cron daemon

<mark style="background: #FFF503A6;">syslog(priority, format, ...)</mark> Generates a log message

<mark style="background: #FFF503A6;">Priority levels (decreasing importance):</mark>

| Level | Meaning |
|---|---|
| `LOG_EMERG` | System is unusable |
| `LOG_ALERT` | Action must be taken immediately |
| `LOG_CRIT` | Critical conditions |
| `LOG_ERR` | Error conditions |
| `LOG_WARNING` | Warning conditions |
| `LOG_NOTICE` | Normal but significant |
| `LOG_INFO` | Informational |
| `LOG_DEBUG` | Debug-level messages |

<mark style="background: #FFF503A6;">closelog()</mark> Closes the connection to the logger.

<mark style="background: #FFF503A6;">Complete example:</mark>
```c
#include <syslog.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    // LOG_CONS: write to console on error
    // LOG_PID: include PID in messages
    // LOG_USER: user-level facility
    openlog("example_program", LOG_CONS | LOG_PID, LOG_USER);
    
    syslog(LOG_INFO, "Program started");
    syslog(LOG_WARNING, "Something looks odd");
    syslog(LOG_ERR, "An error occurred: %s", "details here");
    
    closelog();
    return EXIT_SUCCESS;
}
```

<mark style="background: #FFF503A6;">Reading syslog:</mark> `grep example_program /var/log/syslog`

<mark style="background: #FFF503A6;">Output format:</mark> `Mar 14 15:31:48 hostname example_program[PID]: message`


### <mark style="background: #FFF503A6;">11. GDB Debugging & Segmentation Faults</mark>

<mark style="background: #FFF503A6;">Compilation:</mark> Must compile with debug symbols using the `-g` flag

```bash
gcc -g myprogram.c -o myprogram
```

This creates a <mark style="background: #FFF503A6;">Debugging Symbol Table</mark> - maps binary instructions back to source code lines/variables/functions.

<mark style="background: #FFF503A6;">Starting GDB:</mark>
```bash
gdb myprogram         # load program
gdb myprogram core    # load with core dump
```

<mark style="background: #FFF503A6;">Key GDB Commands:</mark>

| Command | Purpose |
|---|---|
| `run` / `run arg1 arg2` | Start/restart the program |
| `quit` | Exit GDB |
| `kill` | Stop the running program |
| `continue` (`c`) | Resume after stopping |
| `next` (`n`) | Execute next line (no step into) |
| `step` (`s`) | Step into function calls |
| `list` | Show source code around current position |
| `print age` | Print value of variable `age` |
| `set age = 21` | Change value of variable |
| `call myFunc()` | Call a function |
| `backtrace` (`bt`) | Show stack frames |
| `info frame` | Details of current stack frame |
| `frame 2` | Switch to stack frame 2 |

<mark style="background: #FFF503A6;">Breakpoints:</mark>

```bash
break 12              # breakpoint at line 12
break hello.c:12      # breakpoint in specific file
break myfunction      # breakpoint at function
tbreak 12             # temporary breakpoint (fires once)
info breakpoints      # list all breakpoints
disable 12            # disable breakpoint
ignore 12 1           # skip breakpoint once
```

<mark style="background: #FFF503A6;">Watchpoints (variable watch):</mark>
```bash
watch age             # break when 'age' is written
rwatch age            # break when 'age' is read
awatch age            # break on read or write
```

<mark style="background: #FFF503A6;">Debugging Segmentation Faults:</mark>
1. Compile with `-g`
2. Run program in GDB: `gdb ./myprogram`
3. Type `run` - GDB catches the segfault and shows the line
4. Use `backtrace` to see the full call stack
5. Use `print` to inspect variables at the point of crash
6. Use `list` to view the source code around the crash

<mark style="background: #FFF503A6;">Example session:</mark>
```
$ gcc -g myprogram.c -o myprogram
$ gdb myprogram
(gdb) run
Program received signal SIGSEGV, Segmentation fault.
(gdb) backtrace
#0  0x... in process_data (ptr=0x0) at myprogram.c:25
#1  0x... in main () at myprogram.c:10
(gdb) print ptr
$1 = 0x0    <- NULL pointer - found the bug!
```

### <mark style="background: #FFF503A6;">12. Threads, Race Conditions & Mutexes</mark>

<mark style="background: #FFF503A6;">Introduction to Threading:</mark> A thread is a unit of execution within a process - a lightweight process that shares the same memory and resources as the main process but executes instructions independently.

<mark style="background: #FFF503A6;">Why use threads?</mark>
1. <mark style="background: #FFF503A6;">Parallelism:</mark> split large work across multiple CPU cores.
2. <mark style="background: #FFF503A6;">Avoid blocking:</mark> while one thread waits for I/O, others continue working.

<mark style="background: #FFF503A6;">Threads vs processes:</mark>
- Threads share address space, heap, global variables, open FDs.
- Each thread has its own stack, program counter, and registers.
- Context switching between threads is faster than between processes.
- No need for IPC - threads communicate via shared memory.

<mark style="background: #FFF503A6;">User Threads vs Kernel Threads:</mark>

| User Threads | Kernel Threads |
|---|---|
| Managed at application level | Managed by the OS |
| Faster to create, cheaper context switch | More expensive to create/manage |
| OS unaware - can't use multiple cores directly | Full OS support, can run on multiple cores |
| Blocking one can block all | One blocking doesn't block others |

<mark style="background: #FFF503A6;">POSIX Threads (pthreads):</mark>
- Header: `#include <pthread.h>` 
- compile with `-lpthread`

<mark style="background: #FFF503A6;">Key functions:</mark>

| Function | Purpose |
|---|---|
| `pthread_create(&tid, NULL, func, arg)` | Create a new thread |
| `pthread_join(tid, &retval)` | Wait for thread to finish |
| `pthread_exit(retval)` | Exit current thread |
| `pthread_self()` | Get current thread ID |
| `pthread_cancel(tid)` | Request cancellation of a thread |

<mark style="background: #FFF503A6;">Basic thread example:</mark>
```c
#include <stdio.h>
#include <pthread.h>

void *thread_function(void *arg) {
    printf("Thread running, ID: %lu\n", pthread_self());
    pthread_exit(NULL);
}

int main() {
    pthread_t thread;
    pthread_create(&thread, NULL, thread_function, NULL);
    pthread_join(thread, NULL);   // wait for thread
    printf("Thread finished.\n");
    return 0;
}
```

### <mark style="background: #FFF503A6;">Race Conditions</mark>

<mark style="background: #FFF503A6;">What is a race condition?</mark> When multiple threads access shared data and at least one modifies it, without synchronisation. The result depends on the timing of thread execution - non-deterministic.

<mark style="background: #FFF503A6;">Classic example - shared counter:</mark>
```c
int counter = 0;

void* increment(void* arg) {
    for (int i = 0; i < 1000000; i++)
        counter++;   // NOT SAFE - race condition!
    return NULL;
}
```

Running two threads gives inconsistent results (e.g. 1,262,171 instead of 2,000,000) because `counter++` is not atomic - it is load → add → store, and a context switch can happen between these steps.

A critical section is code that accesses shared data and must not be executed by more than one thread at a time.

<mark style="background: #FFF503A6;">Mutexes (Mutual Exclusion):</mark> A mutex is a synchronisation primitive that acts as a lock - only one thread can hold it at a time.

```c
pthread_mutex_t lock;
pthread_mutex_lock(&lock);
// --- critical section ---
counter++;
// -----------------------
pthread_mutex_unlock(&lock);
```

<mark style="background: #FFF503A6;">Full thread-safe counter example:</mark>
```c
#include <stdio.h>
#include <pthread.h>

int counter = 0;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void* increment(void* arg) {
    for (int i = 0; i < 1000000; i++) {
        pthread_mutex_lock(&mutex);
        counter++;
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}

int main() {
    pthread_t t1, t2;
    pthread_create(&t1, NULL, increment, NULL);
    pthread_create(&t2, NULL, increment, NULL);
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    printf("Final: %d [should be 2000000]\n", counter);
    pthread_mutex_destroy(&mutex);
    return 0;
}
```

<mark style="background: #FFF503A6;">Result with mutex:</mark> Always `2000000` - deterministic.

### <mark style="background: #FFF503A6;">13. Kernel Modules</mark>

<mark style="background: #FFF503A6;">What is a kernel module?</mark> A Loadable Kernel Module (LKM) is a piece of code that can be loaded into and removed from the running Linux kernel at runtime - without rebooting or recompiling the kernel.

<mark style="background: #FFF503A6;">Why use kernel modules?</mark>
- Add device drivers without rebuilding the kernel.
- Modular design - only load what you need.
- Modules run in kernel space (privileged, full hardware access).
- Flexibility - update driver code without kernel rebuild.
- File extension: `.ko`
- Location: `/lib/modules/<kernel_version>/kernel/`

<mark style="background: #FFF503A6;">Common uses:</mark> 
- device drivers, 
- filesystem drivers, 
- network protocols.

<mark style="background: #FFF503A6;">Advantages:</mark> 
- flexible, 
- no kernel rebuild needed.

<mark style="background: #FFF503A6;">Risks:</mark> 
- run in kernel space
- a bug can crash the entire system; 
- security risk if malicious.

<mark style="background: #FFF503A6;">Working with modules:</mark>
```bash
lsmod          # list loaded modules
insmod mod.ko  # insert module
rmmod mod      # remove module
modinfo mod.ko # show module info
modprobe mod   # add/remove with dependency handling
```

<mark style="background: #FFF503A6;">Simple module example:</mark>
```c
#include <linux/module.h>  // required by all modules
#include <linux/kernel.h>  // for KERN_INFO
#include <linux/init.h>    // for __init/__exit macros

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Author");
MODULE_DESCRIPTION("A Simple Hello World Module");
MODULE_VERSION("0.1");

static int __init hello_init(void) {
    printk(KERN_INFO "Hello, world\n");
    return 0;  // non-zero = module failed to load
}

static void __exit hello_exit(void) {
    printk(KERN_INFO "Goodbye, world\n");
}

module_init(hello_init);
module_exit(hello_exit);
```

<mark style="background: #FFF503A6;">Key points:</mark>
- `printk()` instead of `printf()` - logs to kernel ring buffer
- `__init` marks function for initialisation only (freed after loading)
- `__exit` marks function for cleanup only
- `MODULE_LICENSE("GPL")` required to avoid "tainting" the kernel

### <mark style="background: #FFF503A6;">14. Unix Philosophy & Design Rules (Eric Raymond)</mark>

<mark style="background: #FFF503A6;">Doug McIlroy's Unix Philosophy (1978):</mark>
1. Make each program do one thing well.
2. Expect the output of every program to become the input of another.
3. Design software to be tried early - throw away clumsy parts and rebuild.
4. Use tools in preference to unskilled help.

<mark style="background: #FFF503A6;">Summarised by Peter Salus:</mark>
1. Write programs that do one thing and do it well.
2. Write programs to work together.
3. Write programs to handle text streams - the universal interface.

<mark style="background: #FFF503A6;">Eric Raymond's 17 Rules (The Art of Unix Programming):</mark>

| Rule | Summary |
|---|---|
| Rule of Modularity | Write simple parts connected by clean interfaces |
| Rule of Clarity | Clarity is better than cleverness |
| Rule of Composition | Design programs to be connected to other programs |
| Rule of Separation | Separate policy from mechanism; interfaces from engines |
| Rule of Simplicity | Design for simplicity; add complexity only where you must |
| Rule of Parsimony | Write a big program only when nothing else will do |
| Rule of Transparency | Design for visibility to make inspection and debugging easier |
| Rule of Robustness | Robustness is the child of transparency and simplicity |
| Rule of Representation | Fold knowledge into data so logic can be stupid and robust |
| Rule of Least Surprise | Always do the least surprising thing |
| Rule of Silence | When a program has nothing to say, it should say nothing |
| Rule of Repair | Fail noisily and as soon as possible |
| Rule of Economy | Programmer time is expensive; conserve it |
| Rule of Generation | Write programs to write programs when you can |
| Rule of Optimisation | Prototype before polishing; get it working before optimising |
| Rule of Diversity | Distrust all claims for "one true way" |
| Rule of Extensibility | Design for the future |

<mark style="background: #FFF503A6;">Rule of Simplicity: Unnecessary complexity is dangerous because:</mark>
- It makes code harder to understand, maintain, and debug.
- Complex systems have more places for bugs to hide.
- Simple systems are easier to reason about and test.
- "Fancy algorithms are buggier than simple ones" (Rob Pike).

<mark style="background: #FFF503A6;">Rule of Transparency:</mark>
- Design so that the program's internal state is visible - e.g. through logging, clear data structures, predictable behaviour. 
- Supports debugging (you can see what went wrong), 
- monitoring (operational visibility), 
- maintenance (others can understand it).

<mark style="background: #FFF503A6;">General design principles:</mark>
- <mark style="background: #FFF503A6;">DRY</mark> - Don't Repeat Yourself
- <mark style="background: #FFF503A6;">KISS</mark> - Keep It Simple, Stupid
- <mark style="background: #FFF503A6;">YAGNI</mark> - You Ain't Gonna Need It
- <mark style="background: #FFF503A6;">SoC</mark> - Separation of Concerns

<mark style="background: #FFF503A6;">Modularity in systems programming:</mark>
- <mark style="background: #FFF503A6;">Separation of concerns:</mark> different responsibilities in different modules.
- <mark style="background: #FFF503A6;">Information hiding:</mark> internal implementation details not exposed.
- <mark style="background: #FFF503A6;">Low coupling:</mark> modules depend on each other as little as possible.
- <mark style="background: #FFF503A6;">High cohesion:</mark> related functionality grouped together.

### <mark style="background: #FFF503A6;">15. stat() Function</mark>

<mark style="background: #FFF503A6;">Purpose:</mark> Retrieves information about a file - its metadata.

```c
#include <sys/stat.h>
int stat(const char *pathname, struct stat *statbuf);
```

<mark style="background: #FFF503A6;">Key fields of struct stat:</mark>

| Field        | Description                                           |
| ------------ | ----------------------------------------------------- |
| `st_mode`    | File type and permissions (use with `S_IFMT` bitmask) |
| `st_ino`     | Inode number                                          |
| `st_nlink`   | Number of hard links                                  |
| `st_uid`     | User ID of owner                                      |
| `st_gid`     | Group ID of owner                                     |
| `st_size`    | File size in bytes                                    |
| `st_blksize` | Preferred I/O block size                              |
| `st_blocks`  | Number of 512-byte blocks allocated                   |
| `st_atime`   | Last access time                                      |
| `st_mtime`   | Last modification time                                |
| `st_ctime`   | Last status change time                               |

<mark style="background: #FFF503A6;">File type detection with st_mode:</mark>
```c
struct stat s;
stat(argv[1], &s);

switch (s.st_mode & S_IFMT) {
    case S_IFREG:  printf("regular file\n");    break;
    case S_IFDIR:  printf("directory\n");        break;
    case S_IFIFO:  printf("FIFO/pipe\n");        break;
    case S_IFLNK:  printf("symlink\n");          break;
    case S_IFCHR:  printf("character device\n"); break;
    case S_IFBLK:  printf("block device\n");     break;
    case S_IFSOCK: printf("socket\n");           break;
}
```

<mark style="background: #FFF503A6;">Related functions:</mark>
- `fstat(fd, &s)` - same but takes an open file descriptor
- `fstatat(fd, path, &s, flags)` - relative to a directory FD


### <mark style="background: #FFF503A6;">16. Message Queues (IPC)</mark>

<mark style="background: #FFF503A6;">What is a message queue?</mark> A linked list of messages stored in the kernel. Each queue has a unique identifier. Processes exchange data as discrete messages.

<mark style="background: #FFF503A6;">Two implementations:</mark>
- <mark style="background: #FFF503A6;">POSIX message queues</mark> (`mq_open`, `mq_send`, `mq_receive`) - preferred, more predictable.
- <mark style="background: #FFF503A6;">System V message queues</mark> (`msgget`, `msgsnd`, `msgrcv`) - older, legacy.

<mark style="background: #FFF503A6;">POSIX Message Queue vs Named Pipe (FIFO):</mark>

| Feature | Named Pipe (FIFO) | Message Queue |
|---|---|---|
| Data format | Byte stream | Discrete messages with priority |
| Message boundaries | No (stream) | Yes - preserved |
| Retrieval | FIFO only | By priority or FIFO |
| Visibility | Filesystem entry | Identified by name (e.g. `/myqueue`) |
| When to use | Simple byte streaming between processes | When you need typed/prioritised messages |

<mark style="background: #FFF503A6;">When to use FIFO:</mark> Simple unidirectional data streaming between related/unrelated processes (e.g. simple chat).

<mark style="background: #FFF503A6;">When to use message queue:</mark> When messages need priorities, or message boundaries must be preserved (e.g. task dispatcher).

<mark style="background: #FFF503A6;">POSIX MQ server setup:</mark>
```c
#include <mqueue.h>

mqd_t mq;
struct mq_attr attr;
attr.mq_flags = 0;
attr.mq_maxmsg = 10;
attr.mq_msgsize = 1024;
attr.mq_curmsgs = 0;

mq = mq_open("/myqueue", O_CREAT | O_RDONLY, 0644, &attr);

char buffer[1024 + 1];
ssize_t bytes = mq_receive(mq, buffer, 1024, NULL);
buffer[bytes] = '\0';
printf("Received: %s\n", buffer);

mq_close(mq);
mq_unlink("/myqueue");
```

<mark style="background: #FFF503A6;">Client:</mark>
```c
mqd_t mq = mq_open("/myqueue", O_WRONLY);
char *msg = "Hello from client";
mq_send(mq, msg, strlen(msg)+1, 0);
mq_close(mq);
```

---

### <mark style="background: #FFF503A6;">17. Profiling with gprof</mark>

<mark style="background: #FFF503A6;">Purpose:</mark> Identify which parts of your program are taking the most execution time (performance bottlenecks).

<mark style="background: #FFF503A6;">1. Compile with profiling enabled:</mark>
```bash
gcc -pg -o myprogram myprogram.c
```

The `-pg` flag causes every function to call `mcount` as one of its first operations, which records call graph data.

<mark style="background: #FFF503A6;">2. Run the program (generates `gmon.out`):</mark>
```bash
./myprogram
```

<mark style="background: #FFF503A6;">3. Analyse with gprof:</mark>
```bash
gprof myprogram gmon.out > analysis.txt
```

<mark style="background: #FFF503A6;">What gprof reports:</mark>
- <mark style="background: #FFF503A6;">Flat profile:</mark> how much time was spent in each function.
- <mark style="background: #FFF503A6;">Call graph:</mark> which functions called which, and how many times.

<mark style="background: #FFF503A6;">How it works:</mark>
- Compiler instruments every function with `mcount` calls.
- `mcount` records call counts and call graph in memory.
- Additionally, the OS samples the program counter at regular intervals (histogram of where time is spent).
- On program exit, data is written to `gmon.out`.

<mark style="background: #FFF503A6;">Limitations:</mark>
- Instrumentation adds overhead - may affect timing slightly.
- Instrumentation code may alter cache behaviour.
- A sampling profiler (no instrumentation) gives more accurate timing but less call detail.

### <mark style="background: #FFF503A6;">18. umask</mark>

<mark style="background: #FFF503A6;">What is umask?</mark> The file mode creation mask. It is a bitmask that specifies which permission bits are removed (masked out) when a new file or directory is created.

<mark style="background: #FFF503A6;">How it works:</mark>
- `umask(022)` means: remove write permission for group and others.
- A file created with `open(..., 0666)` with `umask(022)` gets permissions `0644`.
- <mark style="background: #FFF503A6;">Formula:</mark> `actual_permissions = requested_permissions & ~umask`

<mark style="background: #FFF503A6;">umask vs file permissions:</mark>

| | umask | File permissions |
|---|---|---|
| What it is | A process-level mask | Per-file access control |
| Scope | Affects all new files created by the process | Fixed on the individual file |
| How set | `umask(value)` in C | `chmod`, `open(..., mode)` |
| Inherited? | Yes - child processes inherit parent's umask | No - specific to each file |

<mark style="background: #FFF503A6;">In daemon creation - why umask(0)?</mark>
- Setting `umask(0)` in a daemon means the daemon can create files with any permissions it requests. 
- Without this, inherited umask from the parent shell might unexpectedly restrict the daemon's file creation. 
- `umask(0)` gives the daemon full control over the permissions of files it creates.

```c
umask(0);   // remove all restrictions - daemon has full control
```