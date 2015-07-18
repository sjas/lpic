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

### What is the difference between hardlink and symlink?

> A hardlink isn't a pointer to a file, it's a directory entry (a file) pointing to the same inode. Even if you change the name of the other file, a hardlink still points to the file...

> On the other hand, a symlink is actually pointing to another path (a file name); it resolves the name of the file each time you access it through the symlink.

@see

- http://askubuntu.com/questions/108771/what-is-the-difference-between-a-hard-link-and-a-symbolic-link
- http://stackoverflow.com/questions/185899/what-is-the-difference-between-a-symbolic-link-and-a-hard-link

```bash

# shows hardlinks
$ ls -i1 # with `-i` options, `ls` shows index node(i node)

# creates hard links
$ touch test.txt # creates test.txt
$ ln test.txt test.hard # creates hardlink of test.txt
$ ls -i1 # check that i node of test.txt equals with test.hard

# creates symbol links
$ touch symbol.txt
$ ln -s symbol.txt symbol.sym
$ ls -i1

# let's have a look at the differene between hard and symbol
$ touch {hard,symbol}.txt # creates hard.txt and symbol.txt
$ ln hard.txt hard.hard # creates hard link
$ ln -s symbol.txt symbol.sym # creates symbol link
$ rm {hard,symbol}.txt # removes original .txt files
$ cat hard.hard # see how it works
$ cat symbol.sym # see how it works

```

## Redirect

```bash
# redirect result
$ ls > redirect.txt # the result of `ls` command would be written to redirect2.txt
$ cat redirect.txt
$ ls -i1 >> redirect.txt # adds the result to the existing file

# redirect error
$ ls -222 2> error.txt # 2> writes error log
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
