# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_BOX = 'centos/7'

Vagrant.configure("2") do |config|
  config.vm.box = VAGRANT_BOX
  config.vm.hostname = "jumpbox.local"
  config.vm.network "public_network", bridge: "Intel(R) Wi-Fi 6 AX201 160MHz", ip: "192.168.50.199", hostname: true
  config.vm.network "private_network", ip: "10.10.10.1"
  config.vm.provider "virtualbox" do |vm|
    vm.name = "jumpbox"
    vm.cpus = 2
    vm.memory = "2048"
    vm.linked_clone = true
    vm.check_guest_additions = false
  end
  config.vm.provision "shell", path: "install-this.sh"
end
