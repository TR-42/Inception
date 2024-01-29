FROM alpine:3.19.1

RUN apk update && apk add bind

EXPOSE 53/udp

COPY ./files/named.conf /etc/named/named.conf

RUN mkdir -p /var/named/zones
COPY ./files/zones /var/named/zones

RUN chown -R named:named /var/named && \
    chmod -R 755 /var/named
WORKDIR /var/named
CMD [ "named", "-c", "/etc/named/named.conf", "-g", "-u", "named" ]
