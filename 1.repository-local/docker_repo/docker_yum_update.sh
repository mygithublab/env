#!/bin/bash

echo 'Updating Docker Repository Source'
DATETIME=`date +%Y-%m-%d_%H-%M-%S`
exec > /var/log/Docker_Repo_$DATETIME.log
   reposync -np /mirror/centos7 -r docker-ce-nightly -r docker-ce-stable 
if [ $? -eq 0 ]; then
   createrepo --update /mirror/centos7/docker-ce-nightly
   createrepo --update /mirror/centos7/docker-ce-stable
  echo "SUCCESS: $DATETIME Docker Repository Update successful"
 else
  echo "ERROR: $DATETIME Docker Repository Update failed"
fi
