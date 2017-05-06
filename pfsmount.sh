# pfsmount.sh
# Michael McMahon
# Partion, Filesystem, Mount
#
# INCOMPLETE
# This script aims to find unpartitioned disks, partition those disks, make filesystems for those discs, find UUID, and configure the result in /etc/fstab.


# Check for root.
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 
	exit 1
fi


# Find unpartitioned disks

# Create temporary file with all unpartitioned drives that are not flash or SSD drives.
# cat /proc/partitions | grep -v -e ram -e sr -e dm -e blocks -e '^$' | awk '{ sub(/[0-9]/,"",$4); print $4}'
# This command lists all drive and removes numbers.
# Remove entries with duplicates.
# Remainder should be unpartitioned drives.
# Create second list with SSD & Flash drives
# Remove matches found on both lists.
# Remainder should be unpartitioned drives safe for fio or dd tests.


# Partition disks
fdisk /dev/sdc && fdisk /dev/sdd && fdisk /dev/sde && fdisk /dev/sdf
# If disk is over 2TB, use:
# parted -s -a optimal /dev/sdh mklabel gpt mkpart primary xfs 2048s 100%


# Make filesystems
# In the future, base filesystem choice from other filesystems in use.
mkfs.xfs /dev/sdc1 && mkfs.xfs /dev/sdd1 && mkfs.xfs /dev/sde1 && mkfs.xfs /dev/sdf1
#mkfs.ext4 /dev/sdc1 && mkfs.ext4 /dev/sdd1 && mkfs.ext4 /dev/sde1 && mkfs.ext4 /dev/sdf1


# Find UUID and configure /etc/fstab
ls -lA /dev/disk/by-uuid/ | sort -k 10 | grep -v -e sdb -e total | awk '{ print "UUID=" $9 " /mnt/data" NR-1 "              xfs     defaults        0 2"}' >> /etc/fstab

# list directory contents
# -l     use a long listing format
# -A, --almost-all
#        do not list implied . and ..
#
# /dev/disk/by-uuid/ contains the UUID strings for all formatted drives
#
# sort - sort lines of text files
# -k, --key=POS1[,POS2]
#        start a key at POS1 (origin 1), end it at POS2 (default end of line).  See POS syntax below
#
# grep - print lines matching a pattern
# -v, --invert-match
#        Invert the sense of matching, to select non-matching lines.  (-v is specified by POSIX.)
# 	Matching Control
#	    -e PATTERN, --regexp=PATTERN
# 	           Use PATTERN as the pattern.  This can be used to specify multiple search patterns, or to protect a
# 	           pattern beginning with a hyphen (-).  (-e is specified by POSIX.)
#
# awk - pattern scanning and processing language
# 	print string "UUID="
#	print 9th field.  Fields are separated by spaces by default.
#	print " /mnt/data"
#	print line number minus 1
#	print "              xfs     defaults        0 2"
#
# Append result to /etc/fstab
