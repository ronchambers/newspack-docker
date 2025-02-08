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

# urls
wp --allow-root --path=${WP_PATH} --skip-plugins --skip-themes option update home "https://${name}.local"
wp --allow-root --path=${WP_PATH} --skip-plugins --skip-themes option update siteurl "https://${name}.local"

# admin email
wp --allow-root --path=${WP_PATH} --skip-plugins --skip-themes option update admin_email ${WP_ADMIN_EMAIL}

# remove all plugins
wp --allow-root --path=${WP_PATH} --skip-plugins --skip-themes option delete active_plugins

# user pass
wp --allow-root --path=${WP_PATH} --skip-plugins --skip-themes user update "adminnewspack" --user_pass="test" --user_email=${WP_ADMIN_EMAIL}


