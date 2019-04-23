$which=$(docker run scoop cmd /c scoop which scoop)
$expected="C:\scoop\apps\scoop\current\bin\scoop.ps1"
if ($which -ne $expected) {
  throw "Wrong scoop location. Got $which, expected $expected!"
}
