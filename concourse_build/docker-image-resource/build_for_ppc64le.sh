#!/bin/sh

set -eu

image_name='docker-image-resource-image'
file_name='docker-image-resource'

rm -rf docker-image-resource
git clone https://github.com/barthy1/docker-image-resource -b ppc64le-first-deploy
cd docker-image-resource
rm -rf ./gopath ./built-resource

git clone https://github.com/barthy1/docker-image-resource -b ppc64le-first-deploy ./gopath/src/github.com/concourse/docker-image-resource
#cd ./gopath/src/github.com/concourse/docker-image-resource

mkdir ./built-resource
./ci/scripts/build

cd ./built-resource
sudo docker build -f ./Dockerfile_ppc64le -t $image_name .

sudo docker run -it --name $file_name  $image_name "echo"
sudo docker export $file_name | gzip > ./${file_name}.tar.gz
sudo docker rm -f $file_name
