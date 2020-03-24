#!/usr/bin/env bash

#import globals
source travis/variables.sh

source travis/libs/build.sh

#tests
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} ./test/eoepca-test


#container creation and publishing
docker build -t ${EOEPCA_REPOSITORY}/${LOCAL_SERVICE_NAME} .

docker tag ${EOEPCA_REPOSITORY}/${LOCAL_SERVICE_NAME} ${EOEPCA_REPOSITORY}/${SERVICE_NAME}:$buildTag

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker push ${EOEPCA_REPOSITORY}/${SERVICE_NAME}:$buildTag