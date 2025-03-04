FROM php:8.2-apache

# On active les extensions MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# On copier les fichiers PHP
COPY index.php /var/www/html/

EXPOSE 80