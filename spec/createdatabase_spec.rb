# encoding: utf-8
require 'spec_helper'

describe 'nmddatabase::createdatabase' do
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

  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['nmddatabase'] = {
        'databases' => ['db1']
      }
    end.converge(described_recipe)
  end

  it 'Creates a mysql database.' do
    expect(chef_run).to create_mysql_database('db1').with(
      connection: { :host => "localhost", :username => "root", :password => "rootpw" },
      action: [:create]
    )
  end
end
