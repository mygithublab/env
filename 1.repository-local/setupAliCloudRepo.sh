#!/usr/bin/env bash

#Backup origin repository
cd ~
tar -zcvf CentOS.bk.tar.gz /etc/yum.repos.d/CentOS-*

#Prerequisite software installation
yum install -y wget make cmake gcc gcc-c++ pcre-devel zlib-devel openssl openssl-devel createrepo yum-utils lvm2

#Setup CentOS7 repository
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo

#Verify AliCloud repository
yum repolist

#Sync AliCloud repository to local
##Create local folder which save rpm packages, the size of total rpm packages is about 36.5GB
mkdir /mirror
##Sync to local folder
reposync -p /mirror
##Sync updated rpm packages
reposync -np /mirror
##Create index
createrepo -po /mirror/base/ /mirror/base/
createrepo -po /mirror/extras/ /mirror/extras/
createrepo -po /mirror/updates/ /mirror/updates/
createrepo -po /mirror/epel/ /mirror/epel/
##Update data source
createrepo --update /mirror/base
createrepo --update /mirror/extras
createrepo --update /mirror/updates
createrepo --update /mirror/epel
##Run crontab










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

