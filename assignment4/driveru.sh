#!/bin/bash
apt-get install haproxy -y
apt-get install mysql-client-core-5.7
ufw disable
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bk
cp /root/haproxy.cfg /etc/haproxy/haproxy.cfg
service haproxy start