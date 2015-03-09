ruby_build_dir = Helper.home(".ruby-build")

git ruby_build_dir do
  repository "https://github.com/sstephenson/ruby-build.git"
  action :checkout
  reference "master"
  user "vagrant"
end

bash "ruby-build install" do
  code "#{ruby_build_dir}/install.sh"
end
