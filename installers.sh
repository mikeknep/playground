#!/usr/bin/env bash

install_git() {
  if ! type git > /dev/null 2>&1; then
    apt-get update
    apt-get install -y git
  fi
}

install_dotfiles() {
  if [ ! -d dotfiles ]; then
    git clone "https://github.com/mikeknep/dotfiles.git"
    VM_HOME=$PWD dotfiles/bin/vm.sh
  fi
}

install_vundle() {
  if [ ! -e .vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
    echo "Installing vundle plugins. (This could take a while...)"
    su vagrant -c "sudo vim -u ~/dotfiles/vim/bundles.vim +PluginInstall +qall -e -s"
  fi
}

install_ruby() {
  if ! type ruby > /dev/null 2>&1; then
    git clone https://github.com/sstephenson/rbenv.git .rbenv
    git clone https://github.com/sstephenson/ruby-build.git .ruby-build
    .ruby-build/install.sh
    apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev nodejs
  fi
}

install_mysql() {
  if ! type mysql > /dev/null 2>&1; then
    echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
    apt-get install -y mysql-server libmysqlclient-dev
    mysqladmin -u root -proot password ''
  fi
}

grant_permissions() {
  chown -R vagrant:vagrant .
}
