#! /usr/bin/env bash

# Getting the wp-cli tool and test if it works properly.
install_test_wp_cli()
{
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	return $?
}

# Change wp-cli permissions and move it to the local executoion directory the update it.
configure_update_wp_cli()
{
	chmod u+x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp cli update
}

# Download WordPress and create its configuration file.
download_configure_wordpress()
{
	cd /var/www/html
	wp core download --allow-root
	mv /wp_cli/wp-config.php .
	sed -i -E "s/database_name/$MARIADB_NAME/1" ./wp-config.php
	sed -i -E "s/username/$WP_USER/1" ./wp-config.php
	sed -i -E "s/password/$WP_USER_PASS/1" ./wp-config.php
	return $?
}

# Install and setup WordPress cerdentials.
install_wordpress()
{
	wp core install \
		--url="melkholy.42.fr" \
		--title="Solariscode" \
		--admin_user="$WP_ADMIN_USER" \
		--admin_password="$WP_ADMIN_PASS" \
		--admin_email="$WP_ADMIN_EMAIL" \
		--skip-email \
		--allow-root
	return $?
}

# Setting up WordPress
setup_wordpress()
{
	wp rewrite structure '%postname%' --allow-root
	# wp plugin delete akismet hello
	# wp plugin install
	# wp plugin activate --all
}

install_test_wp_cli
if [ $? = 1 ]; then
	echo "WP-Cli installation failed!"
	exit
fi

configure_update_wp_cli
download_configure_wordpress
if [ $? = 1 ]; then
	echo "WP-Cli Configuration failed!"
	exit
fi

install_wordpress
if [ $? = 1 ]; then
	echo "WP-Cli Installation failed!"
	exit
fi

setup_wordpress
echo "Setting up WordPress was successfull!"
sed -i -E 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
/usr/sbin/php-fpm8.2 -F
