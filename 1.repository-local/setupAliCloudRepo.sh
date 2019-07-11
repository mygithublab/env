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
mkdir -p /mirror/centos7
##Sync to local folder
reposync -p /mirror/centos7
##Sync updated rpm packages
reposync -np /mirror/centos7
##Create index
createrepo -po /mirror/centos7/base/ /mirror/centos7/base/
createrepo -po /mirror/centos7/extras/ /mirror/centos7/extras/
createrepo -po /mirror/centos7/updates/ /mirror/centos7/updates/
createrepo -po /mirror/centos7/epel/ /mirror/centos7/epel/
##Update data source
createrepo --update /mirror/centos7/base
createrepo --update /mirror/centos7/extras
createrepo --update /mirror/centos7/updates
createrepo --update /mirror/centos7/epel
