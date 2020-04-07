# Cookbook:: nodejs_nginx
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_update 'update_sources' do
  action :update
end

package 'nginx'
package 'nodejs'

package %w(nginx npm)

npm_package 'pm2'
npm_package 'react'

service 'nginx' do
  action [:enable, :start]
end

template '/etc/nginx/sites-available/proxy.conf.erb' do
  source 'proxy.conf.erb'
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

nodejs_npm 'pm2'
nodejs_npm 'react'
