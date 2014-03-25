require 'spec_helper'

describe 'Gem Installations' do
  describe command('/opt/chef/embedded/bin/gem specification unf') do
    it { should return_exit_status 0 }
    its(:stdout) { should match(/^name: unf$/) }
  end

  describe command('/opt/chef/embedded/bin/gem specification fog') do
    it { should return_exit_status 0 }
    its(:stdout) { should match(/^name: fog$/) }
  end
end
