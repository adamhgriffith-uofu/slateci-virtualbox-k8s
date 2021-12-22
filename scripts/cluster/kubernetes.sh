#!/bin/bash

# Enable strict mode:
set -euo pipefail

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~ Install and configure Kubernetes                                                ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Adding the Kubernetes repo to yum..."
cd /etc/yum.repos.d
cp /vagrant/resources/yum.repos.d/kubernetes.repo kubernetes.repo
chown root:root kubernetes.repo

echo "Installing kubeadm, kubectl, and kubelet..."
yum install -y kubeadm-1.21.* kubectl-1.21.* kubelet-1.21.* --disableexcludes=kubernetes

echo "Enabling Kublet through systemctl..."
systemctl enable --now kubelet

