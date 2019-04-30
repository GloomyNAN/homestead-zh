#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
sudo apt-get update

# 修改composer镜像
composer config -g repo.packagist composer https://packagist.phpcomposer.com

# npm还原
sudo npm config set registry https://registry.npm.taobao.org

# php扩展
sudo apt-get install php-redis -y

## php7.1扩展
sudo apt-get install php7.1-mcrypt php7.1-gmp php7.1-simplexml -y

## php7.2扩展
sudo apt-get install php7.2-gmp php7.2-mbstring php7.2-xml -y 

## php7.3扩展
sudo apt-get install php7.3-gmp -t

# wkhtmltopdf H5生成pdf插件，教师简历生成用
wkhtmltopdf -y