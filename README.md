# Introduction

## Linux main directory

- boot  : necessarry file for start up system like Linux kernel
- bin   : command for general users
- dev   : device files
- etc   : system setting files
- home  : home directory for users
- lib   : library
- media : mount point for outer media
- proc  : process information of system
- root  : home directory for root users
- sbin  : commands for system admin users
- tmp   : temporary files
- usr   : programs, libraries, documents, etc.
- var   : frequently updated files like log files

# Command Lists

## File

```bash
# cd
$ cd 		#changes directory to home
$ cd - 	#goes back to previous files

# less
$ less test.md
# f/b : show next/previous page
# q   : quits
# =   : show file name and current line number
# /   : search in forward order
# ?   : search in backward order
# v   : launch vi editor

#head/tail
$ head -5 test.md # shows 5 heading lines of test.md
$ tail -3 test.md # shows 3 bottom lines of test.md

#copy
$ cp -i test.md tmp # overwrites with confirmation
$ cp -i test.md tmp # overwrites without confirmation
$ cp -r tmp tmp2 		# copy directory

# move/rename
$ mv -i data.txt tmp 	# overwrites with confirmation
$ mv -f data.txt tmp 	# overwrites without confirmation
$ mv tmpdir mydir 		# -r is not necessary for moving directory like `rm` or `cp` commands

# remove
$ rm -i data.txt 	# removes with confirmation
$ rm -f data.txt 	# removes without confirmation
$ rm -r tmp 			# removes directory(even when the directory is NOT empty)
$ rm -R tmp # removes directory(same with -r option)
$ rmdir tmp # `rmdir` also removes EMPTY files

# create directory
$ mkdir -p tmp/tmp2 	# parents directory will be also created
$ mkdir -m 705 mydir 	# creates directory with set permissions


```

## Count / Sort

```bash

# count
$ ls -l | wc 			# shows bytes/lines/words count
$ wc -c count.txt # shows only bytes count
$ wc -l count.txt # shows only lines count
$ wc -w count.txt # shows only words count

# sort
$ ls -l | sort 		# sorts by alphabetic order
$ ls -l | sort -b # sorts ignoring spaces in the opening sentence
$ ls -l | sort -f # sorts ignoring Small/Capital
$ ls -l | sort -r # sorts in reverse way
$ ls -l | sort -n # sorts number not as a string but as a number

```

## Search

### Locate

```bash

# `locate` commands search based on database
# therefore it is faster than `find` command
$ locate sort

# to update database
# * this is usually executed regularly
$ updatedb

```

### Find

#### Option

```bash

# `maxdepth` otption defines the depth of search target
$ find . -name "README.md" -maxdepth 1

```

#### Condition

```bash

# Basic
# find [targetDirectory] [option]

# By name
$ find . -name "README.md"

# By size
$ find . -size 1k 		# file size = 1k byte
$ find . -size +100c 	# file size > 100 byte
$ find . -size +1k 		# file size > 1k byte
$ find . -size -100c 	# file size < 100 byte
$ find . -size -1k 		# file size < 1k byte

# By types
$ find . -type f # files
$ find . -type d # directories
$ find . -type l # symlinks

# By modified time
$ find . -mtime -1 # files modified in a day
$ find . -mmin -60 # files modified in last 60 mitnues
$ find . -mtime 7  # files which have not modified over a week
$ find . -mmin 60  # files which have not modified over an hour

# By accessed time
$ find . -atime -1 # files accessed in a day
$ find . -amin -60 # files accessed in last 60 minutes
$ find . -atime 7  # files which have not accessed over a week
$ find . -amin 60  # files which have not accessed over an hour

# By permission
$ find . -perm a+r 	# all read-permission is allowed
$ find . -perm 644  # permission code is 644
$ find . -perm -444 # read-permission is allowed for all users
$ find . -perm +444 # read-permission is allowed for one of owner, owner group or other users

# By users
$ find . -user david # files owned by david
$ find . -uid XXXXXX # files owned by declared uid

# By regexp
# @see http://www.gnu.org/software/findutils/manual/html_mono/find.html#Regular-Expressions
$ find . regex ".*git*"

```

### Action

```bash

# print
$ find . -name "*git*" 				# shows matched files(default)
$ find . -name "*git*" -print # shows matched files(default)
$ find . -name "*git*" -ls		# shows file's information also

# `-exec` enables you to execute command to the result
$ find . -name "README.md" -exec rm {} ¥; # without confirmation
$ find . -name "README.md" -ok rm {} ¥;		# with confirmation

```

### Example

```bash

# finds files updated within a day
$ find . -type f -mtime -1

# finds files updated within past 30 minutes
$ find . -type f -mmin -60

# find and delete files which have not been accessed in 200 days
$ find . -atime +200 -exec rm {} ¥;

```

## Zip

```bash

#############
# gzip
#############
# zip file
$ cal > cal.txt
$ gzip cal.txt 									# this creates cal.txt.gz but cal.txt would be deleted
$ gzip -c cal.txt > cal.txt.gz 	# if original files should not be deleted

# zip directory
$ mkdir tmp
$ cp cal.txt tmp
$ gzip -r tmp			# be sure that `gzip -r` will not zip directory itself

# let's see how different
$ ls -l 					# see the difference of sizes
$ cat cal.txt 		# you can see the calander
$ cat cal.txt.gp 	# but this shows misterious results

# unzip
$ gzip -d cal.txt.gp # unzip file
$ gzip -dr tmp			 # unzip files in tmp directory
$ gunzip cal.txt.gp  # equals with `gzip -d` command

#############
# bzip2
#############
$ bzip2 sample.dat    		# this creates sample.dat.bz2
$ bzip2 -d sample.dat.bz2 # unzip


#############
# tar (and then gzip)
#############
# tar [options] archivefile.tar targetDirectory
#
# options
# -c : creates archive
# -x : unzip archive
# -t : show files in archived file
# -f : select archive file by file name
# -r : add files to archived file
# -v : show info in details
# -z : gzip
# -j : bzip2

# example
$ mkdir tmp
$ ls -l > tmp/ls.txt
$ cal > tmp/cal.txt
# creates archived files
$ tar cvf tmp.tar tmp 			# just archived and not compressed
$ tar cvfz tmp.tar.gz tmp  	# archived and compressed with gzip
$ tar cvfj tmp.tar.bz2 tmp 	# archived and compressed with bzip2
# see the dirrerences
$ ls -l

```

### gzip vs bzip2 vs tar?

#### gzip/bzip2 vs tar?

> tar isnt a compression format - its a way to combine multiple files into one file.

> bz2 and gz are compression formats - variations on a theme - similar compression ratio's I think. The default archive manager with ubuntu can open most if not all of these type of files.

#### Then gzip vs bzip2?

> bz2 generally compresses better than gz, but is slower. gz is the de facto standard because it is older, and bz2 is not avaialble by default on some OSes (that's why you mostly find .gz files).

@see
- http://ubuntuforums.org/showthread.php?t=1538026

## Hard link / Symbolic link

```bash

# shows hardlinks
$ ls -i1 # with `-i` options, `ls` shows index node(i node)

# creates hard links
$ touch test.txt 				# creates test.txt
$ ln test.txt test.hard # creates hardlink of test.txt
$ ls -i1 								# check that i node of test.txt equals with test.hard

# creates symbol links
$ touch symbol.txt
$ ln -s symbol.txt symbol.sym
$ ls -i1

# let's have a look at the differene between hard and symbol
$ touch {hard,symbol}.txt 			# creates hard.txt and symbol.txt
$ ln hard.txt hard.hard 				# creates hard link
$ ln -s symbol.txt symbol.sym 	# creates symbol link
$ rm {hard,symbol}.txt 					# removes original .txt files
$ cat hard.hard 								# see how it works
$ cat symbol.sym 								# see how it works

```

### Hardlink vs Symlink?

> A hardlink isn't a pointer to a file, it's a directory entry (a file) pointing to the same inode. Even if you change the name of the other file, a hardlink still points to the file...

> On the other hand, a symlink is actually pointing to another path (a file name); it resolves the name of the file each time you access it through the symlink.

@see

- http://askubuntu.com/questions/108771/what-is-the-difference-between-a-hard-link-and-a-symbolic-link
- http://stackoverflow.com/questions/185899/what-is-the-difference-between-a-symbolic-link-and-a-hard-link

## Redirect

```bash
# redirect result
$ ls > redirect.txt 			# the result of `ls` command would be written to redirect2.txt
$ cat redirect.txt
$ ls -i1 >> redirect.txt 	# adds the result to the existing file

# redirect error
$ ls -222 2> error.txt 	# 2> writes error log
$ ls -333 2>> error.txt # 2>> adds error log to the existing file

# redirect both result and error
# .   = current file
# aaa = not-existring file
$ ls . aaa > ls.log 2>&1 # wrtites both the result and error log

# tips
# by combining `cat` and redirect, you can join the result of
# multiple files contents
$ cat apple.txt banana.txt > banapple.txt

# input redirect
# `tr a-z A-Z` replaces all small caps to Capital caps, but
# this command cannot have file as an argument.
# By usring input `<`, a content of file can be sent to commands.
$ tr a-z A-Z  < error.txt

```

## Pipe

```bash

$ ls -l > ls.txt
$ tr a-z A-Z < ls.txt

# By using pipe, above process can be written in one line
$ ls -l | tr a-z A-Z

# If you want to send the result both to a file and other command
# then use `tee`
$ ls -l | tee result.log | less

```

## Useful tips

```bash
# {}
# the first command is equals with the second one
$ touch test{1,2,3}.mdi
$ touch test1.md test2.md test3.md

```
