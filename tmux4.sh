#!/bin/sh
tmux new-session -d -s hwtest \; send-keys 'echo Window 1' 'C-m' \; rename-window 'hwtest' \; select-window -t hwtest:0 \; split-window -h \; send-keys 'echo Window 2' 'C-m' \; split-window -v -t 0 \; send-keys 'top' 'C-m' \; split-window -v -t 1 \; send-keys 'echo Window 4' 'C-m' \; attach-session -t hwtest
