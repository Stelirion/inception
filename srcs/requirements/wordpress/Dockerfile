#install wordpress

FROM debian:oldstable

RUN     	apt-get update -y && apt-get install -y php-fpm php-mysql curl

WORKDIR     /var/www/html

COPY 		conf/wp-config.php /
COPY    	tools/scriptWORDPRESS.sh /


CMD 		[ "/bin/sh", "/scriptWORDPRESS.sh" ]