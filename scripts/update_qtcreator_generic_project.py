#!/usr/bin/python
import os
project_name = os.path.basename(os.getcwd())
file = open(project_name+".config", "wb")
file.close()
file = open(project_name+".creator", "wb")
file.write("[General]\n")
file.close()
file = open(project_name+".includes", "wb")
file.write("src\n")
file.close()
file = open(project_name+".files", "wb")
file.write(os.popen("git ls-files").read())
file.close()
