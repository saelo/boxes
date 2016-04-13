#!/bin/bash
#
# Installs triton: http://triton.quarkslab.com
#
# To be run as regular user
#
# Requires:
#  * Capstone
#  * Z3
#

set -e

# Boost is another prerequisite
sudo apt-get -y install libboost-dev

git clone https://github.com/JonathanSalwan/Triton.git
cd Triton

mkdir build
cd build

cmake ..
make -j4
sudo make install

cd ..
sudo python ./setup.py install
