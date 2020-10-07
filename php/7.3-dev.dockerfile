FROM php:7.3-fpm-alpine3.11

RUN apk --update --no-cache add autoconf g++ make \
    && pecl install -f xdebug \
    && docker-php-ext-enable xdebug \
    && apk del --purge autoconf g++ make

RUN apk add gnupg ncurses
RUN wget -O phive.phar https://phar.io/releases/phive.phar \
    && wget -O phive.phar.asc https://phar.io/releases/phive.phar.asc \
    && gpg --keyserver pool.sks-keyservers.net --recv-keys 0x9D8A98B29B2D5D79 \
    && gpg --verify phive.phar.asc phive.phar \
    && mv phive.phar /usr/local/bin/phive \
    && chmod +x /usr/local/bin/phive \
    && rm phive.phar.asc

RUN phive install composer-require-checker  -g --trust-gpg-keys D2CCAC42F6295E7D
RUN phive install composer/composer         -g --force-accept-unsigned
RUN phive install deptrac                   -g --trust-gpg-keys EB008C0F094A779B
RUN phive install infection                 -g --trust-gpg-keys C5095986493B4AA0
RUN phive install php-cs-fixer              -g --trust-gpg-keys E82B2FB314E9906E
RUN phive install phpcs                     -g --trust-gpg-keys 31C7E470E2138192
RUN phive install phpstan                   -g --trust-gpg-keys CF1A108D0E7AE720
RUN phive install phpunit                   -g --trust-gpg-keys 4AA394086372C20A
RUN phive install psalm                     -g --trust-gpg-keys 8A03EA3B385DBAA1

RUN mkdir /app
RUN addgroup -S user && adduser -S user -G user
RUN chown user:user /app
USER user

WORKDIR /app
