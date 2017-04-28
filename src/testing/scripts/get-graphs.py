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
image_filename = "./graphs1/" + file_name + ".png"
fig.suptitle(graph_title, fontsize=14, fontweight='bold')
plt.ylabel('Number of Processes waiting for runtime')
plt.xlabel(' > Time  in seconds')


tmp_file_name = ".tmp"

# Remove top 3 lines from all the files 
os.system("tail -n +3 " + file_name + "> file.tmp && mv file.tmp " + file_name)
os.system("awk '{print $1}' " + file_name + "> " + file_name + ".r")
	
new_file_name = file_name  + ".r"

with open(new_file_name, "r") as f:
	lines = f.read().splitlines()
	_patch = mpatches.Patch(color=color_name, label=label)
	plt.legend(handles=[mpatches.Patch(color=color_name, label=label)])
	plt.plot(lines, color_name)
		
	
#plt.show()
fig.savefig(image_filename)


	
