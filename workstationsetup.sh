# workstationsetup.sh
# Michael McMahon
# To setup a new GNU/Linux workstation, install Ubuntu and run this script with:
#   sudo bash setup.sh

# Check for root.
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

echo "Updating system..."
apt update
apt upgrade -y
apt-get dist-upgrade -y

echo "Installing puppet..."
apt install -y puppet

echo "Downloading puppet config..."
cd /tmp
wget https://raw.githubusercontent.com/TechnologyClassroom/Puppet/master/ubuntu1604minworkstation.pp

echo "Applying puppet update..."
puppet apply ubuntuminworkstation.pp

echo "Disabling puppet service..."
systemctl disable puppet.service

echo "Configuring awesome WM..."
echo "exec awesome" > /home/$SUDO_USER/.xinitrc

echo "Downloading hosts file..."
wget https://raw.githubusercontent.com/TechnologyClassroom/HOSTS/master/HOSTSFunix.txt

echo "Applying hosts file..."
cp HOSTSFunix.txt /etc/hosts

# echo "Downloading proprietary Chrome..."
# wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# echo "Installing proprietary Chrome..."
# dpkg -i google-chrome-stable_current_amd64.deb

echo "Rebooting..."
shutdown -r now
