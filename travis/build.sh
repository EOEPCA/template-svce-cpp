#!/usr/bin/env bash

#import globals
source travis/variables.sh

source travis/build.sh

#tests
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} ./test/eoepca-test
