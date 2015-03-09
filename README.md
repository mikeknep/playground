# VM

A virtual machine for development.
Currently very much a work in progress.

## Status

### Shell provisioner
**What it does**
- symlinks dotfiles
- installs vundle plugins
- installs rbenv and ruby-build
- installs mysql with password-less root login

**Steps to start working on a Rails app**
- `git clone <github repo>`
- `rbenv install <version of Ruby used by app>`
- `gem install bundler`
- `bundle install`
- `rake db:create db:migrate db:test:prepare`

### Chef provisioner
**What it does**
- symlinks dotfiles
- installs rbenv and ruby-build
- clones down vundle

**What isn't working yet**
- install vundle plugins
- install mysql

### Docker provisioner
**Coming soon!**
