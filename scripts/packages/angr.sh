#!/bin/bash
#
# To be run as regular user.
#

set -e -x

export DEBIAN_FRONTEND=noninteractive

# Install dependencies.
sudo apt-get -y install python-dev libffi-dev build-essential virtualenvwrapper

# Install angr
git clone https://github.com/angr/angr-dev .angr
cd .angr
./setup.sh -ip angr

echo "=============================================================================="
echo
echo "angr successfully installed. Use 'workon angr' to activate the angr virtualenv"
echo
echo "=============================================================================="
