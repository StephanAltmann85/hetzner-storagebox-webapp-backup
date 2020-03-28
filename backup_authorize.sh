#!/bin/sh
TARGET_SERVER="username.your-storagebox.de"
TARGET_USER=""

CAT=`which cat`
SFTP=`which sftp`

${CAT} ~/.ssh/id_rsa.pub > authorized_keys
echo "mkdir database \n mkdir files\n mkdir .ssh \n chmod 700 .ssh \n put authorized_keys .ssh/authorized_keys \n chmod 600 .ssh/authorized_keys" | ${SFTP} $TARGET_USER@$TARGET_SERVER
wait
rm authorized_keys
exit 0
