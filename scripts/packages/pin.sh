#!/bin/bash
#
# Installs pintool.
#
# To be run as regular user.

set -e -x

FILENAME="pin-3.2-81205-gcc-linux.tar.gz"
URL="http://software.intel.com/sites/landingpage/pintool/downloads/${FILENAME}"

cd ~
mkdir pintool

wget -q $URL
tar -xz -C pintool --strip-components=1 -f ${FILENAME}
rm ${FILENAME}
