#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

# 修改root密码
sudo echo "sudopsw" | sudo -S echo 'root:root' | sudo chpasswd
sudo -root -s /bin/sh /vagrant/envs/init.sh