#!/usr/bin/env bash

# Create the WordPress database on MariaDB server and configure it.
create_configure_database()
{
	mysql -u"$MARIADB_ROOT_USER" -p"$MARIADB_ROOT_PASS" << EOF
	CREATE DATABASE IF NOT EXISTS $MARIADB_NAME ;
	CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASS' ;
	GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$WP_USER'@'%' ;
	FLUSH PRIVILEGES;
EOF
	return $?
}

# Start MariaDB server.
service mariadb start
create_configure_database
if [ $? = 1 ]; then
	echo "MariaDB Configuration failed!"
	exit
else
	echo "MariaDB has been configured successfully!"
fi

# Stop MariaDB service to make sure there is no other instances running
service mariadb stop
mysqld
