#
# Cookbook Name:: et_fog
# Recipe:: default
#
# Copyright (C) 2013 EverTrue, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if platform_family?('debian')
  include_recipe 'apt'
  resources(execute: 'apt-get update').run_action(:run)
end

include_recipe 'build-essential'
include_recipe 'git'

# Dependencies required by nokogiri (for fog)
%w(libxslt-dev libxml2-dev libghc-zlib-dev).each do |pkg|
  c_pkg = package(pkg)
  c_pkg.run_action(:install)
end

chef_gem 'unf' do
  compile_time true
end

# TODO: Remove this once the gem_hell cookbook is ready to roll

chef_gem 'fog' do
  compile_time true
  version node['et_fog']['version']
end
