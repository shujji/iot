#!/bin/bash

export home_dir=/home/pi/snk

sudo $home_dir/AnalogLight/al2.py &
sudo $home_dir/HumidityTemperature/humidtemp.py 11 17 &
sudo $home_dir/Motion/m5.py &
sudo $home_dir/GPS/gps1.py &
sudo $home_dir/UltraSonic/ultraSonic.py &

