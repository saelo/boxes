#!/bin/bash

# Mount the disk image
cd /tmp
mkdir /tmp/isomount
mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
echo Installing guest additions for `uname -a`
/tmp/isomount/VBoxLinuxAdditions.run

# Cleanup
umount isomount
#rm -rf isomount /home/vagrant/VBoxGuestAdditions.iso
