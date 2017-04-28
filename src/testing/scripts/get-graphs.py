import glob
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import matplotlib.pyplot as plt
import sys
import os 

file_name = sys.argv[1]
label = sys.argv[2]
color_name = sys.argv[3]
graph_title = sys.argv[4]
fig = plt.figure()
#image_filename = "./graphs-processes/" + file_name + ".png"
#image_filename = "./graphs-free-ram/" + file_name + ".png"
#image_filename = "./graphs-cs/" + file_name + ".png"
image_filename = "./graphs-idle-cpu/" + file_name + ".png"
fig.suptitle(graph_title, fontsize=14, fontweight='bold')
plt.ylabel(' % of idle cpu ')
plt.xlabel(' > Time  in seconds')


tmp_file_name = ".tmp"

# Remove top 3 lines from all the files 
#os.system("tail -n +3 " + file_name + "> file.tmp && mv file.tmp " + file_name)
#os.system("awk '{print $1}' " + file_name + "| tail -n +3" +  ">"  + file_name + ".updated") # this line for printing number of processes waiting for run time ( r value)
#os.system("awk '{print $4}' " + file_name + "| tail -n +3" +  ">"  + file_name + ".updated") # this line for printingfree ram  ( free )

#os.system("awk '{print $12}' " + file_name + "| tail -n +3" +  ">"  + file_name + ".updated")  # this line is for printing  Context switches ( cs)
os.system("awk '{print $15}' " + file_name + "| tail -n +3" +  ">"  + file_name + ".updated")  # this line is for printing cpu utilization ( idle cpu)	
new_file_name = file_name  + ".updated"

with open(new_file_name, "r") as f:
	lines = f.read().splitlines()
	_patch = mpatches.Patch(color=color_name, label=label)
	plt.legend(handles=[mpatches.Patch(color=color_name, label=label)])
	plt.plot(lines, color_name)
		
	
#plt.show()
fig.savefig(image_filename)


	
