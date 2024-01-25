#Nginx xontainer

#init the base environement
FROM debian:oldstable
RUN apt update -y && apt upgrade -y
RUN apt install nginx openssl -y

#copy and link the nginx config file
COPY /conf/nginx.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

#generate the ssl autosigned key
RUN openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout /etc/ssl/private/ngennaro.42.fr.key \
	-out /etc/ssl/certs/ngennaro.42.fr.crt \
	-subj "/C=FR/ST=Auvergne-Rhone-Alpes/L=Lyon/UID=ngennaro/emailAddress=ngennaro@student.42lyon.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]