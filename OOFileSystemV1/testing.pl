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
	print"\n\nInitial Check Complete - Base Files Created.\n\n"
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
