<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name' );

/** Database username */
define( 'DB_USER', 'username' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Q.5fd6;Cyd475g}MXSv8C06Z*x7Lx|+%jb(4k-$q>%[@f1645qgCPFTt+v9{1Zs-');
define('SECURE_AUTH_KEY',  'VFT%{Hb>ZAJl|:QV9A--$]ShO{IODe09&<|>_&[}|fdo|>oEN~e%e;nkzc0&8|u#');
define('LOGGED_IN_KEY',    '{)-U  |2|9Q-=O]&,%u#:2kS{u5=:tRA$s](Qq0;Z;qiev|CK*0/njWO5p4ft>yp');
define('NONCE_KEY',        'aK=;p%%|Q#TW?H}^5Ta>b`=yZ$4|, vI){D#be~?X]KD+Ii01P9_=-qzN: wk0E%');
define('AUTH_SALT',        'Ym<XZPbBt+K!Kdu<([~Yb5 -}5BOfZc{ri%:A~:f7E+C< LuHN!`EAd] <q(y#J@');
define('SECURE_AUTH_SALT', ':-/.S.Rp0=TA_Vvr-p}NXRqOoTs,,.+2CjL:/HhV~E<X)qzJwlya(}4zooq%|U}G');
define('LOGGED_IN_SALT',   '6CfZ]=$FDe#Ysi#FnPv kV+7R{u,@vs;k9|ux;7A=<D%frlDTBi!5]Cd`}WJJIW5');
define('NONCE_SALT',       '@aSE4#;]z&tS*@SYHMuHa,o915Q*qx/A`+O[@rfYpwYOhAZMY=],rU-(Cx;V;_. ');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>
