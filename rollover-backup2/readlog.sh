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
	#printf "%s\n" "$line" >> $logfile
	printf "%s\n" "$line" >> $tmp_logfile
	size=$(du $tmp_logfile | awk '{print $1}')
	if [ $size -gt $maxlogsize_kb ]; then
	#cp $logfile $logfile.0
	num=$[log_num%max_file_num]
	echo "num is $num"
#	logfile_name=$logfile$num
	echo "logfile name is $logfile$str$num$str1"
#	echo "logfile_name is $logfile_name"
	#cp $logfile $logfile_name
	#file_num=$[ $num + 1 ]
	#if [ "$file_num" -gt 9 ]; then
    #    log_num=0
    #fi
	#logfile=$logfile$num
	tmp_logfile=$logfile$str$num$str1 
	echo -n "" > $tmp_logfile
	log_num=$[ $log_num + 1 ]
	fi
done

