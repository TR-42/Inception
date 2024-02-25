#!/bin/sh

DB_USER=__DB_USER__
DATADIR="/var/lib/mysql"
INIT_SQL_ARG=""

# init DB if not exists
if [ ! -d "$DATADIR/mysql" ]; then
    mysql_install_db --user=$DB_USER --datadir=$DATADIR
    cat /tmp/init_sql/*.sql > /tmp/init.sql
    INIT_SQL_ARG="--init-file=/tmp/init.sql"
fi

mariadbd --user=$DB_USER --datadir=$DATADIR $INIT_SQL_ARG
