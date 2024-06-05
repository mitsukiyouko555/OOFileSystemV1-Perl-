# OO File System

# The assignment is to design and implement an in-memory file system. This file-system consists of 4 types of entities: Drives, Folders, Text files, Zip files.

# Every entity has the following properties:

	# •	Type – The type of the entity (one of the 4 type above).
	# •	Name - An alphanumeric string. Two entities with the same parent cannot have the same name. Similarly, two drives cannot have the same name.
	# •	Path – The concatenation of the names of the containing entities, from the drive down to and including the entity. The names are separated by ‘\’.

#•	Size – an integer defined as follows:
	#	For a text file – it is the length of its content.
	#	For a drive or a folder, it is the sum of all sizes of the entities it contains.
	#	For a zip file, it is one half of the sum of all sizes of the entities it contains.

#Need to understand more about Perl Classes first to figure out how to better use them here.

#Exceptions would be if else statements OR use given-when statements


#So we need to:

# Create a Drive that has at least 1 folder in it with at least 1 file and 1 zip file so that we get a preview of whats to come.

# First have a prompt that displays what is already in the drive with the path.

# It should also display the path.

# Once it displays, it should ask What would you like to do:

# 1. Create a new Folder in this Path
	# Two entities with the same parent cannot have the same name - DONE
	# Create Arguments: Type, Name, Path of parent. 
	# Create Exceptions: Path not found; Path already exists; Illegal File System Operation (if any of the rules a-d above is violated). DONE

# 2. Create a New Text file in this path  - MERGING IT WITH #1
	# Prompt for what you want to name the file 
	# Prompt for what you want to type in the file
	# Save file
	# Two entities with the same parent cannot have the same name
	# Arguments: Type, Name, Path of parent.
	# Exceptions: Path not found; Path already exists; Illegal File System Operation (if any of the rules a-d above is violated).

#3 Append File (add words after what exists in file)
	# Prompt for words.
	# Use /n for new line but make it so user can type that too.
	# Save the file
	# Arguments: Path, Content
	# Exceptions: Path not found; Not a text file.

#4 Overwrite File (overwrite file with what you type) - MERGED with APPEND FILE (#3)
	# Prompt for words.
	# Use /n for new line but make it so user can type that too.
	# Save the file
	# Arguments: Path, Content
	# Exceptions: Path not found; Not a text file.

#5 Read a File
	# path
	# Which File
	# show the path of all files with an array

#6 Rename a File, Folder, Zip Files
	#which file/folder
	#prompt for name
	#show all files and folders and zip files with an array

#7. Zip a file or Folder 
	# path?
	# File Name

#8. Unzip a file or Folder in this path
	#path?
	#File Name
	#Display the paths of all zip files in an array so that the user can select a number to pick the file they want to unzip

#9. Change Directory (you should be able to use cd .. to go back up or cd directory name to go down) - REMOVED - TOO COMPLEX

#10. Display all Paths (Show all possible paths.) - DONE

#11. Move a file or folder to another path (Which file) (and path) (use mv to move - much like linux)
	# Arguments: Source Path, Destination Path. 
	# Exceptions: Path not found; Path already exists, Illegal File System Operation.

#12. Delete a File/Folder (File name)
	# Arguments: Path
	# Exceptions: Path not found.

#13. Show Properties
	# 1.Drive Properties (the sum of all sizes of the entities it contains.)
	# 2.Zip File properties (one half of the sum of all sizes of the entities it contains.)
	# 3.Text File Properties (it is the length of its content. like 500 words?)

#14. Exit - DONE

#-----------------------------------------------------------------------------------


