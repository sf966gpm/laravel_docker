FROM httpd:2.4-alpine

COPY ./docker/apache/httpd.conf /usr/local/apache2/conf/httpd.conf
#COPY ./src /var/www/html