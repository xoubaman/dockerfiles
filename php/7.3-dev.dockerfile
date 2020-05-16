FROM php:7.3-fpm-alpine3.11

RUN apk --update --no-cache add autoconf g++ make \
    && pecl install -f xdebug \
    && docker-php-ext-enable xdebug \
    && apk del --purge autoconf g++ make

RUN wget https://github.com/infection/infection/releases/download/0.16.3/infection.phar \
    && mv infection.phar /usr/local/bin/infection \
    && chmod +x /usr/local/bin/infection

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

WORKDIR /app
