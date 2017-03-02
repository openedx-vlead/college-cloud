import csv
import os 
import codecs

def csv_reader(file_name):
	data_list = []
	f = codecs.open(file_name,"rb","utf-16")
	csvread = csv.reader(f, delimiter='\t')
	csvread.next()
	for row in csvread:
		#print row
		data_list.append(row[0].split(","))
		
	return data_list


file_name = "nptel-videos.csv"
video_list = csv_reader(file_name)

for info in video_list:
	lab_name = info[0]
	nptel_link = info[1]
	youtube_link = info[2]
	
	if youtube_link == '':
		print "There is no youtube link"
	else: 		
		
		
	


