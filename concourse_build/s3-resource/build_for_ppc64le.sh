#!/bin/sh

set -eu

image_name='s3-resource-image'
file_name='s3-resource'

rm -rf se-resource
git clone https://github.com/barthy1/s3-resource -b ppc64le-first-deploy
cd s3-resource
rm -rf ./gopath ./built-resource

git clone https://github.com/barthy1/s3-resource -b ppc64le-first-deploy ./gopath/src/github.com/concourse/s3-resource

mkdir ./built-resource
./scripts/ci

cd ./built-resource
sudo docker build -f ./Dockerfile_ppc64le -t $image_name .

sudo docker run -it --name $file_name  $image_name "echo"
sudo docker export $file_name | gzip > ./${file_name}.tar.gz
sudo docker rm -f $file_name