#!/usr/bin/env bash

#import globals
source travis/variables.sh

if [ "${BUILD_IMAGE}" == "${NULL}" ] #image is not defined
then
	if [ "${BUILD_IMAGE_PUSH}" == "${NULL}" ]#user does not push the newly created image
	then
	  # import build script
		source travis/libs/builder.sh
	else 
    #pull the user's image
		docker pull ${DOCKER_USERNAME}/${EOEPCA_IMAGE}:$buildTag
		if [ $? -ne 0 ] #pull failed
		then
		  #pull failed, build the builder image
			source travis/libs/builder.sh
		else
			LOCAL_DOCKERIMAGE=${DOCKER_USERNAME}/${EOEPCA_IMAGE}:$buildTag
		fi
	fi

else
  #set the user's image
	LOCAL_DOCKERIMAGE=${BUILD_IMAGE}
fi


echo "Docker image: ${LOCAL_DOCKERIMAGE}"


#CMAKE
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} cmake -DCMAKE_BUILD_TYPE=Release -G "CodeBlocks - Unix Makefiles" ..

#make
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} make

#tests
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} ./test/eoepca-test

