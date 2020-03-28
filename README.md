# Information

## Files
### backup_authorize.sh
Will provide public key for key authentification to target server and setup folders.

### backup.sh
Syncs folder and compressed dump to target server.

### excluded_items.txt
Contains folders and files excluded from backup.

## Setup
1. edit files and edit config values
2. run backup_authorize.sh once to setup folders and enable key authentification
3. setup cronjob for backup.sh
    0 * * * * /path/to/backup.sh > /dev/null 2&1
