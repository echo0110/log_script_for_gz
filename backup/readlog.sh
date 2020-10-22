#!/bin/bash
maxlogsize_kb=1024

logfile=$1
while : ; do
	read line
	if [ $? -ne 0 ]; then
		exit 1
	fi
	printf "%s\n" "$line" >> $logfile
	size=$(du $logfile | awk '{print $1}')
	if [ $size -gt $maxlogsize_kb ]; then
	cp $logfile $logfile.0
	echo -n "" > $logfile
	fi
done

