#!/bin/sh

# Clean up
if command -v apt-get > /dev/null; then
    apt-get -y --purge autoremove
    apt-get -y clean
fi

# Remove files from cache
find /var/cache -type f -delete -print

# Zero out the free space to save space in the final image:
echo "Zeroing device to save space..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Remove history file
unset HISTFILE
rm -f ~/.bash_history

# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sync
