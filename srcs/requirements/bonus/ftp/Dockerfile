FROM alpine:3.18.5

ARG FTP_USER=""
ARG FTP_PASSWORD=""

RUN apk update && apk add --no-cache tini vsftpd
ENTRYPOINT ["/sbin/tini", "--"]

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD echo "QUIT" | nc localhost 21

COPY ./files/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/www/html

RUN adduser -D -h /var/www/html/ -s /bin/false ${FTP_USER}
RUN echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

EXPOSE 21 21000-21010

CMD [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]
