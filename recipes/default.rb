# Cookbook:: nodejs_nginx
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

package 'nginx'
# package 'nodejs'
# package 'npm'

# package %w(nginx npm)

service 'nginx' do
  action [:enable, :start]
end

template '/etc/nginx/sites-available/proxy.conf.erb' do
  source 'proxy.conf.erb'
  variables proxy_port: node['nginx']['proxy_port']
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/proxy.conf.erb' do
  to '/etc/nginx/sites-available/proxy.conf.erb'
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart, 'service[nginx]'
end

include_recipe 'nodejs'

npm_package 'pm2'
npm_package 'react'
