FROM alpine:3.18.5

ARG PHP_VERSION="82"
ARG ADMINER_VERSION="4.8.1"
ARG PHP_PACKAGE="php${PHP_VERSION}"

ENV PHP_FPM_EXECUTABLE="php-fpm${PHP_VERSION}"

RUN apk update && apk add --no-cache ${PHP_PACKAGE} ${PHP_PACKAGE}-fpm wget

# install php extensions
RUN apk add\
  --no-cache\
  ${PHP_PACKAGE}-session\
  ${PHP_PACKAGE}-mysqli

RUN mkdir -p /var/www/adminer
VOLUME [ "/var/www/adminer" ]
RUN wget https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}-en.php \
   && mkdir adminer && mv adminer-${ADMINER_VERSION}-en.php /var/www/adminer/index.php

COPY ./files/php-fpm.d/www.conf /etc/${PHP_PACKAGE}/php-fpm.d/www.conf

WORKDIR /var/www/adminer
CMD [ "sh", "-c", "${PHP_FPM_EXECUTABLE} -F -R" ]
