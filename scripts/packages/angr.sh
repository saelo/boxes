#!/bin/bash
#
# To be run as regular user.
#

set -e

# Install dependencies.
sudo apt-get -y install python2.7-dev build-essential libxml2-dev libxslt1-dev git libffi-dev cmake libreadline-dev

# Install angr
git clone https://github.com/angr/angr-dev .angr
cd .angr
./setup.sh -p angr

echo "=============================================================================="
echo
echo "angr successfully installed. Use 'workon angr' to activate the angr virtualenv"
echo
echo "=============================================================================="
