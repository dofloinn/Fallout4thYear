  
  

#include <stdio.h>

#include <stdlib.h>

#include <unistd.h>

#include <signal.h>

#include <sys/types.h>

#include <sys/stat.h>

#include <syslog.h>

  

// Function to transform main process into a daemon

static void become_daemon() {

  pid_t child_pid;

  

  // Step 1: Fork off the parent process

  child_pid = fork();

  

  // Error handling: exit if fork fails

  if (child_pid < 0) {

    exit(EXIT_FAILURE);

  }

  

  // Parent process exits if fork succeeds

  if (child_pid > 0) {

    exit(EXIT_SUCCESS);

  }

  

  // Step 2: Child process becomes session leader

  if (setsid() < 0) {

    exit(EXIT_FAILURE);

  }

  

  // Step 3: Ignore specific signals

  signal(SIGCHLD, SIG_IGN);

  signal(SIGHUP, SIG_IGN);

  

  // Step 4: Second fork to detach completely

  child_pid = fork();

  

  // Error handling: exit if fork fails

  if (child_pid < 0) {

    exit(EXIT_FAILURE);

  }

  

  // Parent process exits if fork succeeds

  if (child_pid > 0) {

    exit(EXIT_SUCCESS);

  }

  

  // Step 5: Change working directory

  chdir("/");

  

  // Step 6: Set new file permissions

  umask(0);

  

  // Step 7: Close all open file descriptors

  for (int fd = sysconf(_SC_OPEN_MAX); fd >= 0; fd--) {

    close(fd);

  }

  

  // Open log file

  openlog("mydaemon", LOG_PID, LOG_DAEMON);

}

  

int main() {

  // Transform into a daemon process

  become_daemon();

  

  // Main loop: log every 20 seconds

  while (1) {

    syslog(LOG_NOTICE, "mydaemon started");

    sleep(20);

    break;

  }

  

  // Log termination and close log file

  syslog(LOG_NOTICE, "mydaemon terminated");

  closelog();

  

  return EXIT_SUCCESS;

}

#include <stdio.h>

#include <fcntl.h>

#include <unistd.h>

  

int main() {

    int fd1, fd2, fd3; // File descriptors

    char filename1[] = "file1.txt";

    char filename2[] = "file2.txt";

  

    // Open files

    fd1 = open(filename1, "r");

    fd2 = open(filename2, "w");

  

    // Check if files opened successfully

    if (fd1 == -1 || fd2 == -1) {

        perror("Error opening file");

        return 1;

    }

  

    // Print file descriptors

    printf("File descriptors:\n");

    printf("File 1: %d\n", fd1);

    printf("File 2: %d\n", fd2);

  

    // Close files

    close(fd1);

    close(fd2);

  

    return 0;

}

// Orphan Example

// The child process is adopted by init process, when parent process dies.

#include<stdio.h>

#include <stdlib.h>

#include <sys/types.h>

#include <unistd.h>

  
  

int main()

{

    // Create a child process      

    int pid = fork();

    if (pid > 0) {

        // if PID > 0 :: this is the parent

        // this process performs printf and finishes

      printf("Parent process, pid %d\n",getpid());

        sleep(5);  // uncomment to wait 5 seconds before process ends

        exit(EXIT_SUCCESS); // Kill the parent

    } else if (pid == 0) {

       printf("Child process");

       // Keep process running with infinite loop

       // When the parent finishes after 5 seconds,

       while(1) {

          sleep(1);

      printf("child 1: pid %d, parent pid: %i\n", getpid(),getppid());

       }

    }

    return 0;

}

// A C program to demonstrate Zombie Process.

// Child becomes Zombie as parent is sleeping

// when child process exits.

#include <stdio.h>

#include <stdlib.h>

#include <sys/types.h>

#include <unistd.h>

int main()

{

    // Fork returns process id

    // in parent process

    pid_t child_pid = fork();

    // Parent process

    if (child_pid > 0) {

        sleep(100);

    } else {  // Child process  

      exit(1);

    }

    return 0;

}

#include <stdio.h>

#include <stdlib.h>

#include <unistd.h> /* for fork */

#include <sys/types.h> /* for pid_t */

#include <sys/wait.h> /* for wait */

  

int main()

{

    /*Spawn a child to run the program.*/

    pid_t pid=fork();

    if (pid==0) { /* child process */

        char *argv[]={"echo","Echo is running now....",NULL};

        sleep(15);

        execv("/bin/echo",argv);

        exit(127); /* only if execv fails */

    }

    else { /* pid!=0; parent process */

        printf("The parent keeps doing whats its doign!!");

    sleep(3);

    }

    return 0;

}

#include <stdio.h>

#include <sys/stat.h>

  

int main(int argc, char* argv[]) {

   const char* const filename = argv[1];

   struct stat buf;

  

   stat (filename, &buf);

   if (buf.st_mode & S_IRUSR) {

      printf("Owner can read %s\n", filename);

   }

  

   if (buf.st_mode & S_IWUSR) {

      printf("Owner can modify %s\n", filename);

   }

  

   if (buf.st_mode & S_IXUSR) {

      printf("Owner can execute %s\n", filename);

   }

  

   return 0;

}

#include <stdio.h>

#include <unistd.h>

  

int main(int argc, char **argv)

{

    printf("Start\n");

    //fork();

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

obj-m += hello_world_mod.o

  

# Use the KERNELDIR environment variable if it exists, otherwise default to /lib/modules/`uname -r`/build

KERNELDIR ?= /lib/modules/$(shell uname -r)/build

  

# PWD variable captures the current directory

PWD := $(shell pwd)

  

all:

    $(MAKE) -C $(KERNELDIR) M=$(PWD) modules

  

clean:

    $(MAKE) -C $(KERNELDIR) M=$(PWD) clean


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

#include <stdio.h>

#include <stdlib.h>

#include <unistd.h>

#include <termios.h>

  

int main(void) {

  struct termios term, original_term;

  

  int myeof;

  // Fetch the current terminal settings

  if (tcgetattr(STDIN_FILENO, &term) < 0) {

    perror("tcgetattr");

    return -1;

  }

  

  // Save a copy of the original settings for restoration later

  original_term = term;

  

  // Disable echoing of characters typed

  term.c_lflag &= ~ECHO;

  
  

  // Set non-canonical input (read 1 character at a time)

  term.c_lflag &= ~ICANON; // non-canonical mode

  term.c_cc[VMIN] = 1;  // one byte

  term.c_cc[VTIME] = 0; // indefinite wait

  

  // Bespoke EOF character to Ctrl+G (0x07)

  myeof=7;

  // Apply the modified terminal settings

  if (tcsetattr(STDIN_FILENO, TCSANOW, &term) < 0) {

    perror("tcsetattr");

    return -1;

  }

  

  printf("Terminal settings changed:\n");

  printf("  - Echoing disabled (characters won't be shown)\n");

  printf("  - Press any key, Ctrl+G to exit.\n");

  

  // Loop to read characters without echo (including Enter)

  while (1) {

    int ch = getchar();

    //if (ch == EOF) { // Now checks for Ctrl+G (0x07)

    if (ch == myeof) { // Now checks for Ctrl+G (0x07)

      break;

    }

    // Print the character for demonstration (replace with your logic)

    printf("You pressed: %c\n", ch);

  }

  

  // Restore original terminal settings

  //Try this without!!! you might need reset

  tcsetattr(STDIN_FILENO, TCSANOW, &original_term);

  

  printf("\nTerminal settings restored. Echoing enabled again.\n");

  

  return 0;

}

//Writes first, then reads

  

#include <stdio.h>

#include <string.h>

#include <fcntl.h>

#include <sys/stat.h>

#include <unistd.h>

  

int main() {

    const char *myfifo = "myfifo";

    mkfifo(myfifo, 0666);  // Create the FIFO

  

    char buffer[80];

  

    while (1) {

        int fd = open(myfifo, O_WRONLY);  // Open for writing

        fgets(buffer, sizeof(buffer), stdin);

        write(fd, buffer, strlen(buffer));

        close(fd);

  

    // Add a delay (e.g., 0.25 seconds)

        usleep(250000); // semaphores better practice than delays...

  
  

    fd = open(myfifo, O_RDONLY);  // Open for reading

        read(fd, buffer, sizeof(buffer));

        printf("User1: %s\n", buffer);

        close(fd);

    }

  

    return 0;

}

#include <stdio.h>

#include <stdlib.h>

#include <unistd.h>

#include <sys/wait.h>

  
  

void exec1();

void exec2();

  

int main() {

  int pipefd[2];

  

  // Create a pipe

  if (pipe(pipefd) == -1) {

    perror("Error creating pipe");

    exit(1);

  }

  

  // Fork for "ps aux"

  pid_t pid = fork();

  if (pid == -1) {

    perror("Error creating fork");

    exit(1);

  } else if (pid == 0) {

    exec1(pipefd);

  }

  

  // Fork for "grep login"

  pid = fork();

  if (pid == -1) {

    perror("Error creating fork");

    exit(1);

  } else if (pid == 0) {

    exec2(pipefd);

  }

  

  // Close pipe descriptors in parent

  close(pipefd[0]);

  close(pipefd[1]);

  

  // Wait for child processes to finish

  for (int i = 0; i < 2; i++) {

    wait(NULL);

  }

  

  return 0; // Return control to terminal

}

  

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

  while(1) {

    sleep(1);

  }

return 0;

}

#include <sys/types.h>

#include <sys/stat.h>

#include <time.h>

#include <stdio.h>

#include <stdlib.h>

  
  

main(int argc, char *argv[])

{

   struct stat s;

  

   if (stat(argv[1], &s) == -1) {

        exit(EXIT_FAILURE);

   }

  

   printf("File type:");

   switch (s.st_mode & S_IFMT) {

    case S_IFBLK:  printf("block device\n"); break;

    case S_IFCHR:  printf("character device\n"); break;

    case S_IFDIR:  printf("directory\n"); break;

    case S_IFIFO:  printf("FIFO/pipe\n"); break;

    case S_IFLNK:  printf("symlink\n"); break;

    case S_IFREG:  printf("regular file\n"); break;

    case S_IFSOCK: printf("socket\n"); break;

    default: printf("unknown?\n"); break;

    }

  

   printf("I-node number: %ld\n", (long) s.st_ino);

  

   printf("Mode: %lo (octal)\n", (unsigned long) s.st_mode);

  

   printf("Link count: %ld\n", (long) s.st_nlink);

   printf("Ownership: UID=%ld   GID=%ld\n", (long) s.st_uid, (long) s.st_gid);

  

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

#include <syslog.h>

#include <stdio.h>

#include <stdlib.h>

#include <unistd.h>

  

int main() {

  
  

  // LOG_CONS: Write directly to the system console if an error occurs sending to the system logger.

  // LOG_PID: Include the PID with each message

  // facility is LOG_USER indicating a user-level message

  openlog("example_program", LOG_CONS | LOG_PID, LOG_USER);

  // LOG_INFO => normal, informational message.

  syslog(LOG_INFO, "Test message from example_program.");

  closelog();

  

  return EXIT_SUCCESS;

}

#include <stdio.h>

#include <stdlib.h>

#include <pthread.h>

  

int counter = 0; // Shared resource

  

void* increment(void* arg) {

    for (int i = 0; i < 1000000; i++) {

        counter++; // Increment counter (shared resource)

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

  

    return 0;

}

#include <stdio.h>

#include <stdlib.h>

#include <pthread.h>

  

int counter = 0; // Shared resource

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER; // Mutex for synchronization

  

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