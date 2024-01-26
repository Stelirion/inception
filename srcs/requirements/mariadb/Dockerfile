# MariaDB container for Wordpress

#init the base environement
FROM debian:oldstable
RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y

#define the variables
ARG DB_ROOT
ARG DB_ROOT_PASSWORD
ARG DB_USER
ARG DB_USER_PASSWORD

#run and configure the database
RUN service mariadb start \
	&& mariadb -e "CREATE DATABASE IF NOT EXISTS wordpress_DB;" \
	&& mariadb -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';" \
	&& mariadb -e "GRANT ALL PRIVILEGES ON wordpress_DB.* TO '${DB_USER}'@'%';" \
	&& mariadb -e "ALTER USER '${DB_ROOT}'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

#expose the port (it's only for metadata)
EXPOSE 3306

CMD ["mariadbd", "--bind-address=0.0.0.0"]
