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
define( 'DB_NAME', 'wp' );

/** Database username */
define( 'DB_USER', 'wp' );

/** Database password */
define( 'DB_PASSWORD', 'wp' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

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
define( 'AUTH_KEY',         ';}G@x6>EdL]j,E}5*>Un=>D$KC/u$60*~lnu(w9NCIHp^4V6GkdzO)?oK%]&6;i<' );
define( 'SECURE_AUTH_KEY',  't69*xo5E|9nBqo)Xz7J K!)`Gxvx<@,Q&{c &k+7mr(*{6tsQ6m5aZkR-l`NV8Lm' );
define( 'LOGGED_IN_KEY',    '$WMT]0FxWe|^`f$dYI~|T[othiOB8f(o?uO2Y|TH7x/fI0wVdN1V-yv;.Yd|z9y.' );
define( 'NONCE_KEY',        'f;8wSeS,Qxx9Iq_Nqb7f>Wi%HD($Zc4An@k|b/h@g6vNC<}*B.&p[fPLf=(U~n1~' );
define( 'AUTH_SALT',        '6R>D.~(KJ8`RUF7&yf-EQ5^$G#=J^in9B~I7}tvjz#ee=5irW<bOd6htvaNqHp3W' );
define( 'SECURE_AUTH_SALT', 'kVu@?^auD I>?-19)?yjY?0{SHYXi!VcB$>iF|fQEqe~psb:DjfJfzpLE?L~rvXM' );
define( 'LOGGED_IN_SALT',   'Ea~DeUxI><F(NI(&F`RlXf5M|XQ]x1_12i=#=N^z5pX5$c^vr;1!f))L3qw.2v<,' );
define( 'NONCE_SALT',       '%6l0aB{uzJAY,TI~A/6|y3}m16%%t3%s9l`oD@^FpDi_NNfm/&g`AQ}G<0?sE(H}' );

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
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
