#!/usr/bin/env bash

source ./host/installers.sh

update_apt_get
install_git
install_dotfiles
install_vundle
install_rbenv
install_mysql
grant_permissions
