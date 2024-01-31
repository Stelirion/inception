#Nginx container

#init the base environement
FROM debian:oldstable
RUN apt update -y && apt upgrade -y
RUN apt install nginx openssl -y

#copy the nginx config file
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#generate the ssl autosigned key
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/ngennaro.42.fr.key \
	-out /etc/nginx/ssl/ngennaro.42.fr.crt \
	-subj "/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/O=42/UID=ngennaro/emailAddress=ngennaro@student.42lyon.fr"


#set the working directory
WORKDIR /etc/nginx/

#expose the port (it's only for metadata)
EXPOSE 443

#launch
CMD ["nginx", "-g", "daemon off;"]