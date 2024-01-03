#! /bin/bash
# Set the hostname
hostnamectl set-hostname docker_instance
dnf update -y
dnf install pip -y
dnf install docker -y
dnf install git -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
curl -SL https://github.com/docker/compose/releases/download/v2.20.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
USER=${abdullahyalcin}
TOKEN=${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}
cd /home/ec2-user && git clone https://${TOKEN}@github.com/${USER}/bookstore.git
cd bookstore/
docker-compose up


