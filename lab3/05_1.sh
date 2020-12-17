#!/bin/bash
c=1
operation="+"

(tail -f pipe) |
while true;
do
read LINE
echo "$LINE"
case "$LINE" in
"QUIT")
echo "out"
exit 0
;;
"+")
operation="+"
read a
read b
c=$(($a+$b))
;;
"*")
operation="*"
read a
read b
c=$(($a*$b))
;;
*)
echo "error"
exit 1
;;
[0-9]*)
case $operation in
"+")
c=$(($LINE+$c))
;;
"*")
c=$(($LINE+$c))
;;
esac
;;
esac
done
