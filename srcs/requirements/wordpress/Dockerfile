FROM alpine:3.18.5

ARG PHP_VERSION="82"
ARG WP_VERSION="6.4.2"
ARG REDIS_CACHE_PLUGIN_VERSION="2.5.0"

ARG MYSQL_USER=""
ARG MYSQL_PASSWORD=""
ARG MYSQL_DATABASE=""

ARG PHP_PACKAGE="php${PHP_VERSION}"
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}

ARG WP_AUTH_KEY=""
ARG WP_SECURE_AUTH_KEY=""
ARG WP_LOGGED_IN_KEY=""
ARG WP_NONCE_KEY=""
ARG WP_AUTH_SALT=""
ARG WP_SECURE_AUTH_SALT=""
ARG WP_LOGGED_IN_SALT=""
ARG WP_NONCE_SALT=""
ENV WP_AUTH_KEY=${WP_AUTH_KEY}
ENV WP_SECURE_AUTH_KEY=${WP_SECURE_AUTH_KEY}
ENV WP_LOGGED_IN_KEY=${WP_LOGGED_IN_KEY}
ENV WP_NONCE_KEY=${WP_NONCE_KEY}
ENV WP_AUTH_SALT=${WP_AUTH_SALT}
ENV WP_SECURE_AUTH_SALT=${WP_SECURE_AUTH_SALT}
ENV WP_LOGGED_IN_SALT=${WP_LOGGED_IN_SALT}
ENV WP_NONCE_SALT=${WP_NONCE_SALT}

ARG WP_DB_IP_DB=""
ENV WP_DB_IP_DB=${WP_DB_IP_DB}
ARG WP_REDIS_IP_REDIS=""
ENV WP_REDIS_IP_REDIS=${WP_REDIS_IP_REDIS}

ENV PHP_FPM_EXECUTABLE="php-fpm${PHP_VERSION}"

RUN apk update && apk add --no-cache ${PHP_PACKAGE} ${PHP_PACKAGE}-fpm wget gettext

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

# ref: https://github.com/renatomefi/php-fpm-healthcheck
RUN wget -O /usr/local/bin/php-fpm-healthcheck \
  https://raw.githubusercontent.com/renatomefi/php-fpm-healthcheck/master/php-fpm-healthcheck \
  && chmod +x /usr/local/bin/php-fpm-healthcheck
HEALTHCHECK --interval=5s --timeout=1s \
    CMD php-fpm-healthcheck

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
COPY files/wp-config.php /tmp/wp-config.php
RUN envsubst < /tmp/wp-config.php > ./wp-config.php \
  '$MYSQL_USER,$MYSQL_PASSWORD,$MYSQL_DATABASE,$WP_AUTH_KEY,$WP_SECURE_AUTH_KEY,$WP_LOGGED_IN_KEY,$WP_NONCE_KEY,$WP_AUTH_SALT,$WP_SECURE_AUTH_SALT,$WP_LOGGED_IN_SALT,$WP_NONCE_SALT,$WP_DB_IP_DB,$WP_REDIS_IP_REDIS'

RUN chown -R nobody:nogroup /var/www/html

CMD [ "sh", "-c", "${PHP_FPM_EXECUTABLE} -F -R" ]
