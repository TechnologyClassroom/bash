#!/bin/sh 
tmux new-session -d \; split-window -v 'top' \; split-window -h \; attach
