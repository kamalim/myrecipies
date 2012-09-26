#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
	action :install
	not_if "service httpd status"
 end
service "httpd" do
 action [:enable, :start]
 not_if "service httpd status"
end
