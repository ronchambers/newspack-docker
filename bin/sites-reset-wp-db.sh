#!/bin/bash

name=$1

if [ -z "${name}" ]; then    
    echo "Blank name is not allowed."
    exit
fi

if [ ! -d "/var/www/additional-sites-html/$name" ]; then    
    echo "Site $name does not exist!"
    exit
fi

WP_PATH="/var/www/additional-sites-html/${name}"
echo "Running for ${WP_PATH}"

# clean db - remove ONLY the $table_prefix = 'wp_'; tables.  other tables (if exits) will stay as is.
wp --allow-root --path=${WP_PATH} --skip-plugins --skip-themes db clean

# Install WP core
wp --allow-root --path=${WP_PATH} core install \
	--url="${name}.local" \
	--title="${name} Local Site" \
	--admin_user=${WP_ADMIN_USER} \
	--admin_password=${WP_ADMIN_PASSWORD} \
	--admin_email=${WP_ADMIN_EMAIL} \
	--skip-email

