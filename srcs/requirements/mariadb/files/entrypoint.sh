#!/bin/sh

DB_USER=$1
DATADIR=$2

if [ -z "$DB_USER" ]; then
    DB_USER="mysql"
fi
if [ -z "$DATADIR" ]; then
    DATADIR="/var/lib/mysql"
fi

# init DB if not exists
if [ ! -d "$DATADIR/mysql" ]; then
    mysql_install_db --user=$DB_USER --datadir=$DATADIR
fi

mariadbd --user=$DB_USER --datadir=$DATADIR
