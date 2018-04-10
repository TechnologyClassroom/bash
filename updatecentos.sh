# updatecentos.sh
# Michael McMahon
# Update CentOS 6, CentOS 7, Scientific Linux, 6 & Scientific Linux 7.

yum update -y
echo "Installing Compatibility Libraries and Development Tools..."
yum groupinstall -y Development\ Tools 2>/dev/null
yum groupinstall -y Compatibility\ Libraries 2>/dev/null
yum groups install -y Development\ Tools 2>/dev/null
yum groups install -y Compatibility\ Libraries 2>/dev/null
