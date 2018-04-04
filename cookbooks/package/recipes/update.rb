#
# Cookbook:: apt_update
# Recipe:: update
#
# Copyright:: 2018, The Authors, All Rights Reserved.

log "Update our sources list!"

execute "apt-get update" do
  command "apt-get update"
end