#!/bin/bash

#####################################
# This script is
# made by Shujaat Nazir Khan
# from Conure IT Services (Pvt.) Ltd.
# to check the status of
# all python scripts on Raspberry Pi
# and restart those only if 
# anyone found died out.
# Dated: 30-Apr-2017
#################################### 

home_dir=/home/pi/snk

COUNT_AL2=`ps -ef|grep -i pyth | grep -i al2.py | nl | awk -F" " '{print $1}'`
COUNT_HUMIDTEMP=`ps -ef|grep -i pyth | grep -i humidtemp.py | nl | awk -F" " '{print $1}'`
COUNT_M5=`ps -ef|grep -i pyth | grep -i m5.py | nl | awk -F" " '{print $1}'`
COUNT_GPS1=`ps -ef|grep -i pyth | grep -i gps1.py | nl | awk -F" " '{print $1}'`
COUNT_ULTRASONIC=`ps -ef|grep -i pyth | grep -i ultraSonic.py | nl | awk -F" " '{print $1}'`

export home_dir COUNT_AL2 COUNT_HUMIDTEMP COUNT_M5 COUNT_GPS1 COUNT_ULTRASONIC

#echo $COUNT_AL2
#echo $COUNT_HUMIDTEMP
#echo $COUNT_M5
#echo $COUNT_GPS1
#echo $COUNT_ULTRASONIC

if
        [[ $COUNT_AL2 != 1 ]]
                then
                sudo $home_dir/AnalogLight/al2.py &
        elif

        [[ $COUNT_HUMIDTEMP != 1 ]]
                then
                sudo $home_dir/HumidityTemperature/humidtemp.py 11 17 &

        elif

        [[ $COUNT_M5 != 1 ]]
                then
                sudo $home_dir/Motion/m5.py &

        elif

        [[ $COUNT_GPS1 != 1 ]]
                then
                sudo $home_dir/GPS/gps1.py &

        elif

        [[ $COUNT_ULTRASONIC != 1 ]]
                then
                sudo $home_dir/UltraSonic/ultraSonic.py &
fi

exit

