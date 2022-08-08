## Introduction

[Symfony](https://symfony.com/), is a web application framework written in [PHP](http://www.php.net) under [MIT License](http://symfony.com/doc/current/contributing/code/license.html).

Symfony is an open source PHP framework with MVC architecture. It is one of the most popular application frameworks among the open source developers' community. It is used to build high-performance complex web applications


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
PHP ini file is located at `./nginx/php.ini`
#### Edit Apache configuration
httpd.conf is located at `./apache/httpd.conf`
#### Editing php.in
PHP ini file is located at `./apache/php.ini`
### Installing / removing PHP extensions
Add `/` remove PHP extensions from `./apache/Dockerfile-{YOUR.PHP.VERSION}`
```
RUN apk add --update --no-cache bash \
                curl \
                curl-dev \
                php7-intl \
                php7-openssl \
                php7-dba \
                php7-sqlite3 \
```
#### Rebuilding from terminal
You have to rebuild the docker image after you make any changes to the project configuration, use the snippet below to rebuild and restart the stack
```
docker-compose stop && docker-compose up --build -d
````