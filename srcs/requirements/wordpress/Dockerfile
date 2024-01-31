#install wordpress

#init the base environement
FROM debian:oldstable
RUN     	apt-get update -y && apt-get upgrade -y
RUN         apt-get install -y php-fpm php-mysql curl

#set the working directory
WORKDIR     /var/www/html

#copy the wordpress config file
COPY 		conf/wp-config.php /
COPY    	tools/scriptWORDPRESS.sh /

#launch
CMD 		[ "/bin/sh", "/scriptWORDPRESS.sh" ]