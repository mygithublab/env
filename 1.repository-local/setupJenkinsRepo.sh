#!/usr/bin/env bash
#Setup Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
#Verify Jenkins repository
sudo yum repolist
#Sync jenkins repository to local
##Create local folder which save rpm packages, the size of total rpm packages is about 36.5GB
sudo mkdir -p /mirror/centos7
##Sync and updated rpm packages to local folder
sudo reposync -np /mirror/centos7 -r jenkins
##Create index
sudo createrepo -po /mirror/centos7/jenkins /mirror/centos7/jenkins
##Update data source
sudo createrepo --update /mirror/centos7/jenkins

