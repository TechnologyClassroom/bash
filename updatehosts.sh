# updatehosts.sh
# Michael McMahon
# This script downloads HOSTS files from github.com/BlueHillBGCB/HOSTS on GNU/Linux, Mac, and Unix systems.
 
# MUST BE RUN WITH ADMINISTRATOR PRIVILEGES

# Copy a file and append the date.  Then, delete the history.
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 1/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 1/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 2/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 2/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 3/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 3/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 4/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 4/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 5/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 5/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 6/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 6/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 7/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 7/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 8/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 8/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 9/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 9/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 10/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 10/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 11/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 11/History
cp /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 12/History /etc/history$(date +%Y%m%d%H%M)  && rm /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 12/History

# Delete Chrome history and cache
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Cookies
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Cookies-journal
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Current Session
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Current Tabs
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/History-journal
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Login Data
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Login Data-journal
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Network Action Predictor
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Network Action Predictor-journal
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Network Presistent State
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Origin Bound Certs
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Origin Bound Certs-journal
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/QuotaManager
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/QuotaManager-journal
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Top Sites
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Top Sites-journal
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/TransportSecurity
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Visited Links
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Web Data
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Web Data-journal
rm -f /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/History Provider Cache

# Delete Chrome history and cache folders
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Local\ Storage
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Default/Cache
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 1
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 2
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 3
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 4
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 5
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 6
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 7
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 8
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 9
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 10
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 11
rm -rf /Users/bluehill/Library/Application\ Support/Google/Chrome/Profile\ 12

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

# echo test > /etc/debug.txt
