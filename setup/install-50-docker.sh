#!/usr/bin/env bash

echo "Installing Docker..."
echo "Docs: https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository"
echo
echo "1 - Install packages to allow apt to use a repository over HTTPS"

sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
echo
echo "2 - Add Docker repo key"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo
echo "3 - Add Docker Repo"

sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

echo
echo "4 - Install Docker"

sudo apt update
sudo apt install docker-ce

echo
echo "5 - Add user to docker group and reload group setting"

sudo usermod -a -G docker $USER
newgrp docker

echo
echo "6 - Run Docker test container"

sudo docker run hello-world

echo
echo "Docker install finished."

