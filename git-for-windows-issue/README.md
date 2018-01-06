# Git for Windows issue

This is a test setup to test Git for Windows in a Windows Docker container.
See https://github.com/git-for-windows/git/issues/1007

**Update**: It seems to be fixed with git-for-windows 2.13.0 -> not fully
**Update 2**: It works with MinGit 2.15.1.2

## Build the Docker image

For simplicity I use Chocolatey to install Git for Windows.

```powershell
.\build.ps1
```

## Run the tests

Test 1 works, inside the container file system

```
.\run-test-1-in-container.ps1
```

Test 2 works, directly in the mounted volume

```
.\run-test-2-in-volume.ps1
```

Test 3 works, directly in the mounted volume

```
run-test-3-in-volume-currdir.ps1
```

Test 4 works, in a sub directory of the mounted volume

```
run-test-4-in-volume-subdir.ps1
```
