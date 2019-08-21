#!/bin/sh

# 修改系统时区
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 更换源为阿里云
my_sources=/vagrant/envs/sources.list
defalut_sources=/etc/apt/sources.list
if [ -f $my_sources ] && [ -f $defalut_sources ]
then
    diff $my_sources $defalut_sources > /dev/null
    if [ $0 != 0 ]; 
    then
        sudo cp $defalut_sources $defalut_sources.bak
        sudo cp $my_sources $defalut_sources
        # Err:14 http://packages.blackfire.io/debian any InRelease
        # Q:The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 696DBE66A72D76DA
        # A:sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 696DBE66A72D76DA
        sudo apt-get update -y
        sudo apt-get upgrade -y
    fi
fi

# 修改composer镜像
composer config -g repo.packagist composer https://packagist.phpcomposer.com

# npm换源
sudo npm config set registry https://registry.npm.taobao.org

# 软件安装
sudo apt-get -y \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    install htop wkhtmltopdf \
    php-redis php-mongodb\
    php7.1-mcrypt php7.1-gmp php7.1-simplexml \
    php7.2-gmp php7.2-mbstring php7.2-xml php7.3-gmp 

# mysql设置

## 修改mysql密码
### mysql --print-defaults
sudo cat > /root/.my.cnf << EOF
[client]
user = root
password = root
host = localhost
EOF

sudo cp /root/.my.cnf /home/vagrant/.my.cnf
sudo cp /vagrant/envs/myopt.cnf /etc/mysql/mysql.conf.d/myopt.cnf
sudo service mysql restart