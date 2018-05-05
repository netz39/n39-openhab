#!/bin/bash
         COUNTER=$1
	 NOCOL="\e[39m"
         RED="\e[31m"
         array=(1 2 3 4 5)
         until [  $COUNTER -lt 0 ]; do
             echo RANDOMBLINK $COUNTER
             sleep 0.1
             VAL=$(( RANDOM % 1024  ))
             for i in "${array[@]}"
             do
                mosquitto_pub -t cmnd/n39logo/PWM$i -m $(( RANDOM % 1024  ))
             done
             let COUNTER-=1
         done
