#!/bin/bash

sudo apt update -y
sudo apt install nginx -y

sudo chown ubuntu:ubuntu /var/www/html/
