sleep 5

if [ ! -f /var/www/html/wp-config.php ]
then
	echo "installing wordpress ..."
	cd /var/www/html
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp --allow-root --path=/var/www/html/ core download
	wp --allow-root --path=/var/www/html/ config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb:3306
	wp --allow-root --path=/var/www/html/ core install --url=$URL --title=$TITLE --admin_name=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL
	wp --allow-root user create $USER_NAME $USER_EMAIL --role=author --user_pass=$USER_PASS
	#wp --allow-root theme install twentytwentytwo --activate
	chown -R www-data:www-data /var/www/html 
else
	echo "wordpress is already in"
fi

php-fpm8.2 -F
