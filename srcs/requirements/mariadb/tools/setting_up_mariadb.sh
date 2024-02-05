#!/usr/bin/env bash

# Create the WordPress database on MariaDB server and configure it.
create_configure_database()
{
	mysql -u$MARIADB_ROOT_USER -p$MARIADB_ROOT_PASS << EOF
	CREATE DATABASE $MARIADB_NAME ;
	CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASS' ;
	GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$WP_USER'@'%' ;
	FLUSH PRIVILEGES;
EOF
	return ($?)
}

# Start MariaDB server.
service mariadb start
create_configure_database
If [ $? = 1 ]; then
	echo "MariaDB Configuration failed!"
	exit
fi

# Change the access for the WP_USER from localhost to outside hosts
sed -i -E "s/127.0.0.1/0.0.0.0/1" /etc/mysql/mariadb.conf.d/50-server.cnf
