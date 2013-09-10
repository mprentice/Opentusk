#! /bin/bash

# Installing OpenTUSK and EPEL repos

set -o errexit

sn=`basename $0`
base_dir="/usr/local/tusk/current"
install_dir="$base_dir/install"
centos_dir="$install_dir/centos-5"

myhost="$HOSTNAME"
myipaddr=`ifconfig eth1 | grep -o 'inet addr:\([0-9.]\+\)' | cut -d: -f2`

/bin/echo "[$sn] Configuring from Vagrant bootstrap ..."
if [[ -d /vagrant ]] ; then
    # Fix /etc/resolv.conf on base CentOS box:
    /sbin/dhclient -q eth0
    /bin/mkdir --parents /usr/local/tusk
    if [[ ! -L $base_dir ]] ; then
        /bin/ln -s /vagrant $base_dir
    fi
    if [[ -z "`grep $HOSTNAME /etc/hosts`" ]]; then
        /bin/echo -e "${myipaddr}\t${myhost}" >> /etc/hosts
    fi
fi

PERL5LIB="$base_dir/lib:$PERL5LIB"

# /bin/echo "[$sn] Adding opentusk repo ..."
# /bin/cp $centos_dir/opentusk.repo /etc/yum.repos.d

# /bin/echo "[$sn] Installing yum packages (takes a while) ..."
# /bin/bash $centos_dir/install_yum_packages.bash

# /bin/echo "[$sn] Setting SELinux to permissive ..."
# /bin/sed -i 's/^\s*SELINUX=.*$/SELINUX=permissive/g' /etc/selinux/config
# /usr/sbin/setenforce Permissive

/bin/echo "[$sn] Setting up TUSK system account ..."
/bin/bash $centos_dir/create_system_accounts.bash

/bin/echo "[$sn] Creating TUSK directories and data tree ..."
/bin/bash $install_dir/scripts/create_directories.sh

/bin/echo "[$sn] Creating a self-signed SSL certificate ..."
/bin/bash $centos_dir/create_ssl_cert.bash

/bin/echo "[$sn] Setting up tusk.conf ..."
/bin/mkdir --parents /usr/local/tusk/conf
/usr/bin/perl $install_dir/vagrant/setup_tusk_conf.pl \
    $install_dir/templates/conf/tusk/tusk.conf \
    > /usr/local/tusk/conf/tusk.conf

/bin/echo "[$sn] Setting up MySQL and loading TUSK databases ..."
if [[ `/sbin/service mysqld status` =~ "stopped" ]] ; then
    /sbin/service mysqld start
fi
/sbin/chkconfig mysqld on
function _grant_mysql {
    mysql_user="$1"
    mysql_host="$2"
    mysql_pass="$3"
    mysql_grant="$4"
    /usr/bin/printf \
        "grant all on *.* to '%s'@'%s' identified by '%s' %s;\n" \
        "$mysql_user" "$mysql_host" "$mysql_pass" "$mysql_grant" \
        | /usr/bin/mysql -u root
}
_grant_mysql 'vagrant' '%' 'vagrant' 'with grant option'
_grant_mysql 'vagrant' 'localhost' 'vagrant' 'with grant option'
_grant_mysql 'content_mgr' 'localhost' 'vagrant'
_grant_mysql 'tusk' 'localhost' 'vagrant'
/usr/bin/perl $base_dir/bin/db/baseline.pl \
    --create-admin --create-school --dbuser=root
/usr/bin/perl $base_dir/bin/db/upgrade.pl --all --dbuser=root
cat <<EOF > /usr/local/tusk/.my.cnf
[client]
user=tusk
password=vagrant
EOF
/bin/chown tusk:tusk /usr/local/tusk/.my.cnf
/bin/chmod 600 /usr/local/tusk/.my.cnf

/bin/echo "[$sn] Setting up Apache ..."
/bin/sed -i \
    's/^LoadModule mime_magic_module/#LoadModule mime_magic_module/g' \
    /etc/httpd/conf/httpd.conf
/bin/cp /etc/httpd/conf.d/ssl.conf /tmp
/bin/sed -n '/<VirtualHost _default_:443>/q;p' /tmp/ssl.conf \
    > /etc/httpd/conf.d/ssl.conf
/bin/cp $install_dir/templates/conf/apache2/tusk_* \
    /etc/httpd/conf.d
/usr/bin/find /etc/httpd/conf.d/ -name "*.conf" -exec \
    /bin/sed -i "s/MYFQDN/`hostname`/g" {} \;
/usr/bin/find /etc/httpd/conf.d/ -name "*.conf" -exec \
    /bin/sed -i "s/TUSKFQDN/`hostname`/g" {} \;
/sbin/service httpd start
/sbin/chkconfig httpd on

/bin/echo "[$sn] Setting firewall to allow http and https ..."
/bin/mv /etc/sysconfig/iptables /etc/sysconfig/iptables.bak
/bin/cat <<EOF > /etc/sysconfig/iptables
# Firewall configuration written by vagrant for OpenTUSK
# Manual customization of this file is not recommended.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
-A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
-A RH-Firewall-1-INPUT -p 50 -j ACCEPT
-A RH-Firewall-1-INPUT -p 51 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp --dport 5353 -d 224.0.0.251 -j ACCEPT
-A RH-Firewall-1-INPUT -p udp -m udp --dport 631 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 631 -j ACCEPT
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 80 -j ACCEPT 
-A RH-Firewall-1-INPUT -p tcp -m tcp --dport 443 -j ACCEPT 
-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT
EOF
/sbin/service iptables restart

/bin/echo "[$sn] Setting up crontabs ..."
/bin/su tusk -c "/usr/bin/perl $base_dir/bin/fts_index --all"
cat <<EOF > /usr/local/tusk/crontab
### Session Tracking
1 1 * * * $base_dir/bin/clean_session_table 2>&1 | $base_dir/bin/mail_cron_error "Old Session Cleaner"
0 3 * * * $base_dir/bin/update_tracking 2>&1 | $base_dir/bin/mail_cron_error "Daily Tracking updater"

### Misc cleanup
25 4 * * * /usr/bin/find /data/temp/ -type f -ctime +2 -exec /bin/rm {} \; 2>&1 | $base_dir/bin/mail_cron_error "Temp file cleanup"

### Forum Crons
10 3 * * * $base_dir/code/forum/cron_jobs.pl 2>&1 | $base_dir/bin/mail_cron_error "Forums: cron_jobs"
20 3 * * * $base_dir/code/forum/cron_subscriptions.pl 2>&1 | $base_dir/bin/mail_cron_error "Forums: cron_subscriptions"
30 * * * * $base_dir/code/forum/cron_rss.pl 2>&1 | $base_dir/bin/mail_cron_error "Forums: cron_rss"

### Eval fts index
5 2 * * 1-5 $base_dir/bin/eval_fts_index --changes_update --school=all 2>&1 | $base_dir/bin/mail_cron_error "Eval FTS Indexer"

### fts index
0,15,30,45 * * * * TZ="US/Eastern";export TZ;$base_dir/bin/fts_index --recent --noprint 2>&1 | $base_dir/bin/mail_cron_error "FTS Indexer"
EOF
/usr/bin/crontab -u tusk /usr/local/tusk/crontab

# Enable network adapter 1
/bin/sed -i 's/ONBOOT=.*/ONBOOT=yes/g' /etc/sysconfig/network-scripts/ifcfg-eth1
/sbin/ifconfig eth1 up

/bin/echo "[$sn] Finished setup."
/bin/echo "[$sn] Add `hostname` to /etc/hosts on your VM host."
/usr/bin/printf \
    "[%s] Mac: /usr/bin/sudo /bin/bash -c \"%s >> /private/etc/hosts\"\n" \
    "$sn" \
    "/usr/bin/printf \\\"%s\\\t%s\\\n\\\" \\\"${myipaddr}\\\" \\\"${myhost}\\\""
/bin/echo "[$sn] (Only needed once.)"
/bin/echo "[$sn] Then connect to http://${myhost} to test."
