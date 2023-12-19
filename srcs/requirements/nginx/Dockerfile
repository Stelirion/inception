FROM debian:bullseye
RUN apt update -y
RUN apt install nginx
WORKDIR /etc/nginx
EXPOSE 443
CMD ['systemd','start','nginx']