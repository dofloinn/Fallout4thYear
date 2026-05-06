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
Size: 417 Blocks: 8 IO Block: 4096 regular file  
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