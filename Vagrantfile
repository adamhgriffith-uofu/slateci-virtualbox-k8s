# -*- mode: ruby -*-
# vi: set ft=ruby :

# Environmental Variables:
ENV['SLATE_ENV'] = "prod"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Avoid updating the guest additions if the user has the plugin installed:
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  # Display a note when running the machine.
  config.vm.post_up_message = "Remember to switch to root (sudo su -)!"

  # Share an additional folder to the guest VM.
  # config.vm.synced_folder "./work", "/vagrant_work"

  # Provision with shell scripts.
  config.vm.provision "shell", inline: <<-SHELL
    echo "192.168.100 master" >> /etc/hosts
    echo "192.168.101 worker1" >> /etc/hosts
    echo "192.168.102 worker2" >> /etc/hosts
  SHELL

  ##############################################################
  # Create the master node.                                    #
  ##############################################################
  config.vm.define "master" do |master|
    master.vm.box = "centos/7"
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.100.10", netmask: "255.255.255.0"

    master.vm.provider "virtualbox" do |vb|
      # Customize the number of CPUs on the VM:
      vb.cpus = 2

      # Display the VirtualBox GUI when booting the machine:
      vb.gui = false

      # Customize the amount of memory on the VM:
      vb.memory = 4096

      # Customize the name that appears in the VirtualBox GUI
      vb.name = "master"
    end

    # Provision with shell scripts.
    master.vm.provision "shell", path: "./scripts/slate-cli/install.sh"
    master.vm.provision "shell" do |script|
      script.env = { SLATE_ENV:ENV['SLATE_ENV'] }
      script.path = "./scripts/slate-cli/access.sh"
    end
    master.vm.provision "shell", path: "./scripts/cluster/os-requirements.sh"
    master.vm.provision "shell", path: "./scripts/cluster/docker.sh"
    master.vm.provision "shell", path: "./scripts/cluster/kubernetes.sh"
    master.vm.provision "shell", path: "./scripts/cluster/master.sh"

  end

  ##############################################################
  # Create the worker nodes.                                   #
  ##############################################################
  (1..2).each do |i|

    config.vm.define "worker#{i}" do |worker|

      worker.vm.box = "centos/7"
      worker.vm.hostname = "worker#{i}"
      worker.vm.network "private_network", ip: "192.168.100.1#{i}", netmask: "255.255.255.0"

      worker.vm.provider "virtualbox" do |vb|
        # Customize the number of CPUs on the VM:
        vb.cpus = 1

        # Display the VirtualBox GUI when booting the machine:
        vb.gui = false

        # Customize the amount of memory on the VM:
        vb.memory = 1024

        # Customize the name that appears in the VirtualBox GUI
        vb.name = "worker#{i}"
      end

      # Provision with shell scripts.
      worker.vm.provision "shell", path: "./scripts/cluster/os-requirements.sh"
      worker.vm.provision "shell", path: "./scripts/cluster/docker.sh"
      worker.vm.provision "shell", path: "./scripts/cluster/kubernetes.sh"

    end

  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
#   config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"










  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
#   config.vm.provider "virtualbox"
#
#   config.vm.provider "virtualbox" do |vb|
#     # Display the VirtualBox GUI when booting the machine
#     vb.gui = false
#
#     # Customize the amount of memory on the VM:
#     vb.memory = "4096"
#
#     # Customize the name that appears in the VirtualBox GUI
#     vb.name
#   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
