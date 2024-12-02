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

# link (migration) plugins:
/var/scripts/link-repos.sh "${WP_PATH}/wp-content"

# link action disabler
link="${WP_PATH}/wp-content/plugins/as-disable-default-runner.php"
if [ -L "${link}" ]; then
    echo "${link} already symlinked"
else
    ln -s "/var/scripts/as-disable-default-runner.php" "${WP_PATH}/wp-content/plugins/"
fi
wp --allow-root --path=${WP_PATH} plugin activate "as-disable-default-runner"

# cap
wp --allow-root --path=${WP_PATH} plugin install co-authors-plus --version=3.6.3

# which versions?
# wp --allow-root --path=${WP_PATH} plugin install redirection --version=5.4.2 --activate
# wp --allow-root --path=${WP_PATH} plugin install wordpress-seo --version=22.2 --activate

