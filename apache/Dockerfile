FROM php:8.2-apache

# Installer le client MySQL
RUN apt-get update && apt-get install -y default-mysql-client

# On active les extensions MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# On copier les fichiers PHP
COPY index.php /var/www/html/

# Wait for it
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["/wait-for-it.sh"]

EXPOSE 80