#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
sudo apt-get update

# wkhtmltopdf H5生成pdf插件，教师简历生成用
sudo apt-get install php7.1-mcrypt php7.1-gmp php7.3-gmp  php-redis wkhtmltopdf -y