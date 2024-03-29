# encoding: utf-8
#
# Cookbook Name:: nmddatabase
# Attributes:: default
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

### nmddatabase::default
# No attributes.

### nmddatabase::useraccess
# No attributes. All variables come from databags

### nmddatabase::mysqlserver
# Some variables come from databags
default[:nmddatabase][:service_name] = node[:mysql][:service_name]

default[:nmddatabase][:allow_remote_root] = node[:mysql][:allow_remote_root]
default[:nmddatabase][:remove_anonymous_users] = node[:mysql][:remove_anonymous_users]
default[:nmddatabase][:root_network_acl] = node[:mysql][:root_network_acl]
default[:nmddatabase][:data_dir] = node[:mysql][:data_dir]

# port
default[:nmddatabase][:port] = node[:mysql][:port]

# databases to create
default[:nmddatabase][:databases] = {}
