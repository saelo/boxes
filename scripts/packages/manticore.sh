#!/bin/bash
#
# To be run as regular user.
#

set -e -x

# Install system dependencies
sudo apt-get update && sudo apt-get install -y z3 python-pip
sudo python -m pip install -U pip

# Install manticore and its dependencies
git clone https://github.com/trailofbits/manticore.git && cd manticore
sudo pip install --no-binary capstone .
