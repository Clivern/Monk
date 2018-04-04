#
# Cookbook:: apt_update
# Recipe:: install
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node['package']['install'].each do |package|
	log "Installing Package #{package}"
	execute "apt-get install #{package}" do
	  command "apt-get install #{package}"
	end
end