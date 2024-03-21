#!/bin/bash

# Start MySQL service
service mysql start

# Execute MySQL commands to create database and user
mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

# Stop MySQL service
service mysql stop

exec supervisord -n