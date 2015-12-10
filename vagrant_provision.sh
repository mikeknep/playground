#!/usr/bin/env bash

install_ruby() {
  if [ ! -d "$HOME/.rbenv" ]; then
    echo Installing ruby

    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH=$HOME/.rbenv/bin:$PATH' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"

    rbenv install 2.2.2
    rbenv global 2.2.2
    rbenv rehash
    gem install bundler --no-ri --no-rdoc
  fi
}

install_ruby
