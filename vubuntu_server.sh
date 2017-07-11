#!/bin/bash
####################################
#
# Configure vanilla Ubuntu server script.
#
####################################

# Upgrade / updtate system.
sudo apt-get --yes update && sudo apt-get --yes upgrade

# Grab the setup script for node7 and plug it into this shell script.
curl https://deb.nodesource.com/setup_7.x -o nodesource_setup.sh

# Start a bash shell as root level user to run the script.
sudo bash nodesource_setup.sh

# Install node.js.
sudo apt-get install nodejs

# Install build essentials.
sudo apt-get --yes install build-essential
