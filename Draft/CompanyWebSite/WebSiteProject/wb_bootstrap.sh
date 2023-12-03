#!/bin/bash

apt update && apt upgrade -y
apt install apache2 -y
systemctl enable apache2

cp company-website/ /usr/local/apache2/htdocs/