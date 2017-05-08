#!/usr/bin/env python


import RPi.GPIO as GPIO
import time
import itertools
import requests
import datetime
from time import gmtime, strftime

today = datetime.date.today()

GPIO.setmode(GPIO.BCM)

#TRIG = 23
TRIG = 25
ECHO = 24

print "Distance Measurement In Progress"

GPIO.setup(TRIG,GPIO.OUT)
GPIO.setup(ECHO,GPIO.IN)

for i in itertools.count():

	GPIO.output(TRIG, False)
	print "Waiting For Sensor To Settle"
	#time.sleep(2)
	#time.sleep(0.5)

	GPIO.output(TRIG, True)
	time.sleep(0.00001)
	GPIO.output(TRIG, False)

	while GPIO.input(ECHO)==0:
		pulse_start = time.time()

	while GPIO.input(ECHO)==1:
		pulse_end = time.time()

#for i in itertools.count():

	pulse_duration = pulse_end - pulse_start

	distance = pulse_duration * 17150

	distance = round(distance, 2)

	print "Distance:",distance,"cm" , strftime("%d/%m/%Y" , gmtime()) , strftime("%H:%M:%S" , gmtime())
	r = requests.post("https://thingspace.io/dweet/for/RPiRND1_ultraSonic", data={ 'distance': distance , 'date': strftime("%d/%m/%Y" , gmtime()) , 'time': strftime("%H:%M:%S" , gmtime()) })
	#time.sleep(0.5)
	if i < 0:
	  break

#GPIO.cleanup()

