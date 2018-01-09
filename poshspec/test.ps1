docker run -v "$(pwd)/spec:C:/spec" -w C:/spec poshspec powershell -file container.ps1
if ($LastExitCode) {
  throw "Error in poshspec tests."
}
