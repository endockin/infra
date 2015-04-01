# -*- mode: ruby -*-
# vi: set ft=ruby :

# Author: langmatelaszlo@gmail.com
# Description
# ----------
# This Vagrantfile should bring up 3 instances of a clean ubuntu server
# with ansible installed

# Shell snippet used to install ansible on bare hosts
$initscript = <<SCRIPT
  echo "Starting Shell Provisioning"
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install -y ansible
  echo "Finished Shell Provisioning"
SCRIPT

# Vagrant Configuration
Vagrant.configure(2) do |config|

  # Virtual Machine Inventory & Host-Only IP Addresses
  servers = {
    :endockin1 => '192.168.199.101',
    :endockin2 => '192.168.199.102',
    :endockin3 => '192.168.199.103'
  }

  # Individual Server Configuration
  servers.each do |server_name, server_ip|
    config.vm.define server_name do |server_config|
      server_config.vm.box = "ubuntu/trusty64"
      server_config.vm.host_name = server_name.to_s
      server_config.vm.network "private_network", ip: server_ip
      server_config.vm.provision "shell", inline: $initscript
      server_config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = 1024
      end
    end
  end

end

