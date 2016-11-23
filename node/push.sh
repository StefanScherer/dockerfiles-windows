#!/bin/bash
set -e

function push {
  docker tag node:$1 stefanscherer/node-windows:$1
  docker tag node:$2 stefanscherer/node-windows:$2
  docker tag node:$3 stefanscherer/node-windows:$3

  docker tag node:$1-onbuild stefanscherer/node-windows:$1-onbuild
  docker tag node:$2-onbuild stefanscherer/node-windows:$2-onbuild
  docker tag node:$3-onbuild stefanscherer/node-windows:$3-onbuild

  docker tag node:$1-nano stefanscherer/node-windows:$1-nano
  docker tag node:$2-nano stefanscherer/node-windows:$2-nano
  docker tag node:$3-nano stefanscherer/node-windows:$3-nano

  docker tag node:$1-nano-onbuild stefanscherer/node-windows:$1-nano-onbuild
  docker tag node:$2-nano-onbuild stefanscherer/node-windows:$2-nano-onbuild
  docker tag node:$3-nano-onbuild stefanscherer/node-windows:$3-nano-onbuild

  docker push stefanscherer/node-windows:$1
  docker push stefanscherer/node-windows:$2
  docker push stefanscherer/node-windows:$3
  docker push stefanscherer/node-windows:$1-onbuild
  docker push stefanscherer/node-windows:$2-onbuild
  docker push stefanscherer/node-windows:$3-onbuild
  docker push stefanscherer/node-windows:$1-nano
  docker push stefanscherer/node-windows:$2-nano
  docker push stefanscherer/node-windows:$3-nano
  docker push stefanscherer/node-windows:$1-nano-onbuild
  docker push stefanscherer/node-windows:$2-nano-onbuild
  docker push stefanscherer/node-windows:$3-nano-onbuild
}

push 4.6.2 4.6 4
push 6.9.1 6.9 6
push 7.2.0 7.2 7
