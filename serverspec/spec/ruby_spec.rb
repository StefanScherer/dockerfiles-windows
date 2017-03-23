require "serverspec"

set :backend, :cmd
set :os, :family => 'windows'

describe "Ruby" do
  describe command('ruby --version') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /ruby 2.3.1p112/ }
  end

  describe command('bundle version') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /Bundler version 1.14.6/ }
  end
end
