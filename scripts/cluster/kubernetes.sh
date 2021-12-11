#!/bin/bash

# Enable strict mode:
set -euo pipefail

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~ Install and configure Kubernetes                                                ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Adding the Kubernetes repo to yum..."
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

echo "Installing kubeadm, kubectl, and kubelet..."
yum install -y kubeadm kubectl kubelet --disableexcludes=kubernetes

echo "Enabling Kublet on reboot through systemctl..."
systemctl enable --now kubelet

echo "Stepping back to compatible kubeadm, kubectl, and kubelet versions..."
yum install kubeadm-1.21.* kubectl-1.21.* kubelet-1.21.* --disableexcludes=kubernetes