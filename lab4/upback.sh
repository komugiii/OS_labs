#!/bin/bash
if [[ ! -d ~/restore ]]; then
mkdir ~/restore
fi
last=$(find $HOME -maxdepth 1 -type d -name 'Backup-*' | sort | tail -1)
ls $last | grep -Ev '[0-9]{4}-[0-9]{2}-[0-9]{2}$' | while read name; do
cp -r "$last/$name" ~/restore/
done
