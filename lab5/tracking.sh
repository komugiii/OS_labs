#!/bin/bash
rm ./reporttracking.log
touch ./reporttracking.log
rm ./top5.log
touch ./top5.log
./mem.bash & pid=$!
echo "memfree, swapfree, virt, res, shr" >> ./reporttracking.log
while [ -d /proc/$pid ]; do
meminfo=$(</proc/meminfo)
memfree=$(grep MemFree <<< $meminfo | awk '{print $2}')
swapfree=$(grep SwapFree <<< $meminfo | awk '{print $2}')
pagesize=$(getconf PAGE_SIZE)
first=$(cat /proc/$pid/statm | awk '{print $1}')
second=$(cat /proc/$pid/statm | awk '{print $2}')
third=$(cat /proc/$pid/statm | awk '{print $3}')
first=$(($first*pagesize/1024))
second=$(($second*pagesize/1024))
third=$(($third*pagesize/1024))
top5=$(top -n 1 | tail -n +8 | head -n 5 | awk '{print $13}')
echo "-" >> ./top5.log
echo "$top5" >> ./top5.log
echo "$memfree, $swapfree, $first, $second, $third" >> ./reporttracking.log
sleep 1
done
