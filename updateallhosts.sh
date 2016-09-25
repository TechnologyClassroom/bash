# updateallhosts.sh
# Michael McMahon
# This will take updates from HOSTSMTWRwin.txt and the top portion of HOSTSFwin.txt to create a new set of HOSTS files.

# Variables
gitname='Michael McMahon'
gitmail='INSERTUSERNAME@HERE'
gitpass='INSERTPASSWORDHERE'
gitrepo='github.com/BlueHillBGCB/HOSTS.git'
today=$(date +%Y%m%d)
localserver='172.16.20.84'

# Download latest HOSTS.git
git clone https://$gitrepo

# Change directory
cd HOSTS

# Fix date
echo Fixing the date...
sed -i -- "s/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/$today/g" HOSTSMTWRwin.txt
sed -i -- "s/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/$today/g" HOSTSFwin.txt
# Syntax from http://unix.stackexchange.com/questions/181283/replace-date-with-current-date

# Cut everthing from '# Normal Hosts' to the end of the file and save that as normalhosts.txt (has Windows end-of-line format)
echo Creating temporary files...
grep -n '# Normal Hosts' HOSTSMTWRwin.txt | cut -f1 -d":" | xargs -I{} tail -n +{} HOSTSMTWRwin.txt > normalhosts.txt
# Syntax from http://stackoverflow.com/questions/5968107/get-everything-in-a-file-after-a-grepd-string
# grep -n FOO FILE.TXT | cut -f1 -d":" | xargs -I{} tail -n +{} FILE.TXT > NEWFILE.TXT

# Replace everything at '# Normal Hosts' with normalhosts.txt for a file containing 'F'
grep -n '# Normal Hosts' HOSTSFwin.txt | cut -f1 -d":" | xargs expr -1 + | xargs -I{} head -n +{} HOSTSFwin.txt > Fhosts.txt

# Build HOSTSFwin.txt
echo Building HOSTSFwin.txt...
cat Fhosts.txt normalhosts.txt > HOSTSFwin.txt

# Duplicate the two base files to all iterations
echo Duplicating files...
cp HOSTSMTWRwin.txt HOSTSMTWRwinLS.txt
cp HOSTSFwin.txt HOSTSFwinLS.txt

# Replace 127.0.0.1 with the local server IP address for all files that end in LS
# You can replace the 2nd ip address with your own local server IP address
echo Fixing LS files...
sed -i -- 's/127.0.0.1/$localserver/g' *LS.txt
# syntax from http://unix.stackexchange.com/questions/112023/how-can-i-replace-a-string-in-a-files

# Fix line endings for everything that contains the string 'unix'
echo Fixing line endings...
tr -d '\15\32' < HOSTSMTWRwin.txt > HOSTSMTWRunix.txt
tr -d '\15\32' < HOSTSMTWRwinLS.txt > HOSTSMTWRunixLS.txt
tr -d '\15\32' < HOSTSFwin.txt > HOSTSFunix.txt
tr -d '\15\32' < HOSTSFwinLS.txt > HOSTSFunixLS.txt
# tr -d '\15\32' < windows.txt > unix.txt
# Synatax from http://stackoverflow.com/questions/16768776/convert-line-endings

# Clean up temporary files
echo Cleaning up...
rm normalhosts.txt
rm Fhosts.txt

# Add all files to github
# echo Adding files to github...

# Clean up folder
echo Cleaning up folder...
cd ..
rm -r HOSTS

echo DONE!
