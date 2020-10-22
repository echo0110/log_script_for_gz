#!/bin/bash
maxlogsize_kb=1024
max_file_num=10
log_num=0
logfile=$1
while : ; do
	read line
	if [ $? -ne 0 ]; then
		exit 1
	fi
	printf "%s\n" "$line" >> $logfile
	size=$(du $logfile | awk '{print $1}')
	if [ $size -gt $maxlogsize_kb ]; then
	#cp $logfile $logfile.0
	num=$[log_num%max_file_num]
	echo "num is $num"
	logfile_name=$logfile$num
	echo "logfile.num is $logfile.$num"
	echo "logfile_name is $logfile_name"
	cp $logfile $logfile_name
	echo -n "" > $logfile
	log_num=$[ $log_num + 1 ]
	fi
done

