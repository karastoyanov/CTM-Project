#!/bin/bash

# Wait for Rsync to be installed
sleep 30

# Update the OS
# apt update && apt upgrade -y

# Install Apache2
apt install apache2 -y

# Remove the default configuration for Apache2
rm -rf /etc/apache2/sites-available/000-default.conf

# Enable the TrollParts conf
a2ensite troll_parts.conf

# Enable and restart Apache2 daemon
systemctl enable apache2 && systemctl restart apache2