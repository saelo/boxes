#!/bin/bash
#
# To be run as regular user.

set -e

sudo apt-get -y install git gdb

git clone https://github.com/longld/peda.git ~/.peda
echo "source ~/.peda/peda.py" >> ~/.gdbinit
