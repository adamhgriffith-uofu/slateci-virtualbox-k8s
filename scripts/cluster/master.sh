#!/bin/bash

# Enable strict mode:
set -euo pipefail

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~ Configure SLATE Master Node                                                     ~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Initializing the Kubernetes cluster with Kubeadm.."
kubeadm init --pod-network-cidr=192.168.0.0/16

echo "Enabling kubectl access for root..."
mkdir -p "$HOME/.kube"
cp -i "/etc/kubernetes/admin.conf" "$HOME/.kube/config"
chown $(id -u):$(id -g) "$HOME/.kube/config"

echo "Creating Pod network via Calico..."
kubectl create -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl create -f https://docs.projectcalico.org/manifests/custom-resources.yaml
