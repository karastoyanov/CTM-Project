#!/bin/bash

# Update the OS
apt update && apt upgrade -y

# Install Nginx
apt install nginx -y
systemctl enable nginx && systemctl start nginx

# cp nginx.conf /etc/nginx/sites-available/