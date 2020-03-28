#!/bin/sh
# Set variables
DB_NAME=""
DB_USER=""
DB_PASSWORD=""
BACKUP_SOURCE="/var/www/"
# folder where this script is located
EXECUTION_FOLDER=""
TARGET_SERVER="username.your-storagebox.de"
TARGET_PORT="23"
TARGET_USER=""

cd $EXECUTION_FOLDER

NOW=$(date +"%Y-%m-%d-%H-%M")
MYSQL_DUMP=`which mysqldump`
RSYNC=`which rsync`
GZIP=`which gzip`

${RSYNC} -az --delete --exclude-from 'excluded_items.txt' -e 'ssh -p 23' $BACKUP_SOURCE $TARGET_USER@$TARGET_SERVER:files/
wait

# Dump database
${MYSQL_DUMP} -u $DB_USER -p$DB_PASSWORD $DB_NAME | ${GZIP} > $NOW.sql.gz
wait
${RSYNC} -az --remove-source-files -e 'ssh -p 23' $NOW.sql.gz $TARGET_USER@$TARGET_SERVER:database/
wait
exit 0
