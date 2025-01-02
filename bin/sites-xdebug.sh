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

# stop auto-ajax that interfere with debugging.
cp "/var/scripts/as-disable-default-runner.php" "${WP_PATH}/wp-content/mu-plugins/" 
cp "/var/scripts/wp-plugin-helper-no-heartbeat.php" "${WP_PATH}/wp-content/mu-plugins/"

# stop favicon.ico interuption.
cp "/var/scripts/img/favicon.ico" "${WP_PATH}/"
