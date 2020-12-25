#!/bin/bash
rm ./reporttracking2.log
touch ./reporttracking2.log
rm ./top5_2.log
touch ./top5_2.log
./mem.bash & pid1=$!
./mem2.bash & pid2=$!
echo "memfree, swapfree, virt1, res1, shr1, virt2, res2, shr2" >> ./reporttracking2.log
while [ -d /proc/$pid1 ]&&[ -d /proc/$pid2 ]; do
meminfo=$(</proc/meminfo)
memfree=$(grep MemFree <<< $meminfo | awk '{print $2}')
swapfree=$(grep SwapFree <<< $meminfo | awk '{print $2}')
pagesize=$(getconf PAGE_SIZE)
first=$(awk -v p=$pagesize -v OFS=',' '{print $1*p/1024,$2*p/1024,$3*p/1024}' /proc/$pid1/statm)
second=$(awk -v p=$pagesize -v OFS=',' '{print $1*p/1024,$2*p/1024,$3*p/1024}' /proc/$pid2/statm)
top5=$(top -n 1 | tail -n +8 | head -n 5 | awk '{print $13}')
echo "-" >> ./top5_2.log
echo "$top5" >> ./top5_2.log
echo "$memfree, $swapfree, $first, $second" >> ./reporttracking2.log
sleep 1
done
