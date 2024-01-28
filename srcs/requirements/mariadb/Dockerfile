FROM alpine:3.12.12

EXPOSE 3306

RUN addgroup mysql && \
    adduser -D -s /sbin/nologin -h /var/lib/mysql -G mysql mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

RUN apk update && apk upgrade

RUN apk add mariadb mariadb-client

VOLUME ["/var/lib/mysql"]

COPY files/mariadb-server.cnf /etc/my.cnf.d/

WORKDIR /var/lib/mysql
COPY files/init_sql/ /tmp/init_sql
COPY files/entrypoint.sh /entrypoint.sh
CMD ["sh", "/entrypoint.sh", "mysql", "/var/lib/mysql"]
