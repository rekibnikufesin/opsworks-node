#
# Cookbook Name:: appserver
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "nodejs::nodejs_from_binary"
# Or set a specific version of nodejs to be installed
node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '6.6.0'
node.default['nodejs']['binary']['checksum'] = 'c22ab0dfa9d0b8d9de02ef7c0d860298a5d1bf6cae7413fb18b99e8a3d25648a' 
