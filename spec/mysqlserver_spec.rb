# encoding: utf-8
require 'spec_helper'

describe 'nmddatabase::mysqlserver' do
  before do
    stub_data_bag_item('nmddatabase', 'server').and_return(
      id: 'server',
      _default: {
        server_root_password: 'rootpw',
        server_debian_password: 'debianpw',
        server_repl_password: 'replpw'
      }
    )
  end

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'Creates a mysql service.' do
    expect(chef_run).to create_mysql_service('default').with(
      port: '3306',
      data_dir: '/var/lib/mysql',
      allow_remote_root: false,
      root_network_acl: [],
      remove_anonymous_users: true,
      server_root_password: 'rootpw',
      server_debian_password: 'debianpw',
      server_repl_password: 'replpw',
      action: [:create]
    )
  end
end
