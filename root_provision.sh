#!/usr/bin/env bash

update_apt_get() {
  echo Updating apt-get
  apt-get -qq update
}

install_essentials() {
  if ! type git > /dev/null 2>&1; then
    echo Installing git and other build tools
    apt-get -y install git autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev nodejs
  fi
}

install_swift() {
  if ! type swift > /dev/null 2>&1; then
    curl -s https://swift.org/builds/ubuntu1404/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04.tar.gz > swift-2.2.tar.gz
    mkdir swift
    tar -zxf swift-2.2.tar.gz -C swift/
    rm swift-2.2.tar.gz
    echo 'export PATH=/home/vagrant/swift/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu14.04/usr/bin/:$PATH' >> .bashrc
  fi
}

install_mysql() {
  if ! type mysql > /dev/null 2>&1; then
    echo Installing mysql
    echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
    apt-get -y install mysql-server libmysqlclient-dev
    mysqladmin -u root -proot password ''
  fi
}

update_apt_get
install_essentials
install_swift
install_mysql