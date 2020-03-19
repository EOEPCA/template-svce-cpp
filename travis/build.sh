#!/usr/bin/env bash

source travis/variables.sh

if [ "${BUILD_IMAGE}" != "${NULL}" ]
then
	source travis/libs/builder.sh
else
	LOCAL_DOCKERIMAGE=${BUILD_IMAGE}
fi


#CMAKE prepare
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} cmake -DCMAKE_BUILD_TYPE=Release -G "CodeBlocks - Unix Makefiles" ..

#make
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} make

#tests
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} ./test/eoepca-test

