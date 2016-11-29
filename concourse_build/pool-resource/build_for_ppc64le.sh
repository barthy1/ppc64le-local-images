#!/bin/sh

set -eu

image_name='pool-resource-image'
file_name='pool-resource'

rm -rf pool-resource
git clone https://github.com/barthy1/pool-resource -b ppc64le-first-deploy
cd pool-resource
rm -rf ./gopath ./built-resource

git clone https://github.com/barthy1/pool-resource -b ppc64le-first-deploy ./gopath/src/github.com/concourse/pool-resource

mkdir ./built-resource
./ci/build

cd ./built-resource
sudo docker build -f ./Dockerfile_ppc64le -t $image_name .

sudo docker run -it --name $file_name  $image_name "echo"
sudo docker export $file_name | gzip > ./${file_name}.tar.gz
sudo docker rm -f $file_name