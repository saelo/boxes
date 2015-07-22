#!/bin/bash
#
# Installs caffe (https://github.com/BVLC/caffe).
#
# To be run as regular user.
#
# Needs some scientific packages installed.

set -e

# Install dependencies.
sudo apt-get -y install git bc libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler python-dev python3-dev libatlas-base-dev

git clone https://github.com/BVLC/caffe.git ~/caffe

# Install python dependencies.
sudo apt-get -y install python3-pip python-pip
cd ~/caffe/python
for req in $(cat requirements.txt); do
    sudo pip install $req
done

cd ~/caffe
cp Makefile.config.example Makefile.config

# No CUDA support :(
sed -i 's/# CPU_ONLY/CPU_ONLY/' Makefile.config

make all
make pycaffe

echo "export PYTHONPATH=/home/$USER/caffe/python:\$PYTHONPATH" >> ~/.zshrc
