#!/bin/bash

HTTPD_PORT=$(cat /root/webservers.txt | grep apache | cut -d ',' -f2)
echo $HTTPD_PORT
sed -i "s/8000/$HTTPD_PORT/g" /etc/haproxy/haproxy.cfg

NGINX_PORT=$(cat /root/webservers.txt | grep nginx | cut -d ',' -f2)
echo $NGINX_PORT
sed -i "s/8010/$NGINX_PORT/g" /etc/haproxy/haproxy.cfg

PYTHON_PORT=$(cat /root/webservers.txt | grep python | cut -d ',' -f2)
echo $PYTHON_PORT
sed -i "s/8020/$PYTHON_PORT/g" /etc/haproxy/haproxy.cfg

PHP_PORT=$(cat /root/webservers.txt | grep php | cut -d ',' -f2)
echo $PHP_PORT
sed -i "s/8030/$PHP_PORT/g" /etc/haproxy/haproxy.cfg

PERL_PORT=$(cat /root/webservers.txt | grep perl | cut -d ',' -f2)
echo $PERL_PORT
sed -i "s/8040/$PERL_PORT/g" /etc/haproxy/haproxy.cfg

NODEJS_PORT=$(cat /root/webservers.txt | grep nodejs | cut -d ',' -f2)
echo $NODEJS_PORT
sed -i "s/8050/$NODEJS_PORT/g" /etc/haproxy/haproxy.cfg

systemctl restart haproxy