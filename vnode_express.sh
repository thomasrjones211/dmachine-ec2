#!/bin/bash
####################################
#
# Configure vanilla Node / Express script.
#
####################################

# Make directory for the server.
mkdir ne_server
cd ne_server

# npm init / create package.json.
npm init -y

# Install express and add to pakage.json.
npm install express --save-dev

# Create index.js to run node project.
echo "const express = require('express')
  const app = express()
  app.use(express.static('public'))
  app.listen(3000, () => console.log('Server running on port 3000'))" > /home/ubuntu/ne_server/index.js

# Create public folder for servering HMTL
mkdir /home/ubuntu/ne_server/public/

# Create index.html.
echo '<!DOCTYPE html>
<html>
  <head>
    <title>Voila</title>
  </head>
  <body>
    <img src="https://media.tenor.com/images/99ea8a97df366a4c6f26b5e99a9a7c45/tenor.gif" height="300" width="750">
  </body>
</html>' > /home/ubuntu/ne_server/public/index.html


# Confirm / instruct
#echo
#echo
# echo 'Use:  node index.js to start basic node_express server'
