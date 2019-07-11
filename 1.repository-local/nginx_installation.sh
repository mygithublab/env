#!/bin/bash

groupadd nginx
useradd -r -g nginx -s /bin/false -M nginx

yum install -y nginx

cp -f /vagrant/nginx.conf /etc/nginx

systemctl enable nginx
systemctl start nginx

