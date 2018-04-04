#
# Cookbook:: apt_update
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'package::update'
include_recipe 'package::install'