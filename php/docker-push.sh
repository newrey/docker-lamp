#!/bin/bash

set -ex

#PARENT_DIR=$(basename "${PWD%/*}")
CURRENT_DIR="${PWD##*/}"
#IMAGE_NAME="$PARENT_DIR/$CURRENT_DIR"
IMAGE_NAME="third-eye/$CURRENT_DIR"
TAG="${1}"

REGISTRY="registry.cn-hangzhou.aliyuncs.com"

docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} ./
docker tag ${REGISTRY}/${IMAGE_NAME}:${TAG} ${REGISTRY}/${IMAGE_NAME}:latest
docker push ${REGISTRY}/${IMAGE_NAME}
docker tag ${REGISTRY}/${IMAGE_NAME}:latest ${REGISTRY}/${IMAGE_NAME}:${TAG}
docker push ${REGISTRY}/${IMAGE_NAME}