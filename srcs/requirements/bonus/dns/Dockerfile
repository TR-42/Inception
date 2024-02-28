FROM alpine:3.18.5

ARG DOMAIN_NAME="xxx.42.fr"
ARG DOMAIN_NAME_PLACEHOLDER="DOMAIN_NAME.42.fr"
ENV DOMAIN_NAME=${DOMAIN_NAME}

RUN apk update && apk --no-cache add bind gettext

EXPOSE 53/udp

COPY ./files/named.conf named.conf

RUN mkdir -p /var/named/zones
COPY ./files/zones /var/named/zones
RUN envsubst < named.conf > /etc/named/named.conf && \
    mv /var/named/zones/${DOMAIN_NAME_PLACEHOLDER}.zone /var/named/zones/${DOMAIN_NAME}.zone

RUN chown -R named:named /var/named && \
    chmod -R 755 /var/named
WORKDIR /var/named
CMD [ "named", "-c", "/etc/named/named.conf", "-g", "-u", "named" ]
