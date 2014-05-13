#
# Cookbook Name:: et_fog
# Recipe:: default
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'build-essential'
include_recipe 'apt'
include_recipe 'git'

execute 'apt-get update' do
  action  :nothing
end.run_action(:run)

# Dependencies required by nokogiri (for fog)
%w(libxslt-dev libxml2-dev).each do |pkg|
  c_pkg = package(pkg)
  c_pkg.run_action(:install)
end

# TODO: Remove this once the gem_hell cookbook is ready to roll
%w{
  unf
  fog
}.each do |pkg|
  g = chef_gem pkg do
    action :nothing
  end

  g.run_action(:install)
end
