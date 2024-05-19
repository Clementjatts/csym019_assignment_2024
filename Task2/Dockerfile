FROM php:8.2-apache

# Install necessary PHP extensions
RUN docker-php-ext-install pdo_mysql

# Enable Apache modules
RUN a2enmod headers

# Add custom Apache configuration directly in the Dockerfile
RUN echo "ServerName localhost\n\
<Directory /var/www/html>\n\
Options Indexes FollowSymLinks\n\
AllowOverride All\n\
Require all granted\n\
DirectoryIndex Login.html\n\
</Directory>\n\
AddHandler application/x-httpd-php .html" \
>> /etc/apache2/sites-available/000-default.conf

# Ensure ownership and permissions are correct inside the container
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy application source code to the container
COPY src/ /var/www/html/
