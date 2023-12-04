#!/bin/bash

# Add new user
useradd -m -s /bin/bash web-admin

# Change the password for the web-admin user
echo "web-admin:Password123!!" | chpasswd

# Update the OS
apt update && apt upgrade -y

# Install Apache2
apt install apache2 -y
systemctl enable apache2 && systemctl start apache2

rm -rf /etc/apache2/sites-available/000-default.conf