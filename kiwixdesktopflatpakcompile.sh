#!/bin/bash

# kiwixdesktopflatpakcompile.sh
# version 0.6
# Compile dependencies for kixix desktop for Triquel 8.
# Michael McMahon

# This script is licensed under the GNU Affero General Public License v3.0
# (AGPL-3.0).  See the LICENSE file for more information.

# To run this script, boot Triquel 8 and follow these steps:
# Open a terminal and run this script with:
# sudo bash kiwixdesktopflatpakcompile.sh
# OR
# sudo /bin/bash kiwixdesktopflatpakcompile.sh
# OR
# sudo chmod 755 kiwixdesktopflatpakcompile.sh
# sudo ./kiwixdesktopflatpakcompile.sh



# Initialization checks

# Check for /bin/bash.
if [ "$BASH_VERSION" = '' ]; then
  echo "You are not using bash."
  echo "Use this syntax instead:"
  echo "sudo bash bluearchive.sh"
  exit 1
fi

# Check networking
# https://unix.stackexchange.com/questions/190513/shell-scripting-proper-way-to-
#   check-for-internet-connectivity
echo Checking network...
if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo "The network is up."
else
  echo "The network is down."
  echo "Check connection and restart script!"
  exit 1
fi



# Updates and dependencies

echo "Installing dependencies..."
sudo apt install -y python3-pip
sudo apt install -y virtualenv
sudo apt install -y cmake
sudo apt install -y pkg-config
sudo apt install -y autopoint
sudo apt install -y libtool
sudo apt install -y ccache
sudo apt install -y automake
sudo apt install -y libtool
sudo apt install -y git
sudo apt install -y subversion
sudo apt install -y gcc
sudo apt install -y libbz2-dev
sudo apt install -y libmagic-dev

sudo apt install -y flex
sudo apt install -y bison
sudo apt install -y gperf

sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update
sudo apt install -y flatpak
sudo apt install -y flatpak-builder

echo "Installing optional dependency for ninja..."
sudo apt install -y re2c

echo "Cloning ninja repository..."
cd /tmp
git clone https://github.com/ninja-build/ninja
cd ninja/
echo "Creating the ninja binary..."
./configure.py --bootstrap

echo "Checking if ninja was successfully built from source..."
if [ $(./ninja -h 2>&1 | wc -l) -gt 1 ]
then
  echo "ninja compiled successfully!"
else
  echo "ninja failed to compile :("
  echo "Check logs for more information"
  exit 1
fi

echo "Creating ~/bin if it does not exist..."
mkdir -p $HOME/bin
echo "Copying ninja to ~/bin..."
cp ninja $HOME/bin

echo "Creating a python virtual environment instead of modifying the system..."
cd ~
virtualenv -p python3 ./
echo "Activating the python virtual environment..."
source bin/activate

echo "Downloading kiwix-build..."
cd /tmp
git clone https://github.com/kiwix/kiwix-build.git
cd kiwix-build
echo "Installing kiwix-build and dependencies..."
pip install .
echo "Refreshing bash paths..."
hash -r

echo "Building kiwix-desktop and dependencies..."
kiwix-build --target-platform flatpak --make-release kiwix-desktop
