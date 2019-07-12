#!/bin/bash

sudo sed -i '7 s/enforcing/disabled/' /etc/selinux/config

sudo setenforce Permissive
