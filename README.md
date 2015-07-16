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
$ cd #changes directory to home
$ cd - #goes back to previous files

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
$ cp -r tmp tmp2 # copy directory

# move/rename
$ mv -i data.txt tmp # overwrites with confirmation
$ mv -f data.txt tmp # overwrites without confirmation
$ mv tmpdir mydir # -r is not necessary for moving directory like `rm` or `cp` commands

# remove
$ rm -i data.txt # removes with confirmation
$ rm -f data.txt # removes without confirmation
$ rm -r tmp # removes directory(even when the directory is NOT empty)
$ rm -R tmp # removes directory(same with -r option)
$ rmdir tmp # `rmdir` also removes EMPTY files

# create directory
$ mkdir -p tmp/tmp2 # parents directory will be also created
$ mkdir -m 705 mydir # creates directory with set permissions


```

## Hard link / Symbolic link

```bash

# shows hardlinks
$ ls -i1 # with `-i` options, `ls` shows index node(i node)

# creates hardlinks
$ touch test.txt # creates test.txt
$ ln test.txt test.hard # creates hardlink of test.txt
$ ls -i1 # check that i node of test.txt equals with test.hard

```

## Useful tips

```bash
# {}
# the first command is equals with the second one
$ touch test{1,2,3}.mdi
$ touch test1.md test2.md test3.md

```
