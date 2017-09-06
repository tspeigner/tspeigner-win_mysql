require 'spec_helper'
describe 'win_mysql' do
  context 'with default values for all parameters' do
    it { should contain_class('win_mysql') }
  end
end
