#!/bin/bash

# wordwrap80.sh
# Michael McMahon
# Word wrap at 80 characters
#   sh wordwrap80.sh filetowrap.txt

# Word wrap at 80 characters without breaking words.
fold -sw 80 $1 > $1.bak
# From user2683246 at https://unix.stackexchange.com/questions/25173
# Alternatively look at `fmt -w 80`

# Remove trailing spaces and tabs.
sed -i 's/[[:blank:]]*$//' $1.bak
# From fedorqui at https://stackoverflow.com/questions/20521857

# Manually check the beginning of all lines.
vim $1.bak
# nano $1.bak

# Replace the origininal file.
mv $1.bak $1
