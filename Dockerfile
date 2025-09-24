FROM php:8.2-fpm

WORKDIR /var/www/

#library linux
RUN apt-get update -y && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    zlib1g-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo mbstring zip exif pcntl bcmath gd

#composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#php extentions
RUN docker-php-ext-install gettext intl pdo_mysql gd
