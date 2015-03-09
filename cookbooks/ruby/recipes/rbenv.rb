rbenv_dir = Helper.home(".rbenv")

git rbenv_dir do
  repository "https://github.com/sstephenson/rbenv.git"
  action :checkout
  reference "master"
  user "vagrant"
end

packages = [ "autoconf",
             "bison",
             "build-essential",
             "libssl-dev",
             "libyaml-dev",
             "libreadline6-dev",
             "zlib1g-dev",
             "libncurses5-dev",
             "libffi-dev",
             "libgdbm3",
             "libgdbm-dev",
             "nodejs" ]

bash "rbenv sanity" do
  # details: https://github.com/sstephenson/ruby-build/wiki#suggested-build-environment
  code "apt-get install -y #{packages.join(' ')}"
end
