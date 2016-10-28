#!/bin/sh

set -eu

cd git2.10
sudo docker build -t git:2.10 .
cd ../golang1.7
sudo docker build -t golang:1.7 .