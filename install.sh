#!/bin/sh

# Author  : Samuel CP
# Purpose : Install required software in Vagrant VM
# 			Running in Ubuntu 14.04 LTS

# --------------- USAGE ---------------
# Execute this file inside directory
#
# 	$ ./install.sh
# 	

# -------------------------------------
# Add source directories
# ------------------------------------- 
sudo apt-get install software-properties-common

# Nginx
wget -O - http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
echo deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx | sudo tee /etc/apt/sources.list.d/nginx.list

# MariaDB
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main'

# HHVM
wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu trusty main | sudo tee /etc/apt/sources.list.d/hhvm.list

sudo apt-get update

# -------------------------------------
# Installing...
# -------------------------------------
# Git
sudo apt-get -y install git

# Nginx
sudo apt-get -y install nginx

# MariaDB
sudo apt-get -y install mariadb-server

# PHP & HHVM
sudo apt-get -y install php5-fpm php5-mysql php5-curl	
sudo apt-get -y install hhvm
sudo /usr/share/hhvm/install_fastcgi.sh

# Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# NodeJS & PM2
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get -y install nodejs
sudo npm install pm2 -g

# Redis
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
sudo make install
cd