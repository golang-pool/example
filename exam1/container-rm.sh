#!/usr/bin/env bash

containerName=$1

if [ "$(docker ps -aq -f status=running -f name=${containerName})"  ]; then
	docker stop ${containerName}
fi

if [ "$(docker ps -aq -f status=exited -f name=${containerName})"  ]; then
	docker rm ${containerName}
fi

if [ "$(docker ps -aq -f status=created -f name=${containerName})"  ]; then
	docker rm ${containerName}
fi

if [ "$(docker ps -aq -f status=dead -f name=${containerName})"  ]; then
	docker rm -f ${containerName}
fi
