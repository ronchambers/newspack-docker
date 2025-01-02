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

# reset configs without running any plugin/theme code.
wp --allow-root --path=${WP_PATH} --skip-plugins --skip-themes config set AUTOMATIC_UPDATER_DISABLED true --raw --type=constant
wp --allow-root --path=${WP_PATH} --skip-plugins --skip-themes config set DISABLE_WP_CRON true --raw --type=constant
wp --allow-root --path=${WP_PATH} --skip-plugins --skip-themes config set WP_AUTO_UPDATE_CORE false --raw --type=constant

# stop auto updates
cp "/var/scripts/wp-plugin-stop-updates.php" "${WP_PATH}/wp-content/mu-plugins/"
