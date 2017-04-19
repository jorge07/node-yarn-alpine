#!/usr/bin/env bash

DOCKER_PATH=../

VERSIONS=(4.8 6.10 7.9)

DOCKERFILE_NAME=Dockerfile.onbuild

for v in $"${VERSIONS[@]}"; do

    echo "Destination: $DOCKER_PATH$v/$DOCKERFILE_NAME"

    mkdir -p $DOCKER_PATH$v || true # Ignore if exist before

    export NODE_VERSION=$v
    envsubst '${NODE_VERSION}' <Dockerfile.tpl> "$DOCKER_PATH$v/$DOCKERFILE_NAME"
done
