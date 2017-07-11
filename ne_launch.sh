#!/bin/bash
####################################
#
# Launch ne_server
#
####################################

# Copy scripts to remote
echo 'Launching site'
cd ne_server/
node index.js
echo
echo 'Site now running on :80 though NginX :3000'
