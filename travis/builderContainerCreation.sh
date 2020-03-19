#!/usr/bin/env bash

# fail fast settings from https://dougrichardson.org/2018/08/03/fail-fast-bash-scripting.html
set -euov pipefail

source travis/variables.sh

BUILDIMAGE=false
if [ "${BUILD_IMAGE}" != "${NULL}" ] #is defined a public DockerImageCompiler
then
	docker pull ${BUILD_IMAGE}
	if [ $? -ne 0 ] #pull failed, build my DockerImageCompiler
	then
		BUILDIMAGE=true	
	else
		docker tag ${BUILD_IMAGE} ${LOCAL_DOCKERIMAGE}
	fi
fi

# the Image must be buildt
if [ ${BUILDIMAGE} -eq true ]
then
	docker build --rm --no-cache -t ${LOCAL_DOCKERIMAGE} .
fi

# check if the Image must be push
if [ "${BUILD_IMAGE_PUSH}" != "${NULL}" ]
then
	echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
	docker tag ${LOCAL_DOCKERIMAGE} ${DOCKER_USERNAME}/${EOEPCA_IMAGE}:$buildTag
	docker push ${DOCKER_USERNAME}/${EOEPCA_IMAGE}:$buildTag
fi

