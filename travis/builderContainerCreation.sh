#!/usr/bin/env bash

# fail fast settings from https://dougrichardson.org/2018/08/03/fail-fast-bash-scripting.html
set -euov pipefail

source travis/variables.sh

if [ "${BUILD_IMAGE}" != "${NULL}" ]
then
	source travis/libs/builder.sh
fi




