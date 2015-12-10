# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "sandbox"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 4567, host: 4567

  config.vm.synced_folder "/Users/mikeknepper/sandbox", "/home/vagrant/sandbox"

  config.ssh.forward_agent = true

  config.vm.provision :shell, path: "root_provision.sh"
  config.vm.provision :shell, privileged: false, path: "vagrant_provision.sh"
end
