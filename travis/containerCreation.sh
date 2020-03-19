#!/usr/bin/env bash

# fail fast settings from https://dougrichardson.org/2018/08/03/fail-fast-bash-scripting.html
set -euov pipefail

# Check presence of environment variables
TRAVIS_BRANCH="${TRAVIS_BRANCH:-develop}"
TRAVIS_BUILD_NUMBER="${TRAVIS_BUILD_NUMBER:-0}"

# Create a Docker image and tag it as 'travis_<build number>'
docker build --rm -t ${DOCKER_USERNAME}/testcompiler:1 .

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push ${DOCKER_USERNAME}/testcompiler:1   # defaults to docker hub


