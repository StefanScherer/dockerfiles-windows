# Java

To build Windows Docker images with Java you should have a look at these
two pull request.

## Oracle Java

You can build Docker images with Oracle Java for both windowsservercore and
nanoserver.

See pull request [oracle/docker-images#209](https://github.com/oracle/docker-images/pull/209)

## OpenJDK

The official image `openjdk` has three Windows variants:

```
$ docker run --rm mplatform/mquery openjdk
Image: openjdk
 * Manifest List: Yes
 * Supported platforms:
   - linux/amd64
   - windows/amd64:10.0.17763.615
   - windows/amd64:10.0.17134.885
   - windows/amd64:10.0.14393.3085
```

RedHat has announced the availabilty of OpenJDK for Windows.
You can build Docker images with RedHat's OpenJDK for both windowsservercore and
nanoserver.

See pull request [docker-library/openjdk#88](https://github.com/docker-library/openjdk/pull/88)

There are several options where to obtain OpenJDK for Windows.

* RedHat
  * https://developers.redhat.com/products/openjdk/overview/

* Azul Systems
  * https://www.azul.com/downloads/zulu/zulu-windows/

* ojdkbuild/ojdkbuild
  * https://github.com/ojdkbuild/ojdkbuild
