# RaspberryPiSDinstall.sh
# Michael McMahon
# Raspberry Pi SD Card Install for Mac OS X from limited user account

# Referenced guide on http://cmdann.ca/tutorials/raspberry-pi-tutorials/raspberry-pi-sd-card-setup-mac/

# After running df -h, the SD card is /dev/disk1s1
# So I'll use /dev/rdisk1 for the dd command

#sudo diskutil unmount /dev/disk1s1
su Computer\ Clubhouse -c sudo\ diskutil\ unmount\ /dev/disk1s1

# Installs Backed up img
su Computer\ Clubhouse -c sudo\ dd\ bs=1m\ if=/Users/bluehill/Downloads/RaspberryPi/Raspbian20160804BAK.img\ of=/dev/rdisk1

#sudo diskutil eject /dev/rdisk1
#su Computer\ Clubhouse -c sudo\ diskutil\ eject\ /dev/rdisk1
su Computer\ Clubhouse -c sudo\ diskutil\ eject\ /dev/rdisk1