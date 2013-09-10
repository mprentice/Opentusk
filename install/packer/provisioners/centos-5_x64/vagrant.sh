#!/bin/bash

set -o errexit

# Add vagrant user
useradd -G wheel -p $(openssl passwd -1 vagrant) vagrant

# Add to sudoers
echo -e 'vagrant\tALL=(ALL)\tNOPASSWD: ALL' >> /etc/sudoers
echo -e 'Defaults:vagrant\t!requiretty' >> /etc/sudoers

# Add vagrant SSH key
mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
wget -qO- https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
    >> /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Setup hostname
myhost=vagrant-tusk-centos-5_x64.vagrantup.com
sed -i "s/HOSTNAME=.*/HOSTNAME=${myhost}/g" \
    /etc/sysconfig/network
echo "${myhost}" >> /etc/mail/local-host-names
