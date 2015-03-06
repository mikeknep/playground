#!/usr/bin/env bash

apt-get update
apt-get install -y git

git clone https://github.com/mikeknep/dotfiles.git
VM_HOME="/home/vagrant" ./dotfiles/bin/vm.sh
