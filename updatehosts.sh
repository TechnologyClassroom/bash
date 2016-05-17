# updatehosts.sh
# Michael McMahon
# This script downloads HOSTS files from github.com/BlueHillBGCB/HOSTS on GNU/Linux, Mac, router & Unix systems.

# Download HOSTS files from github.com/BlueHillBGCB/HOSTS
curl -o /etc/HOSTSFunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFunix.txt
curl -o /etc/HOSTSMTWRunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRunix.txt

# Copy MTWR file to the Hosts file.
cp /etc/HOSTSMTWRunix.txt /etc/hosts
