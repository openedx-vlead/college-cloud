#!/usr/bin/python

import requests
import datetime

now = datetime.datetime.now()

date = now.strftime("%d-%m-%Y")

dump_file = "feedback-dump-"+date+".json"

url = "http://feedback.vlabs.ac.in/feedback_dump?date="+date+"&key=defaultkey"
response=requests.get(url)
fp=open(dump_file,"w")
fp.write(response.content)
fp.close()
#print type(response.content)
