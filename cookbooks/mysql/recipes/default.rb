packages = [ "mysql-server", "libmysqlclient-dev" ]

bash "install mysql with default passwords" do
  code "echo 'mysql-server mysql-server/root_password password root' | debconf-set-selections"
  code "echo 'mysql-server mysql-server/root_password_again password root' | debconf-set-selections"
  code "apt-get install -y #{packages.join(' ')}"
end

bash "reset mysql root user to no password" do
  code "mysqladmin -u root -proot password ''"
end
