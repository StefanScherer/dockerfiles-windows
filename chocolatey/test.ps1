$version=$(docker run chocolatey choco --version)
$expected="0.10.15"
if ($version -ne $expected) {
  throw "Wrong Chocolatey version. Got $version, expected $expected!"
}

