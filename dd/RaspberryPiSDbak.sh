# RaspberryPiSDbak.sh
# Michael McMahon
# Raspberry Pi SD Card Backup for GNU/Linux

# Referenced guide on
# http://cmdann.ca/tutorials/raspberry-pi-tutorials/raspberry-pi-sd-card-setup-mac/

# After running df -h, the SD card is /dev/sdc.
# Yours may be different.

# unmount partitions
sudo umount /dev/sdc1 2>/dev/null
sudo umount /dev/sdc2 2>/dev/null
sudo umount /dev/sdc3 2>/dev/null
sudo umount /dev/sdc4 2>/dev/null
sudo umount /dev/sdc5 2>/dev/null
sudo umount /dev/sdc6 2>/dev/null

# Backup Card
# sudo dd bs=1M if=/mnt/data0/data/iso/arm/raspbian/raspbian20170126BAK.img of=/dev/sdc status=progress
sudo dd bs=1M if=/dev/sdc of=/mnt/data0/data/iso/arm/raspbian/raspbian$(date +%Y-%m-%d)BAK.img status=progress

#sudo diskutil eject /dev/rdisk1
sudo eject /dev/sdc 2>/dev/null
sync

echo "The SD card can now be removed."
