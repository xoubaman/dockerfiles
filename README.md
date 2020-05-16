# Dockerfiles

Another personal Dockerfiles and Docker images repository.

## PHP

Based on php fpm alpine images packed with:

* Xdebug
* Composer
* Infection

Available tags:

* xoubaman/php:7.3-dev
* xoubaman/php:7.4-dev

Using composer without installing it locally:
    
    docker run --rm -v $(pwd):/app -u $(id -u):$(id -g) xoubaman/php:7.4-dev composer install



