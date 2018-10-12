FROM php:7.2-apache

LABEL maintener=@dez
RUN docker-php-ext-install pdo_mysql \
&& useradd -g www-data newuser \
&& sed -i "s/DocumentRoot\ \/var\/www\/html/DocumentRoot\ \/var\/www\/monsite/" /etc/apache2/sites-available/000-default.conf \
&& mkdir /var/www/monsite \
&& cd /var/www/monsite \
&& curl https://raw.githubusercontent.com/IBM-Cloud/phpinfo/master/index.php  | xargs | rev | cut -c3- | rev | tee index.php \
&& echo '<?php echo "Version PHP courante: " . phpversion();?>' > version.php \
&& chown newuser:www-data version.php \
&& chmod 770 version.php
