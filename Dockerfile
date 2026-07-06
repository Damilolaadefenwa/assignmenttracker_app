# This file downloads an operating system with PHP 8.2 and Apache

# 1. Use the latest official PHP runtime with Apache
FROM php:8.2-apache

# 2. Install MariaDB (MySQL) and required dependencies
RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# 3. Install PHP extensions for MySQL (both standard and PDO)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 4. Set the working directory
WORKDIR /var/www/html

# 5. Copy your application files into the container
COPY . /var/www/html

# 6. Copy custom Apache configuration (from apache.conf)
COPY apache.conf /etc/apache2/sites-available/000-default.conf
# Enable Apache modules
RUN a2enmod rewrite

# 7. Copy our startup scripts to the root of the container
COPY init.sql /init.sql
COPY start.sh /start.sh

# 8. Make the start-up script executable
RUN chmod +x /start.sh

# 9. Expose port 80
EXPOSE 80

# 10. Run our custom startup script instead of the default Apache command
CMD ["/start.sh"]