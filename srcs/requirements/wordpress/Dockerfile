FROM alpine:3.19.1

ARG WP_VERSION="6.4.2"
ARG REDIS_CACHE_PLUGIN_VERSION="2.5.0"
ARG PHP_PACKAGE="php82"
RUN apk update && apk add ${PHP_PACKAGE} ${PHP_PACKAGE}-fpm wget

# install php extensions
RUN apk add\
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

RUN chown -R nobody:nogroup /var/www/html

CMD [ "php-fpm82", "-F", "-R" ]
