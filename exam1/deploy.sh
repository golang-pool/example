#!/usr/bin/env bash

imageName=exam1:1.1
containerName=exam1

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

if [ "$(docker images -q ${imageName})"  ]; then
	docker rmi ${imageName}
fi

docker build -t ${imageName} . && docker run -d --name ${containerName} ${imageName}