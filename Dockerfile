FROM php:7.3-apache

# Apache mod_rewrite
RUN a2enmod rewrite

# Create working and temp directory
RUN cd /var/www && mkdir var/ && chmod -R 0777 var/
RUN mkdir /app

# Copy code-base
COPY example/ /var/www/html
COPY vendor/ /var/www/vendor
COPY src/ /var/www/src

# Copy dummy data for trying
COPY example/dag.neon /app/dag.neon

# Make symlink
RUN ln -sf /app/dag.neon

WORKDIR /app

EXPOSE 80
