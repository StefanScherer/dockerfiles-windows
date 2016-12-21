# Compile Node.js in a Windows container

This `Dockerfile` can be used to compile Node.js from source in a Windows container.
It is used to investigate the bug with Node.js up to 7.3.0 reading files from
a volume mount. I've opened an issue https://github.com/nodejs/node/issues/8897 for discussion.
There also is a first inacceptable proposal https://github.com/nodejs/node/pull/9475 that shows some improvement. But finally this should be fixed in libuv. So let's go down the rabbit hole...

## Run a test

This command will fail

```powershell
PS C:\> docker run -v "$(pwd):C:\test" stefanscherer/node-windows:7.3.0 node -p "const fs=require('fs'); fs.realpathSync('c:/test')"
Unable to find image 'stefanscherer/node-windows:7.3.0' locally
7.3.0: Pulling from stefanscherer/node-windows
3889bb8d808b: Already exists
04ee5d718c7a: Already exists
e1c14e0fa11b: Pull complete
3b2744e491b8: Pull complete
51ae1d75bfe1: Pull complete
3c9ea98671fa: Pull complete
f4a13e185114: Pull complete
96f7b288e31d: Pull complete
Digest: sha256:aaa69d7f6ace9a3e33afe742d00f57d42f67676913ab77f20ddf1ce038efdbed
Status: Downloaded newer image for stefanscherer/node-windows:7.3.0
fs.js:901
  return binding.lstat(pathModule._makeLong(path));
                 ^

Error: ENOENT: no such file or directory, lstat 'c:\ContainerMappedDirectories'
    at Object.fs.lstatSync (fs.js:901:18)
    at Object.realpathSync (fs.js:1531:21)
    at [eval]:1:28
    at ContextifyScript.Script.runInThisContext (vm.js:26:33)
    at Object.exports.runInThisContext (vm.js:79:17)
    at Object.<anonymous> ([eval]-wrapper:6:22)
    at Module._compile (module.js:571:32)
    at Immediate.<anonymous> (bootstrap_node.js:383:29)
    at runCallback (timers.js:651:20)
    at tryOnImmediate (timers.js:624:5)
```

## Compile Node.js from source and run tests

```powershell
docker build -t nodetest node
```

## Compile libuv

```powershell
docker build -t libuvtest libuv
```

## TODO

* Run the tests on a mounted volume
