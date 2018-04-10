# updatedebian.sh
# Michael McMahon
# Update Debian and Ubuntu.

sudo apt update
sudo apt upgrade -y
sudo apt-get dist-upgrade -y
sudo apt autoremove
sudo apt clean
