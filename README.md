# Dockerfiles

Another personal Dockerfiles and Docker images repository.

## PHP

Available tags:

* xoubaman/php:7.2-dev
* xoubaman/php:7.3-dev
* xoubaman/php:7.4-dev
* xoubaman/php:8.0-dev

Based on php fpm alpine with **Xdebug** enabled.

The following tools are installed using Phive and globally available, along with Phive itself:

* Composer v2
* Composer Require Checker
* Deptrac
* Infection
* Php Code Sniffer
* Php CS fixer
* Phpstan
* Phpunit
* Psalm

Hence you can call any of them out of the box:
    
     docker run --rm -v $(pwd):/app -u $(id -u):$(id -g) xoubaman/php:7.4-dev composer require xoubaman/json



