dotfiles_dir = Helper.home("dotfiles")

git dotfiles_dir do
  repository "https://github.com/mikeknep/dotfiles.git"
  action :checkout
  reference "master"
  user "vagrant"
end

bash "symlink dotfiles" do
  code "VM_HOME=#{Helper.home} #{dotfiles_dir}/bin/vm.sh"
end
