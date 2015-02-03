# MySQL-Backup

Creates a gziped dump for each database found through credentials given.
All you need is a user with SELECT permission on the tables.

This script uses --single-transaction option which means you won't need the LOCK TABLES permission.

# Usage:

````
./mysql.sh localhost user pass ./bkp_dir
````
