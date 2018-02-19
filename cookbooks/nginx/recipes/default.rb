# frozen_string_literal: true
# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

include_recipe "apt-update"

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

cookbook_file "/var/www/html/index.nginx-debian.html" do
  source "index.html"
  mode "0644"
end

# For more information, see the documentation: https://docs.chef.io/recipes.html
