#!/bin/bash
# pfsmount.sh
# Michael McMahon
# Partition, filesystem, and mount drives

# INCOMPLETE
# WARNING: THIS FILE IS DESTRUCTIVE!  READ, UNDERSTAND, AND MAKE RELEVANT
# CHANGES BEFORE RUNNING THIS SCRIPT.  I AM NOT RESPONSIBLE FOR DATA LOSS
# FROM IMPROPER USE OF THIS SCRIPT.  YOU HAVE BEEN WARNED.

# This script aims to find unpartitioned disks, partition those disks, make
# filesystems for those discs, find UUID, and configure the result in
# /etc/fstab.

# Check for root.
if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root" 
        exit 1
fi


# Automatically list all partitions
drives="$( cat /proc/partitions | grep -v -e ram -e loop -e nvme -e sr -e name -e dm | tail -n+2 | awk '{ print "/dev/" $4 }' | uniq -u | tr '\n' ' ' )"
echo "${drives}"

# Explanation of the command that starts with cat
#
# cat /proc/partitions | grep -v -e dm -e loop -e name -e nvme -e sr | \
# tail -n+2 | awk '{ print "/dev/" $4 }' | uniq -u | tr '\n' ' '
#
# "cat /proc/partitions" lists all partitions available.
#
# "| grep -v -e dm -e loop -e name -e nvme -e sr" excludes dm, loop, name,
# nvme, and sr.
#
# "| tail -n+2" excludes the empty first line.
#
# "| awk '{ print "/dev/" $4 }'" print the 4th column.
#
# "| uniq -u" exclude duplicate entries.  This removes partitioned drives from
# the list.
#
# "| tr '\n' ' '" changes multiple line output to spaced output.

# Manually enter drives

# Any drives listed in the drives variable will be erased.  Uncomment the set of
# drives you wish to use.  Add and remove drives as necessary.

# Drives sda-sdz
#drives="/dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg\
# /dev/sdh /dev/sdi /dev/sdj /dev/sdk /dev/sdl /dev/sdm /dev/sdn /dev/sdo\
# /dev/sdp /dev/sdq /dev/sdr /dev/sds /dev/sdt /dev/sdu /dev/sdv /dev/sdw\
# /dev/sdx /dev/sdy /dev/sdz"

# Drives sda-sdaz
#drives="/dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg\
# /dev/sdh /dev/sdi /dev/sdj /dev/sdk /dev/sdl /dev/sdm /dev/sdn /dev/sdo\
# /dev/sdp /dev/sdq /dev/sdr /dev/sds /dev/sdt /dev/sdu /dev/sdv /dev/sdw\
# /dev/sdx /dev/sdy /dev/sdz\
# /dev/sdaa /dev/sdab /dev/sdac /dev/sdad /dev/sdae /dev/sdaf /dev/sdag\
# /dev/sdah /dev/sdai /dev/sdaj /dev/sdak /dev/sdal /dev/sdam /dev/sdan\
# /dev/sdao /dev/sdap /dev/sdaq /dev/sdar /dev/sdas /dev/sdat /dev/sdau\
# /dev/sdbv /dev/sdaw /dev/sdax /dev/sday /dev/sdaz"

# Drives sda-sdbz
#drives="/dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg\
# /dev/sdh /dev/sdi /dev/sdj /dev/sdk /dev/sdl /dev/sdm /dev/sdn /dev/sdo\
# /dev/sdp /dev/sdq /dev/sdr /dev/sds /dev/sdt /dev/sdu /dev/sdv /dev/sdw\
# /dev/sdx /dev/sdy /dev/sdz\
# /dev/sdaa /dev/sdab /dev/sdac /dev/sdad /dev/sdae /dev/sdaf /dev/sdag\
# /dev/sdah /dev/sdai /dev/sdaj /dev/sdak /dev/sdal /dev/sdam /dev/sdan\
# /dev/sdao /dev/sdap /dev/sdaq /dev/sdar /dev/sdas /dev/sdat /dev/sdau\
# /dev/sdbv /dev/sdaw /dev/sdax /dev/sday /dev/sdaz\
# /dev/sdba /dev/sdbb /dev/sdbc /dev/sdbd /dev/sdbe /dev/sdbf /dev/sdbg\
# /dev/sdbh /dev/sdbi /dev/sdbj /dev/sdbk /dev/sdbl /dev/sdbm /dev/sdbn\
# /dev/sdbo /dev/sdbp /dev/sdbq /dev/sdbr /dev/sdbs /dev/sdbt /dev/sdbu\
# /dev/sdbv /dev/sdbw /dev/sdbx /dev/sdby /dev/sdbz"


# Partition unpartitioned disks and add filesystem

for drive in $drives; do
  echo "Checking $drive for partition table..."
  if [ $(sfdisk -d $drive 2>&1 | wc -l ) -eq 1 ]
  # Line is based on Spenser Gilliland at https://superuser.com/questions/471359
  # This step should be redundant now.
  then
    echo "No partition table found on ${drive}!"
    echo "Starting $drive partitioning..."
    if [ $( fdisk -l $drive | grep Disk | awk '{ print $5/1024/1024/1024/1024 " >= 2"}' | bc -l ) -eq 1 ]
    # If the size of the drive is greater than or equal to 2TB, use gpt
    # partition table.  /1024/1024/1024/1024 converts bytes to terabytes.
    # BASH cannot handle floating point math so bc is an added dependency.
    then
      echo "$drive is greater than or equal to 2TB."
      echo "Using parted to create gpt partition table and partitioning..."
      # parted -s -a optimal ${drive} mklabel gpt mkpart primary 2048s 100%
    else
      echo "$drive is less than 2TB."
      echo "Using fdisk to create dos partition table and partitioning..."
      # sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${drive}
      #   o # clear the in memory partition table
      #   n # new partition
      #     # primary partition
      #     # partition number 1
      #     # default - start at beginning of disk 
      #     # Use the full space of the drive
      #   p # print the in-memory partition table
      #   w # write the partition table
      # EOF ### TEST HEREDOC within loop!!!!
    fi
    echo "Creating a filesystem for ${drive}1..."
    # mkfs.ext4 ${drive}1
    # mkfs.xfs ${drive}1
  else
    echo "Parition table found on ${drive}!"
    echo "Adding $drive to grep -v list..."
    # TODO
  fi
done

# Manually use fdisk for drives that are less than or equal to 2TB.

# Drives sda-sdz
#fdisk /dev/sda && fdisk /dev/sdb
#fdisk /dev/sdc && fdisk /dev/sdd
#fdisk /dev/sde && fdisk /dev/sdf
#fdisk /dev/sdg && fdisk /dev/sdh
#fdisk /dev/sdi && fdisk /dev/sdj
#fdisk /dev/sdk && fdisk /dev/sdl
#fdisk /dev/sdm && fdisk /dev/sdn
#fdisk /dev/sdo && fdisk /dev/sdp
#fdisk /dev/sdq && fdisk /dev/sdr
#fdisk /dev/sds && fdisk /dev/sdt
#fdisk /dev/sdu && fdisk /dev/sdv
#fdisk /dev/sdw && fdisk /dev/sdx
#fdisk /dev/sdy && fdisk /dev/sdz

# Drives sdaa-sdaz
#fdisk /dev/sdaa && fdisk /dev/sdab
#fdisk /dev/sdac && fdisk /dev/sdad
#fdisk /dev/sdae && fdisk /dev/sdaf
#fdisk /dev/sdag && fdisk /dev/sdah
#fdisk /dev/sdai && fdisk /dev/sdaj
#fdisk /dev/sdak && fdisk /dev/sdal
#fdisk /dev/sdam && fdisk /dev/sdan
#fdisk /dev/sdao && fdisk /dev/sdap
#fdisk /dev/sdaq && fdisk /dev/sdar
#fdisk /dev/sdas && fdisk /dev/sdat
#fdisk /dev/sdau && fdisk /dev/sdav
#fdisk /dev/sdaw && fdisk /dev/sdax
#fdisk /dev/sday && fdisk /dev/sdaz

# Drives sdba-sdbz
#fdisk /dev/sdba && fdisk /dev/sdbb
#fdisk /dev/sdbc && fdisk /dev/sdbd
#fdisk /dev/sdbe && fdisk /dev/sdbf
#fdisk /dev/sdbg && fdisk /dev/sdbh
#fdisk /dev/sdbi && fdisk /dev/sdbj
#fdisk /dev/sdbk && fdisk /dev/sdbl
#fdisk /dev/sdbm && fdisk /dev/sdbn
#fdisk /dev/sdbo && fdisk /dev/sdbp
#fdisk /dev/sdbq && fdisk /dev/sdbr
#fdisk /dev/sdbs && fdisk /dev/sdbt
#fdisk /dev/sdbu && fdisk /dev/sdbv
#fdisk /dev/sdbw && fdisk /dev/sdbx
#fdisk /dev/sdby && fdisk /dev/sdbz

# Manually use parted to partition drives.

# parted for drives that are greater than 2TB

# Drives sda-sdz
#parted -s -a optimal /dev/sda mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdb mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdc mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdd mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sde mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdf mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdg mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdh mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdi mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdj mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdk mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdl mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdm mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdn mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdo mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdp mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdq mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdr mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sds mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdt mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdu mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdv mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdw mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdx mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdy mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdz mklabel gpt mkpart primary 2048s 100%

# Drives sdaa-sdaz
#parted -s -a optimal /dev/sdaa mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdab mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdac mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdad mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdae mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdaf mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdag mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdah mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdai mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdaj mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdak mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdal mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdam mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdan mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdao mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdap mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdaq mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdar mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdas mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdat mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdau mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdav mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdaw mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdax mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sday mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdaz mklabel gpt mkpart primary 2048s 100%

# Drives sdba-sdbz
#parted -s -a optimal /dev/sdba mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbb mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbc mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbd mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbe mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbf mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbg mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbh mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbi mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbj mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbk mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbl mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbm mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbn mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbo mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbp mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbq mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbr mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbs mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbt mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbu mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbv mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbw mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbx mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdby mklabel gpt mkpart primary 2048s 100%
#parted -s -a optimal /dev/sdbz mklabel gpt mkpart primary 2048s 100%

# Manually make filesystem xfs for Red Hat 7 based systems.

# Drives sda-sdz
#mkfs.xfs /dev/sda1 && mkfs.xfs /dev/sdb1
#mkfs.xfs /dev/sdc1 && mkfs.xfs /dev/sdd1
#mkfs.xfs /dev/sde1 && mkfs.xfs /dev/sdf1
#mkfs.xfs /dev/sdg1 && mkfs.xfs /dev/sdh1
#mkfs.xfs /dev/sdi1 && mkfs.xfs /dev/sdj1
#mkfs.xfs /dev/sdk1 && mkfs.xfs /dev/sdl1
#mkfs.xfs /dev/sdm1 && mkfs.xfs /dev/sdn1
#mkfs.xfs /dev/sdo1 && mkfs.xfs /dev/sdp1
#mkfs.xfs /dev/sdq1 && mkfs.xfs /dev/sdr1
#mkfs.xfs /dev/sds1 && mkfs.xfs /dev/sdt1
#mkfs.xfs /dev/sdu1 && mkfs.xfs /dev/sdv1
#mkfs.xfs /dev/sdw1 && mkfs.xfs /dev/sdx1
#mkfs.xfs /dev/sdy1 && mkfs.xfs /dev/sdz1

# Drives sdaa-sdaz
#mkfs.xfs /dev/sdaa1 && mkfs.xfs /dev/sdab1
#mkfs.xfs /dev/sdac1 && mkfs.xfs /dev/sdad1
#mkfs.xfs /dev/sdae1 && mkfs.xfs /dev/sdaf1
#mkfs.xfs /dev/sdag1 && mkfs.xfs /dev/sdah1
#mkfs.xfs /dev/sdai1 && mkfs.xfs /dev/sdaj1
#mkfs.xfs /dev/sdak1 && mkfs.xfs /dev/sdal1
#mkfs.xfs /dev/sdam1 && mkfs.xfs /dev/sdan1
#mkfs.xfs /dev/sdao1 && mkfs.xfs /dev/sdap1
#mkfs.xfs /dev/sdaq1 && mkfs.xfs /dev/sdar1
#mkfs.xfs /dev/sdas1 && mkfs.xfs /dev/sdat1
#mkfs.xfs /dev/sdau1 && mkfs.xfs /dev/sdav1
#mkfs.xfs /dev/sdaw1 && mkfs.xfs /dev/sdax1
#mkfs.xfs /dev/sday1 && mkfs.xfs /dev/sdaz1

# Drives sdba-sdbz
#mkfs.xfs /dev/sdba1 && mkfs.xfs /dev/sdbb1
#mkfs.xfs /dev/sdbc1 && mkfs.xfs /dev/sdbd1
#mkfs.xfs /dev/sdbe1 && mkfs.xfs /dev/sdbf1
#mkfs.xfs /dev/sdbg1 && mkfs.xfs /dev/sdbh1
#mkfs.xfs /dev/sdbi1 && mkfs.xfs /dev/sdbj1
#mkfs.xfs /dev/sdbk1 && mkfs.xfs /dev/sdbl1
#mkfs.xfs /dev/sdbm1 && mkfs.xfs /dev/sdbn1
#mkfs.xfs /dev/sdbo1 && mkfs.xfs /dev/sdbp1
#mkfs.xfs /dev/sdbq1 && mkfs.xfs /dev/sdbr1
#mkfs.xfs /dev/sdbs1 && mkfs.xfs /dev/sdbt1
#mkfs.xfs /dev/sdbu1 && mkfs.xfs /dev/sdbv1
#mkfs.xfs /dev/sdbw1 && mkfs.xfs /dev/sdbx1
#mkfs.xfs /dev/sdby1 && mkfs.xfs /dev/sdbz1

# Manually make filesystem ext4 for Debian based systems.

# Drives sda-sdz
#mkfs.ext4 /dev/sda1 && mkfs.ext4 /dev/sdb1
#mkfs.ext4 /dev/sdc1 && mkfs.ext4 /dev/sdd1
#mkfs.ext4 /dev/sde1 && mkfs.ext4 /dev/sdf1
#mkfs.ext4 /dev/sdg1 && mkfs.ext4 /dev/sdh1
#mkfs.ext4 /dev/sdi1 && mkfs.ext4 /dev/sdj1
#mkfs.ext4 /dev/sdk1 && mkfs.ext4 /dev/sdl1
#mkfs.ext4 /dev/sdm1 && mkfs.ext4 /dev/sdn1
#mkfs.ext4 /dev/sdo1 && mkfs.ext4 /dev/sdp1
#mkfs.ext4 /dev/sdq1 && mkfs.ext4 /dev/sdr1
#mkfs.ext4 /dev/sds1 && mkfs.ext4 /dev/sdt1
#mkfs.ext4 /dev/sdu1 && mkfs.ext4 /dev/sdv1
#mkfs.ext4 /dev/sdw1 && mkfs.ext4 /dev/sdx1
#mkfs.ext4 /dev/sdy1 && mkfs.ext4 /dev/sdz1

# Drives sdaa-sdaz
#mkfs.ext4 /dev/sdaa1 && mkfs.ext4 /dev/sdab1
#mkfs.ext4 /dev/sdac1 && mkfs.ext4 /dev/sdad1
#mkfs.ext4 /dev/sdae1 && mkfs.ext4 /dev/sdaf1
#mkfs.ext4 /dev/sdag1 && mkfs.ext4 /dev/sdah1
#mkfs.ext4 /dev/sdai1 && mkfs.ext4 /dev/sdaj1
#mkfs.ext4 /dev/sdak1 && mkfs.ext4 /dev/sdal1
#mkfs.ext4 /dev/sdam1 && mkfs.ext4 /dev/sdan1
#mkfs.ext4 /dev/sdao1 && mkfs.ext4 /dev/sdap1
#mkfs.ext4 /dev/sdaq1 && mkfs.ext4 /dev/sdar1
#mkfs.ext4 /dev/sdas1 && mkfs.ext4 /dev/sdat1
#mkfs.ext4 /dev/sdau1 && mkfs.ext4 /dev/sdav1
#mkfs.ext4 /dev/sdaw1 && mkfs.ext4 /dev/sdax1
#mkfs.ext4 /dev/sday1 && mkfs.ext4 /dev/sdaz1

# Drives sdba-sdbz
#mkfs.ext4 /dev/sdba1 && mkfs.ext4 /dev/sdbb1
#mkfs.ext4 /dev/sdbc1 && mkfs.ext4 /dev/sdbd1
#mkfs.ext4 /dev/sdbe1 && mkfs.ext4 /dev/sdbf1
#mkfs.ext4 /dev/sdbg1 && mkfs.ext4 /dev/sdbh1
#mkfs.ext4 /dev/sdbi1 && mkfs.ext4 /dev/sdbj1
#mkfs.ext4 /dev/sdbk1 && mkfs.ext4 /dev/sdbl1
#mkfs.ext4 /dev/sdbm1 && mkfs.ext4 /dev/sdbn1
#mkfs.ext4 /dev/sdbo1 && mkfs.ext4 /dev/sdbp1
#mkfs.ext4 /dev/sdbq1 && mkfs.ext4 /dev/sdbr1
#mkfs.ext4 /dev/sdbs1 && mkfs.ext4 /dev/sdbt1
#mkfs.ext4 /dev/sdbu1 && mkfs.ext4 /dev/sdbv1
#mkfs.ext4 /dev/sdbw1 && mkfs.ext4 /dev/sdbx1
#mkfs.ext4 /dev/sdby1 && mkfs.ext4 /dev/sdbz1

# Generate fstab for drives with xfs filesystems
#ls -lA /dev/disk/by-uuid/ | sort -k 10 | grep -v -e md -e nvme -e total | awk '{ print "UUID=" $9 " /mnt/data" NR-1 "              xfs     defaults        0 2"}' >> /etc/fstab

# Generate fstab for drives with ext4 filesystems
#ls -lA /dev/disk/by-uuid/ | sort -k 10 | grep -v -e md -e nvme -e total | awk '{ print "UUID=" $9 " /mnt/data" NR-1 "              ext4    defaults        0 2"}' >> /etc/fstab

# Explanation of the command that starts with ls
#
# list directory contents
# -l     use a long listing format
# -A, --almost-all
#        do not list implied . and ..
#
# /dev/disk/by-uuid/ contains the UUID strings for all formatted drives
#
# sort - sort lines of text files
# -k, --key=POS1[,POS2]
#        start a key at POS1 (origin 1), end it at POS2 (default end of line).
#        See POS syntax below
#
# grep - print lines matching a pattern
# -v, --invert-match
#        Invert the sense of matching, to select non-matching lines.  (-v is
#        specified by POSIX.)
# 	Matching Control
#	    -e PATTERN, --regexp=PATTERN
# 	           Use PATTERN as the pattern.  This can be used to specify
#                  multiple search patterns, or to protect a pattern beginning
#                  with a hyphen (-).  (-e is specified by POSIX.)
#
# awk - pattern scanning and processing language
# 	print string "UUID="
#	print 9th field.  Fields are separated by spaces by default.
#	print " /mnt/data"
#	print line number minus 1
#	print "              xfs     defaults        0 2"
#
# Append result to /etc/fstab

# Note: Sets of drives greater than 26 will not be in order.
# sda1
# sdaa1
# ...
# sdaz1
# sdb1
# sdba1
# ...
# sdbh1
# sdc1
# sdd1


# Notes on automating dos partition table partitioning

# Another way to script fdisk is to use a format like this without comments:
#fdisk /dev/sdc <<EOF
#n
#
#
#
#
#w
#EOF

# Another easy to document method for using fdisk
# Example by user2070305 at https://superuser.com/questions/332252
#sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDEV}
#  o # clear the in memory partition table
#  n # new partition
#  p # primary partition
#  1 # partition number 1
#    # default - start at beginning of disk 
#  +100M # 100 MB boot parttion
#  n # new partition
#  p # primary partition
#  2 # partion number 2
#    # default, start immediately after preceding partition
#    # default, extend partition to end of disk
#  a # make a partition bootable
#  1 # bootable partition is partition 1 -- /dev/sda1
#  p # print the in-memory partition table
#  w # write the partition table
#  q # and we're done
#EOF

#sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDEV}
#  o # clear the in memory partition table
#  n # new partition
#   # primary partition
#   # partition number 1
#   # default - start at beginning of disk 
#   # Use the full space of the drive
#  p # print the in-memory partition table
#  w # write the partition table
#  q # and we're done
#EOF

# TODO
# - Generate a log file.
# - Generate a warning that must be agreed to.
# - Generate a list of drives.
# - Consider replace fdisk with sfdisk?
# - Create a function for creating a filesytem.
# - Determine filesytem by identifying operating system or looking for other fs.
# - Ignore previously partitioned drives when generating fstab.
