if (!(Test-Path subdir)) {
  mkdir subdir
}
cd subdir
git clone https://chromium.googlesource.com/external/gyp

