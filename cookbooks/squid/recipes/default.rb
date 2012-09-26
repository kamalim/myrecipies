#
# Cookbook Name:: squid
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

package "squid" do
	action :install
	not_if "test -f /etc/init.d/squid"
end

execute "squid.conf" do 
	command "echo http_port 3128 transparent >> /etc/squid/squid.conf"
	action :run
	not_if "cat /etc/squid/squid.conf | grep transparent"
end

cookbook_file "/root/iptables.sh" do
	source "iptables.sh" 
	mode "0755"
	not_if "test -f /root/iptables.sh"
end

execute "iptables.sh" do
	command "./root/iptables.sh"
	action :run
        not_if "iptables --list -t nat | grep 3128"
end

service "squid" do
        action [:enable, :start]
end
#
