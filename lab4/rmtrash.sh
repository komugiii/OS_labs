#!/bin/bash

if [ ! -f "$1" ]; then
echo "file doesn't exist"
exit 1
fi

if [ ! -d "~/.trash" ]; then
mkdir ~/.trash
fi
trash_name=$(uuidgen)
ln ./"$1" ~/.trash/$trash_name
rm ./"$1"
path=$(realpath ./"$1")
echo $path/$trash_name >> ~/.trash.log
