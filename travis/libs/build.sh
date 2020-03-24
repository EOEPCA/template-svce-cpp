#!/usr/bin/env bash

if [ "${BUILD_IMAGE}" == "${NULL}" ] #image is not defined
then
	if [ "${BUILD_IMAGE_PUSH}" == "${NULL}" ]
	then
	  # import build script
		source travis/libs/builder.sh
	else
    #pull the user's image
		docker pull ${EOEPCA_REPOSITORY}/${EOEPCA_IMAGE}:${BUILD_IMAGE_PUSH}
		if [ $? -ne 0 ] #pull failed
		then
		  #pull failed, build the builder image
			source travis/libs/builder.sh
		else
			LOCAL_DOCKERIMAGE=${EOEPCA_REPOSITORY}/${EOEPCA_IMAGE}:${BUILD_IMAGE_PUSH}
		fi
	fi

else
  #set the user's image
	LOCAL_DOCKERIMAGE=${BUILD_IMAGE}
fi


echo "Docker image: ${LOCAL_DOCKERIMAGE}"


#CMAKE
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} cmake -DCMAKE_BUILD_TYPE=${CMAKERELEASE} -G "CodeBlocks - Unix Makefiles" ..
#make
docker run --rm -ti  -v $PWD:/project/ -w /project/build/  ${LOCAL_DOCKERIMAGE} make
