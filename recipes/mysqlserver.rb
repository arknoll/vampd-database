# encoding: utf-8
#
# Cookbook Name:: nmddatabase
# Recipe:: useraccess
#
# Author:: Alex Knoll
# Copyright:: 2014, NewMedia Denver
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
server = data_bag_item('nmddatabase', 'server')[node.chef_environment]

node.set['mysql']['server_root_password'] = server['server_root_password']
node.set['mysql']['server_debian_password'] = server['server_debian_password']
node.set['mysql']['server_repl_password'] = server['server_repl_password']

mysql_service node[:nmddatabase][:service_name] do
  port node[:nmddatabase][:port]
  data_dir node[:nmddatabase][:data_dir]
  allow_remote_root node[:nmddatabase][:allow_remote_root]
  root_network_acl node[:nmddatabase][:root_network_acl]
  remove_anonymous_users node[:nmddatabase][:remove_anonymous_users]
  server_root_password server['server_root_password']
  server_debian_password server['server_debian_password']
  server_repl_password server['server_repl_password']
  action :create
end
