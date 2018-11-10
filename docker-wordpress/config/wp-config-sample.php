<?php

define( 'DB_NAME', 'MYSQL_DATABASE' );
define( 'DB_USER', 'MYSQL_USER' );
define( 'DB_PASSWORD', 'MYSQL_PASSWORD' );
define( 'DB_HOST', 'WP_DB_HOST' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
$WORDPRESS_SALT;


$table_prefix = 'WP_PREFIX';

define( 'WP_DEBUG', false );
define( 'WP_MEMORY_LIMIT', '256M' );
define( 'WP_MAX_MEMORY_LIMIT', '512M' );
define( 'WP_CACHE', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}
require_once( ABSPATH . 'wp-settings.php' );
