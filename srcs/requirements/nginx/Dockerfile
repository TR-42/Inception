FROM alpine:3.19.1

ARG DOMAIN_NAME=""
ARG PLACEHOLDER_DOMAIN_NAME="__DOMAIN_NAME__"

EXPOSE 443

RUN apk update && apk upgrade

RUN apk add nginx openssl

COPY files/nginx.conf /etc/nginx/nginx.conf

RUN sed -i "s/$PLACEHOLDER_DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/nginx.conf

CMD ["nginx"]
