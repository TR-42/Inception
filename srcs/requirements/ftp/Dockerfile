FROM alpine:3.19.1

RUN apk update && apk add vsftpd

COPY ./files/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/www/html

RUN adduser -D -h /var/www/html/ -s /bin/false ftp_user
RUN echo "ftp_user:0000" | chpasswd

EXPOSE 21 21000-21010

CMD [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]
