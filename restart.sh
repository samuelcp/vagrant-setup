#!/bin/sh

# Author  : Samuel CP
# Purpose : Run/restart services
# 			Running in Ubuntu 14.04 LTS

# --------------- USAGE ---------------
# Execute this file inside directory
#
# 	$ ./restart.sh
# 	

sudo service nginx restart
sudo service mysql restart
sudo service php5-fpm restart
sudo service hhvm restart
