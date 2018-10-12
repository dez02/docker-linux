FROM php:7.2-apache

LABEL maintener=@dez
RUN docker-php-ext-install pdo_mysql \
&& useradd -g www-data newuser
