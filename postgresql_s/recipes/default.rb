#
# Cookbook:: postgresql_ina
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
postgresql_server_install 'My Postgresql Client install' do
  version node['postgresql']['version']
  action [:install, :create]
end 

postgresql_database 'create database' do
  template node['postgresql']['template'] 
  database node['postgresql']['database']
  #encoding node['postgresql']['encoding']
  #locale node['postgresql']['locale']
  action [:create]
end 

package 'postgresql10-contrib'

file '/usr/pgsql-10/share/extension' do
  mode '755'
end

postgresql_extension 'adminpack' do
  source_directory '/usr/pgsql-10/share/extension'
  database node['postgresql']['database']
end