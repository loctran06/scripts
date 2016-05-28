Script backup mysql :

#################################
#!/bin/sh
#
#SCRIPT BACKUP_MYSQL ON MASTER
#CREATED BY LOCTP
#
#################################

LOG_DIR=/home/backup/mysql;
CUR_DATE=$(date +"%m%d%Y");

/usr/bin/mysqldump -uuser -ppassword --socket=/var/lib/mysql/mysql.sock --port=3306 dbname01 | gzip -9 >  ${LOG_DIR}/dbname.${CUR_DATE}.sql.gz

/usr/bin/mysqldump -uroot -ppassword --socket=/var/lib/mysql/mysql.sock --port=3306 dbname02 | gzip -9 >  ${LOG_DIR}/dbname02.${CUR_DATE}.sql.gz


############### Delete file old 14 ngay #########################

find /home/backup/mysql/  -type f -mtime +14 -exec rm -rf {} \;

############ End SCript #############
