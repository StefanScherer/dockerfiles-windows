#!/bin/bash
set -e

function build {
  docker build -t node:$1 $2
  docker tag node:$1 node:latest
  docker tag node:$1 node:$2
  docker tag node:$1 node:$3

  docker build -t node:$1-onbuild $2/onbuild
  docker tag node:$1-onbuild node:$2-onbuild
  docker tag node:$1-onbuild node:$3-onbuild

  docker build -t node:$1-nano $2/nano
  docker tag node:$1-nano node:latest-nano
  docker tag node:$1-nano node:$2-nano
  docker tag node:$1-nano node:$3-nano

  docker build -t node:$1-nano-onbuild $2/nano/onbuild
  docker tag node:$1-nano-onbuild node:$2-nano-onbuild
  docker tag node:$1-nano-onbuild node:$3-nano-onbuild
}

build 4.6.1 4.6 4
build 6.9.1 6.9 6
build 7.0.0 7.0 0
