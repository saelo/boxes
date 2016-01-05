#!/bin/bash
#
# To be run as regular user.

set -e

sudo apt-get -y install git gdb

sudo pip3 install pycparser

git clone https://github.com/zachriggle/pwndbg ~/.pwndbg
echo "source ~/.pwndbg/gdbinit.py" >> ~/.gdbinit
