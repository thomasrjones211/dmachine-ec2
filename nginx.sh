#!/bin/bash
####################################
#
# How bout nginx script.
#
####################################

# Install nginX
echo 'Installing nginx'
sudo apt-get --yes install nginx
echo

# Manual start to make sure nginx running
echo 'Starting nginx'
sudo /etc/init.d/nginx start
echo

# Remove default nginx config
echo 'Removing default config'
sudo rm /etc/nginx/sites-enabled/default
echo

# Create ne_server config
echo "server {
  listen 80;
  server_name ne_server;
  location / {
    proxy_set_header  X-Real-IP  \$remote_addr;
    proxy_set_header  Host       \$http_host;
    proxy_pass        http://127.0.0.1:3000;
  }
}" > /etc/nginx/sites-available/ne_server
echo 'nginx conifg created for ne_server'
echo

# Create ne_server config
echo 'Enabling ne_server config'
sudo ln -s /etc/nginx/sites-available/ne_server /etc/nginx/sites-enabled/ne_server
echo

# Restart nginx
echo 'Restarting nginx'
sudo service nginx restart
echo
