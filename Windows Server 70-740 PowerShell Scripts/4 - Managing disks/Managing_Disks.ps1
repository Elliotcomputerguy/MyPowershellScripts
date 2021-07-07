# remote onto server
Enter-PSSession <computer>

# view disks
Get-Disk
Get-Partition

# initalize disk
Initialize-Disk -Number 1 -PartitionStyle GPT

# Create a partition
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter <letter>

# format with a file system
Format-Volume -DriveLetter <letter> -FileSytem NTFS -NewFileSystemLabel <label>

# start over
Clear-Disk -Number 1 -RemoveData

# all raw disks in 1 shot
Get-Disk |
	Where-Object PartitionStyle -EQ "RAW" | 
		Initalize-Disk -PartitionStyle GPT -PassThru |
			Format-Volume
