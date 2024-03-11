#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;

mkdir -p /run/php/;

touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	
    # Folder for all the web related files
	mkdir -p /var/www/html;

    # Download wp-cli
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;

	cd /var/www/html;

    # Download and extract core files wordpress
	wp core download --allow-root;

	# Move the config file to the html folder
	mv /var/www/wp-config.php /var/www/html/wp-config.php;

    # Enter the .env variables into the wp-config.php file
	sed -i "s/define( 'DB_NAME', 'DB_NAME' );/define( 'DB_NAME', '${DB_NAME}' );/" /var/www/html/wp-config.php;
	sed -i "s/define( 'DB_USER', 'WP_ADMIN_LOGIN' );/define( 'DB_USER', '${WP_ADMIN_LOGIN}' );/" /var/www/html/wp-config.php;
	sed -i "s/define( 'DB_PASSWORD', 'WP_ADMIN_PASSWORD' );/define( 'DB_PASSWORD', '${WP_ADMIN_PASSWORD}' );/" /var/www/html/wp-config.php;

	# Install wordpress with the env variables
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL};
	# Create a new user
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
fi

# Also set url settings to odan.42.fr in wp dashboard
# Allow all comments through wp dashboard

exec "$@"
