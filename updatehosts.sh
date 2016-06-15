# updatehosts.sh
# Michael McMahon
# This script downloads HOSTS files from github.com/BlueHillBGCB/HOSTS on GNU/Linux, Mac, router & Unix systems.

# Download HOSTS files from github.com/BlueHillBGCB/HOSTS
curl -o /etc/HOSTSFunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFunix.txt
curl -o /etc/HOSTSMTWRunix.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRunix.txt
curl -o /etc/HOSTSFunixLS.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSFunixLS.txt
curl -o /etc/HOSTSMTWRunixLS.txt https://raw.githubusercontent.com/BlueHillBGCB/HOSTS/master/HOSTSMTWRunixLS.txt

# Copy MTWR file to the hosts file unless today is Friday.  If it is Friday, copy the F file to hosts.
if [ $(date '+%u') == "5" ];then
   cp /etc/HOSTSFunix.txt /etc/hosts
else
   cp /etc/HOSTSMTWRunix.txt /etc/hosts
fi
