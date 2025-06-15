#! /bin/bash

BACKUP_DIR=$1
MYSQL=/usr/bin/mysql
MYSQLDUMP=/usr/bin/mysqldump

databases=`$MYSQL -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)"`

for db in $databases; do
  $MYSQLDUMP --single-transaction --databases $db | gzip > "$BACKUP_DIR/$db.gz"
done
