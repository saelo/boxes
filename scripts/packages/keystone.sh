#!/bin/bash

# TODO code not yet public
set -e -x

git clone https://github.com/keystone-engine/keystone.git
cd keystone

./make.sh
sudo ./make.sh install

cd bindings/python
sudo make install
sudo make install3
