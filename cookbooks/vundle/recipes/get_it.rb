vundle_dir = Helper.home(".vim/bundle/Vundle.vim")

bash "make vundle dir" do
  code "mkdir -p #{vundle_dir}"
end

git vundle_dir do
  repository "https://github.com/gmarik/Vundle.vim.git"
  action :sync
  reference "master"
end
