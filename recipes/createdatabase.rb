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
include_recipe 'mysql::client'
include_recipe 'database'
include_recipe 'database::mysql'

server = data_bag_item('nmddatabase', 'server')[node.chef_environment]

node[:nmddatabase][:databases].each do |database_name|
  mysql_connection_info = {
    :host     => 'localhost',
    :username => 'root',
    :password => server['server_root_password']
  }

  mysql_database database_name do
    connection mysql_connection_info
    action [:create]
  end
end
