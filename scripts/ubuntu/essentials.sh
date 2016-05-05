#!/bin/bash
#
# Installs some essential packages.

export DEBIAN_FRONTEND=noninteractive

apt-get -y install htop vim-nox git curl zsh build-essential tree cmake python3-dev python3-pip silversearcher-ag
