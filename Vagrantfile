# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "dev-vm"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 4567, host: 4567

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.ssh.forward_agent = true

  config.vm.provision :shell, path: "script.sh"
end
