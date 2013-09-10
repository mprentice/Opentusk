#!/bin/bash

# Liberally borrowed/copied from:
# https://github.com/gwagner/packer-centos

# Saves ~25M
yum -y remove kernel-devel

# Clean cache
yum clean all

# Clean /tmp
rm -rf /tmp/*

# Clean up unused disk space so compressed image is smaller.
# Doesn't seem to work. Outputs:
#   virtualbox: cat: write error: No space left on device
# cat /dev/zero > /tmp/zero.fill
# rm /tmp/zero.fill
