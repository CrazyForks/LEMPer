#!/usr/bin/env bash

header_msg
echo "Installing MariaDB server..."

# Install MariaDB
apt-get install -y mariadb-server libmariadbclient18

# Fix MySQL error?
# Ref: https://serverfault.com/questions/104014/innodb-error-log-file-ib-logfile0-is-of-different-size
#service mysql stop
#mv /var/lib/mysql/ib_logfile0 /var/lib/mysql/ib_logfile0.bak
#mv /var/lib/mysql/ib_logfile1 /var/lib/mysql/ib_logfile1.bak
#service mysql start

# MySQL Secure Install
mysql_secure_installation

# Restart MariaDB MySQL server
if [[ $(ps -ef | grep -v grep | grep mysql | wc -l) > 0 ]]; then
    service mysql restart
fi
