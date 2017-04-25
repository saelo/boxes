#!/bin/bash
#
# Installs some essential packages.
# Use this script for all Ubuntu versions before 16.04
#

export DEBIAN_FRONTEND=noninteractive

apt-get -y install htop vim git curl zsh build-essential tree cmake python-dev python3-dev python-pip python3-pip silversearcher-ag gdb
