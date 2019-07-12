#!/bin/bash

sudo groupadd nginx
sudo useradd -r -g nginx -s /bin/false -M nginx

sudo yum install -y nginx

sudo cp -f /vagrant/nginx.conf /etc/nginx

sudo systemctl enable nginx
sudo systemctl start nginx

