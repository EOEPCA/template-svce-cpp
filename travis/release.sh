#!/usr/bin/env bash

set -euov pipefail

pullTag=${EOEPCA_REPOSITORY}/${SERVICE_NAME}:$buildTag
releaseTag=${EOEPCA_REPOSITORY}/${SERVICE_NAME}:release_${buildTag}
latestTag=${EOEPCA_REPOSITORY}/${SERVICE_NAME}:latest

docker pull ${pullTag}

docker tag ${pullTag} ${releaseTag}
docker push ${releaseTag}

docker tag ${pullTag} ${latestTag}
docker push ${latestTag}
