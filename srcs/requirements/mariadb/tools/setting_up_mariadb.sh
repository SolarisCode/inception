#!/usr/bin/env bash

# Setting up MariaDB server and remove
# some insecure default settings and lock down access remote access
# using the root user.
setting_up_mariadb()
{
	service mariadb start
	mysql_secure_installation << EOF

	Y
	Y
	$MARIADB_ROOT_PASS
	$MARIADB_ROOT_PASS
	Y
	Y
	Y
	Y
EOF
	return $?
}

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

setting_up_mariadb
if [ $? = 1 ]; then
	echo "MariaDB setup failed!"
	exit
else
	echo "MariaDB setup was Successful!"
fi

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
