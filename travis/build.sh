#!/usr/bin/env bash

#import globals
source travis/variables.sh

if [ "${TRAVIS}" != "true" ]
then

  source travis/libs/build.sh

  #tests
  docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} ./test/eoepca-test

fi