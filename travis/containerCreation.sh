#!/usr/bin/env bash

# fail fast settings from https://dougrichardson.org/2018/08/03/fail-fast-bash-scripting.html
set -euov pipefail

SERVICE_NAME=template-service-cpp
LOCAL_SERVICE_NAME="local_${SERVICE_NAME}"


source travis/variables.sh

source travis/build.sh

docker build -t eoepca/${LOCAL_SERVICE_NAME} .

docker tag eoepca/${LOCAL_SERVICE_NAME} eoepca/{$SERVICE_NAME}:$buildTag

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push eoepca/eoepca/{$SERVICE_NAME}:$buildTag