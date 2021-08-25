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

  # Ubuntu Virtual Machine
  config.vm.define "Ubuntu-vm" do |vm3|
    vm3.vm.hostname = "ubuntu"
    vm3.vm.box = "bento/ubuntu-18.04"
    vm3.vm.network "private_network", ip: "192.168.42.10"
	vm3.vm.boot_timeout = 500

    vm3.vm.provider "virtualbox" do |vb|
      vb.name = "Ubuntu"
      vb.gui = false
      vb.cpus = "1"
      vb.memory = "1024"
    end

    vm3.vm.provision "shell", inline: <<-SHELL
      apt-get update -y
	  apt-get install -y man man-db git
    SHELL
  end

  # CentOS Virtual Machine
  config.vm.define "Centos-vm" do |vm1|
    vm1.vm.hostname = "CentOs"
    vm1.vm.box = "bento/centos-7.2"
    vm1.vm.network "private_network", ip: "192.168.33.11"

    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "CentOS"
      vb.gui = false
      vb.cpus = "1"
      vb.memory = "1024"
    end

    vm1.vm.provision "shell", inline: <<-SHELL
      yum update -y
	  yum install -y man man-pages man-db git bind-utils vim
    SHELL
  end

  # OpenSuse Virtual Machine
  config.vm.define "Opensuse-vm" do |vm2|
    vm2.vm.hostname = "opensuse"
    vm2.vm.box = "bento/opensuse-leap-15.1"
    vm2.vm.network "private_network", ip: "192.168.33.12"

    vm2.vm.provider "virtualbox" do |vb|
      vb.name = "OpenSuse"
      vb.gui = false
      vb.cpus = "1"
      vb.memory = "1024"
    end

    vm2.vm.provision "shell", inline: <<-SHELL
      zypper update -y
      zypper install -y man man-pages man-db git
    SHELL
  end

  # Fedora Virtual Machine
  config.vm.define "Fedora-vm" do |vm4|
    vm4.vm.hostname = "fedora-vm"
	vm4.vm.box = "bento/fedora-31"
    vm4.vm.network "private_network", ip: "192.168.33.13"

    vm4.vm.provider "virtualbox" do |vb|
      vb.name = "Fedora"
      vb.gui = false
      vb.cpus = "1"
      vb.memory = "1024"
    end

    vm4.vm.provision "shell", inline: <<-SHELL
      dnf update -y
      dnf install -y man man-pages man-db git
    SHELL
  end
end
    # Others conf
    # vmX.vm.synced_folder "shared", "/vagrant_data", :nfs => { :mount_options => ["dmode=777", "fmode=666"] }
    # vmX.vm.provision "shell", path: ".sh"
  	# vmX.vm.provision "shell", run: "always", inline: <<-SHELL
  	  # echo "Welome !"
    # SHELL
