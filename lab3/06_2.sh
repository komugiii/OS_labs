#!/bin/bash
echo $$ > .pid
a=1
mode="+"
sigterm()
{
echo "stop"
exit 0
}
plus()
{
mode="+"
}
multiplication()
{
mode="*"
}
trap 'sigterm' SIGTERM
trap 'plus' USR1
trap 'multiplication' USR2
while true; do
case "$mode" in
"+")
a=$(($a+2))
;;
"*")
a=$(($a*2))
;;
esac
sleep 1
echo "$a"
done
