#!/usr/bin/env bash

export LOCAL_DOCKERIMAGE='eoepca/eoepca-build'
export EOEPCA_IMAGE="eoepca-build"
export TRAVIS_BRANCH="${TRAVIS_BRANCH:-develop}"
export TRAVIS_BUILD_NUMBER="${TRAVIS_BUILD_NUMBER:-0}"
export buildTag=travis_${TRAVIS_BRANCH}_${TRAVIS_BUILD_NUMBER}