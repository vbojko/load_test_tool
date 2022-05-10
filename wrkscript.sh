#!/bin/bash
#this script launches wrt on every cpu core of the client system

# This is the help function showing a description of the parameters
helpFunction ()
{
  echo ""
  echo "Usage: $0 -c connections -t threads -d duration -r request "
  echo -e "\t-c number of concurrent connections"
  echo -e "\t-t number of requests per connection"
  echo -e "\t-d duration of test. Notation: 10s (seconds) 10m(minutes) 10h(hours)"
  echo -e "\t-r request including protocol and URI, e.g. https://1.1.1.1/1.html"
  exit 1
}

# This section is used to parse the arguments
while getopts "c:t:d:r:?:" opt
do
 case "$opt" in
         c ) conn="$OPTARG" ;;
         t ) thread="$OPTARG" ;;
         d ) dur="$OPTARG" ;;
         r ) req="$OPTARG" ;;
         ? ) helpFunction ;;
 esac
done

# this sectiopn takes the arguments and applied default values if argument is not provided
conn=${conn:-"10"}
thread=${thread:-"1"}
dur=${dur:-"30s"}
req=${req:-"https://1.1.1.1/1.html"}
cores="`cat /proc/cpuinfo | grep processor | wc -l`"


# This section created the load test. 
#the takeset -c # pins the task to a cpecific cpu core
# for the load test we use wrk. check the wrk site for command structure: https://github.com/wg/wrk

for (( t=0; t<$cores; t++))
do
        taskset -c $t wrk -t $thread -c $conn -d $dur -H 'Connection: close' $req &
done

