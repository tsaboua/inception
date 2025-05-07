#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sleep 10

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOST --allow-root
./wp-cli.phar core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_AUSER --admin_password=$WP_APASS --admin_email=$WP_ADMIN_EMAIL --allow-root
./wp-cli.phar user create $WP_USER $WP_USER_EMAIL --role=subscriber --user_pass=$WP_PASS --allow-root

php-fpm7.4 -F
