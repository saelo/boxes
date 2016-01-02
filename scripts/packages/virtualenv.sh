#!/bin/bash
#
# To be run as regular user.

set -e

sudo apt-get -y install virtualenvwrapper

echo "source /usr/share/virtualenvwrapper/virtualenvwrapper.sh" | tee -a ~/.bashrc ~/.zshrc
