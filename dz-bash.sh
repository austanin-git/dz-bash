#!/bin/bash
# Creating files with random content
for i in {1..10};
do
	echo hello > "/home/andrey/dz-project1/files-to-transfer/File${i}.txt"
done


# deleting a week old files
find /home/andrey/dz-project1/ -mtime +7 -exec rm {} \;


# deleteting a week old files on a remote host
ssh andrey@10.128.0.3 'find /home/andrey/store/ -mtime +7 -exec rm {} \;'

# compressing and sending files to remote host
rsync -az /home/andrey/dz-project1/files andrey@10.128.0.3:/home/andrey/

# cron
# 0 1 * * * bash /home/andrey/dz-project1/dz-bash.sh
