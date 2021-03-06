#!/bin/bash
NGINX_PORT=$(cat /root/webservers.txt | grep nginx | cut -d ',' -f2)
echo $NGINX_PORT
sed -i "s/8010/$NGINX_PORT/g" /etc/nginx/nginx.conf
echo "Nginx updated"
service nginx restart

HTTPD_PORT=$(cat /root/webservers.txt | grep apache | cut -d ',' -f2)
echo $HTTPD_PORT
sed -i "s/8000/$HTTPD_PORT/g" /etc/httpd/conf/httpd.conf
echo "Apache Updated"
service httpd restart 

PHP_PID=$(ps -e | egrep php | awk '{print $1; }')
kill -9 $PHP_PID
PHP_PORT=$(cat /root/webservers.txt | grep php | cut -d ',' -f2)
echo $PHP_PORT
nohup php -S 0.0.0.0:$PHP_PORT & sleep 1 && echo 

PYTHON_PID=$(ps -e | egrep python | awk '{print $1; }')
kill -9 $PYTHON_PID
PYTHON_PORT=$(cat /root/webservers.txt | grep python | cut -d ',' -f2)
echo $PYTHON_PORT
sed -i "s/8020/$PYTHON_PORT/g" /root/pythonserver.py
nohup python /root/pythonserver.py & sleep 1 && echo 

PERL_PID=$(ps -e | egrep perl | awk '{print $1; }')
kill -9 $PERL_PID
PERL_PORT=$(cat /root/webservers.txt | grep perl | cut -d ',' -f2)
echo $PERL_PORT
sed -i "s/8040/$PERL_PORT/g" /root/perl/perlserver.pl
perl /root/perl/perlserver.pl sleep 1 && echo 

NODEJS_PID=$(ps -e | egrep node | awk '{print $1; }')
kill -9 $NODEJS_PID
NODEJS_PORT=$(cat /root/webservers.txt | grep nodejs | cut -d ',' -f2)
echo $NODEJS_PORT
sed -i "s/8050/$NODEJS_PORT/g" /root/node/nodeserver.js
nohup node /root/node/nodeserver.js & sleep 1 && echo 




