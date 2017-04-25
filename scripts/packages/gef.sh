#!/bin/bash

set -e -x

sudo apt-get -y install git gdb

# Yolo
wget -q -O- https://github.com/hugsy/gef/raw/master/gef.sh | sh
