#! /usr/bin/env bash

# Getting the wp-cli tool and test if it works properly.
install_test_wp_cli()
{
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	php wp-cli.phar --info
	return ($?)
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
	cd $WP_DIR
	wp core download --allow-root
	wp config create \
		--dbname=$MARIADB_NAME \
		--dbuser=$WP_USER \
		--dbpass=$WP_USER_PASS \
		--dbhost=$MARIADB_SERVER
	test -b wp-config.php
	return ($?)
}

# Install and setup WordPress cerdentials.
install_wordpress()
{
	wp db create --path=$WP_DIR
	wp core install \
		--url="melkholy.42.fr" \
		--title="Solariscode" \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASS \
		--admin-email=$WP_ADMIN_EMAIL \
		--path=$WP_DIR
	return ($?)
}

# Setting up WordPress
setup_wordpress()
{
	wp rewrite structure '%postname%'
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
