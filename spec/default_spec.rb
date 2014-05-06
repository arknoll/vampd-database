# encoding: utf-8
require 'spec_helper'

describe 'nmddatabase::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

end
