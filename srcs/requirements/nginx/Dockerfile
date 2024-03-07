FROM alpine:3.18.5

ARG DOMAIN_NAME=""
ENV DOMAIN_NAME=${DOMAIN_NAME}

EXPOSE 443

RUN apk update && apk upgrade

RUN apk add --no-cache nginx openssl gettext

COPY files/nginx.conf nginx.conf

RUN envsubst < nginx.conf > /etc/nginx/nginx.conf \
  '$DOMAIN_NAME'

CMD ["nginx"]
