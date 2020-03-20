#!/usr/bin/env bash

# fail fast settings from https://dougrichardson.org/2018/08/03/fail-fast-bash-scripting.html
set -euov pipefail

#import globals
source travis/variables.sh

if [ "${BUILD_IMAGE}" == "${NULL}" -a "${BUILD_IMAGE_PUSH}" != "${NULL}" ]
then
  # import build script
	source travis/libs/builder.sh
fi




