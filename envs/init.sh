#!/bin/sh

# 修改系统时区
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 更换源为阿里云
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
cat > /etc/apt/sources.list <<EOF
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
EOF
sudo apt-get update
sudo apt-get upgrade -y

# 修改composer镜像
composer config -g repo.packagist composer https://packagist.phpcomposer.com

# npm还原
sudo npm config set registry https://registry.npm.taobao.org

# php扩展 
# php配置文件使用作者
sudo apt-get install -y php-redis 

## php7.1扩展
sudo apt-get install -y php7.1-mcrypt php7.1-gmp php7.1-simplexml 

## php7.2扩展
sudo apt-get install -y php7.2-gmp php7.2-mbstring php7.2-xml 

## php7.3扩展
sudo apt-get install -y php7.3-gmp 

## php重启
sudo service php7.1-fpm restart
sudo service php7.2-fpm restart
sudo service php7.3-fpm restart

# 软件安装

## htop 活动监视器
## wkhtmltopdf H5生成pdf插件，CMS教师简历生成用
sudo apt-get install -y htop wkhtmltopdf 

# mysql设置

## 修改sql_mode，兼容order、group by
sudo echo 'sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES' >> /etc/mysql/mysql.conf.d/mysqld.cnf

# mysql -hlocalhost -uroot -psecret mysql < /vagrant/envs/init.sql

## 修改mysql密码
cat > /root/.my.cnf << EOF
[client]
user = root
password = root
host = localhost
EOF

cp /root/.my.cnf /home/vagrant/.my.cnf
sudo service mysql restart