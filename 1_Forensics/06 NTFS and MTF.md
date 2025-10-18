### <mark style="background: #00ECFFA6;">Overview</mark>

NTFS File System  
Master File Table Records  
Resident and non-resident files  
NTFS Journaling

### <mark style="background: #00ECFFA6;">NTFS</mark>

<mark style="background: #00ECFFA6;">NTFS:</mark> New Technology File System  

NTFS is the primary file system for recent versions of Windows and Windows Server  

It offers security descriptors, encryption, disk quotas, and rich metadata.  

NTFS can support volumes as large as 8 petabytes on Windows Server 2019 and newer and Windows 10

### <mark style="background: #00ECFFA6;">How NTFS Works</mark>

A hard drive needs to be formatted with to work with a particular file system.  

An operating system will be capable of working with a particular file system to perform storage and retrieval operations.  

Clusters range from 512 bytes to 64 KB

### <mark style="background: #00ECFFA6;">NTFS features</mark>

<mark style="background: #00ECFFA6;">Features:</mark>
- Organizational efficiency - b-tree directory scheme  
- Accessible data - via MFT  
- Capacity for very large files  
- User Permissions  
- File compression  
- Security - place permissions on certain data  
- Logging - extensive logs on the file system operation

### <mark style="background: #00ECFFA6;">How is this useful in Digital Forensics?</mark>

Over the last couple of weeks we have seen how content cna be recovered from a file system (carving, Autopsy, headers, footers etc...)  

For a given machine the Hard Drive and File System are the data persistence mechanism. Anything saved or retrieved comes through here.  

The exact operation of a File System can offer information to a digital forensic investigation.

### <mark style="background: #00ECFFA6;">What is available via NTFS</mark>

<mark style="background: #00ECFFA6;">File System Analysis:</mark> <mark style="background: #00ECFFA6;">Master File Table (MFT)</mark> and File metadata  

<mark style="background: #00ECFFA6;">Recovery:</mark> deleted content (carving and unallocated space)  

<mark style="background: #00ECFFA6;">Timestamps:</mark> Analyzing timestamps (creation, modification, access)  

<mark style="background: #00ECFFA6;">Journal Analysis:</mark> the journals document the changes made to the file system

### <mark style="background: #00ECFFA6;">Master File Table MFT</mark>

MFT is a relational database  

The new <mark style="background: #00ECFFA6;">Resilient File System (ReFS)</mark> will be the replacement for  
NTFS  

Every file and folder has a record in the MFT (including the MFT itself and its copy)  

A MFT record contains date/time stamps, the file size, file status and the memory addresses for the file content (even if the file is deleted)

### <mark style="background: #00ECFFA6;">NTFS Reserved Files</mark>

```
• $MFT  
• SMFTMirr  
• $LogFile  
• $Volume  
• $AttrDef  
• Root Directory  
• $Bitmap  
• $Extend/$Quota  
• $Extend/$ObjId  
• SBoot  
• $BadClus  
• $Secure  
• $UpCase  
• $Extend  
• Reserves for $MFT  
• Extension Endties  
• $Extend§Reparse
```

### <mark style="background: #00ECFFA6;">MFT Record</mark>

A MFT record is 1024 bytes in size, in 2 contiguous 512 sectors  

The first sector contains most of the useful forensic data  

The second sector contains file data (if we are dealing with a resident file)  

If the file data (size) is greater than 512 bytes the file in sot stored in the MTF record but somewhere on the drive.

### <mark style="background: #00ECFFA6;">Overview of a MFT Record</mark>

The 2 MFT sectors both finish with F7 04  

<mark style="background: #00ECFFA6;">The MFT Records need to deal with:</mark>
- files and folders  
- parent and child relationships

<mark style="background: #00ECFFA6;">Overview:</mark>
- <mark style="background: #00ECFFA6;">Header:</mark> starting with 46 49 4C 45 (spells FILE)
- <mark style="background: #00ECFFA6;">Standard Info:</mark> starting with 10 00 00 00
- <mark style="background: #00ECFFA6;">Filename:</mark> starting with 30 00 00 00
- Additional file name entry
- <mark style="background: #00ECFFA6;">Data:</mark> starting with 80 00 00 00

### <mark style="background: #00ECFFA6;">General Info on NFTS</mark>

It can be difficult to find tutorials online for NTFS digital forensics  

There can be small differences in the operation of NTFS for different OS versions.  

A new reference chart would be needed for each operating system  

A forensics examiner would need to be familiar with the differences.

### <mark style="background: #00ECFFA6;">What is file system journaling?</mark>

The journal is a transactional log of all changes mode to a given volume.  

If there is an issue with the system (eg power off / crash), the operating system can use the journal information to roll back changes or to continue the operation.  

The main focus is to try maintain file system integrity and prevent catastrophic events from occurring.  

Demo: MFTECmd tool by Eric Zimmerman

### <mark style="background: #00ECFFA6;">Why is system journaling relevant?</mark>  

We can use the journal to find evidence of file creations, deletions, changes etc...  

The journal may be the only way to prove if a file existed on a given machine (even if anti-forensics techniques were used)

### <mark style="background: #00ECFFA6;">$UsrJrnl</mark>

Located in $Extend\$UsrJrnl  

Tracks high level changes  

Provides an efficient change monitoring solution, this is used by AV / Backups software to monitor changes to files.  

Typical size is 32MB  

<mark style="background: #00ECFFA6;">Example Operation Codes:</mark> fileCreate, fileDelete, Rename, Data Override etc....

### <mark style="background: #00ECFFA6;">$LogFile</mark>

Located in Root  

Tracks the detailed low lever transactional changes for NTFS  

Provides file system integrity and resilience.  

Records actual data that changed  

May only last hours to days on a primary boot brive.  

Typical size is 64MB  

<mark style="background: #00ECFFA6;">Example Operation Codes:</mark>
- ``AddIndexEntryAllocation``  
- ``InitializeFileRecordSegment``  
- ``DeleteIndexEntryAllocation``  
- Etc...

<mark style="background: #00ECFFA6;">Demo</mark>
- Tools by Eric Zimmerman  
- KAPE  
- MFTECmd  
- Timeline Explorer

### <mark style="background: #00ECFFA6;">NTFS ATTRIBUTES</mark>

<table>
	<tr>
		<th>Code</th>
		<th>Attribute Name</th>
	</tr>
	<tr>
		<td>10 00 00 00</td>
		<td>$Standard_Information</td>
	</tr>
	<tr>
		<td>20 00 00 00</td>
		<td>$Attribute_List</td>
	</tr>
	<tr>
		<td>30 00 00 00</td>
		<td>$File_Name</td>
	</tr>
	<tr>
		<td>40 00 00 00</td>
		<td>$Object_Id</td>
	</tr>
	<tr>
		<td>50 00 00 00</td>
		<td>$Security_Descriptor</td>
	</tr>
	<tr>
		<td>60 00 00 00</td>
		<td>$Volume_Name</td>
	</tr>
	<tr>
		<td>70 00 00 00</td>
		<td>$Volume_Information</td>
	</tr>
	<tr>
		<td>80 00 00 00</td>
		<td>$Data</td>
	</tr>
	<tr>
		<td>90 00 00 00</td>
		<td>$Index_Root</td>
	</tr>
	<tr>
		<td>A0 00 00 00</td>
		<td>$Inde_Allocation</td>
	</tr>
	<tr>
		<td>B0 00 00 00</td>
		<td>$Bitmap</td>
	</tr>
	<tr>
		<td>C0 00 00 00</td>
		<td>$ReparsePoint</td>
	</tr>
	<tr>
		<td>D0 00 00 00</td>
		<td>$Ea_Information</td>
	</tr>
	<tr>
		<td>E0 00 00 00</td>
		<td>$EA</td>
	</tr>
	<tr>
		<td>00 00 00 00</td>
		<td>$Logged_Utility_Stream</td>
	</tr>
</table>

### <mark style="background: #00ECFFA6;">$Data Attribute</mark>  

80 00 00 00 xx xx xx xx yy  

As for all attributes, they come with 4 bytes standing for its length (xx xx xx xx).  

The byte that follows this indicates whether the attribute is resident or not (yy)  

When it is resident its value is 0  

When it is not resident its value is 1

### <mark style="background: #00ECFFA6;">Resident files</mark>

The data for a resident file is contained within the MFT record.

### <mark style="background: #00ECFFA6;">Non-resident files</mark> 

If a file is non-resident, information (data) is stored elsewhere on the disk drive.  

For this to happen the data size will be greater than 512  

The data is stored in groups (data runs). A data run specifies a range of clusters where the file's data is stored, and it includes information about the starting cluster, the number of clusters, and the run's length.  

To retrieve a file, NTFS follows the data runs to retrieve the data from the designated clusters.  

There is no single cut off size for a file to be resident or not, it depends on several factors. Depending on how the file is created (e.g. by the system, there may be more space for it to be a resident file.

### <mark style="background: #00ECFFA6;">Summary</mark> 

Being able to understand MFT records is an important part of drive analysis in digital forensics.  

This offers insights into data recovery and drive analysis.  

It can show what operations were performed and when.  

If offers different attributes within the MFT records  

Its probably best to use specialized tools to work with the MFT, but the investigators understanding of NTFS and MFT may offer something good to the  
investigation not detected by the tools.