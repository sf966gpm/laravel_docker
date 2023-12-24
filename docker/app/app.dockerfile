FROM php:8.3-fpm-alpine
WORKDIR /var/www/html
RUN apk add zip unzip

# удобная сборка зависимостей
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
COPY --from=composer:2.6 /usr/bin/composer /usr/local/bin/composer

RUN install-php-extensions pdo pdo_pgsql pgsql \
    bcmath \
    soap \
    sockets




#COPY ./src /var/www/html
#RUN chmod -R storage
#RUN composer install

#RUN adduser -D app && chown app:app -R /var/www/html
#USER app