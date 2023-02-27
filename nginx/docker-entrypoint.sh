#!/bin/bash
set +x

if [[ -f "/var/www/composer.json" ]] 
then
    cd /var/www/
    if [[ -d "/var/www/vendor" ]] 
    then                                                                                                                                  "
        sudo composer update
        echo "Laravel - Clear All [Development]"
    else                                                                                                                            "
        sudo composer install
    fi

fi

if [[ "$(ls -A "/var/www/")" ]] 
then
    echo "Directory is not Empty, Please deleted hiden file and directory"
else
    cd /var/www/
    sudo symfony check:requirements
    sudo symfony new .
    sudo composer req --dev maker ormfixtures fakerphp/faker --no-cache
    sudo composer req doctrine twig
    sudo cp .env .env.local
fi
if [[ {PHP_VERSION} == 7.4 ]] 
then
    sudo composer require doctrine/annotations
fi
sudo cp /app/default.conf /etc/nginx/conf.d/default.conf
sudo chown -R nobody:nobody /var/www 2> /dev/null
sudo rm -rf /var/preview
nginx -s reload
echo "App is ready for use"
exec "$@"