## Introduction

[Symfony](https://symfony.com/), is a web application framework written in [PHP](http://www.php.net) under [MIT License](http://symfony.com/doc/current/contributing/code/license.html).

The Symfony Development Container has been carefully engineered to provide you and your team with a highly reproducible Symfony development environment. We hope you find the Symfony Development Container useful in your quest for world domination. Happy hacking!


## Getting started
### Install
#### Using DECK

Install symfony from the DECK marketplace and follow the instructions on the GUI

#### From terminal with Docker
The quickest way to get started with the Symfony Development Container is using docker-compose.
Download the docker-compose.yml file in the application directory:
```
$ git clone https://github.com/deck-app/symfony.git
$ cd symfony
$ docker-compose up -d
```
### Modifying project settings
From the DECK app, go to stack list and click on project's ` More > configure > Advanced configuration ` Follow the instructions below and restart your stack from the GUI

#### Edit Nginx configuration
default.conf is located at ` /nginx/default.conf`
#### Editing php.in
PHP ini file is located at `./nginx/php_ini/php{YOUR.PHP.VERSION}.ini`
#### Edit Apache configuration
httpd.conf is located at `./apache/httpd.conf`
#### Editing php.in
PHP ini file is located at `./apache/php_ini/php{YOUR.PHP.VERSION}.ini`
### Installing / removing PHP extensions
Add `/` remove PHP extensions from `./apache/Dockerfile-{YOUR.PHP.VERSION}`
```
RUN apk add --update --no-cache bash \
                curl \
                curl-dev \
                php5-intl \
                php5-openssl \
                php5-dba \
                php5-sqlite3 \
```
#### Rebuilding from terminal
You have to rebuild the docker image after you make any changes to the project configuration, use the snippet below to rebuild and restart the stack
```
docker-compose stop && docker-compose up --build -d
````