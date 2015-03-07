#!/usr/bin/env bash

apt-get update
apt-get install -y git

git clone https://github.com/mikeknep/dotfiles.git
VM_HOME=$PWD dotfiles/bin/vm.sh&

git clone https://github.com/sstephenson/rbenv.git .rbenv
git clone https://github.com/sstephenson/ruby-build.git .ruby-build
.ruby-build/install.sh
apt-get install -y libssl-dev

echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
apt-get -y install mysql-server

chown -R vagrant:vagrant .
