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

mysql_users = data_bag_item('nmddatabase', 'users')[node.chef_environment]

mysql_users['grant_hosts'].each do |host_name, host|
  mysql_connection_info = {
    :host     => host_name,
    :username => host[:maintenance_user],
    :password => host[:maintenance_password]
  }
  host['databases'].each do |db_name, database|
    database['users'].each do |user_name, user|
      Chef::Log.debug "nmddatabase::useraccess: - grant access to user #{user_name} on #{host_name}"
      mysql_database_user user_name do
        connection mysql_connection_info
        password user['password']
        database_name db_name
        host host_name
        privileges user['privileges']
        action :grant
      end
    end
  end
end
