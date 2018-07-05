#!/bin/sh 
tmux new-session -d 'canto-curses' \; split-window -v 'top' \; split-window -h \; attach
