FROM httpd:latest

COPY ./docker/apache/vhost.conf /usr/local/apache2/conf/extra/vhost.conf

# Enable Apache modules to ensure proper functionality
RUN sed -i \
   # Uncomment the configuration for mod_deflate to enable compression
    -e '/#LoadModule deflate_module/s/^#//g' \
    # Uncomment the configuration for mod_proxy to enable proxying capabilities
    -e '/#LoadModule proxy_module/s/^#//g' \
    # Uncomment the configuration for mod_proxy_fcgi to enable FastCGI proxy module
    -e '/#LoadModule proxy_fcgi_module/s/^#//g' \
    /usr/local/apache2/conf/httpd.conf

# Include the virtual host configuration file in the main Apache configuration
RUN echo "Include /usr/local/apache2/conf/extra/vhost.conf" >> /usr/local/apache2/conf/httpd.conf