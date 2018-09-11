#!/bin/bash

# nginxcentos7.sh
# Michael McMahon
# Compile latest mainline nginx as of this writing.

# Updated from https://www.vultr.com/docs/how-to-compile-nginx-from-source-on-centos-7

echo "Installing dependencies..."
yum install -y perl perl-devel perl-ExtUtils-Embed libxslt libxslt-devel libxml2 libxml2-devel gd gd-devel GeoIP GeoIP-devel

echo "Moving to builds directory..."
mkdir builds
cd builds/

echo "Downloading nginx source..."
wget https://nginx.org/download/nginx-1.15.3.tar.gz
echo "Extracting nginx source..."
tar zxvf nginx-1.15.3.tar.gz 

echo "Downloading pcre source..."
wget https://ftp.pcre.org/pub/pcre/pcre-8.42.tar.gz
echo "Extracting pcre source..."
tar zxvf pcre-8.42.tar.gz 

echo "Downloading zlib source..."
wget https://www.zlib.net/zlib-1.2.11.tar.gz
echo "Extracting zlib source..."
tar zxvf zlib-1.2.11.tar.gz 

echo "Downloading openssl source..."
wget https://www.openssl.org/source/openssl-1.1.1.tar.gz
echo "Extracting openssl source..."
tar zxvf openssl-1.1.1.tar.gz 

echo "Removing source tarballs..."
rm -f nginx-1.15.3.tar.gz
rm -f pcre-8.42.tar.gz
rm -f zlib-1.2.11.tar.gz
rm -f openssl-1.1.1.tar.gz

echo "Installing nginx manpage..."
cp nginx-1.15.3/man/nginx.8 /usr/share/man/man8
gzip /usr/share/man/man8/nginx.8

echo "Moving to nginx directory..."
cd nginx-1.15.3

echo "Configuring nginx build..."
./configure --prefix=/etc/nginx \
            --sbin-path=/usr/sbin/nginx \
            --modules-path=/usr/lib64/nginx/modules \
            --conf-path=/etc/nginx/nginx.conf \
            --error-log-path=/var/log/nginx/error.log \
            --pid-path=/var/run/nginx.pid \
            --lock-path=/var/run/nginx.lock \
            --user=nginx \
            --group=nginx \
            --build=CentOS \
            --builddir=nginx-1.15.3 \
            --with-select_module \
            --with-poll_module \
            --with-threads \
            --with-file-aio \
            --with-http_ssl_module \
            --with-http_v2_module \
            --with-http_realip_module \
            --with-http_addition_module \
            --with-http_xslt_module=dynamic \
            --with-http_image_filter_module=dynamic \
            --with-http_geoip_module=dynamic \
            --with-http_sub_module \
            --with-http_dav_module \
            --with-http_flv_module \
            --with-http_mp4_module \
            --with-http_gunzip_module \
            --with-http_gzip_static_module \
            --with-http_auth_request_module \
            --with-http_random_index_module \
            --with-http_secure_link_module \
            --with-http_degradation_module \
            --with-http_slice_module \
            --with-http_stub_status_module \
            --http-log-path=/var/log/nginx/access.log \
            --http-client-body-temp-path=/var/cache/nginx/client_temp \
            --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
            --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
            --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
            --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
            --with-mail=dynamic \
            --with-mail_ssl_module \
            --with-stream=dynamic \
            --with-stream_ssl_module \
            --with-stream_realip_module \
            --with-stream_geoip_module=dynamic \
            --with-stream_ssl_preread_module \
            --with-compat \
            --with-pcre=../pcre-8.42 \
            --with-pcre-jit \
            --with-zlib=../zlib-1.2.11 \
            --with-openssl=../openssl-1.1.1 \
            --with-openssl-opt=no-nextprotoneg \
            --with-debug

echo "Compiling nginx..."
make

echo "Installing nginx..."
make install

echo "Symlinking modules..."
ln -s /usr/lib64/nginx/modules /etc/nginx/modules

echo "Symlinking index.html to index.htm..."
ln -s /etc/nginx/html/index.html /etc/nginx/html/index.htm

echo "Printing the version and compilation options for nginx..."
nginx -V

echo "Creating a new user for nginx..."
useradd --system --home /var/cache/nginx --shell /sbin/nologin --comment "nginx user" --user-group nginx

echo "Running nginx..."
mkdir -p /var/cache/nginx
nginx -t

cd ..

echo "Creating nginx systemd unit file..."
cat << EOF > /usr/lib/systemd/system/nginx.service
[Unit]
Description=nginx - high performance web server
Documentation=https://nginx.org/en/docs/
After=network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t -c /etc/nginx/nginx.conf
ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s TERM $MAINPID

[Install]
WantedBy=multi-user.target
EOF

echo "Starting and enabling nginx service..."
systemctl start nginx.service
systemctl enable nginx.service

echo "Displaying nginx status..."
echo "nginx.service is $(systemctl is-enabled nginx.service)!"
systemctl status nginx.service
curl -I 127.0.0.1

echo "Removing archaic nginx files..."
rm -f /etc/nginx/koi-utf /etc/nginx/koi-win /etc/nginx/win-utf

echo "Adding nginx syntax highlighting to vim..."
mkdir ~/.vim/
cp -r nginx-1.15.3/contrib/vim/* ~/.vim/

echo "Removing all default nginx backups..."
rm -f /etc/nginx/*.default

echo "Enabling port 80 through firewalld..."
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload
