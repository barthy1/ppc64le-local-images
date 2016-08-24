#!/bin/sh

set -eu
rm -rf $PWD/projects
mkdir -p $PWD/projects
cd $PWD/projects
../docker-image-resource/build_for_ppc64le.sh
../time-resource/build_for_ppc64le.sh
../archive-resource/build_for_ppc64le.sh
../git-resource/build_for_ppc64le.sh
