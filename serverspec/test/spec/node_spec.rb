require "serverspec"

set :backend, :cmd
set :os, :family => 'windows'

describe "Node.js" do
  describe command("& 'C:/Program Files/nodejs/node.exe' --version") do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /v6.9.5/ }
  end
end
