require "serverspec"

set :backend, :cmd
set :os, :family => 'windows'

describe "Chocolatey" do
  describe file("#{ENV['ProgramData']}/chocolatey/bin") do
    it { should exist }
  end

  describe command('choco version') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /Chocolatey v0.10.3/ }
  end
end
