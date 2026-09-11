FROM php:5.6-apache

RUN a2enmod rewrite \
    && docker-php-ext-install mysql mysqli pdo_mysql \
    && printf '%s\n' \
      '<Directory /var/www/html>' \
      '    Options FollowSymLinks' \
      '    AllowOverride All' \
      '    Require all granted' \
      '</Directory>' \
      > /etc/apache2/conf-available/miruslug.conf \
    && a2enconf miruslug

COPY sources/miruslug/ /var/www/html/
COPY legacy-docker/config.inc.php /var/www/html/manager/includes/config.inc.php
COPY legacy-docker/php.ini /usr/local/etc/php/conf.d/miruslug.ini

# The archived MODX page cache contains absolute URLs for the old production
# domain (miruslug.kz). Remove rendered page caches so MODX rebuilds them from
# the current Host header, e.g. http://localhost:8080 when running locally.
RUN rm -f /var/www/html/assets/cache/docid_*.pageCache.php \
    && mkdir -p /var/www/html/assets/cache \
    && chown -R www-data:www-data /var/www/html/assets/cache \
    && find /var/www/html -type d -exec chmod 755 {} \; \
    && find /var/www/html -type f -exec chmod 644 {} \;

EXPOSE 80
