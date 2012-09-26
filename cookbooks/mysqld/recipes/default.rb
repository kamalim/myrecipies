#
# Cookbook Name:: mysqld
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "mysql-server" do
	action :install
	not_if "service mysqld status"
end

service "mysqld" do
	action [:enable, :start]
	not_if "service mysqld status"
end 
