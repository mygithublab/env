#!/usr/bin/env bash


#install createrepo
yum install -y createrepo

yum install -y httpd
echo "Hello, World!" >> /var/www/html/index.html

#mkdir -p /var/www/html/centos/extra
#mkdir -p /var/www/html/centos/updates
#mkdir -p /var/www/html/centos/x86_64

#createrepo -pdo /var/www/html/extra /var/www/html/extra
#createrepo -pdo /var/www/html/updates /var/www/html/updates
#createrepo -pdo /var/www/html/x86_64 /var/www/html/x86_64

systemctl enable httpd
systemctl start httpd
systemctl restart httpd

