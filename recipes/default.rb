#
# Cookbook Name:: headphones
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# Attibutes
error = ''
if node['platform_version'].to_f >= 7.0
  node.default['headphones']['release'] = 7
elsif node['platform_version'].to_f >= 6.0
  node.default['headphones']['release'] = 6
else
  error = 'Please use a supported OS and version'
end
raise error unless error.empty?

# Recipes
if node['headphones']['release'] == 7
  include_recipe 'headphones::install_headphones'
elsif node['headphones']['release'] == 6
  include_recipe 'headphones::install_headphones'
end
