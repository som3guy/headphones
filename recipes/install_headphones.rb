#
# Cookbook Name:: headphones
# Recipe:: install_headphones
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user node['headphones']['user'] do
  home node['headphones']['directory']['user']
  system true
  action :create
end

node['headphones']['directory'].each do |_name, value|
  directory value do
    mode '755'
    owner 'headphones'
    group 'headphones'
    recursive true
  end
end

package 'git' do
  action :install
end

git "#{node['headphones']['directory']['user']}/headphones" do
  repository node['headphones']['git_url']
  revision 'master'
  action :checkout
end

template 'headphones_service_rhel-6' do
  path '/etc/init.d/headphones'
  source 'headphones_init.erb'
  mode '775'
  owner 'root'
  group 'root'
  only_if { node['headphones']['release'] == 6 }
end

template 'headphones_config' do
  path "#{node['headphones']['directory']['config']}/headphones.ini"
  source 'headphones.ini.erb'
  mode '644'
  owner node['headphones']['user']
  group node['headphones']['user']
end

execute 'update permissions' do
  command "chown -R headphones:headphones #{node['headphones']['directory']['user']}"
end

file "#{node['headphones']['directory']['config']}/headphones.ini" do
  owner 'headphones'
  group 'headphones'
  action :create
end

service 'headphones' do
  action :start
end


