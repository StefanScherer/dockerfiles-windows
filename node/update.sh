#!/bin/bash
set -e

function update_version() {
  version=$1
  latest=$(curl -s https://nodejs.org/dist/latest-v${version}.x/SHASUMS256.txt | head -1 | sed 's/^.*node-v//' | sed 's/-.*//')
  curr=$(grep -oE "NODE_VERSION [0-9.]+" ${version}*/Dockerfile)
  curr=${curr#* }

  if [ "$curr" == "$latest" ]; then
    return
  fi

  echo "Updating $curr -> $latest"

  a=( ${curr//./ } )
  curr_major="${a[0]}"
  curr_major_minor="${a[0]}.${a[1]}"
  a=( ${latest//./ } )
  latest_major="${a[0]}"
  latest_major_minor="${a[0]}.${a[1]}"

  find ${curr_major_minor} -type f -exec sed -i "" "s/${curr//./\\.}/$latest/g" {} +
  find build* -type f -exec sed -i "" "s/${curr//./\\.}/$latest/g" {} +
  find build* -type f -exec sed -i "" "s/${curr_major_minor//./\\.}/$latest_major_minor/g" {} +
  find build* -type f -exec sed -i "" "s/${curr_major//./\\.}/$latest_major/g" {} +
  find test* -type f -exec sed -i "" "s/${curr//./\\.}/$latest/g" {} +
  find test* -type f -exec sed -i "" "s/${curr_major_minor//./\\.}/$latest_major_minor/g" {} +
  find test* -type f -exec sed -i "" "s/${curr_major//./\\.}/$latest_major/g" {} +
  find push* -type f -exec sed -i "" "s/${curr//./\\.}/$latest/g" {} +
  find push* -type f -exec sed -i "" "s/${curr_major_minor//./\\.}/$latest_major_minor/g" {} +
  find push* -type f -exec sed -i "" "s/${curr_major//./\\.}/$latest_major/g" {} +

  if [ "$curr_major_minor" != "$latest_major_minor" ]; then
    mv ${curr_major_minor} ${latest_major_minor}
  fi
}

update_version 8
update_version 6
