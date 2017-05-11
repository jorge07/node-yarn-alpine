#!/usr/bin/env bash

DOCKER_PATH=../

VERSIONS=(6.10 7.9)

DOCKERFILE_NAME=Dockerfile.onbuild
DOCKERFILE_MILTI_STAGE_NAME=Dockerfile.multi-stage-compile
DOCKERFILE_BUILD_NAME=Dockerfile.onbuild-compile

for v in $"${VERSIONS[@]}"; do

    echo "Destination: $DOCKER_PATH$v/$DOCKERFILE_NAME"

    mkdir -p $DOCKER_PATH$v || true # Ignore if exist before

    export NODE_VERSION=$v
    envsubst '${NODE_VERSION}' <Dockerfile.multi-stage.tpl> "$DOCKER_PATH$v/$DOCKERFILE_MILTI_STAGE_NAME"
    envsubst '${NODE_VERSION}' <Dockerfile.build.tpl> "$DOCKER_PATH$v/$DOCKERFILE_NAME"
    envsubst '${NODE_VERSION}' <Dockerfile.tpl> "$DOCKER_PATH$v/$DOCKERFILE_BUILD_NAME"
done
