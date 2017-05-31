#!/bin/bash
sudoers='/etc/sudoers'
if [ -e /usr/local/etc/sudoers ]; then
    # We're probably on FreeBSD
    sudoers='/usr/local/etc/sudoers'
fi
echo "$SUDO_USER ALL=(ALL) NOPASSWD:ALL" >> $sudoers
