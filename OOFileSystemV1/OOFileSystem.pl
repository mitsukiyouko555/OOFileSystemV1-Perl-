#!/usr/bin/perl
use strict; #< provides warning - safety net
use warnings; #< provides warning - safety net
use experimental qw( switch ); # <---- need this for given-when statements to work!!!! (so far ended up not using it)
use File::Find; #<----- use this to activate Find which is used for parsing directories
use Data::Dumper; #<----- used for sorting data and stuff (so far ended up not using it)
use File::Compare; #<------- compares files! (so far ended up not using it)
use File::Path qw( make_path rmtree ); #<--- for deleting directories and its contents.(so far ended up not using it)
use File::Copy;
use File::Spec;
use File::Basename;



#Here, after i made the stuff that creates the inital folders, i found that i need an if else statement - ie if the initial files exist, to just go straight to the menu. if it doesnt exist then create the files.

if ( -e "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive/Folder1/test.txt")
{
	print"\n\nInitial Check Complete - Base Files Already Created.\n"
}

else{
	print "\n\nCreating Base Directory Folder, and Files for Initial Setup...\n\n";

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

	mkdir($dir) or die "Issue creating directory; OR It already exists.";

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
	print "\nHere is a list of the directories that were created too!\n\n";
									#--------------------------------------------------------------------------------------
									#Displays all paths
									#--------------------------------------------------------------------------------------
											find(
											{
												wanted => \&findfiles,
												},
												'/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive'
												);
											
											sub findfilesOG{

													open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "Can't open > directory_list.txt: $!";

													print $fh "$File::Find::name\n\n";

													#Writing to the file

													close $fh or die "Couldn't close the file; File not open: $!";

													open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "File was not created correctly or already exists.\n\n";

													print readline($fh);

													close $fh or die "Couldn't close the file; File not open: $!";

											}
									#--------------------------------------------------------------------------------------
									# END OF CODE that Displays all paths
									#--------------------------------------------------------------------------------------


}


# so we want it to create the initial files
# but if the initial files already exists, we don't want it to create it, we want it to bypass it and go straight to the menu

#------------------
#Testing:
	#At this point, the stuff i have so far works as intended. If the initial files and folders doesn't exist, it creates one. if it does exist it goes to the menu.
#------------------

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

print "\n\n\nWhat would you like to do? Here are your options:\n\n";

# PROBLEM I HAVE EVERY SINGLE TIME IS THAT IT ALWAYS BREAKS OUT OF THE OUTER LOOP AND NEVER GOES BACK TO THE MAIN MENU AFTER A INNER LOOP CONDITION IS MET.. THAT IS BECAUSE... I NEED NOT JUST A WHILE LOOP WITH THE IF ELSE STATEMENTS INSIDE IT! I ALSO NEED ANOTHER WHILE LOOP BEFORE THAT MAKING THE MAIN MENU LOOP!

#It Goes: While loop for the main menu > while loop for the if else statements!!


#this LOOP Here is important as it is referenced in the if statement where if input = 14 it exits. otherwise if you just put last without the label it won't exit..

LOOP:while(1){
	
	print "\n\n1. Create a new folder or file\n\n2. Append to Text File OR Overwrite Text File (WIP)\n\n3. Read a File\n\n4. Rename a File, Folder, or Zip File (WIP)\n\n5. Zip a File or Folder (WIP)\n\n6. Unzip a file or folder (WIP)\n\n7. Display all Paths\n\n8. Move a File or Folder (WIP Can Move File; Can't Move Folder Yet)\n\n9. Delete a File/Folder\n\n10.Show All Properties (WIP)\n\n11. Exit\n\n";

# here is where the options are going to be..

# think about where and how to use classes, Given when statements (fancy if else statements)
	print "\nYour Choice: ";
	my $option = <>;

	print "\n";

	INNER_LOOP: while($option ne "14"){

#time to work on the fancy stuff - what happens after you select one of these....

		if($option == "1"){
			print "\n\nYou picked 1. Create a new folder\n\n";
			# create a new folder:
			# Where do you want it to go?
			# what do you want it to be called?
			# go back to menu
			# Create Exceptions: Path not found; Path already exists; Illegal File System Operation (if any of the rules a-d above is violated).
			if($option == "1"){
				print "Would you like to create a file or a folder?";
				print "\n\n1.A Folder\n\n2.A File\n\n3.Back\n\n";
				print"Your Choice: ";
				my $option1 = <>;
				print "\n\n";

				if($option1 == "1"){
					#code to create the folder goes here

					print "Where do you want your new FOLDER to reside?\n\nCOPY AND PASTE the path you want to create your folder in.\n\n";
#-------------------------------------------------------------------------------------------------
#PROBABLY GONNA HAVE TO COPY AND PASTE THIS SECTION OVER AND OVER AGAIN CUZ CANT FIGURE OUT HOW TO FRIKIN REUSE IT :(
#------------------------------------------------------------------------------------------------
					find(
					{
						wanted => \&findfiles,
						},
						'/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive'
						);
					
					#Find a way to reuse this subroutine...

					sub findfiles{

							open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "Can't open > directory_list.txt: $!";

							#--------------------------------------------------------------------------
							#we are VERY close with this.... just need to somehow loop it? LEFT OFF HERE.
							
							# my $index = 1;
							# ++$index;

							#print $fh "$index.$File::Find::dir\n\n";

							#hm or instead of trying to get rid of duplicates i tried doing $File::Find::name instead and for some reason that doesn't show duplicates so i will go with that... i wil then note that if it it ends with a .* (* being a wildcard) then it will throw an error noting either its not a valid path ot illegal operation.

							print $fh "$File::Find::name\n\n";

							#Writing to the file

							close $fh or die "Couldn't close the file; File not open: $!";

							open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "File was not created correctly or already exists.\n\n";

							print readline($fh);

							close $fh or die "Couldn't close the file; File not open: $!";
						#instead of print, perhaps port this into a file
						# so so far, we ported that into a file, then opened and printed it..

						# we just need to do this to the file to make it do what i want it to do:
							#remove duplicates 
							#and concactanate with 1++ incremental #'s'
					}

#----------- see if this chunk up here can be moved to an upper level so it is more accessable to the other if else statements that will come later... because as it is now, it will only create thedirectory list folder IF the user selects 1. we want it to do it before that. - and NOPE moving it up does weird things. since you are a noob just stay with copy paste - dont fix something that aint broken....

					while(1)
					{
						print "\n\nYour Choice:";
						
						my $new_folder_path = <>;

						my $formatted_folder_path = chomp($new_folder_path);

						# if given path includes throw the Illegal operation error OR path not found
						# if given path is a valid location, prompt for file name
						# if file name already exists throw error and tell user to pick another name
						# if name is not alphanumeric, throw an error that it is not alphanumeric
						while (1){
							# this index basically says if input does not contain . but does contain / then do
							if((index($new_folder_path, '.') == -1) and ($new_folder_path =~ "/Drive")){

								print"\n\nWhat would you like to call it?\n\nFolder Name: ";

								my $folderName = <>;

								print "\n\n$new_folder_path/$folderName";

								#moved this from within the while loop so that it is more accessable for the other if else statements

								my $new_directory = "$new_folder_path/$folderName";

								$new_directory =~ s/\s+$//;

								# since i can't figure out how to compare the 2 files as noted below imma just not do that...

								# open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/new_folder_name.txt") or die "Can't open > new_folder_name.txt: $!";
							
								# print $fh "$new_directory";

								# #Writing to the file

								# close $fh or die "Couldn't close the file; File not open: $!";


								#if new directory name matches something in /Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt then throw error that name already exists and choose another name.

								# use this while statement here to say if #new_directory does not match what is in the directory list file then do the if else.



								while(1){

									if($folderName =~ /^[\p{Alnum}\s]/){

										#code for creating actual folder goes here...
										#NOTE.. here, we would note that path = $new_folder_path/$folderName
										#in the event we need to move it, we would ask what path to move it to and thus the same theory still applies except with $new_path_name/$foldername.

										#insert code to actually create the folder.... use the class thing and put in properties...
										
										#this creates the folder but in the directory above it rather than within it... it seems to be a issue with the concatination. it doesn't out the / before the folder name properly..

										#after some adjustmnt the above issue has been fixed AND it creates the directory in the correct place but for some reason adds a ? after the directory...

										#with $new_directory =~ s/\s+$//; it FINALLY REMOVES the frikin ? at the end of it!! YAY!!!

										mkdir($new_directory) 
										or do {
											warn("\n\nCan't create the Directory noted above or Directory already exists.\n\n");
											print"\n\nPLEASE PICK ANOTHER NAME:";
											last;
										};

										print "\n\nCreating Folder...";
										print"\n\nFOLDER CREATED SUCCESSFULLY!\n\n\nBack to the Main Menu:\n";

										last INNER_LOOP;
									}

									# INSERT an elsif to check to see if name already exists.. but perhaps once that is done switch the places between creating the flder and this.


									else{
										print"\n\nPlease use ONLY Alphanumeric Characters.";
										last;

									}

								}

							}
							#include an elsif here for noting if name already exists..

							else{

								print "\n\nIllegal File System Operation.\n\nCannot create Folder in Text or Zip File or a non directory.\n\nPlease Pick from a Folder directory instead.\n\n";
								last;

							}
						}

					}
#--------------------------------------------------------------------------------------------
#END OF CODE FOR CREATING A FOLDER 
#- HAS CODE FOR MAKING SURE A PATH IS SELECTED
#- HAS CODE TO CHECK FOR ALPHANUMERIC FOLDER NAMING ONLY
#--------------------------------------------------------------------------------------------
				}

				elsif($option1 == "2"){

					print "Where do you want your new FILE to reside?\n\nCOPY AND PASTE the path you want to create your file in.\n\n";

					find(
					{
						wanted => \&findfiles,
						},
						'/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive'
						);
					

					sub findfiles2{

							open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "Can't open > directory_list.txt: $!";

							print $fh "$File::Find::name\n\n";

							close $fh or die "Couldn't close the file; File not open: $!";

							open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "File was not created correctly or already exists.\n\n";

							print readline($fh);

							close $fh or die "Couldn't close the file; File not open: $!";

					}


					while(1)
					{
						print "\n\nYour Choice:";
						
						my $new_file_path = <>;

						my $formatted_file_path = chomp($new_file_path);

						while (1){

							if((index($new_file_path, '.') == -1) and ($new_file_path =~ "/Drive")){

								print"\n\nWhat would you like to call it?\n\nFolder Name: ";

								my $fileName = <>;
								$fileName =~ s/\s+$//;

								INNER1:while(1){

									if($fileName =~ /^[\p{Alnum}\s]/){

									# THIS IS THE CODE FOR CREATING A FOLDER - LEAVING IT HERE FOR REFERENC!

									# 	mkdir($new_directory) 
									# 	or do {
									# 		warn("\n\nCan't create the Directory noted above or Directory already exists.\n\n");
									# 		print"\n\nPLEASE PICK ANOTHER NAME:";
									# 		last;
									# 	};

									# 	print "\n\nCreating Folder...";
									# 	print"\n\nFOLDER CREATED SUCCESSFULLY!\n\n\nBack to the Main Menu:\n";

									# 	last INNER_LOOP;
									# }
									
									#-----------------------------------------------------------------------------
									#INSERT CODE HERE FOR CREATING THE FILE AND THE CONTENT THAT GOES IN THE FILE...
									#-----------------------------------------------------------------------------

									#maybe create the file first the simply take user input and > it into the file?

									print "\n\n$new_file_path/$fileName.txt";


									my $new_file_directory = "$new_file_path/$fileName.txt";
									#this is the new file path ^

									unless(-e $new_file_directory){
										open (my $fh, '>', $new_file_directory) or do{
										warn "Could not create the file.";
										last INNER1;
										};

										print "\n\nFile $new_file_directory has been created!";

										print "\n\nWhat would you like to type/save into the file?\n\nYour Input: ";

										my $fileSave = <>;

										open $fh, '>', "$new_file_directory";

										print {$fh} $fileSave;

										close $fh;

										print "\n\nFile has been Saved!\n\nGoing back to the Menu:\n\n";

										last INNER_LOOP;
									}
									else{
										print "File already exists in this directory. Please choose another name.";
										last INNER1;
									}


									# open( MYFILE, ">$new_file_directory_formatted") or die "Failed to create the new file.";

									# print MYFILE $new_file_directory_formatted;

									# close (MYFILE);z

									#--------------------------------------------------
									# Somehow this up here ^ is looping and also it is not checking to see if a file is existing or not. i think i should do this the original way i was thinking of whic is instead of using STDIN and putting it directly into the file i take it, I create the file first theb port the data in...
									#--------------------------------------------------

									}

									else{
										print"\n\nPlease use ONLY Alphanumeric Characters.";
										last;

									}

								}

							}

							else{

								print "\n\nIllegal File System Operation.\n\nCannot create File in Text or Zip File or a non directory.\n\nPlease Pick from a Folder directory instead.\n\n";
								last;

							}
						}

					}


				}

				elsif($option1 == "3"){
					print "Going Back to the menu:\n\n";
					last;
				}
				else{
					print "Invalid option";
				}

			}
				last;
		}
		#add more if else statements here so that if it is not one of the 14 it goes back to main menu.
		#Merged with option 1

		# if($option == "2"){
		# 	print "\n\nYou picked 2. Create a new text file\n\nGoing Back to the menu:\n";
		# 	# create a new txt file
		# 	# where do you want it to go?
		# 	# what do you want it to be called?
		# 	# Write the file content
		# 	# go back to menu
		# 	# Exceptions: Path not found; Path already exists; Illegal File System Operation (if any of the rules a-d above is violated).

		# 		last;
		# }

		# can we combine Append and Overwrite file? its only a slight difference in code...

		if($option == "2"){
			print "\n\nYou picked 2. Append to Text File OR Overwrite Text File.\n\nGoing Back to the menu:\n";
			# append file
			# which file
			# what do you want to append
			# what hotkey do they press for saving? (Type wq! to trigger the closing of the file?)
			# then read content back to them
			# then go back to the menu
			# Exceptions: Path not found; Not a text file.
				last;
		}

		#MERGED this with option 2

		# if($option == "3"){
		# 	print "\n\nYou picked 4. Overwrite Text File\n\nGoing Back to the menu:\n";
		# 	# Overwrite text file
		# 	# which file
		# 	# prompt to type
		# 	# what hotkey do they press for saving? (Type wq! to trigger the closing of the file?)
		# 	# then read content back to them
		# 	# then go back to the menu
		# 	# Exceptions: Path not found; Not a text file.
		# 		last;
		# }
		if($option == "3"){
			print "\n\nYou picked 3. Read a File.\n\nPlease COPY AND PASTE the name of the file you want to read:\n\n";
			# Read a file
			# which file (array of existing files in directories)
			# read the selected file
			# after reading go back to main menu
			# exception - file/folder not found

			#--------------------------------------------------------------------------------------
			#Displays all paths
			#--------------------------------------------------------------------------------------
					find(
					{
						wanted => \&findfiles,
						},
						'/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive'
						);
					
					sub findfiles3{

							open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "Can't open > directory_list.txt: $!";

							print $fh "$File::Find::name\n\n";

							#Writing to the file

							close $fh or die "Couldn't close the file; File not open: $!";

							open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "File was not created correctly or already exists.\n\n";

							print readline($fh);

							close $fh or die "Couldn't close the file; File not open: $!";

					}
			#--------------------------------------------------------------------------------------
			# END OF CODE that Displays all paths
			#--------------------------------------------------------------------------------------
		OUTER:while(1){
			print "\nYour Choice: ";

			my $path_to_read = <>;
			chomp($path_to_read);


			INNER: while(1){
					if(($path_to_read =~ ".txt") and ($path_to_read =~ "/Drive")){

					#code to read file... nope.. failed code here....

						# open FILE, "<" $path_to_read or die "Can't read file.";

						# print "\n\nReading File Contents:\n\n";

						# while(<FH>)
						# {
						# 	print $_;
						# }	
					
						# close;

						#nope didnt work....

						# print "\n\nEnd of File Content.";

							# open (FH, "<", $path_to_read) or die "Can't open file.\n\n";

							# # this block down here does not stop once it prints all the lines it keeps repeating

							# while(<FH>)
							# {
							# 	print $_;
							# 	last;
							# }

							# close(FH);

						#holy crap this finally works..	

						print "\n\nHERE ARE THE FILE CONTENTS:\n\n";

						unless(open FILE, $path_to_read){
							die "\nCan't Open File.\n"
						}

						while(my $line = <FILE>){
							print $line;
						}

						close FILE;
						last OUTER;

					}

					else{
						print "\n\nInvalid Operation. Please select a .txt file.";
						last INNER;
					}
				}
			
			}

			print "\n\nEND OF FILE CONTENTS.\n\nGoing Back to the menu:\n";

			last;
		}				
		if($option == "4"){
			print "\n\nYou picked 4. Rename a File, Folder, or Zip File\n\nGoing Back to the menu:\n";
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
		if($option == "5"){
			print "\n\nYou picked 5. Zip a File or Folder\n\nGoing Back to the menu:\n";
			# Zip a folder or file
			# which folder or file
			# on the back end, change the file property to 1/2 the total sum of all the stuff in it.
			# exception - file not found
				last;
		}
		if($option == "6"){
			print "\n\nYou picked 6. Unzip a file or folder\n\nGoing Back to the menu:\n";
			# unzip a folder
			# which folder?
			# append _unzipped after unzipping so that it does not have the same name. or unzipped_1 etc if it is unzipped multiple times
			# on the back end change the file property back to original size
			# exception - file not found
				last;
		}

		#changing directory may mess up stuff... perhaps since the assignment didn't ask for it leave this one out even tho its fancy cuz its probs hard to implememt

		# if($option == "9"){
		# 	print "\n\nYou picked 9. Change Directory\n\nGoing Back to the menu:\n";
		# 	# Change directory
		# 	# show current directory and all its files
		# 	# show available directories to navigate to in an array.
		# 	# user input to pick a number to go to that directory
		# 		last;
		# }
		if($option == "7"){
			print "\n\nYou picked 7. Display all Paths\n\nHere are all the paths and directories:\n\n";
			# Display all paths
			# show all possible paths
					find(
					{
						wanted => \&findfiles,
						},
						'/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive'
						);
					
					sub findfiles7{

							open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "Can't open > directory_list.txt: $!";

							print $fh "$File::Find::name\n\n";

							#Writing to the file

							close $fh or die "Couldn't close the file; File not open: $!";

							open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "File was not created correctly or already exists.\n\n";

							print readline($fh);

							close $fh or die "Couldn't close the file; File not open: $!";

					}

			print "\nPaths Displayed. Going Back to the menu:\n";


				last;
		}

		if($option == "8"){
			print "\n\nYou picked 8. Move a File or Folder\n\n";
			#Which file/folder do you want to move?
			#Where do you want to move it - show all possible paths AND allow option to create new folder..if it does not exist it should create the folders..
			#NOTE 2 entities with the same name cannot exist under the same parent. therefore if the file/folder has the same name as another file or folder in the path they are moving to it should ask for them to rename and ask yes or no.
			#if yes then prompt for name.
			#if no then add a # after it. like test2.txt or Folder1-2 or something.
	
				print "Do you want to move:\n\n1. a FILE\n\nor\n\n2. a FOLDER?";

				print "\n\nYour Choice: ";

				my $item_to_move = <>;

				Outer8a:while(1){

					if($item_to_move == "1"){

						print"\n\nWhich File do you want to move? (COPY AND PASTE the PATH of the File you want to move.)\n\n";

						#--------------------------------------------------------------------------------------
						#Displays all paths
						#--------------------------------------------------------------------------------------
								find(
								{
									wanted => \&findfiles,
									},
									'/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive'
									);
								
								sub findfiles8a{

										open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "Can't open > directory_list.txt: $!";

										print $fh "$File::Find::name\n\n";

										#Writing to the file

										close $fh or die "Couldn't close the file; File not open: $!";

										open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "File was not created correctly or already exists.\n\n";

										print readline($fh);

										close $fh or die "Couldn't close the file; File not open: $!";

								}
						#--------------------------------------------------------------------------------------
						# END OF CODE that Displays all paths
						#--------------------------------------------------------------------------------------
						print "\n\nYour Choice: ";		

						my $file_to_move = <>;

							Inner8:while(1){
								#if selected item is not a file... throw error
								if((index($file_to_move, '.') == -1) and ($file_to_move =~ "/Drive")){

									print "\n\nPlease select a FILE; Not a Folder.";
									last Inner8;

								}

								else{

									print "\n\nWhere do you want to move the file?\n\n";

									#--------------------------------------------------------------------------------------
									#Displays all paths
									#--------------------------------------------------------------------------------------
											find(
											{
												wanted => \&findfiles,
												},
												'/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive'
												);
											
											sub findfiles8ab{

													open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "Can't open > directory_list.txt: $!";

													print $fh "$File::Find::name\n\n";

													#Writing to the file

													close $fh or die "Couldn't close the file; File not open: $!";

													open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "File was not created correctly or already exists.\n\n";

													print readline($fh);

													close $fh or die "Couldn't close the file; File not open: $!";

											}
									#--------------------------------------------------------------------------------------
									# END OF CODE that Displays all paths
									#--------------------------------------------------------------------------------------
									print "\n\nYour Choice: ";						
									my $where_to_move = <>;

										Innermost8:while(1){
											#if place to move is not a folder throw a illegal operation error.

											if((index($where_to_move, '.') == -1) and ($where_to_move =~ "/Drive")){

												chomp($where_to_move);
												chomp($file_to_move);

												#my $formatted_file_to_move = $file_to_move =~ s/.*\/\s*//;;
												(my $file,my $dir,my $ext) = fileparse($file_to_move, qr/\.[^.]*/);

												my $formatted_file_to_move = $file.$ext;

												#remove everything before the last/

												my $file_after_move = "$where_to_move/$formatted_file_to_move";

												#need to include code that says if path already exists last innermost8 - file with that name already exists in this path. please choose another directory and move the file to a different folder
												

												print "\n\n$file_after_move";

												move($file_to_move, $file_after_move);


												print "\n\nFile has been moved!";

												print"\n\nBack to the main menu:\n\n";

												last INNER_LOOP;

											}
											else{
												print "\n\nIllegal File System Operation.\n\nCannot Move Item into a Text or Zip File or a non directory.\n\nPlease Pick from a Folder directory instead.\n\n";
												last Innermost8;
											}
										}

								}

							}


					}
					elsif($item_to_move == "2"){

						print"WIP - So far there is no way to move a folder in this program. RIP.";

					}
					else{

						print "Not a Valid Choice.";
						last;
							
					}

				}



			}

		if($option == "9"){
			print "\n\nYou picked 9. Delete a File/Folder";
			# Delete a file/folder
			# which file/folder
			# Exceptions - path not found
			OURTER:while(1){
				print "\n\nDo you want to: \n\n1.DELETE a FILE \n\nOR \n\n2.DELETE a FOLDER\n\nOR\n\n3. Go Back\n\n";

				print "Your Choice: ";

				my $item_to_delete = <>;

				INNER:while(1){

					if($item_to_delete == "1"){



						print "\n\nWhich FILE do you want to DELETE?\n\n(COPY AND PASTE the path of the file you want to Delete.)\n\n";

						find(
						{
							wanted => \&findfiles,
							},
							'/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive'
							);
						
						sub findfiles9a{

								open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "Can't open > directory_list.txt: $!";

								print $fh "$File::Find::name\n\n";

								#Writing to the file

								close $fh or die "Couldn't close the file; File not open: $!";

								open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "File was not created correctly or already exists.\n\n";

								print readline($fh);

								close $fh or die "Couldn't close the file; File not open: $!";

						}

						#your choice
						#select the file you want to delete - if it does not contain a . in the name and contains /drive, throw error - please select a file instead
						print "\nYour Choice: ";

						my $File_to_delete = <>;

						chomp($File_to_delete);

			

				INNERMOST:while(1){

							if(($File_to_delete =~ ".") and ($File_to_delete =~ "/Drive")){

								print "\n\nDeleting File....";

								unlink $File_to_delete;

								if (-e $File_to_delete){
									print "\n\nThere was an Issue with deleting the File...";
								last;
								}
								else{
									print "\n\nFile has been successfully deleted!\n\nBack to the Menu:\n\n";

								last INNER_LOOP;
								}

							}
							else{
								print "\n\nNot a Valid File OR Path not found. Please select a .zip or .txt file from the provided paths.";
								last INNERMOST;
							}

							
						}

					}

					elsif($item_to_delete == "2"){

						# if((index($folder_to_delete, '.') == -1) and ($folder_to_delete =~ "/Drive"))

						print "\n\nWhich FOLDER do you want to DELETE?\n\n(COPY AND PASTE the path of the folder you want to Delete.)\n\n";

						find(
						{
							wanted => \&findfiles,
							},
							'/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/Drive'
							);
						
						sub findfiles9b{

								open (my $fh, ">", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "Can't open > directory_list.txt: $!";

								print $fh "$File::Find::name\n\n";

								#Writing to the file

								close $fh or die "Couldn't close the file; File not open: $!";

								open ($fh, "<", "/Users/mitsukiyouko/Desktop/Dropbox/Coding/Perl/OOFileSystem/directory_list.txt") or die "File was not created correctly or already exists.\n\n";

								print readline($fh);

								close $fh or die "Couldn't close the file; File not open: $!";

						}

						#your choice
						#select the file you want to delete - if it does not contain a . in the name and contains /drive, throw error - please select a file instead
						print "\nYour Choice: ";

						my $folder_to_delete = <>;

						chomp($folder_to_delete);

			

				INNERMOST:while(1){

							if((index($folder_to_delete, '.') == -1) and ($folder_to_delete =~ "/Drive")){

								unlink glob "$folder_to_delete/* $folder_to_delete/.*";

								print "Deleting Folder....\n\n";

								rmdir($folder_to_delete) or do{

									if (-e $folder_to_delete){
										print "There was an Issue with deleting the Folder...\n\nNOTE: Cannot Delete NON-Empty Folders!";
									last;									
									}
									else{
										print "Folder has been successfully deleted!";
									last OURTER;
									}
								};

							}
							else{
								print "\n\nInvalid Path OR Not a Valid Folder Name. Please select a FOLDERfrom the given paths.\n\n";
								last INNERMOST;
							}

						}

					}

					elsif($item_to_delete == "3"){
						print "Back to the Menu:\n\n";
						last OURTER;
					}

					else{

						print"Not a valid choice. Please select one of the options.";
						last INNER;

					}
				}
			}

			print "\n\nGoing Back to the menu:\n";				

				last;		
		}
		if($option == "10"){
			print "\n\nYou picked 10.Show All Properties\n\nGoing Back to the menu:\n";
			# Show properties
			# 1.Drive Properties (the sum of all sizes of the entities it contains.)
			# 2.Zip File properties (one half of the sum of all sizes of the entities it contains.)
			# 3.Text File Properties (it is the length of its content. like 500 words?)
				last;

		}
		if($option == "11"){
			print "\n\nExiting...\n\n";
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




