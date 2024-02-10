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
	GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$WP_USER'@'%' WITH GRANT OPTION ;
	FLUSH PRIVILEGES;
EOF
	return $?
}

# Start setting up MariaDB.
setting_up_mariadb
if [ $? = 1 ]; then
	echo "MariaDB setup failed!"
	exit
else
	echo "MariaDB setup was Successful!"
fi

# Create WordPress database and its user.
create_configure_database
if [ $? = 1 ]; then
	echo "MariaDB Configuration failed!"
	exit
else
	echo "MariaDB has been configured successfully!"
fi

# Stop MariaDB service to make sure there is no other instances running
# then start it again and tie it to the current terminal session.
service mariadb stop
mysqld
