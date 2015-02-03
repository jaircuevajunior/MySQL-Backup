#! /bin/bash

BACKUP_DIR=$4
MYSQL_HOST=$1
MYSQL_USER=$2
MYSQL_PASSWORD=$3
MYSQL=/usr/bin/mysql
MYSQLDUMP=/usr/bin/mysqldump

databases=`$MYSQL -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`

for db in $databases; do
  $MYSQLDUMP -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD --single-transaction --databases $db | gzip > "$BACKUP_DIR/$db.gz"
done
