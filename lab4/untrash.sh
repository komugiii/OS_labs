#!/bin/bash
cat ~/.trash.log | while read line; do
 ID=$(basename "$line")
 path=$(dirname "$line")
 fileName=$(basename "$path")
 echo $ID
 echo $path
 echo $fileName
 if [ "$fileName" = "$1" ]; then
  echo "$path ? yes or no"
  read ans < /dev/tty
  if [ $ans = "yes" ]; then
   path2=$(dirname $path)
    if [ ! -d "$path2" ]; then
    path2=$HOME
    fi
   newName=$path2/$fileName
   if [ -f "$newName" ]; then
    echo "input new name"
    read fileName < /dev/tty
   fi
  ln ~/.trash/$ID "$path2/$fileName"
  rm ~/.trash/$ID
  fi
 fi
done
