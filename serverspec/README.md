# Run Serverspec tests in a Windows container

[Dockerfile](https://github.com/StefanScherer/dockerfiles-windows/blob/master/serverspec/Dockerfile)

This is a Windows Docker image with [Serverspec](http://serverspec.org) installed.

You can run isolated Serverspec tests in Windows containers, eg. to test all
scenarios of an own built MSI package.

Each container starts without your MSI package installed, so you don't need
a snapshot of your VM.

## Example

To run the Serverspec tests create a folder `spec` with some `*_spec.rb` files.
See the [spec](https://github.com/StefanScherer/dockerfiles-windows/tree/master/serverspec/spec) folder to selftest this Docker image for an example.

Run the container like this:

```
PS C:\> docker run -v "$(pwd)/spec:C:/spec" stefanscherer/serverspec-windows

Chocolatey
  File "C:\ProgramData/chocolatey/bin"
    should exist
  Command "choco version"
    exit_status
      should eq 0
    stdout
      should match /Chocolatey v0.10.3/

Ruby
  Command "ruby --version"
    exit_status
      should eq 0
    stdout
      should match /ruby 2.3.1p112/
  Command "bundle version"
    exit_status
      should eq 0
    stdout
      should match /Bundler version 1.14.3/

Finished in 10.25 seconds (files took 1.77 seconds to load)
7 examples, 0 failures
```
