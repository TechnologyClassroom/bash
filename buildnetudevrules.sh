#!/bin/bash

# buildnetudevrules.sh
# Michael McMahon
# Build net udev rules.

# Tested with Ubuntu 16.04 Server.

ip a | grep link | grep -v scope | awk '{ print "SUBSYSTEM==\"net\", ACTION==\"add\", ATTR\{address\}==\"" $2 "\", NAME==\"eth" NR-1 "\"" }' | tail -n+2 #>> /etc/udev/rules.d/70-persistent-net.rules
