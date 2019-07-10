#!/bin/bash

sed -i '$a 5 * * * * /bin/bash /vagrant/crontab_centos_yum_update.sh' /etc/crontab

#sed -i '$a 00 13 * * 6 [ $(date +%d) -eq $(cal | awk 'NR==3{PRINT $NF}')] && /bin/bash /vagrant/crontab_centos_yum_update.sh' /etc/crontab
