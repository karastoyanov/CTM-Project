#!/bin/bash

apt update && apt upgrade -y
apt install nginx -y
cp nginx.conf /etc/nginx/sites-available/