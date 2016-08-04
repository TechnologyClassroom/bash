# RaspberryPiSDbak.sh
# Michael McMahon
# Raspberry Pi SD Card Backup for OS X from limited user account

# Referenced guide on http://cmdann.ca/tutorials/raspberry-pi-tutorials/raspberry-pi-sd-card-setup-mac/

# After running df -h, the SD card is /dev/disk1s1 and /dev/disk1s6.
# Yours may be different.

#sudo diskutil unmount /dev/disk1s1
su Computer\ Clubhouse -c sudo\ diskutil\ unmount\ /dev/disk1s1
su Computer\ Clubhouse -c sudo\ diskutil\ unmount\ /dev/disk1s6

# Backup Card
#sudo dd bs=1m if=~/Downloads/RaspberryPi/Raspbian20160804BAK.img of=/dev/rdisk1
su Computer\ Clubhouse -c sudo\ dd\ bs=1m\ if=/dev/rdisk1\ of=/Users/bluehill/Downloads/RaspberryPi/Raspbian20160804BAK.img

#sudo diskutil eject /dev/rdisk1
su Computer\ Clubhouse -c sudo\ diskutil\ eject\ /dev/rdisk1