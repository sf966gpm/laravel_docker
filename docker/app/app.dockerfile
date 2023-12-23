FROM php:8.2-fpm

#RUN apt install
RUN docker-php-ext-install pdo pdo_mysql
USER www-data