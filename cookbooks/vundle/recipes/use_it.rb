plugins_file = Helper.home("dotfiles/vim/bundles.vim")

bash "install vundle plugins" do
  user "vagrant"
  code "sudo vim -u #{plugins_file} +PluginInstall +qall"
end
