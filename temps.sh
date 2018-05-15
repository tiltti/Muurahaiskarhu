#!/bin/bash

declare -a miners=(192.168.2.11 192.168.2.12 192.168.2.13 192.168.2.14 192.168.2.15 192.168.2.16 192.168.2.17 192.168.2.18 192.168.2.19 192.168.2.20 192.168.2.21 192.168.2.22 192.168.2.23 192.168.2.24 192.168.2.25 192.168.2.26 192.168.2.27 192.168.2.28 192.168.2.29 192.168.2.30 192.168.2.31 192.168.2.32 192.168.2.33 192.168.2.34 192.168.2.35 192.168.2.36 192.168.2.37 192.168.2.38 192.168.2.39 192.168.2.40 192.168.2.41 192.168.2.42)

j=1
for i in "${miners[@]}"
do
   echo "Querying: $j $i"
   temp1=$(echo 'stats|0' | nc $i 4028 | awk -F',' {'print $50'} | awk -F'=' {'print $2'})
   temp2=$(echo 'stats|0' | nc $i 4028 | awk -F',' {'print $51'} | awk -F'=' {'print $2'})
   temp3=$(echo 'stats|0' | nc $i 4028 | awk -F',' {'print $52'} | awk -F'=' {'print $2'})
   if [ -n "$temp1" ]; then
	    echo "Temp1: $temp1"
   else
     temp1="-1"
	    echo "Temp1: $temp1"
   fi
   if [ -n "$temp2" ]; then
      echo "Temp2: $temp2"
    else
      temp2="-1"
      echo "Temp2: $temp2"
  fi
  if [ -n "$temp3" ]; then
    echo "Temp3: $temp3"
  else
    temp3="-1"
    echo "Temp3: $temp3"
  fi
#   curl -i -XPOST 'http://localhost:8086/write?db=minertemp' -u admin:KalkkiPetteri1803influx --data-binary 'temperature,miner='$j' chip1='$temp1',chip2='$temp2',chip3='$temp3
   let j=j+1
done
