curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x /usr/local/bin/wp

wp core download --allow-root

mv /wp-config.php .

sed -i -r "s/db_name/wordpress_DB/1"   wp-config.php
sed -i -r "s/user/$DB_USER/1"  wp-config.php
sed -i -r "s/pwd/$DB_USER_PASSWORD/1"    wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php


wp core install --url="$DOMAIN_NAME/" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root

wp user create "$WP_USER" "$WP_USER_EMAIL" --role=author --user_pass="$WP_USER_PASSWORD" --allow-root

wp theme install twentytwenty --activate --allow-root

wp post delete $(wp post list --posts_per_page=1 --format=ids --allow-root) --allow-root;
wp post delete $(wp post list --post_type=page --format=ids --allow-root) --allow-root;

wp plugin update --all --allow-root

wp post create --post_type='post' --post_status=publish --post_title='Inception' --post_content="Un projet de kaliter" --post_thumbnail_id=7 --post_author=2 --allow-root
 
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php

chown -R www-data:www-data ./

/usr/sbin/php-fpm7.4 -F