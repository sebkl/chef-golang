#
# Cookbook Name:: golang
# Recipe:: default
#
# Copyright 2014, Sebastian Klöppel
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy
# of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#

remote_file File.join(Chef::Config[:file_cache_path], node['go']['filename']) do
  source node['go']['url']
  action :delete
end

template "/etc/profile.d/golang.sh" do
  action :delete
end

[ node['go']['gobin'],
  File.join(Chef::Config[:file_cache_path], 'go'),
  File.join(Chef::Config[:file_cache_path], 'go'),
  File.join(node['go']['install_dir'],'go'),
  node['go']['gopath'] ].each do |d|
  directory d do
    action :delete
    recursive true
  end
end
