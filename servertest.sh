# servertest.sh
# Michael McMahon
# servertest.sh loads new content to an nginx server.
# Usage:
# sudo sh servertest.sh folderthatcontainsawebsite

# Backup current from /usr/share/nginx/html/index.html
# or /var/www/html/index.nginx-debian.html
# server directs to root from /etc/nginx/sites-available/default
# sudo tar cvf /var/www/htmlbak$(date +%Y%m%d-%H%M).tar -C /var/www/html .

# Copy $1 folder contents
sudo cp -r ./$1/* /var/www/html/

# Restart nginx
sudo /etc/init.d/nginx restart
