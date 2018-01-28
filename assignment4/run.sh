#!/bin/bash
FILE="$1"
if [ "$FILE" = "csv" ];
then
	mysql -u root --password='5116735' --local-infile <<-EOF
	LOAD DATA LOCAL INFILE '/root/assignment4.csv path' INTO TABLE stars FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/root/assignment4.csv path' INTO TABLE categories FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
EOF
elif [ "$FILE" = "backup" ];
then
	mysql -D cts4348 -u root --password='5116735' < assignment4.sql.bk 
else
	echo "Unsupported Argument Type";
EOF
fi