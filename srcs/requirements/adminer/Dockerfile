FROM alpine:3.19.1

ARG ADMINER_VERSION="4.8.1"
ARG PHP_PACKAGE="php82"
RUN apk update && apk add ${PHP_PACKAGE} ${PHP_PACKAGE}-fpm wget

# install php extensions
RUN apk add\
  ${PHP_PACKAGE}-session\
  ${PHP_PACKAGE}-mysqli

RUN mkdir -p /var/www/adminer
VOLUME [ "/var/www/adminer" ]
RUN wget https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}-en.php \
   && mkdir adminer && mv adminer-${ADMINER_VERSION}-en.php /var/www/adminer/index.php

COPY ./files/php-fpm.d/www.conf /etc/${PHP_PACKAGE}/php-fpm.d/www.conf

WORKDIR /var/www/adminer
CMD [ "php-fpm82", "-F", "-R" ]
