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

  config.vm.define "c1" do |c1|
    c1.vm.box = "centos/7"
    c1.vm.hostname = "centos01"
    c1.vm.network "public_network"

    c1.vm.provider "virtualbox" do |vb|
      # Customize the number of CPUs on the VM:
      vb.cpus = 2

      # Display the VirtualBox GUI when booting the machine:
      vb.gui = false

      # Customize the amount of memory on the VM:
      vb.memory = 4096

      # Customize the name that appears in the VirtualBox GUI
      vb.name = "centos01"
    end

  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Avoid updating the guest additions if the user has the plugin installed:
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell" do |script|
    script.env = { }
    script.path = "./scripts/slate-cli/install.sh"
  end
  config.vm.provision "shell" do |script|
    script.env = { SLATE_ENV:ENV['SLATE_ENV'] }
    script.path = "./scripts/slate-cli/access.sh"
  end
  config.vm.provision "shell" do |script|
    script.env = {  }
    script.path = "./scripts/cluster/os-requirements.sh"
  end
  config.vm.provision "shell" do |script|
    script.env = {  }
    script.path = "./scripts/cluster/docker.sh"
  end
  config.vm.provision "shell" do |script|
    script.env = {  }
    script.path = "./scripts/cluster/kubernetes.sh"
  end
  config.vm.provision "shell" do |script|
    script.env = {  }
    script.path = "./scripts/cluster/master.sh"
  end

  # Display a note when running the machine.
  config.vm.post_up_message = "Remember to switch to root (sudo su -)!"








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
