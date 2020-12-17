#!/bin/bash
while true; do
read LINE
echo "$LINE" > pipe
case $LINE in
"+" | "*" | [0-9]*)
:
;;
"QUIT")
echo "QUIT"
exit 0
;;
*)
echo "ERROR"
exit 1
;;
esac
done
