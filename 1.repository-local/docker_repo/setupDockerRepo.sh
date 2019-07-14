#!/usr/bin/env bash
#Setup Docker repository
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-nightly
#Verify docker repository
sudo yum repolist
#Sync docker repository to local
##Create local folder which save rpm packages
sudo mkdir -p /mirror/centos7
##Sync and updated rpm packages to local folder
sudo reposync -np /mirror/centos7 -r docker-ce-nightly -r docker-ce-stable
##Create index
sudo createrepo -po /mirror/centos7/docker-ce-nightly /mirror/centos7/docker-ce-nightly
sudo createrepo -po /mirror/centos7/docker-ce-stable /mirror/centos7/docker-ce-stable
##Update data source
sudo createrepo --update /mirror/centos7/docker-ce-nightly
sudo createrepo --update /mirror/centos7/docker-ce-stable
