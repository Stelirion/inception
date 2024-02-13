#install wordpress

#init the base environement
FROM debian:oldstable
RUN     	apt-get update -y && apt-get upgrade -y
RUN         apt-get install -y php-fpm php-mysql curl

#set the working directory
WORKDIR     /var/www/html

COPY    	tools/scriptWORDPRESS.sh /

#launch
CMD 		[ "/bin/sh", "/scriptWORDPRESS.sh" ]