#!/bin/sh

set -eu

image_name='git-resource-image'
file_name='git-resource'

git clone https://github.com/barthy1/git-resource -b ppc64le-first-deploy

cd ../../images/git2.4
sudo docker build -t git:2.4 .
cd ../golang1.6
sudo docker build -t golang:1.6 .

cd ../../concourse_build/projects/git-resource
sudo docker build -f ./Dockerfile_ppc64le -t $image_name .

sudo docker run -it --name $file_name  $image_name "echo"
sudo docker export $file_name | gzip > ./${file_name}.tar.gz
sudo docker rm -f $file_name