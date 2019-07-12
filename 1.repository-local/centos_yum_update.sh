#!/bin/bash

echo 'Updating AliCloud CentOS7 Repository Source'
DATETIME=`date +%Y-%m-%d_%H-%M-%S`
exec > /var/log/AliCloud_CentOS7_Repo_$DATETIME.log
   reposync -np /mirror/centos7
if [ $? -eq 0 ]; then
   createrepo --update /mirror/centos7/base
   createrepo --update /mirror/centos7/extras
   createrepo --update /mirror/centos7/updates
   createrepo --update /mirror/centos7/epel
  echo "SUCCESS: $DATETIME AliCloud CentOS7 Repository Update successful"
 else
  echo "ERROR: $DATETIME AliCloud CentOS7 Repository Update failed"
fi
