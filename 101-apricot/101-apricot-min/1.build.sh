#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export TAG_NAME="${CMD_PATH##*/}"
echo $TAG_NAME
cd $CMD_PATH

docker build . -t ghcr.io/linuxdeepin365/10006-docker-linuxdeepin:$TAG_NAME

if [ ! -z $1 ];then
    docker push ghcr.io/linuxdeepin365/10006-docker-linuxdeepin:$TAG_NAME
fi
