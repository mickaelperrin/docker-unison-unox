#!/usr/bin/env bash
set -e

if [ "$1" == 'supervisord' ]; then

    [ ! -d $UNISON_DIR ] && mkdir -p $UNISON_DIR

    if [ ! -z $UNISON_OWNER_UID ]; then

        mkdir -p /home/www-data

        [ ! $(id -u www-data) ] && adduser -h /home/www-data -u $UNISON_OWNER_UID -D www-data

        chown -R www-data $UNISON_DIR
        chown -R www-data /home/www-data
     else
        UNISON_MANAGE_OWNER=""
     fi

    # Check if a script is available in /docker-entrypoint.d and source it
    for f in /docker-entrypoint.d/*; do
        case "$f" in
            *.sh)     echo "$0: running $f"; . "$f" ;;
            *)        echo "$0: ignoring $f" ;;
        esac
    done
fi

exec "$@"
