#!/bin/bash

# Enable strict mode:
set -euo pipefail

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~ Install and configure Docker                                                    ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Adding the yum-config-manager tool..."
yum install yum-utils -y

echo "Adding the stable Docker repo to yum..."
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "Installing the latest version of DockerCE and containerd..."
yum install docker-ce docker-ce-cli containerd.io -y

echo "Enabling Docker on reboot through systemctl..."
systemctl enable --now docker