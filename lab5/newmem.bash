#!/bin/bash
arr=()
i=0
while true; do
  arr+=(1 2 3 4 5 6 7 8 9 10)
  i=$(($i+1))
  if [ ${#arr[@]} -eq $1 ]; then
    exit 0
  fi
done
