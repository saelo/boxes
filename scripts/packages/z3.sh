#!/bin/bash
#
# Installs the z3 theorem prover.
#
# To be run as regular user
#

set -e

git clone https://github.com/Z3Prover/z3.git
cd z3

python scripts/mk_make.py --python
cd build
make -j4
sudo make install
