#!/usr/bin/env bash

source ./host/installers.sh

install_git
install_dotfiles
install_vundle
install_ruby
install_mysql
grant_permissions
