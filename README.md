# VirtualBox & Kubernetes

Tools to create K8s with VirtualBox via HashiCorp Vagrant.

## Vagrant

* [Download vagrant](https://www.vagrantup.com/downloads) and follow the installer's instructions.
* Install the Virtualbox Guest Additions via the following command:

  ```shell
  vagrant plugin install vagrant-vbguest
  ```
  
  **Note:** you will receive the mount errors described in [Vagrant No VirtualBox Guest Additions installation found](https://www.devopsroles.com/vagrant-no-virtualbox-guest-additions-installation-found-fixed/).

## References

* [Playing with kubeadm in Vagrant Machines](https://medium.com/@joatmon08/playing-with-kubeadm-in-vagrant-machines-36598b5e8408)
* [GitHub: scriptcamp/vagrant-kubeadm-kubernetes](https://github.com/scriptcamp/vagrant-kubeadm-kubernetes)
* [GitHub: marthanda93/kubernetes-cluster](https://github.com/marthanda93/kubernetes-cluster/blob/main/kubeadm/centos/script/bootstrap.sh)