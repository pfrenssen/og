#!/bin/bash

echo "DRUPAL_DIR: $DRUPAL_DIR"
echo "MODULE_DIR: $MODULE_DIR"
echo  $(pwd)

case "$1" in
    PHP_CodeSniffer)
        cd $MODULE_DIR
        composer install
        ./vendor/bin/phpcs
        exit $?
        ;;
    *)
        ln -s $MODULE_DIR $DRUPAL_DIR/modules/og
        cd $DRUPAL_DIR
        ./vendor/bin/phpunit -c ./core/phpunit.xml.dist $MODULE_DIR
        exit $?
esac
