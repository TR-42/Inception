#!/bin/sh

DB_USER=$1
DATADIR=$2
INIT_SQL_ARG=""

if [ -z "$DB_USER" ]; then
    DB_USER="mysql"
fi
if [ -z "$DATADIR" ]; then
    DATADIR="/var/lib/mysql"
fi

# init DB if not exists
if [ ! -d "$DATADIR/mysql" ]; then
    mysql_install_db --user=$DB_USER --datadir=$DATADIR
    cat /tmp/init_sql/*.sql > /tmp/init.sql
    INIT_SQL_ARG="--init-file=/tmp/init.sql"
fi

mariadbd --user=$DB_USER --datadir=$DATADIR $INIT_SQL_ARG
