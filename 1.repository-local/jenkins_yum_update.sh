#!/bin/bash

echo 'Updating Jenkins Repository Source'
DATETIME=`date +%Y-%m-%d_%H-%M-%S`
exec > /var/log/Jenkins_Repo_$DATETIME.log
   reposync -np /mirror/centos7 -r jenkins
if [ $? -eq 0 ]; then
   createrepo --update /mirror/centos7/jenkins
  echo "SUCCESS: $DATETIME Jenkins Repository Update successful"
 else
  echo "ERROR: $DATETIME Jenkins Repository Update failed"
fi
