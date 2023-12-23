FROM alpine:3.12.12

EXPOSE 443

RUN apk update && apk upgrade

RUN apk add nginx openssl

COPY files/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx"]
