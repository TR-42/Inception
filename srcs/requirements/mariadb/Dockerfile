FROM alpine:3.12.12

EXPOSE 3306

RUN addgroup mysql && \
    adduser -D -s /sbin/nologin -h /var/lib/mysql -G mysql mysql && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

RUN apk update && apk upgrade

RUN apk add mariadb mariadb-client

VOLUME ["/var/lib/mysql"]

COPY files/my.cnf /etc/my.cnf.d/

USER mysql
WORKDIR /var/lib/mysql
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
CMD ["mariadbd", "--user=mysql", "--datadir=/var/lib/mysql"]
