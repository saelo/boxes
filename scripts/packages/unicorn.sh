#!/bin/bash

echo "Installing unicorn"

set -e -x

sudo apt-get -y install libglib2.0-dev

git clone https://github.com/unicorn-engine/unicorn.git
cd unicorn

./make.sh
sudo ./make.sh install

cd bindings/python
sudo make install
sudo make install3
