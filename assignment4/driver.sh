#!/bin/bash
yum install mariadb mariadb-server -y
systemctl start mariadb
systemctl stop firewalld
yum install wireshark -y
tshark -r mysql.pcap -e  mysql.query -T fields -Y "mysql" | grep -Ev “^$” > mysql.txt
mysql -u root <<-EOF
CREATE DATABASE cts4348;
USE cts4348;
CREATE TABLE stars (
     id INT AUTO_INCREMENT PRIMARY KEY UNIQUE, 
     username VARCHAR(45) NOT NULL,
     gender VARCHAR(15) NOT NULL,
     category_id INT NOT NULL,
     address VARCHAR(100), 
     birthday VARCHAR(45),
     phone VARCHAR(45)
 );
CREATE TABLE categories (
     id INT AUTO_INCREMENT PRIMARY KEY UNIQUE, 
     name VARCHAR(100) NOT NULL
 );
EOF
DISTRO=$( cat /etc/*-release | tr [:upper:] [:lower:] | grep -Poi '(centos)' | uniq )
if [ "$DISTRO" = "centos" ];
then
	echo $DISTRO;
	mysql -u root <<-EOF
	SET @@auto_increment_offset=1;
	SET @@auto_increment_increment=2;
EOF
else
	echo $DISTRO;
	mysql -u root <<-EOF
	SET @@auto_increment_offset=2;
	SET @@auto_increment_increment=2;
EOF
fi
while IFS= read -r line; do
    if [[ $line =~ "GRANT SELECT ON" ]]; 
    then
    	mysql -u root << EOF
        $line;
EOF
    fi
done < mysql.txt
mysql -u root << EOF
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('5116735');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE test;
FLUSH PRIVILEGES;
EOF


