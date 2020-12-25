#!/bin/bash
k=30
n=3000000
for ((i=1;i<=$k;i++)); do
./newmem.bash $n
sleep 1
done
