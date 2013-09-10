Packer Build Instructions for OpenTUSK

Table of Contents
=================

* Overview
* Quick Start
* Why Packer?
* Naming Conventions
* Build a Base Box
* Deploy a Base Box
* JSON File
* Kickstart File
* Provisioners

Overview
========

These instructions are for using [packer](www.packer.io) to build a
[vagrant](www.vagrantup.com) base box for OpenTUSK. This document is
not meant as a guide for how to use packer or vagrant.

Quick Start
===========

1. Install [Virtualbox](www.virtualbox.org) and
   [Packer](www.packer.io).
2. Navigate to this directory and run the following command:
   <code>make</code>

Why Packer?
===========

We use Packer to automatically build and provision a development
virtual machine for use with Vagrant and VirtualBox. The VM is
designed to be used in development mode only.

Note: In the future this may be extended to building test and
production environments.

Naming Conventions
==================

We follow conventions when naming files, builds, and hosts where
possible. Some common name pieces are "tusk", "vagrant", and "vbox",
for TUSK or OpenTUSK, Vagrant, and VirtualBox pieces, respectively. We
also use "centos" for operating system type, "5" for CentOS 5.8 or
CentOS 5.9, and "x64" to refer to the 64-bit version of
CentOS. For example, the VirtualBox machine name is
"tusk-centos-5_x64", and the Packer build name is
"tusk-centos-5_x64-vagrant-vbox".

JSON configuration file for Packer:
centos-5_x64-vagrant-vbox.json

Provisioners:
provisioners/centos-5_x64/*

See the Packer configuration JSON file for more names.


Build a Base Box
================

Build the base box by running <code>make</code>. This takes a while to
run and if everything goes well it will produce the file:
tusk-centos-5_x64-vagrant-vbox.box

Packer can sometimes hang or produce spurious errors during the build.
If that happens, clean up intermediate files with
<code>make clean</code> and try building again.

In case of build problems, clean up intermediate files with:
<code>make clean</code>

Deploy a Base Box
=================

Once a base box is built, import into Vagrant:
<code>vagrant box add tusk-centos-5_x64 tusk-centos-5_x64-vagrant-vbox.box</code>

A custom box for use with Vagrant and VirtualBox can also be
downloaded from the TUSK repo4 server:
http://repo4.tusk.tufts.edu/images/tusk-centos-5_x64-vagrant-vbox.box

This is the file that the Vagrantfile will try to download if you
haven't added a TUSK box yourself with the instructions above.

JSON File
=========

The Packer build relies on the configuration JSON file:
centos-5_x64-vagrant-vbox.json

Kickstart File
==============

The kickstart file is www/centos-5_x64-vagrant-vbox-ks.cfg

It sets up the CentOS virtual machine with the right settings for
Vagrant and VirtualBox.

Provisioners
============

Currently, the provisioners are just simple shell scripts that set up
the virtual machine for use with Vagrant and OpenTUSK. They download
supporting packages for the Vagrant base box to make deploying a new
development virtual machine very quick. They are found in
provisioners/centos-5_x64/.
