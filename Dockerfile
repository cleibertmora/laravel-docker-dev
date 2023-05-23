FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
    curl \
    g++ \
    git \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libonig-dev \
    libpng-dev \
    libreadline-dev \
    libxml2-dev \
    libzip-dev \
    sudo \
    unzip \
    zip \
 && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
    bcmath \
    bz2 \
    calendar \
    exif \
    iconv \
    intl \
    mbstring \
    opcache \
    pdo_mysql \
    soap \
    tokenizer \
    zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ARG uid
RUN useradd -G www-data,root -u $uid -d /home/devuser devuser
RUN mkdir -p /home/devuser/.composer && \
    chown -R devuser:devuser /home/devuser

WORKDIR /var/www/html

USER devuser

RUN composer global require laravel/installer

ENV PATH="/home/devuser/.composer/vendor/bin:${PATH}"

USER root

# Instalar Nginx
RUN apt-get update && apt-get install -y nginx

# Configurar Nginx
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

EXPOSE 80

CMD service nginx start && php-fpm
