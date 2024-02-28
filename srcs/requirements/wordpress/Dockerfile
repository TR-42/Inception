FROM alpine:3.18.5

ARG PHP_VERSION="82"
ARG WP_VERSION="6.4.2"
ARG REDIS_CACHE_PLUGIN_VERSION="2.5.0"

ARG MYSQL_USER=""
ARG MYSQL_PASSWORD=""
ARG MYSQL_DATABASE=""

ARG PHP_PACKAGE="php${PHP_VERSION}"

ARG PLACEHOLDER_MYSQL_USER="__MYSQL_USER__"
ARG PLACEHOLDER_MYSQL_PASSWORD="__MYSQL_PASSWORD__"
ARG PLACEHOLDER_MYSQL_DATABASE="__MYSQL_DATABASE__"

ENV PHP_FPM_EXECUTABLE="php-fpm${PHP_VERSION}"

RUN apk update && apk add --no-cache ${PHP_PACKAGE} ${PHP_PACKAGE}-fpm wget

# install php extensions
RUN apk add\
  --no-cache\
  ${PHP_PACKAGE}-json\
  ${PHP_PACKAGE}-mysqli\
  ${PHP_PACKAGE}-curl\
  libcurl\
  ${PHP_PACKAGE}-dom\
  libxml2\
  ${PHP_PACKAGE}-exif\
  ${PHP_PACKAGE}-fileinfo\
  ${PHP_PACKAGE}-intl\
  ${PHP_PACKAGE}-mbstring\
  ${PHP_PACKAGE}-openssl\
  openssl\
  ${PHP_PACKAGE}-xml\
  ${PHP_PACKAGE}-zip\
  libzip\
  ${PHP_PACKAGE}-redis\
  ${PHP_PACKAGE}-ctype

WORKDIR /root
COPY ./files/download_cache/ /root/

RUN mkdir -p /var/www/html
VOLUME [ "/var/www/html" ]

RUN if [ ! -f "/root/wordpress-${WP_VERSION}.tar.gz" ]; then \
      wget "https://wordpress.org/wordpress-${WP_VERSION}.tar.gz";\
    fi;\
    tar -xzvf wordpress-${WP_VERSION}.tar.gz -C /var/www/html --strip-components=1 && \
    rm -rf wordpress-${WP_VERSION}.tar.gz

RUN if [ ! -f "/root/redis-cache.${REDIS_CACHE_PLUGIN_VERSION}.zip" ]; then \
      wget "https://downloads.wordpress.org/plugin/redis-cache.${REDIS_CACHE_PLUGIN_VERSION}.zip";\
    fi;\
    unzip "redis-cache.${REDIS_CACHE_PLUGIN_VERSION}.zip" -d "/var/www/html/wp-content/plugins" && \
    rm -rf "redis-cache.${REDIS_CACHE_PLUGIN_VERSION}.zip" && \
    cp /var/www/html/wp-content/plugins/redis-cache/includes/object-cache.php /var/www/html/wp-content

COPY ./files/php-fpm.d/www.conf /etc/${PHP_PACKAGE}/php-fpm.d/www.conf

WORKDIR /var/www/html
COPY files/wp-config.php ./wp-config.php
RUN sed -i\
    -e "s/${PLACEHOLDER_MYSQL_USER}/${MYSQL_USER}/g"\
    -e "s/${PLACEHOLDER_MYSQL_PASSWORD}/${MYSQL_PASSWORD}/g"\
    -e "s/${PLACEHOLDER_MYSQL_DATABASE}/${MYSQL_DATABASE}/g"\
  ./wp-config.php

RUN chown -R nobody:nogroup /var/www/html

CMD [ "sh", "-c", "${PHP_FPM_EXECUTABLE} -F -R" ]
