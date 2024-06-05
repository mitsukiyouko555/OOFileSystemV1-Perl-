#!/usr/bin/perl
use strict;
use warnings;
use experimental qw( switch ); # <---- need this for given-when statements to work!!!!


#Class items needed:
	#- Folder
	#- Files
	#

#Here, after i made the stuff that creates the inital folders, i found that i need an if else statement - ie if the initial files exist, to just go straight to the menu. if it doesnt exist then create the files.

if ( -e "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive/Folder1/test.txt")
{
	print"\n\nInitial Check Complete - Base Files Already Created.\n\n"
}

else{
	print "Creating Base Directory Folder, and Files for Initial Setup...\n\n";

	my $dir = "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive"; 

	# EXACT Path of the Directory

	#idk how to make a drive and i can't find how to make a drive with perl on google so imma name this folder drive just so i can pretend it is a drive. (well it resides in my dropbox which is tecnhically a drive :3 Close enough for a noob i guess XD

	# this path would need to be adjusted if I were to move this to another computer.

	mkdir($dir) or die "Can't create directory; It already exists.";
	#mkdir creates the directory 
	#die kills the process if there is an issue with it such as if the item already exists 

	print "Directory Created...\n\n";

	print "Creating Initial Folder...\n\n";

	$dir = "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive/Folder1"; 
	#creating the folder within the initial folder
	# this path would need to be adjusted if I were to move this to another computer.

	mkdir($dir) or die "Can't create directory; It already exists.";

	print "Initial Folder Created...\n\n";

	open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive/Folder1/test.txt") or die "Can't open > test.txt: $!";
	#this creates the file and opens it for you to write into it. > overwrites and >> appends stuff to File
	# this path would need to be adjusted if I were to move this to another computer.


	print $fh "This is a test file for the sake of demonstrating that I can make a file.\n";
	#Writing to the file

	close $fh or die "Couldn't close the file; File not open: $!";

	print "Test File Created...\n\n";
	print "Opening the file to see if it created correctly...\n\nThe File contents has the following line:\n\n";

	open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive/Folder1/test.txt") or die "File was not created correctly or already exists.\n\n";
	# < makes it read only 
	# Adding + between < or > means both read and write access
	# +< makes it so we read and write on the file
	# +> will read, write, create, and truncate the file.

	print readline($fh);

	close $fh or die "Couldn't close the file; File not open: $!";

	print "\n";

	print "Yay, it created correctly.\n\n";

}

# so we want it to create the initial files
# but if the initial files already exists, we don't want it to create it, we want it to bypass it and go straight to the menu

#------------------
#Testing:
	#At this point, the stuff i have so far works as intended. If the initial files and folders doesn't exist, it creates one. if it does exist it goes to the menu.
#------------------

print "What would you like to do? Here are your options:\n\n";

# PROBLEM I HAVE EVERY SINGLE TIME IS THAT IT ALWAYS BREAKS OUT OF THE OUTER LOOP AND NEVER GOES BACK TO THE MAIN MENU AFTER A INNER LOOP CONDITION IS MET.. THAT IS BECAUSE... I NEED NOT JUST A WHILE LOOP WITH THE IF ELSE STATEMENTS INSIDE IT! I ALSO NEED ANOTHER WHILE LOOP BEFORE THAT MAKING THE MAIN MENU LOOP!

#It Goes: While loop for the main menu > while loop for the if else statements!!

	print "
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

     |----       ----|  |-------------|  -------\\    -----  |----      ----|
     |    \\     /    |  |  ___________|  |       \\   |   |  |   |      |   |
     |     \\   /     |  |  |             |   |\\   \\  |   |  |   |      |   |
     |  |\\  \\-/  /|  |  |  -----------|  |   | \\   \\ |   |  |   |      |   |
     |  | \\     / |  |  |  ___________|  |   |  \\   \\|   |  |   |      |   |
     |  |  \\   /  |  |  |  |             |   |   \\   |   |  \\   \\_____/    /
     |  |   \\_/   |  |  |  |----------|  |   |    \\      |   \\            /
     |__|         |__|  |_____________|  |___|     \\_____|    \\__________/   

 ---------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------";

#this LOOP Here is important as it is referenced in the if statement where if input = 14 it exits. otherwise if you just put last without the label it won't exit..

LOOP:while(1){
	
	print "\n\n1. Create a new folder\n\n2. Create a new text file\n\n3. Append File (Add words after what exists in a txt file.\n\n4. Overwrite Text File\n\n5. Read a File\n\n 6. Rename a File, Folder, or Zip File\n\n7. Zip a File or Folder\n\n8. Unzip a file or folder\n\n9. Change Directory\n\n10. Display all Paths\n\n11. Move a File or Folder\n\n12. Delete a File/Folder\n\n13.Show All Properties\n\n14. Exit\n\n";

# here is where the options are going to be..

# think about where and how to use classes, Given when statements (fancy if else statements)
	print "\nYour Choice: ";
	my $option = <>;

	print "\n";

	while($option ne "14"){

#time to work on the fancy stuff - what happens after you select one of these....

		if($option == "1"){
			print "\n\nYou picked 1. Create a new folder\n\nGoing Back to the menu:\n";
			# create a new folder:
			# Where do you want it to go?
			# what do you want it to be called?
			# go back to menu
			# Create Exceptions: Path not found; Path already exists; Illegal File System Operation (if any of the rules a-d above is violated).
				last;
		}
		#add more if else statements here so that if it is not one of the 14 it goes back to main menu.
		if($option == "2"){
			print "\n\nYou picked 2. Create a new text file\n\nGoing Back to the menu:\n";
			# create a new txt file
			# where do you want it to go?
			# what do you want it to be called?
			# Write the file content
			# go back to menu
			# Exceptions: Path not found; Path already exists; Illegal File System Operation (if any of the rules a-d above is violated).
				last;
		}
		if($option == "3"){
			print "\n\nYou picked 3. Append File (Add words after what exists in a txt file.\n\nGoing Back to the menu:\n";
			# append file
			# which file
			# what do you want to append
			# what hotkey do they press for saving? (Type wq! to trigger the closing of the file?)
			# then read content back to them
			# then go back to the menu
			# Exceptions: Path not found; Not a text file.
				last;
		}
		if($option == "4"){
			print "\n\nYou picked 4. Overwrite Text File\n\nGoing Back to the menu:\n";
			# Overwrite text file
			# which file
			# prompt to type
			# what hotkey do they press for saving? (Type wq! to trigger the closing of the file?)
			# then read content back to them
			# then go back to the menu
			# Exceptions: Path not found; Not a text file.
				last;
		}
		if($option == "5"){
			print "\n\nYou picked 5. Read a File\n\nGoing Back to the menu:\n";
			# Read a file
			# which file (array of existing files in directories)
			# read the selected file
			# after reading go back to main menu
			# exception - file/folder not found
				last;
		}				
		if($option == "6"){
			print "\n\nYou picked 6. Rename a File, Folder, or Zip File\n\nGoing Back to the menu:\n";
			# Rename a file, folder or zip file
			# Which file/folder
			# what do you want it to be renamed to?
			# if name already exists in directory, throw an error noting so
			# if renaming a zip, extension must remain .zip make sure to only allow the change to the name part of the name
			# After renaming, show the new name/path
			# then go back to the main menu
			# exception - file/folder not found
				last;
		}
		if($option == "7"){
			print "\n\nYou picked 7. Zip a File or Folder\n\nGoing Back to the menu:\n";
			# Zip a folder or file
			# which folder or file
			# on the back end, change the file property to 1/2 the total sum of all the stuff in it.
			# exception - file not found
				last;
		}
		if($option == "8"){
			print "\n\nYou picked 8. Unzip a file or folder\n\nGoing Back to the menu:\n";
			# unzip a folder
			# which folder?
			# append _unzipped after unzipping so that it does not have the same name. or unzipped_1 etc if it is unzipped multiple times
			# on the back end change the file property back to original size
			# exception - file not found
				last;
		}
		if($option == "9"){
			print "\n\nYou picked 9. Change Directory\n\nGoing Back to the menu:\n";
			# Change directory
			# show current directory and all its files
			# show available directories to navigate to in an array.
			# user input to pick a number to go to that directory
				last;
		}
		if($option == "10"){
			print "\n\nYou picked 10. Display all Paths\n\nGoing Back to the menu:\n";
			# Display all paths
			# show all possible paths
				last;
		}
		if($option == "11"){
			print "\n\nYou picked 11. Move a File or Folder\n\nGoing Back to the menu:\n";
			#Which file/folder do you want to move?
			#Where do you want to move it - show all possible paths AND allow option to create new folder..if it does not exist it should create the folders..
			#NOTE 2 entities with the same name cannot exist under the same parent. therefore if the file/folder has the same name as another file or folder in the path they are moving to it should ask for them to rename and ask yes or no.
			#if yes then prompt for name.
			#if no then add a # after it. like test2.txt or Folder1-2 or something.
				last;
		}
		if($option == "12"){
			print "\n\nYou picked 12. Delete a File/Folder\n\nGoing Back to the menu:\n";
			# Delete a file/folder
			# which file/folder
			# Exceptions - path not found
				last;		
		}
		if($option == "13"){
			print "\n\nYou picked 13.Show All Properties\n\nGoing Back to the menu:\n";
			# Show properties
			# 1.Drive Properties (the sum of all sizes of the entities it contains.)
			# 2.Zip File properties (one half of the sum of all sizes of the entities it contains.)
			# 3.Text File Properties (it is the length of its content. like 500 words?)
				last;

		}
		if($option == "14"){
			print "\n\nYou picked 14. Exit...\n\nExiting...\n\n";
				last LOOP;
		}
		else{
			print "

----------------------------------------------------------------

  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n\n 

        NOT A VALID CHOICE; PLEASE PICK FROM THE MENU:\n\n

  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

----------------------------------------------------------------

";
			last;
		}
	}
}




