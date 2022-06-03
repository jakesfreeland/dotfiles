#!/bin/sh

if [ -z $1 ] || [ "$1" = "--help" ]; then
  echo "USAGE: ${0##*/} [IMAGE ID] [CONTAINER PATH] [LOCAL PATH]" >&2
  exit 1
fi

container_id="$(docker create $1)"
container_path="$2"
local_path="$3"

docker cp ${container_id}:${container_path} ${local_path}
docker rm ${container_id}

