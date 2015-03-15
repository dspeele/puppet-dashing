require 'spec_helper'
describe 'dashing' do

  context 'with defaults for all parameters' do
    it { should contain_class('dashing') }
  end
end
