# encoding: utf-8
require 'spec_helper'

describe 'nmddatabase::useraccess' do
  before do
    stub_data_bag_item('nmddatabase', 'users').and_return(
      id: 'users',
      _default: {
        grant_hosts: {
          localhost: {
            maintenance_user: 'root',
            maintenance_password: 'root',
            type: 'mysql',
            databases: {
              example: {
                users: {
                  drupal: {
                    password: 'drupal',
                    privileges: [
                      :select,
                      :insert,
                      :update,
                      :delete,
                      :create,
                      :drop,
                      :index,
                      :alter,
                      :'lock tables',
                      :'create temporary tables'
                    ]
                  }
                }
              }
            }
          }
        }
      }
    )
  end

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'Includes the database recipe.' do
    expect(chef_run).to include_recipe('database')
  end

  it 'Creates a mysql database user.' do
    expect(chef_run).to grant_mysql_database_user('drupal').with(
      password: 'drupal',
      database_name: 'example',
      host: 'localhost',
      privileges: [
        :select,
        :insert,
        :update,
        :delete,
        :create,
        :drop,
        :index,
        :alter,
        :'lock tables',
        :'create temporary tables'
      ],
      action: [:grant]
    )
  end
end
