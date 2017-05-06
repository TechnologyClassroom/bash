#!/bin/bash

# clone7.sh

# Michael McMahon

# This script will copy drives like so:
# 
# sda Live OS on flash drive
#
# backup drive
# sdd mounted as /mnt       Machine 2           Machine 4           Machine 6
# /mnt/disk0.img   >>>>>>>> sdg        >>>>>>>> sdk        >>>>>>>> sdo
# /mnt/disk1.img   >>>>>>>>      sdh   >>>>>>>>      sdl   >>>>>>>>      sdp
#  ^      ^
#  ^      ^
#  ^      ^
#  ^      ^
# sdb  >  ^  >>>>>>>>>>>>>> sde        >>>>>>>> sdi        >>>>>>>> sdm
#        sdc >>>>>>>>>>>>>>      sdf   >>>>>>>>      sdj   >>>>>>>>      sn
# original drives           Machine 1           Machine 3           Machine 5
#
# After each machine is finished.  The drives can be safely removed.
# 

# I used a supermicro server with 16 drive bays.

echo Insert drives one at a time to ensure drive letters are correct.

echo "Prereq: drive with live GNU/Linux distro on sda"
echo "    mount /dev/sdd /mnt"


echo "WARNING: This script uses dd to overwrite drives"
echo \ 
echo "If this is not what you want to do, shutdown now."
echo "If incorrect, the drives may need to be reflashed."


lsblk

#echo "Press any key to continue..."
#read

echo Updating system.  This is unnecessary, but it gives the user extra time to shutdown.
echo Updating repositories twice...
apt-get update 1>/dev/null
apt-get update 1>/dev/null
#apt-get install -y console-setup
#apt-get upgrade -y

# 11AM
# Time estimates are based on 1TB 7200RPM HDDs.

# sdb and sdc go to files on sdd
uptime >> /tmp/report.log
uptime
echo Backing up sdb and sdc to /mnt on sdd... >> /tmp/report.log
echo Backing up sdb and sdc to /mnt on sdd...
dd if=/dev/sdb of=/mnt/disk0.img bs=4M >> /tmp/report.log
dd if=/dev/sdc of=/mnt/disk1.img bs=4M >> /tmp/report.log
echo Initial Backup is complete. >> /tmp/report.log
echo Initial Backup is complete.
uptime >> /tmp/report.log
uptime
# 3:30PM

echo Generating script to copy sdb and sdc to sde, sdf, sdi, sdj, sdm, and sdn...

# Machine 1
echo "echo sdb to sde >> /tmp/report.log" > /tmp/ddroutine.sh
echo "dd if=/dev/sdb of=/dev/sde bs=4M >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "echo sdc to sdf >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "dd if=/dev/sdc of=/dev/sdf bs=4M >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "echo ejecting sde and sdf >> /tmp/report.log" >> /tmp/ddroutine.sh
echo eject /dev/sde >> /tmp/ddroutine.sh
echo eject /dev/sdf >> /tmp/ddroutine.sh
echo "echo Machine 1 is done. sde and sdf can be removed. >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "uptime >> /tmp/report.log" >> /tmp/ddroutine.sh
# 9PM

# Machine 3
echo "echo sdb to sdi >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "dd if=/dev/sdb of=/dev/sdi bs=4M >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "echo sdc to sdj >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "dd if=/dev/sdc of=/dev/sdj bs=4M >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "echo ejecting sdi and sdj >> /tmp/report.log" >> /tmp/ddroutine.sh
echo eject /dev/sdi >> /tmp/ddroutine.sh
echo eject /dev/sdj >> /tmp/ddroutine.sh
echo "echo Machine 3 is done. sdi and sdj can be removed. >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "uptime >> /tmp/report.log" >> /tmp/ddroutine.sh
# 2:30AM

# Machine 5
echo "echo sdb to sdm >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "dd if=/dev/sdb of=/dev/sdm bs=4M >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "echo sdc to sdn >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "dd if=/dev/sdc of=/dev/sdn bs=4M >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "echo ejecting sdm and sdn >> /tmp/report.log" >> /tmp/ddroutine.sh
echo eject /dev/sdm >> /tmp/ddroutine.sh
echo eject /dev/sdn >> /tmp/ddroutine.sh
echo "echo Machine 3 is done. sdm and sdn can be removed. >> /tmp/report.log" >> /tmp/ddroutine.sh
echo "uptime >> /tmp/report.log" >> /tmp/ddroutine.sh
# 8:00AM

echo Copying sdb and sdc to sde, sdf, sdi, sdj, sdm, and sdn in the background...
echo Monitor progress with watch -n 60 cat /tmp/report.log
sh /tmp/ddroutine.sh &

# Machine 2
echo disk0.img to sdg >> /tmp/report.log
dd if=/mnt/disk0.img of=/dev/sdg bs=4M >> /tmp/report.log
echo disk1.img to sdh >> /tmp/report.log
dd if=/mnt/disk1.img of=/dev/sdh bs=4M >> /tmp/report.log
echo ejecting sdg and sdh >> /tmp/report.log
echo ejecting sdg and sdh
eject /dev/sdg
eject /dev/sdh
echo Machine 2 is done. sdg and sdh can be removed. >> /tmp/report.log
echo Machine 2 is done. sdg and sdh can be removed.
uptime >> /tmp/report.log
uptime
# 8PM

# Machine 4
echo disk0.img to sdk >> /tmp/report.log
dd if=/mnt/disk0.img of=/dev/sdk bs=4M >> /tmp/report.log
echo disk1.img to sdl >> /tmp/report.log
dd if=/mnt/disk1.img of=/dev/sdl bs=4M >> /tmp/report.log
echo ejecting sdk and sdl >> /tmp/report.log
echo ejecting sdk and sdl
eject /dev/sdk
eject /dev/sdl
echo Machine 4 is done. sdk and sdl can be removed. >> /tmp/report.log
echo Machine 4 is done. sdk and sdl can be removed.
uptime >> /tmp/report.log
uptime
# 12:30AM

# Machine 6
echo disk0.img to sdo >> /tmp/report.log
dd if=/mnt/disk0.img of=/dev/sdo bs=4M >> /tmp/report.log
echo disk1.img to sdp >> /tmp/report.log
dd if=/mnt/disk1.img of=/dev/sdp bs=4M >> /tmp/report.log
echo ejecting sdo and sdp >> /tmp/report.log
echo ejecting sdo and sdp
eject /dev/sdo
eject /dev/sdp
echo Machine 4 is done. sdo and sdp can be removed. >> /tmp/report.log
echo Machine 4 is done. sdo and sdp can be removed.
uptime >> /tmp/report.log
uptime
# 4:30AM

#echo Unmounting /dev/sdd...
#umount /mnt
#echo Mounting /dev/sdq
#mount /dev/sdq /mnt

#echo Backup 2
## sdb and sdc go to files on sdq
#uptime >> /tmp/report.log
#uptime
#dd if=/dev/sdb of=/mnt/disk0.img bs=4M >> /tmp/report.log
#dd if=/dev/sdc of=/mnt/disk1.img bs=4M >> /tmp/report.log
#echo Initial Backup is complete.
#uptime >> /tmp/report.log
#uptime
# 8:30AM

cp /tmp/report.log /mnt/sorensonreport.log
echo sleep 10 >> /tmp/shutdown.sh
echo umount /mnt >> /tmp/shutdown.sh
echo sleep 43200 >> /tmp/shutdown.sh # 12 hours of extra time for the other script to complete.
echo shutdown -h now >> /tmp/shutdown.sh
sh /tmp/shutdown.sh &
