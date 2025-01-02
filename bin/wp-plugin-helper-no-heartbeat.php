<?php
/*
Plugin Name: WP Plugin Helper No Heartbeat
*/
add_action( 'init', function () { wp_deregister_script( 'heartbeat' ); } );
