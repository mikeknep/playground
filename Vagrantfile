# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "dev-vm"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 4567, host: 4567

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.ssh.forward_agent = true

  # config.vm.provision :shell, path: "script.sh"
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "get_started"
    chef.add_recipe "dotfiles"
    chef.add_recipe "ruby::rbenv"
    chef.add_recipe "ruby::ruby_build"
    chef.add_recipe "vundle::get_it"

    # NOT WORKING!
    # chef.add_recipe "vundle::use_it"
    # chef.add_recipe "mysql"
  end
end
