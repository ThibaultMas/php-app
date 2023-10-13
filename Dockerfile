FROM php:7.4-apache-bullseye

RUN apt-get update && \
    apt-get install --yes \
    git \
    wget \
    ffmpeg \
    lsb-release

RUN docker-php-ext-install sockets
RUN docker-php-ext-install bcmath

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.6.2

COPY . /app
WORKDIR /app

RUN composer install


