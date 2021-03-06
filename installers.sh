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
  if [ ! -d "/home/vagrant/swift" ]; then
    echo Installing swift
    curl -s https://swift.org/builds/swift-2.2-release/ubuntu1404/swift-2.2-RELEASE/swift-2.2-RELEASE-ubuntu14.04.tar.gz > swift-2.2.tar.gz
    mkdir swift
    tar -zxf swift-2.2.tar.gz -C swift/
    rm swift-2.2.tar.gz
    echo 'export PATH=/home/vagrant/swift/swift-2.2-RELEASE-ubuntu14.04/usr/bin/:$PATH' >> .bashrc
  fi
}

install_julia() {
  if ! type julia > /dev/null 2>&1; then
    add-apt-repository ppa:staticfloat/juliareleases
    add-apt-repository ppa:staticfloat/julia-deps
    apt-get update
    apt-get install julia
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

install_postgres() {
  if ! type psql > /dev/null 2>&1; then
    echo Installing postgres
    apt-get -qqy install postgresql libpq-dev
    mkdir -p /usr/local/pgsql/data
    chown postgres:postgres /usr/local/pgsql/data
    sudo -u postgres /usr/lib/postgresql/9.3/bin/initdb -D /usr/local/pgsql/data
    sudo -u postgres psql -c "CREATE USER vagrant WITH CREATEDB SUPERUSER;"
  fi
}

install_redis() {
  if [ ! -d "/home/vagrant/redis-stable" ]; then
    echo Installing redis
    wget http://download.redis.io/redis-stable.tar.gz
    tar xvzf redis-stable.tar.gz
    cd redis-stable
    make
    make install
    cd ..
    rm redis-stable.tar.gz
  fi
}

install_rabbitmq() {
  if ! type rabbitmq-server > /dev/null 2>&1; then
    echo Installing rabbitmq
    echo "deb http://www.rabbitmq.com/debian testing main" >> /etc/apt/sources.list
    apt-get -qq update
    apt-get -y --force-yes install rabbitmq-server
  fi
}
