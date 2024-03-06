FROM alpine:3.18.5

RUN apk update && apk add --no-cache redis~=7.0.15

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD redis-cli ping

COPY ./files/redis.conf /etc/redis.conf

EXPOSE 6379

RUN mkdir -p /var/lib/redis

CMD [ "redis-server", "/etc/redis.conf" ]
