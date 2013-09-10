#!/bin/bash

set -o errexit

# Install epel
rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm

# Install opentusk repo
rpm -Uvh http://repo4.tusk.tufts.edu/5/x86_64/opentusk-release-4.00-0.2.el5.centos.noarch.rpm

# Install rpmforge
cd /tmp
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm
rpm -Uvh rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm
wget http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt
rpm --import RPM-GPG-KEY.dag.txt
rm -f rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm
rm -f RPM-GPG-KEY.dag.txt

# Disable rpmforge
sed -i 's/^enabled\s*=\s*1/enabled = 0/g' /etc/yum.repos.d/rpmforge.repo

# Install packages for Virtualbox Guest Additions
yum -y install \
    kernel-devel \
    kernel-headers \
    dkms \
    nano \
    htop

# Install packages for OpenTUSK
yum -y install httpd \
    mod_perl \
    mod_perl-devel \
    mod_ssl \
    mysql \
    mysql-server \
    mysql-devel \
    ImageMagick-perl \
    expat-devel \
    gdbm-devel \
    git \
    lftp \
    libXpm \
    libapreq2 \
    perl-libapreq2 \
    poppler-utils \
    ncftp \
    xorg-x11-xauth \
    wget \
    python-demjson \
    gd \
    gd-devel \
    perl-Readonly \
    perl-IPC-Run3 \
    perl-Moose \
    perl-Apache-DBI \
    perl-Apache-Session-Wrapper \
    perl-Archive-Zip \
    perl-Date-Calc \
    perl-DateManip \
    perl-DBD-mysql \
    perl-Email-Date-Format \
    perl-GD \
    perl-GDTextUtil \
    perl-GDGraph \
    perl-IO-stringy \
    perl-Image-ExifTool \
    perl-Image-Size \
    perl-JSON \
    perl-libintl \
    perl-Log-Log4perl \
    perl-MIME-Lite \
    perl-Mail-Sendmail \
    perl-Parse-RecDescent \
    perl-Proc-ProcessTable \
    perl-LDAP \
    perl-Spreadsheet-WriteExcel \
    perl-Term-ReadLine-Gnu \
    perl-TermReadKey \
    perl-Test-Base \
    perl-Unicode-String \
    perl-XML-Parser \
    perl-XML-LibXSLT \
    perl-Log-Any \
    perl-Test-Deep \
    perl-Linux-Pid \
    perl-XML-SAX-Writer \
    perl-YAML \
    perl-Statistics-Descriptive \
    perl-HTML-Defang \
    perl-HTML-Mason \
    perl-MasonX-Request-WithApacheSession \
    tusk-perl-XML-Twig \
    perl-Sys-MemInfo \
    perl-File-Type

# Install rpmforge packages
yum -y --enablerepo=rpmforge install \
    perl-Devel-Size \
    perl-HTML-Strip
