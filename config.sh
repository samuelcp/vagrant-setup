#!/bin/sh

# Author  : Samuel CP
# Purpose : Configure settings of related software
# 			Running in Ubuntu 14.04 LTS

# --------------- USAGE ---------------
# Execute this file inside directory
#
# 	$ ./config.sh
# 	

# -------------------------------------
# Time zone
# -------------------------------------
# sudo timedatectl set-timezone UTC

# -------------------------------------
# Register HHVM startup
# -------------------------------------
sudo update-rc.d hhvm defaults

# -------------------------------------
# Register nginx config file here...
# -------------------------------------
sudo cp conf/hhvm-with-fallback.conf /etc/nginx

# -------------------------------------
# Register pm2 services (auto start)
# -------------------------------------
sudo cp conf/workaround-vagrant-bug-6074.conf /etc/init
sudo cp conf/pm2-upstart.conf /etc/init

# -------------------------------------
# Register redis server (auto start)
# -------------------------------------
sudo mkdir /etc/redis
sudo mkdir -p /var/redis/6379
sudo cp redis-stable/utils/redis_init_script /etc/init.d/redis_6379
sudo cp conf/redis.conf /etc/redis/6379.conf
sudo update-rc.d redis_6379 defaults
sudo rm -r redis-stable
sudo rm redis-stable.tar.gz
