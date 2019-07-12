#!/usr/bin/env bash
#Backup origin repository
sudo cd /home/vagrant
sudo tar -zcvf CentOS.bk.tar.gz /etc/yum.repos.d/CentOS-*
#Prerequisite software installation
sudo yum install -y wget make cmake gcc gcc-c++ pcre-devel zlib-devel openssl openssl-devel createrepo yum-utils lvm2 vim
#Setup CentOS7 repository
sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
sudo wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
#Verify AliCloud repository
sudo yum repolist
#Sync AliCloud repository to local
##Create local folder which save rpm packages, the size of total rpm packages is about 36.5GB
#mkdir -p /mirror/centos7
##Sync to local folder
sudo reposync -p /mirror/centos7
##Sync updated rpm packages
sudo reposync -np /mirror/centos7
##Create index
sudo createrepo -po /mirror/centos7/base/ /mirror/centos7/base/
sudo createrepo -po /mirror/centos7/extras/ /mirror/centos7/extras/
sudo createrepo -po /mirror/centos7/updates/ /mirror/centos7/updates/
sudo createrepo -po /mirror/centos7/epel/ /mirror/centos7/epel/
##Update data source
sudo createrepo --update /mirror/centos7/base
sudo createrepo --update /mirror/centos7/extras
sudo createrepo --update /mirror/centos7/updates
sudo createrepo --update /mirror/centos7/epel
