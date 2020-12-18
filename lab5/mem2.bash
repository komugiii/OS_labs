#!/bin/bash
rm ./report2.log
touch ./report2.log
arr=()
i=0
while true; do
  arr+=(1 2 3 4 5 6 7 8 9 10)
  i=$(($i+1))
  if [ $i -eq 100000 ]; then
    echo "${#arr[@]}" >> ./report2.log
    i=0
  fi
done
