#!/bin/sh

echo "Deleting password for user ${SUDO_USER}"
passwd --delete ${SUDO_USER} &> /dev/null
