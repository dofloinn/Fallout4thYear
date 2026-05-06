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