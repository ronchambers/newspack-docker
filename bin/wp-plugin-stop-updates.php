<?php
/**
 * Plugin Name: Stop Auto-Updates
 * Description: Stop Auto-Updates
 */

// Stop auto-updates for plugins.
add_filter( 'auto_update_plugin', '__return_false' );

// Stop auto-updates for themes.
add_filter( 'auto_update_theme', '__return_false' );

// https://github.com/Automattic/newspack-manager/blob/95c1bef3a227dba2349249d183f45bb895297828/includes/class-newspack-plugin-autoupdates.php

// Other ideas from the internet...
// add_filter( 'automatic_updater_disabled', '__return_true' );
// add_filter( 'allow_dev_auto_core_updates', '__return_false' );
// add_filter( 'allow_minor_auto_core_updates', '__return_false' );
// add_filter( 'allow_major_auto_core_updates', '__return_false' );
// add_filter( 'auto_update_translation', '__return_false' );

// Other ideas from chatgpt...
// remove_action('load-update-core.php', 'wp_update_plugins');
// add_filter('pre_site_transient_update_plugins', '__return_null');
