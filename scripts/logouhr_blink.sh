#!/bin/bash
         COUNTER=$1
         until [  $COUNTER -lt 0 ]; do
             echo Blink $COUNTER
             sleep 0.2
             mosquitto_pub -t cmnd/n39logo/PWM5 -m 1023
             sleep 0.1
             mosquitto_pub -t cmnd/n39logo/PWM2 -m 1023
             sleep 0.2
             mosquitto_pub -t cmnd/n39logo/PWM5 -m 0
             sleep 0.1
             mosquitto_pub -t cmnd/n39logo/PWM2 -m 0
             let COUNTER-=1
         done
