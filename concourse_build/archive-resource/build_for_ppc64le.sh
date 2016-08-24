#!/bin/sh

set -eu

image_name='archive-resource-image'
file_name='archive-resource'

rm -rf archive-resource
git clone https://github.com/barthy1/archive-resource -b ppc64le-first-deploy
cd archive-resource
rm -rf ./gopath ./built-resource

git clone https://github.com/barthy1/archive-resource -b ppc64le-first-deploy ./gopath/src/github.com/concourse/archive-resource

mkdir ./built-resource
./scripts/ci

cd ./built-resource
sudo docker build -f ./Dockerfile_ppc64le -t $image_name .

sudo docker run -it --name $file_name  $image_name "echo"
sudo docker export $file_name | gzip > ./${file_name}.tar.gz
sudo docker rm -f $file_name