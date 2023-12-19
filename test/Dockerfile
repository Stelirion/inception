FROM debian:bullseye

RUN apt update -y

RUN apt install ngnix openssl -Y

WORKDIR /etc/nginx

COPY ./derlr.conf .
COPY ./derlr.conf .
COPY ./derlr.conf .

EXPOSE 443

CMD ['nginx','-g','daemon off;']