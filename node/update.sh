#!/bin/bash

function update_version() {
  version=$1
  latest=$(curl -s https://nodejs.org/dist/latest-v${version}.x/SHASUMS256.txt | head -1 | sed 's/^.*node-v//' | sed 's/-.*//')
  curr=$(grep -oE "NODE_VERSION [0-9.]+" ${version}*/Dockerfile)
  curr=${curr#* }

  if [ "$curr" == "$latest" ]; then
    return
  fi

  echo "Updating $curr -> $latest"
  sha=$(curl -s https://nodejs.org/dist/latest-v${version}.x/SHASUMS256.txt | grep win-x64.zip | sed 's/ .*//')
  echo "New SHA256 $sha"

  a=( ${curr//./ } )
  curr_major="${a[0]}"
  curr_major_minor="${a[0]}.${a[1]}"
  a=( ${latest//./ } )
  latest_major="${a[0]}"
  latest_major_minor="${a[0]}.${a[1]}"
 
  set -x
  set -e
  find ${curr_major_minor} -type f -exec sed -i "" "s/ENV NODE_SHA256.*/ENV NODE_SHA256 $sha/g" {} +
  find ${curr_major_minor} -type f -exec sed -i "" "s/$curr/$latest/g" {} +
  find build* -type f -exec sed -i "" "s/$curr/$latest/g" {} +
  find build* -type f -exec sed -i "" "s/$curr_major_minor/$latest_major_minor/g" {} +
  find build* -type f -exec sed -i "" "s/$curr_major/$latest_major/g" {} +

  mv ${curr_major_minor} ${latest_major_minor}
}

update_version 7
update_version 6
update_version 4
