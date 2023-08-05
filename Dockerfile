# base image
FROM php:5.6-apache

RUN apt-get update && \
    apt-get install -y libonig-dev libicu-dev icu-devtools unzip git

# set PHP configuration
RUN echo "upload_max_filesize = 10M" >> /usr/local/etc/php/php.ini \
    && echo "post_max_size = 20M" >> /usr/local/etc/php/php.ini

RUN docker-php-ext-install mysqli pdo_mysql intl

# enable mod_rewrite
RUN a2enmod rewrite

# copy application to container
COPY . /var/www/html/

# set permissions
RUN chown -R www-data:www-data /var/www/html/
RUN cd /var/www/html/
RUN chmod 777 -R *

# expose port 80 for web traffic
EXPOSE 80

# run Apache in the foreground to keep the container running
CMD ["apache2-foreground"]