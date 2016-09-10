#!/bin/bash

echo "DRUPAL_DIR: $DRUPAL_DIR"
echo "MODULE_DIR: $MODULE_DIR"
echo SIMPLETEST_BASE_URL
echo SIMPLETEST_DB
echo  $(pwd)
ls -al

case "$1" in
    PHP_CodeSniffer)
        cd $MODULE_DIR
        ls -al
        composer install
        ./vendor/bin/phpcs
        exit $?
        ;;
    *)
        ln -s $MODULE_DIR $DRUPAL_DIR/modules/og
        cd $DRUPAL_DIR
        ls -al
        ./vendor/bin/phpunit -c ./core/phpunit.xml.dist $MODULE_DIR/tests
        exit $?
esac
