#!/bin/bash
if [ -f "/var/www/composer.json" ]
then
    cd /var/www/
    
echo "  ______                                                   _                           _  _        _                                   ";
echo " / _____)                                                 (_)              _          | || | _    (_)                                  ";
echo "| /       ___   ____   ____    ___    ___   ____   ____    _  ____    ___ | |_   ____ | || || |_   _   ___   ____                      ";
echo "| |      / _ \ |    \ |  _ \  / _ \  /___) / _  ) / ___)  | ||  _ \  /___)|  _) / _  || || ||  _) | | / _ \ |  _ \                     ";
echo "| \_____| |_| || | | || | | || |_| ||___ |( (/ / | |      | || | | ||___ || |__( ( | || || || |__ | || |_| || | | |   _  _  _  _  _  _ ";
echo " \______)\___/ |_|_|_|| ||_/  \___/ (___/  \____)|_|      |_||_| |_|(___/  \___)\_||_||_||_| \___)|_| \___/ |_| |_|  (_)(_)(_)(_)(_)(_)";
echo "                      |_|                                                                                                              ";

    composer install
    echo "Dependencies updated"
elif [ {SYMFONY_INSTALL} = true ];
then
    cd /var/www/
    composer install
    echo "Dependencies updated"
elif [ "$(ls -A "/var/www/")" ]; 
then
    echo "Directory is not Empty, Please deleted hiden file and directory"
else 
    cd /var/www/
    symfony check:requirements
    
echo "  ______                                                   _                           _  _        _                                   ";
echo " / _____)                                                 (_)              _          | || | _    (_)                                  ";
echo "| /       ___   ____   ____    ___    ___   ____   ____    _  ____    ___ | |_   ____ | || || |_   _   ___   ____                      ";
echo "| |      / _ \ |    \ |  _ \  / _ \  /___) / _  ) / ___)  | ||  _ \  /___)|  _) / _  || || ||  _) | | / _ \ |  _ \                     ";
echo "| \_____| |_| || | | || | | || |_| ||___ |( (/ / | |      | || | | ||___ || |__( ( | || || || |__ | || |_| || | | |   _  _  _  _  _  _ ";
echo " \______)\___/ |_|_|_|| ||_/  \___/ (___/  \____)|_|      |_||_| |_|(___/  \___)\_||_||_||_| \___)|_| \___/ |_| |_|  (_)(_)(_)(_)(_)(_)";
echo "                      |_|                                                                                                              ";

    symfony new .
    composer req --dev maker ormfixtures fakerphp/faker
    composer req doctrine twig
    cp .env .env.local
fi

exec "$@"