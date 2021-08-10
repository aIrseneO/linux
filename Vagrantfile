# -*- mode: ruby -*-
# vi: set ft=ruby :

################################################################################
#     Copyright (c) 2021 Arsene Temfack                                        #
#                                                                              #
#     SPDX-License-Identifier: MIT                                             #
################################################################################

Vagrant.configure("2") do |config|
  # For a complete reference, the online documentation is at
  # https://docs.vagrantup.com.
  # Every Vagrant development environment requires a box. They can be search at
  # https://vagrantcloud.com/search.
  
  # CentOS Virtual Machine
  config.vm.define "Centos-vm" do |vm1|
    vm1.vm.hostname = "CentOs-vm"
    vm1.vm.box = "bento/centos-7.2"
    vm1.vm.network "private_network", ip: "192.168.33.10"
    vm1.vm.synced_folder "shared", "/vagrant_data",type:"virtualbox"

    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "CentOS"
      vb.gui = false
      vb.cpus = "1"
      vb.memory = "1024"
    end

    vm1.vm.provision "shell", inline: <<-SHELL
      yum update
	  yum install -y man man-pages man-db git bind-utils vim
      /vagrant/shared/bash.sh /vagrant/shared/
    SHELL
  end

  # OpenSuse Virtual Machine
  config.vm.define "Opensuse-vm" do |vm2|
    vm2.vm.hostname = "OpenSuse-vm"
    vm2.vm.box = "bento/opensuse-leap-15.1"
    vm2.vm.network "private_network", ip: "192.168.33.11"
    vm2.vm.synced_folder "shared", "/vagrant_data",type:"virtualbox"

    vm2.vm.provider "virtualbox" do |vb|
      vb.name = "OpenSuse"
      vb.gui = false
      vb.cpus = "1"
      vb.memory = "1024"
    end

    vm2.vm.provision "shell", inline: <<-SHELL
      zypper update
      zypper install -y man man-pages man-db git
      /vagrant/shared/bash.sh /vagrant/shared/
    SHELL
  end

  # Ubuntu Virtual Machine
  config.vm.define "Ubuntu-vm" do |vm3|
    vm3.vm.hostname = "Ubuntu-vm"
    vm3.vm.box = "bento/ubuntu-18.04"
    vm3.vm.network "private_network", ip: "192.168.33.12"
    vm3.vm.synced_folder "shared", "/vagrant_data",type:"virtualbox"
	vm3.vm.boot_timeout = 500

    vm3.vm.provider "virtualbox" do |vb|
      vb.name = "Ubuntu"
      vb.gui = false
      vb.cpus = "2"
      vb.memory = "1024"
    end

    vm3.vm.provision "shell", inline: <<-SHELL
      apt update
	  apt install -y man man-pages man-db git
      /vagrant/shared/bash.sh /vagrant/shared/
    SHELL
  end

  # Fedora Virtual Machine
  config.vm.define "Fedora-vm" do |vm4|
    vm4.vm.hostname = "Fedora-vm"
	vm4.vm.box = "bento/fedora-31"
    vm4.vm.network "private_network", ip: "192.168.33.14"
    vm4.vm.synced_folder "shared", "/vagrant_data",type:"virtualbox"

    vm4.vm.provider "virtualbox" do |vb|
      vb.name = "Fedora"
      vb.gui = false
      vb.cpus = "1"
      vb.memory = "1024"
    end

    vm4.vm.provision "shell", inline: <<-SHELL
      dnf update
      dnf install -y man man-pages man-db git
      /vagrant/shared/bash.sh /vagrant/shared/
    SHELL
  end
end
    # Others conf
    # vmX.vm.synced_folder "shared", "/vagrant_data", :nfs => { :mount_options => ["dmode=777", "fmode=666"] }
    # vmX.vm.provision "shell", path: ".sh"
  	# vmX.vm.provision "shell", run: "always", inline: <<-SHELL
  	  # echo "Welome !"
    # SHELL
