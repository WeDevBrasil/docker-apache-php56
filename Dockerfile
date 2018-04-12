FROM php:5.6-apache

MAINTAINER Thiago Moreira <loganguns@gmail.com>

COPY ./config/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./config/php/php.ini /usr/local/etc/php/

RUN docker-php-ext-install mysql && \
	docker-php-ext-install pdo pdo_mysql && \
	docker-php-ext-install mysqli && \
        a2ensite 000-default.conf && \
	a2enmod rewrite

WORKDIR /var/app/web
