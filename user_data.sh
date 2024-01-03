#!/bin/bash

# Set the hostname
hostnamectl set-hostname docker_instance
dnf update -y
dnf install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
dnf install git -y
curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
USER="***********"
TOKEN="**********************"
git clone https://${TOKEN}@github.com/${USER}/bookstore.git
cd bookstore/
docker-compose up


