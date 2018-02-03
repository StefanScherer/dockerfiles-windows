#!/bin/bash

rm -rf tmp
mkdir -p tmp
pushd tmp

for i in $(cat ../filelist); do
  if [[ "$i" == *README.md ]]; then
    echo "file $i" > "$i"
  else
    mkdir -p "$i"
  fi
done

cat ../filelist | zip -@ ../longpath.zip

popd
rm -rf tmp
