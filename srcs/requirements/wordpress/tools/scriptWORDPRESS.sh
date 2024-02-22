curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x /usr/local/bin/wp

wp core download --allow-root

wp config create --dbname="wordpress_DB" --dbuser="$DB_USER" --dbpass="$DB_USER_PASSWORD" --dbhost="$DB_HOST" --allow-root

wp core install --url="ngennaro@42.fr/" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root

wp user create "$WP_USER" "$WP_USER_EMAIL" --role=author --user_pass="$WP_USER_PASSWORD" --allow-root
wp user create "$WP_ADMIN" "$WP_ADMIN_EMAIL" --role=administrator --user_pass="$WP_ADMIN_PASSWORD" --allow-root

wp theme install twentytwenty --activate --allow-root

wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php

chown -R www-data:www-data ./

/usr/sbin/php-fpm7.4 -F