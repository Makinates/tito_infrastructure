#!/bin/bash
# This script backs up a specified directory

SOURCE="/Users/tito/Desktop/Titolu_pro"
DESTINATION="/Users/tito/Desktop/Titolu_pro_backup"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

if [ ! -d "$DESTINATION" ]; then
    mkdir -p $DESTINATION
fi

tar -czf $DESTINATION/backup-$DATE.tar.gz -C "$SOURCE" .
echo "Backup created at $DESTINATION/backup-$DATE.tar.gz."

