#!/usr/bin/env python 

import RPi.GPIO as GPIO
import time
import itertools
import datetime
from time import gmtime, strftime
import requests
 
GPIO.setmode(GPIO.BCM)
GPIO.setup(23,GPIO.IN)

today = datetime.date.today()
 
#for i in range(0,100):
for i in itertools.count():

    r = requests.post("https://thingspace.io/dweet/for/RPiRND1_motionSensor", data={'motion': GPIO.input(23), 'date': strftime("%m/%d/%Y" , gmtime()), 'time': strftime("%H:%M:%S" , gmtime()) })
    print GPIO.input(23) , strftime("%d/%m/%Y" , gmtime()) , strftime("%H:%M:%S" , gmtime())

#    time.sleep(1)
    time.sleep(0.05)
    if i < 0:
        break

