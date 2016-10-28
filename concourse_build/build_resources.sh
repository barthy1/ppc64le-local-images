#!/bin/sh

set -eu
rm -rf $PWD/projects
mkdir -p $PWD/projects
cd $PWD/projects
../s3-resource/build_for_ppc64le.sh
../semver-resource/build_for_ppc64le.sh
../docker-image-resource/build_for_ppc64le.sh
../time-resource/build_for_ppc64le.sh
../archive-resource/build_for_ppc64le.sh
../git-resource/build_for_ppc64le.sh

mkdir -p resources
cp s3-resource/built-resource/s3-resource.tar.gz   resources/
cp semver-resource/built-resource/semver-resource.tar.gz   resources/
cp docker-image-resource/built-resource/docker-image-resource.tar.gz  resources/
cp time-resource/built-resource/time-resource.tar.gz  resources/
cp archive-resource/built-resource/archive-resource.tar.gz resources/
cp git-resource/git-resource.tar.gz  resources/