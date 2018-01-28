#!/bin/bash

while ((i++)); read -r line; do
        v1=$(echo $line | cut -d ',' -f1)
        v2=$(echo $line | cut -d ',' -f2)
        v3=$(echo $line | cut -d ',' -f3)
        echo "$v2 IN $v1 $v3" | tee -a /etc/named/zones/*.edu
done < dnsData.csv
systemctl restart named