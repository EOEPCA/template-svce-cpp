#!/usr/bin/env bash

source travis/variables.sh

if [ "${BUILD_IMAGE}" == "${NULL}" ]
then
	if [ "${BUILD_IMAGE_PUSH}" == "${NULL}" ]
	then
		source travis/libs/builder.sh
		#LOCAL_DOCKERIMAGE=${BUILD_IMAGE}
	else 

		docker pull ${DOCKER_USERNAME}/${EOEPCA_IMAGE}:$buildTag
		if [ $? -ne 0 ] #pull failed
		then 
			source travis/libs/builder.sh
		else
			LOCAL_DOCKERIMAGE=${DOCKER_USERNAME}/${EOEPCA_IMAGE}:$buildTag
		fi
	fi

else
	LOCAL_DOCKERIMAGE=${BUILD_IMAGE}
fi


echo "Docker image: ${LOCAL_DOCKERIMAGE}"


#CMAKE prepare
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} cmake -DCMAKE_BUILD_TYPE=Release -G "CodeBlocks - Unix Makefiles" ..

#make
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} make

#tests
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} ./test/eoepca-test

