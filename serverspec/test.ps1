docker run -v "$(pwd)\spec:C:\spec" serverspec
if ($LastExitCode) {
  throw "Error in Serverspec tests."
}
