#!/bin/bash
#
# Installs some essential packages.

export DEBIAN_FRONTEND=noninteractive

# TODO remove when installed by default...
apt-get install virtualbox-guest-dkms
apt-get -y install htop vim-nox git curl zsh build-essential tree python python-pip python3-dev python3-pip silversearcher-ag gdb
