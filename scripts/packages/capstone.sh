#!/bin/bash

git clone https://github.com/aquynh/capstone.git
cd capstone

./make.sh
sudo ./make.sh install

cd bindings/python
sudo make install
sudo make install3
