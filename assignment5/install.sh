#!/bin/bash

yum install bind bind-utils -y

echo "acl trusted {
        10.128.0.0/16;
        localhost;
};" >> /etc/named.conf

sed -i 's/.*allow-query.*/allow-query     { trusted; };forwarders { 10.128.1.137; };forward only;/' /etc/named.conf

systemctl start named