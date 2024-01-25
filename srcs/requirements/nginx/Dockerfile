#Nginx xontainer

#init the base environement
FROM debian:oldstable
RUN apt update -y && apt upgrade -y
RUN apt install nginx openssl -y

#copy and link the nginx config file
COPY conf/nginx.conf /etc/nginx/
WORKDIR /etc/nginx/

#generate the ssl autosigned key
RUN openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout ngennaro.42.fr.key \
	-out ngennaro.42.fr.crt \
	-subj "/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/UID=ngennaro/emailAddress=ngennaro@student.42lyon.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]