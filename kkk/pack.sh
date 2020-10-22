#!/bin/bash
maxlogsize_kb=1024
max_file_num=10
log_num=1
str=_
str1=.txt
logfile=l3
tmp_logfile=l3_0.txt
while : ; do
	read line
	if [ $? -ne 0 ]; then
		exit 1
	fi
	printf "%s\n" "$line" >> $tmp_logfile
	size=$(du $tmp_logfile | awk '{print $1}')
	if [ $size -gt $maxlogsize_kb ]; then
	num=$[log_num%max_file_num]
	tmp_logfile=$logfile$str$num$str1 
	echo -n "" > $tmp_logfile
	log_num=$[ $log_num + 1 ]
	fi
done

