#!/bin/sh

set -eu

image_name='time-resource-image'
file_name='time-resource'

rm -rf time-resource
git clone https://github.com/barthy1/time-resource -b ppc64le-first-deploy
cd time-resource
rm -rf ./gopath ./built-resource

git clone https://github.com/barthy1/time-resource -b ppc64le-first-deploy ./gopath/src/github.com/concourse/time-resource

mkdir ./built-resource
./scripts/ci

cd ./built-resource
sudo docker build -f ./Dockerfile_ppc64le -t $image_name .

sudo docker run -it --name $file_name  $image_name "echo"
sudo docker export $file_name | gzip > ./${file_name}.tar.gz
sudo docker rm -f $file_name