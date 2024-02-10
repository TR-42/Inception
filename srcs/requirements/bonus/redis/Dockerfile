FROM alpine:3.19.1

RUN apk update && apk add redis

COPY ./files/redis.conf /etc/redis.conf

EXPOSE 6379

RUN mkdir -p /var/lib/redis

CMD [ "redis-server", "/etc/redis.conf" ]
