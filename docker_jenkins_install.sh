#!/bin/bash

# Update the package list
sudo apt update

# Install packages to allow apt to use a repository over HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable Docker repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the package list again
sudo apt update

# Install the latest version of Docker CE (Community Edition)
sudo apt install -y docker-ce

# Add Jenkins and Ubuntu users to the Docker group
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
sudo usermod -aG jenkins ubuntu

# Restart Jenkins and Docker to apply group changes
sudo systemctl restart jenkins
sudo systemctl restart docker

# Enable Docker service to start on boot
sudo systemctl enable docker

# Start Docker service
sudo systemctl start docker

