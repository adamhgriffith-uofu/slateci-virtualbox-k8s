# SLATE, VirtualBox, and Kubernetes

> **_IMPORTANT:_** This repository requires a read-through of [SLATE Cluster Installation](https://slateci.io/docs/cluster/) beforehand and if you have questions reach out to the team via SLACK, in an email, or during the working-sessions.

Tools to create K8s with VirtualBox via HashiCorp Vagrant and register with SLATE.

## Requirements

### Vagrant

* [Download vagrant](https://www.vagrantup.com/downloads) and follow the installer's instructions.
* Install the Virtualbox Guest Additions via the following command:

  ```shell
  vagrant plugin install vagrant-vbguest
  ```
  
  **Note:** you will receive the mount errors described in [Vagrant No VirtualBox Guest Additions installation found](https://www.devopsroles.com/vagrant-no-virtualbox-guest-additions-installation-found-fixed/).
* Enable autocompletion:

  ```shell
  vagrant autocomplete install --bash
  ```

### Tokens

> **_NOTE:_** All files added to `/<repo-location>/secrets/tokens` will be ignored by Git so don't worry :).

* During the build process Vagrant will copy relevant tokens into the `master` vm.
* Please copy all required keys below to `/<repo-location>/secrets/tokens` before building the images.

| Name        | Required | Description                                                                      |
|-------------|----------|----------------------------------------------------------------------------------|
| `slate-cli` | Yes      | SLATE CLI token acquired from the [SLATE Portal](https://portal.slateci.io/cli). |

## Build and Run

Bring up the three virtual machines `master`, `worker1`, and `worker2`:

```shell
vagrant up
```

### Initialize K8s Cluster

Initialization is done for you.

* The host directory `/<repo-location>/work` is mounted at `/vagrant_work` on each virtual machine.
* When `master` is created it will create `/<repo-location>/work/join.sh`.
* `/<repo-location>/work/join.sh` will be used by the workers to join the Kubernetes cluster automatically.

### SLATE Cluster Federation

SSH into the `master` node and run the commands described in [SLATE: Cluster Federation](https://slateci.io/docs/cluster/manual/cluster-federation.html).

## Teardown

Tearing down the virtual machines and clearing the old `/<repo-location>/work/join.sh` is done with a single command:

```shell
vagrant destroy -f
```

See [Vagrant: Destroy](https://www.vagrantup.com/docs/cli/destroy) for additional information.

## References

* [Playing with kubeadm in Vagrant Machines](https://medium.com/@joatmon08/playing-with-kubeadm-in-vagrant-machines-36598b5e8408)
* [GitHub: scriptcamp/vagrant-kubeadm-kubernetes](https://github.com/scriptcamp/vagrant-kubeadm-kubernetes)
* [GitHub: marthanda93/kubernetes-cluster](https://github.com/marthanda93/kubernetes-cluster/blob/main/kubeadm/centos/script/bootstrap.sh)
* [SLATE Manual Cluster Installation](https://slateci.io/docs/cluster)