#!/bin/bash

# blinkgen.sh
# Blink lights on disk drives

# Michael McMahon

# To run this script, boot Ubuntu Desktop 16.04, 14.04, GRML, or Debian 9, run
# this script with:
# sudo bash blinkgen.sh
# OR
# sudo chmod 755 blinkgen.sh
# sudo ./blinkgen.sh

# Initialization checks

# Check for root.
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

# Check networking
# https://unix.stackexchange.com/questions/190513
echo "Checking network..."
if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo "The network is up."
else
  echo "The network is down."
  echo "Check connection and restart script!"
  exit 1
fi

# Updates and dependencies

echo "Adding Universe entries to apt sources list..."
add-apt-repository universe

echo "Installing packages for blinking LED lights..."
apt-get update 2>/dev/null >> /dev/null
apt-get install -y ledmon >> /dev/null

# LEDs

echo "Generating blink.sh..."
cd /tmp
fdisk -l | grep Disk\ | grep -v -e ram -e identifier -e swap | awk '{print \
"sleep 1 && sudo ledctl locate=" substr($2, 1, length($2)-1)}' > blink.sh
echo "Manually test drive LED lights for each drive with:"
echo "  ledctl locate=/dev/sda"
echo \ 
echo "To blink all drives with 1 second delay between each, run this command:"
echo "  sh /tmp/blink.sh"
echo "If drives fail to light, try again with controller card."
echo "If lights do not work, check backplane, pins, ports, and cables."
echo \ 
sh /tmp/blink.sh
