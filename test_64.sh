#!/bin/bash
conn="10"
thread="1"
dur="120s"
ip="10.140.129.222"
file="64.html"
cores="`cat /proc/cpuinfo | grep processor | wc -l`"
for (( t=0; t<$cores; t++))
do
        taskset -c $t wrk -t $thread -c $conn -d $dur -H 'Connection: close' https://$ip/$file &
done
