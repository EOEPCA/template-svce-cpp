#!/usr/bin/env bash

export NULL='none'
export LOCAL_DOCKERIMAGE='eoepca/eoepca-build'
export EOEPCA_IMAGE="eoepca-build"
TRAVIS_BRANCH="${TRAVIS_BRANCH:-develop}"
export TRAVIS_BUILD_NUMBER="${TRAVIS_BUILD_NUMBER:-0}"

echo ${TRAVIS_BRANCH} | grep '/'
if [ $? -eq 0 ]
then
	TRAVIS_BRANCH=$(echo ${TRAVIS_BRANCH}| sed -e 's@/@_@g')
	TRAVIS_BRANCH=$(echo ${TRAVIS_BRANCH}| sed -e 's@-@_@g')
fi

export TRAVIS_BRANCH


if [ "${TRAVIS_BRANCH}" == 'master' ]
then
	echo 'Branch selected: master '
fi

if [ "${TRAVIS_BRANCH}" == 'deveop' ]
then
	echo 'Branch selected: develp' 
fi


export buildTag=travis_${TRAVIS_BRANCH}_${TRAVIS_BUILD_NUMBER}
export BUILD_IMAGE="${BUILD_IMAGE:-${NULL}}"
export BUILD_IMAGE_PUSH="${BUILD_IMAGE_PUSH:-${NULL}}"

