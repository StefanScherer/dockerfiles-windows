$ErrorActionPreference = 'SilentlyContinue';
out=$(docker run powercli)
if(!($content.Contains('Welcome to VMware PowerCLI!'))) {
  throw "PowerCLI test failed!"
}
