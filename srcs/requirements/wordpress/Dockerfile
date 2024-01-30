FROM alpine:3.19.1

ARG WP_VERSION="6.4.2"
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
  libzip

WORKDIR /root
COPY ./files/download_cache/ /root/

RUN mkdir -p /var/www/html
VOLUME [ "/var/www/html" ]
RUN if [ ! -f "/root/wordpress-${WP_VERSION}.tar.gz" ]; then \
      wget "https://wordpress.org/wordpress-${WP_VERSION}.tar.gz";\
    fi;\
    tar -xzvf wordpress-${WP_VERSION}.tar.gz -C /var/www/html --strip-components=1 && \
    rm -rf wordpress-${WP_VERSION}.tar.gz

COPY ./files/php-fpm.d/www.conf /etc/${PHP_PACKAGE}/php-fpm.d/www.conf

WORKDIR /var/www/html
COPY files/wp-config.php ./wp-config.php

CMD [ "php-fpm82", "-F", "-R" ]
