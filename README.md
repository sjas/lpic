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



```
