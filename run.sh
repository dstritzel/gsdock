#!/bin/bash

SVC=${PWD##*/}
PORT=33333

docker rm -f $SVC

docker build -t $SVC . || exit 1

docker run --rm -it \
	-p $PORT:$PORT \
	-p 11000:11000 \
    --name $SVC \
    -e PORT=$PORT \
    -e GOODSYNC_USER=$1\
    -e GOODSYNC_PWD=$2\
    -v $(pwd)/data:/data \
    $SVC