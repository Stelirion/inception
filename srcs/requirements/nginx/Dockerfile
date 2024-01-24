FROM debian:buster

RUN apt update -y

RUN apt install nginx openssl -y

# WORKDIR /etc/nginx

# COPY ./derlr.conf .
# COPY ./derlr.conf .
# COPY ./derlr.conf .

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]