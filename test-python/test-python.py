import time
import sys

# Open file
file = open(sys.argv[1], "w")

# Increment from 1 to 60, writing output to file and waiting 1 second every increment
for i in range(1,61):
	file.write("Counting..." + str(i) + "\n")
	time.sleep(1)
