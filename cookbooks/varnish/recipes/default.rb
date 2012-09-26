#
# Cookbook Name:: varnish
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "rpm" do 
	command "rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-3.0/el5/noarch/varnish-release-3.0-1.noarch.rpm"
	action :run
	not_if "test -f /etc/init.d/varnish"
end

package "varnish" do 
	action :install
	not_if "test -f /etc/init.d/varnish"
end

service "varnish" do
	action [:enable, :start]
end
