#!/bin/bash
####################################
#
# Create AWS EC2 (node, express, nginX)
#
####################################

# Create AWS EC2
echo 'Setting up Ubuntu EC2 instance'
docker-machine create --driver amazonec2 --amazonec2-security-group ssh-http --amazonec2-security-group docker-machine --amazonec2-region us-west-2 --amazonec2-ssh-keypath ~/.ssh/dockercloud --engine-install-url=https://releases.rancher.com/install-docker/1.13.sh --engine-install-url=https://releases.rancher.com/install-docker/17.05.sh aws-01
echo

# Copy scripts to remote
echo 'Copying scripts to remote instance'
docker-machine scp -r /Users/thomas.jones/Docker/vubuntu_server.sh aws-01:/home/ubuntu/
docker-machine scp -r /Users/thomas.jones/Docker/vnode_express.sh aws-01:/home/ubuntu/
docker-machine scp -r /Users/thomas.jones/Docker/nginx.sh aws-01:/home/ubuntu/
docker-machine scp -r /Users/thomas.jones/Docker/ne_launch.sh aws-01:/home/ubuntu/
echo

# Connect to remote instance
echo 'Connecting to remote'
docker-machine ssh aws-01 'sudo ./vubuntu_server.sh ; sudo ./vnode_express.sh ; sudo ./nginx.sh ; sudo ./ne_launch.sh'

echo
echo 'Scripts installed successfully'
