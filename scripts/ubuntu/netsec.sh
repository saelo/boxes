#!/bin/bash
#
# Installs some computer security related packages.
#

set -e

export DEBIAN_FRONTEND=noninteractive

# Classics.
apt-get -y install nmap strace ltrace gdb nasm hexedit

# Python stuff is always useful :)
apt-get -y install ipython3 ipython python3-pil python-pil python3-numpy python-numpy python3-pip python-pip

# Useful networking stuff.
apt-get -y install wireshark python-scapy socat
