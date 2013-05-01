require_recipe "apt"
require_recipe "apache2"

#Installation des basiques

package "vim" do
  action :install
end

package "php5" do
  action :install
end

package "php5-cli" do
  action :install
end

package "php5-dev" do
  action :install
end

package "php5-mysql" do
  action :install
end

package "mysql-server" do
  action :install
end

package "mysql-client-core-5.1" do
  action :install
end

package "phpunit" do    
  action :install

#Fin des installations

execute "disable-default-site" do
  command "sudo a2dissite default"
  notifies :reload, resources(:service => "apache2"), :delayed
end

web_app "project" do
  template "project.conf.erb"
  notifies :reload, resources(:service => "apache2"), :delayed
end
