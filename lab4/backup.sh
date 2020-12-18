#!/bin/bash
date=$(date '+%Y-%m-%d')
last=$(basename "$(find $HOME -maxdepth 1 -type d -name 'Backup-*' | sort | tail -1)" | sed "s/Backup-//")
date2=$(date -d "$last + 7 days" "+%Y-%m-%d")
if [[ "$date2" < "$date" ]] || [[ -z "$last" ]]; then
  mkdir -v ~/"Backup-$date"
  cp -r ~/source/* ~/"Backup-$date"
  echo "Backup-$date" >> ~/backup-report
  echo "$date" >> ~/backup-report
  find ~/source -type f >> ~/backup-report
  else
  echo "Backup-$last $date" >> ~/backup-report
  find ~/source -maxdepth 1 | tail -n +2 | while read name; do
    fileName=$(basename "$name")
    backupFileName=~/"Backup-$last/$fileName"
    if [ -f "$backupFileName" ]; then
    size1=$(du -s "$name" | awk '{print $1}')
    size2=$(du -s "$backupFileName" | awk '{print $1}')
    if [ ! $size1 -eq $size2 ]; then
      mv "$backupFileName" "$backupFileName.$date"
      echo "$fileName" "$backupFileName.$date" >> ~/backup-report
    else
       continue
    fi
     else
       echo "$name" >> ~/backup-report
    fi
    cp -r "$name" "$backupFileName"
  done
fi
